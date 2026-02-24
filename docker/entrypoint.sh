#!/bin/bash
set -euo pipefail

FUSEKI_BASE="${FUSEKI_BASE:-/fuseki}"
FUSEKI_HOME="${FUSEKI_HOME:-/jena-fuseki}"
DATASET_DIR="${FUSEKI_BASE}/databases/imas"
RDF_SOURCE="/rdf-data"
FUSEKI_URL="http://localhost:3030"

# shiro.ini初期化（初回のみ）
if [ ! -f "${FUSEKI_BASE}/shiro.ini" ]; then
    echo "[imasparql] Initializing Fuseki base directory..."
    mkdir -p "${FUSEKI_BASE}"
    cp "${FUSEKI_HOME}/shiro.ini" "${FUSEKI_BASE}/shiro.ini"
    sed -i "s|admin=YOURPASSWORD|admin=${ADMIN_PASSWORD}|g" "${FUSEKI_BASE}/shiro.ini"
fi

# Fusekiをバックグラウンド起動
echo "[imasparql] Starting Fuseki..."
"${FUSEKI_HOME}/fuseki-server" --config=/fuseki-config.ttl --port=3030 &
FUSEKI_PID=$!

# 起動待機
echo "[imasparql] Waiting for Fuseki to become available..."
MAX_WAIT=120
WAITED=0
until curl --silent --fail "${FUSEKI_URL}/\$/ping" > /dev/null 2>&1; do
    sleep 2; WAITED=$((WAITED + 2))
    if [ "${WAITED}" -ge "${MAX_WAIT}" ]; then
        echo "[imasparql] ERROR: Timeout waiting for Fuseki" >&2; exit 1
    fi
done
echo "[imasparql] Fuseki is ready."

# 初回のみRDFデータをロード
if [ -d "${DATASET_DIR}" ] && [ "$(ls -A "${DATASET_DIR}" 2>/dev/null)" ]; then
    echo "[imasparql] TDB2 database already exists. Skipping data load."
else
    echo "[imasparql] Loading RDF data from ${RDF_SOURCE}..."
    LOAD_ERRORS=0
    while IFS= read -r -d '' rdf_file; do
        echo "[imasparql]   Loading: ${rdf_file}"
        HTTP_STATUS=$(curl --silent --output /dev/null --write-out "%{http_code}" \
            --request POST \
            --user "admin:${ADMIN_PASSWORD}" \
            --header "Content-Type: application/rdf+xml" \
            --data-binary @"${rdf_file}" \
            "${FUSEKI_URL}/imas/data?default")
        if [ "${HTTP_STATUS}" -lt 200 ] || [ "${HTTP_STATUS}" -ge 300 ]; then
            echo "[imasparql]   WARNING: Failed ${rdf_file} (HTTP ${HTTP_STATUS})" >&2
            LOAD_ERRORS=$((LOAD_ERRORS + 1))
        fi
    done < <(find "${RDF_SOURCE}" -name "*.rdf" -print0 | sort -z)
    echo "[imasparql] Data load complete (errors: ${LOAD_ERRORS})"
fi

echo "[imasparql] SPARQL endpoint: ${FUSEKI_URL}/imas/query"
wait "${FUSEKI_PID}"
