FROM stain/jena-fuseki:5.1.0

COPY docker/fuseki-config.ttl /fuseki-config.ttl
COPY docker/entrypoint.sh /entrypoint.sh

USER root
RUN chmod +x /entrypoint.sh
USER fuseki

ENTRYPOINT ["/sbin/tini", "--", "/entrypoint.sh"]
