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
CREATE (Laurence:Person {name:'Laurence fishburne', born:1961})
--rollback MATCH (n:Person {name: 'Laurence'})
--rollback DELETE n

-- changeset Tsvi:5
CREATE (Hugo:Person {name:'Hugo weaving', born:1962})
--rollback MATCH (n:Person {name: 'Hugo'})
--rollback DELETE n

-- changeset Tsvi:6
CREATE (LillyW:Person {name:'Lilly Wachowski', born:1967})
--rollback MATCH (n:Person {name: 'Lilly'})
--rollback DELETE n

-- changeset Tsvi:7
CREATE (LanaW:Person {name:'Lana Wachowski', born:1965})
--rollback MATCH (n:Person {name: 'Lana'})
--rollback DELETE n

-- changeset Tsvi:8
CREATE (JoelS:Person {name:'Joel Silver', born:1952})
--rollback MATCH (n:Person {name: 'Joel'})
--rollback DELETE n

-- changeset Tsvi:9
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
