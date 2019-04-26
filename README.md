# imasparql
![stat](https://img.shields.io/badge/dynamic/json.svg?color=green&style=flat-square&label=stat&query=%24.results.bindings%5B%3A1%5D.stat.value&url=https%3A%2F%2Fsparql.crssnky.xyz%2Fspql%2Fimas%2Fquery%3Foutput%3Djson%26query%3DPREFIX%2520rdf%253A%2520%253Chttp%253A%252F%252Fwww.w3.org%252F1999%252F02%252F22-rdf-syntax-ns%2523%253E%2520PREFIX%2520schema%253A%2520%253Chttp%253A%252F%252Fschema.org%252F%253E%2520PREFIX%2520imas%253A%2520%253Chttps%253A%252F%252Fsparql.crssnky.xyz%252Fimasrdf%252FURIs%252Fimas-schema.ttl%2523%253E%2520SELECT%2520%28group_concat%28concat%28%2527%2520%2527%252C%2520str%28%253Fcnt%29%252C%2520%2527%2520%2527%252C%2520if%28contains%28str%28%253Fo%29%252C%2520%2522%2523%2522%29%252C%2520strafter%28str%28%253Fo%29%252C%2520%2522%2523%2522%29%252C%2520strafter%28str%28%253Fo%29%252C%2520str%28schema%253A%29%29%29%252C%2520%2527s%2527%29%253B%2520separator%253D%2527%252C%2527%29%2520as%2520%253Fstat%29%2520WHERE%2520%257B%2520SELECT%2520%253Fo%2520%28COUNT%28%253Fs%29%2520AS%2520%253Fcnt%29%2520WHERE%2520%257B%2520%253Fs%2520rdf%253Atype%2520%253Fo%2520FILTER%2520%28%253Fo%2520IN%2520%28imas%253AIdol%252C%2520imas%253AUnit%252C%2520imas%253AClothes%29%29%2520%257D%2520GROUP%2520BY%2520%253Fo%2520%257D)

[im@sparql](https://sparql.crssnky.xyz/imas/)'s RDFs

# 編集者歓迎
データがまだまだ完璧とは言えません。  
データの追加・データの修正ぜひぜひお願いします。    
[CONTRIBUTING.md](https://github.com/imas/imasparql/blob/master/CONTRIBUTING.md)

### 参考
アイドルマスター公式 http://idolmaster.jp/  
シンデレラガールズ http://www.mbga.jp/_game_intro?game_id=12008305  
ミリオンライブ http://imas.gree-apps.net/app/index.php/sptop  
SideM http://www.mbga.jp/_game_intro?game_id=12017647  
アイドルマスター コロムビア公式 http://columbia.jp/idolmaster/  
ミリオンライブ Lantis公式 http://www.lantis.jp/imas/  
SideM Lantis公式 http://www.lantis.jp/sidem/  
ニコニコ大百科 http://dic.nicovideo.jp/  
ピクシブ辞典 https://dic.pixiv.net/    
Wikipedia https://ja.wikipedia.org  
DBpedia http://ja.dbpedia.org/  
Music Forest http://www.minc.gr.jp  
シンデレラガールズ ユニット相関図 https://imags-cg-unit.netlify.com    
アイマスライブセトリ https://music765plus.com/%E3%83%A9%E3%82%A4%E3%83%96%26%E6%AD%8C%E3%81%82%E3%82%8A%E3%82%A4%E3%83%99%E3%83%B3%E3%83%88%E3%81%AE%E4%B8%80%E8%A6%A7  
imascg CallTable https://calltable.imascg.moe/  
ご協力のみなさまの手作り資料
