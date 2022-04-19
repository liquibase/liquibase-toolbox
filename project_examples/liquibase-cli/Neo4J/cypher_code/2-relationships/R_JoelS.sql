-- liquibase formatted sql

-- changeset AmyZ:7
MATCH
  (a:Person),
  (b:Movie)
WHERE a.name = 'Joel Silver' AND b.title = 'The Matrix'
CREATE (a)-[:PRODUCED]->(b)
--rollback MATCH (n {name: 'Joel Silver'})-[r:PRODUCED]->(t {title:'The Matrix'})
--rollback DELETE r
