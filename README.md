# imasparql
![stat](https://img.shields.io/badge/dynamic/json.svg?color=green&style=flat-square&label=stat&query=%24.results.bindings%5B%3A1%5D.stat.value&url=https%3A%2F%2Fsparql.crssnky.xyz%2Fspql%2Fimas%2Fquery%3Foutput%3Djson%26query%3DPREFIX%2520rdf%253A%2520%253Chttp%253A%252F%252Fwww.w3.org%252F1999%252F02%252F22-rdf-syntax-ns%2523%253E%2520PREFIX%2520schema%253A%2520%253Chttp%253A%252F%252Fschema.org%252F%253E%2520PREFIX%2520imas%253A%2520%253Chttps%253A%252F%252Fsparql.crssnky.xyz%252Fimasrdf%252FURIs%252Fimas-schema.ttl%2523%253E%2520SELECT%2520%28group_concat%28concat%28%2527%2520%2527%252C%2520str%28%253Fcnt%29%252C%2520%2527%2520%2527%252C%2520if%28contains%28str%28%253Fo%29%252C%2520%2522%2523%2522%29%252C%2520strafter%28str%28%253Fo%29%252C%2520%2522%2523%2522%29%252C%2520strafter%28str%28%253Fo%29%252C%2520str%28schema%253A%29%29%29%252C%2520%2527s%2527%29%253B%2520separator%253D%2527%252C%2527%29%2520as%2520%253Fstat%29%2520WHERE%2520%257B%2520SELECT%2520%253Fo%2520%28COUNT%28%253Fs%29%2520AS%2520%253Fcnt%29%2520WHERE%2520%257B%2520%253Fs%2520rdf%253Atype%2520%253Fo%2520FILTER%2520%28%253Fo%2520IN%2520%28imas%253AIdol%252C%2520imas%253AUnit%252C%2520imas%253AClothes%29%29%2520%257D%2520GROUP%2520BY%2520%253Fo%2520%257D)

[im@sparql](https://sparql.crssnky.xyz/imas/)'s RDFs

# 編集者歓迎
データがまだまだ完璧とは言えません。  
データの追加・データの修正ぜひぜひお願いします。    
[CONTRIBUTING.md](https://github.com/imas/imasparql/blob/master/CONTRIBUTING.md)

# 使い方(im@sparqlでの使用方法 with Apache Jena Fuseki2)
[Apache Jena Fuseki2](https://jena.apache.org/documentation/fuseki2/)  
Fusekiでは、Configureの.ttlファイルにファイルを登録することで使えるようになります。  
参考：https://jena.apache.org/documentation/fuseki2/fuseki-configuration.html#dataset

# Discussion
[IM@Study](https://imas-hack.herokuapp.com/)のSlackのimasparqlチャンネルにて、時たま話し合いが行われています。  
みなさまのご意見や要望も募集しています。  
[@croMisa](https://twitter.com/cromisa)へでも大丈夫です。

# Special Thanks
- [rdflint](https://imas.github.io/rdflint/) from [みかみんさん](https://github.com/takemikami)  
- [SHACL](https://www.w3.org/TR/shacl/)の導入 from [きりだるまさん](https://github.com/kiridaruma)  
- [Contributorのみなさん]https://sparql.crssnky.xyz/imas/contributors/)

and... You！
