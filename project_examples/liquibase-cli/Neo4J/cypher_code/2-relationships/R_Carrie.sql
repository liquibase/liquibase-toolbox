-- liquibase formatted sql

-- changeset MikeR:3
MATCH
  (a:Person),
  (b:Movie)
WHERE a.name = 'Carrie-Anne Moss' AND b.title = 'The Matrix'
CREATE (a)-[:ACTED_IN {roles:['Trinity']}]->(b)
--rollback MATCH (n {name: 'Carrie-Anne Moss'})-[r:ACTED_IN]->(t {title:'The Matrix'})
--rollback DELETE r

