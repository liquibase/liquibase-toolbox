-- liquibase formatted sql

-- changeset Kevin:3
MATCH
  (a:Person),
  (b:Movie)
WHERE a.name = 'Hugo weaving' AND b.title = 'The Matrix'
CREATE (a)-[:ACTED_IN {roles:['Agent Smith']}]->(b)
--rollback MATCH (n {name: 'Hugo weaving'})-[r:ACTED_IN]->(t {title:'The Matrix'})
--rollback DELETE r

