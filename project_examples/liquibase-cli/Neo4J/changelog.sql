-- liquibase formatted sql

-- changeset Tsvi:1
CREATE (TheMatrix:Movie {title:'The Matrix', released:1999, tagline:'Welcome to the Real World'})
--rollback MATCH (n:Movie {name: 'TheMatrix'})
--rollback DELETE n

-- changeset Tsvi:2
CREATE (Keanu:Person {name:'Keanu Reeves', born:1964})
--rollback MATCH (n:Person {name: 'Keanu'})
--rollback DELETE n

-- changeset Tsvi:3
CREATE (Carrie:Person {name:'Carrie-Anne Moss', born:1967})
--rollback MATCH (n:Person {name: 'Carrie'})
--rollback DELETE n

-- changeset Tsvi:4
CREATE
(Keanu)-[:ACTED_IN {roles:['Neo']}]->(TheMatrix),
(Carrie)-[:ACTED_IN {roles:['Trinity']}]->(TheMatrix),
(Laurence)-[:ACTED_IN {roles:['Morpheus']}]->(TheMatrix),
(Hugo)-[:ACTED_IN {roles:['Agent Smith']}]->(TheMatrix),
(LillyW)-[:DIRECTED]->(TheMatrix),
(LanaW)-[:DIRECTED]->(TheMatrix),
(JoelS)-[:PRODUCED]->(TheMatrix)
--rollback MATCH (n)
--rollback DETACH DELETE n
