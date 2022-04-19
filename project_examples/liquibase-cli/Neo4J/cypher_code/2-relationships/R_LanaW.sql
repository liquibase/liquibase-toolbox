-- liquibase formatted sql

-- changeset Jay:1
MATCH
  (a:Person),
  (b:Movie)
WHERE a.name = 'Lana Wachowski' AND b.title = 'The Matrix'
CREATE (a)-[:DIRECTED]->(b)
--rollback MATCH (n {name: 'Lana Wachowski'})-[r:DIRECTED]->(t {title:'The Matrix'})
--rollback DELETE r

