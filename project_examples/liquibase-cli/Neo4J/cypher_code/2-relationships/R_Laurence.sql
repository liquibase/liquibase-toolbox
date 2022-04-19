-- liquibase formatted sql

-- changeset Dan:1
MATCH
  (a:Person),
  (b:Movie)
WHERE a.name = 'Laurence fishburne' AND b.title = 'The Matrix'
CREATE (a)-[:ACTED_IN {roles:['Morpheus']}]->(b)
--rollback MATCH (n {name: 'Laurence fishburne'})-[r:ACTED_IN]->(t {title:'The Matrix'})
--rollback DELETE r

