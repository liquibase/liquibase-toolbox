-- liquibase formatted sql

-- changeset John:1
MATCH
  (a:Person),
  (b:Movie)
WHERE a.name = 'Keanu Reeves' AND b.title = 'The Matrix'
CREATE (a)-[:ACTED_IN {roles:['Neo']}]->(b)
--rollback MATCH (n {name: 'Keanu Reeves'})-[r:ACTED_IN]->(t {title:'The Matrix'})
--rollback DELETE r

