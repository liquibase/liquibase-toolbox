-- liquibase formatted sql

-- changeset Tsvi:1
CREATE (TheMatrix:Movie {title:'The Matrix', released:1999, tagline:'Welcome to the Real World'})
--rollback MATCH (n:Movie) WHERE n.title = 'The Matrix'
--rollback DELETE n

-- changeset Tsvi:2
CREATE (Keanu:Person {name:'Keanu Reeves', born:1964})
--rollback MATCH (n:Person) WHERE n.name = 'Keanu Reeves'
--rollback DELETE n

-- changeset Tsvi:3
CREATE (Carrie:Person {name:'Carrie-Anne Moss', born:1967})
--rollback MATCH (n:Person) WHERE n.name = 'Carrie-Anne Moss'
--rollback DELETE n

-- changeset Tsvi:4
CREATE (Laurence:Person {name:'Laurence fishburne', born:1961})
--rollback MATCH (n:Person) WHERE n.name = 'Laurence fishburne'
--rollback DELETE n

-- changeset Tsvi:5
CREATE (Hugo:Person {name:'Hugo weaving', born:1962})
--rollback MATCH (n:Person) WHERE n.name = 'Hugo weaving'
--rollback DELETE n

-- changeset Tsvi:6
CREATE (LillyW:Person {name:'Lilly Wachowski', born:1967})
--rollback MATCH (n:Person) WHERE n.name = 'Lilly Wachowski'
--rollback DELETE n

-- changeset Tsvi:7
CREATE (LanaW:Person {name:'Lana Wachowski', born:1965})
--rollback MATCH (n:Person) WHERE n.name = 'Lana Wachowski'
--rollback DELETE n

-- changeset Tsvi:8
CREATE (JoelS:Person {name:'Joel Silver', born:1952})
--rollback MATCH (n:Person) WHERE n.name = 'Joel Silver'
--rollback DELETE n

-- changeset Tsvi:9
MATCH
  (a:Person),
  (b:Movie)
WHERE a.name = 'Keanu Reeves' AND b.title = 'The Matrix'
CREATE (a)-[:ACTED_IN {roles:['Neo']}]->(b)
--rollback MATCH (n {name: 'Keanu Reeves'})-[r:ACTED_IN]->(t {title:'The Matrix'})
--rollback DELETE r

-- changeset Tsvi:10
MATCH
  (a:Person),
  (b:Movie)
WHERE a.name = 'Carrie-Anne Moss' AND b.title = 'The Matrix'
CREATE (a)-[:ACTED_IN {roles:['Trinity']}]->(b)
--rollback MATCH (n {name: 'Carrie-Anne Moss'})-[r:ACTED_IN]->(t {title:'The Matrix'})
--rollback DELETE r

-- changeset Tsvi:11
MATCH
  (a:Person),
  (b:Movie)
WHERE a.name = 'Laurence fishburne' AND b.title = 'The Matrix'
CREATE (a)-[:ACTED_IN {roles:['Morpheus']}]->(b)
--rollback MATCH (n {name: 'Laurence fishburne'})-[r:ACTED_IN]->(t {title:'The Matrix'})
--rollback DELETE r

-- changeset Tsvi:12
MATCH
  (a:Person),
  (b:Movie)
WHERE a.name = 'Hugo weaving' AND b.title = 'The Matrix'
CREATE (a)-[:ACTED_IN {roles:['Agent Smith']}]->(b)
--rollback MATCH (n {name: 'Hugo weaving'})-[r:ACTED_IN]->(t {title:'The Matrix'})
--rollback DELETE r

-- changeset Tsvi:13
MATCH
  (a:Person),
  (b:Movie)
WHERE a.name = 'Lilly Wachowski' AND b.title = 'The Matrix'
CREATE (a)-[:DIRECTED]->(b)
--rollback MATCH (n {name: 'Lilly Wachowski'})-[r:DIRECTED]->(t {title:'The Matrix'})
--rollback DELETE r

-- changeset Tsvi:14
MATCH
  (a:Person),
  (b:Movie)
WHERE a.name = 'Lana Wachowski' AND b.title = 'The Matrix'
CREATE (a)-[:DIRECTED]->(b)
--rollback MATCH (n {name: 'Lana Wachowski'})-[r:DIRECTED]->(t {title:'The Matrix'})
--rollback DELETE r

-- changeset Tsvi:15
MATCH
  (a:Person),
  (b:Movie)
WHERE a.name = 'Joel Silver' AND b.title = 'The Matrix'
CREATE (a)-[:PRODUCED]->(b)
--rollback MATCH (n {name: 'Joel Silver'})-[r:PRODUCED]->(t {title:'The Matrix'})
--rollback DELETE r
