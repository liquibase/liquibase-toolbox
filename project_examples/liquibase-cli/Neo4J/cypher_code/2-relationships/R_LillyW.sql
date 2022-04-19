-- liquibase formatted sql

-- changeset Tsvi:4
MATCH
  (a:Person),
  (b:Movie)
WHERE a.name = 'Lilly Wachowski' AND b.title = 'The Matrix'
CREATE (a)-[:DIRECTED]->(b)
--rollback MATCH (n {name: 'Lilly Wachowski'})-[r:DIRECTED]->(t {title:'The Matrix'})
--rollback DELETE r

