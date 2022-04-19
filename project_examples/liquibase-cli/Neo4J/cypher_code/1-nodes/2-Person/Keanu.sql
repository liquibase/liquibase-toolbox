-- liquibase formatted sql

-- changeset MarkF:1
CREATE (Keanu:Person {name:'Keanu Reeves', born:1964})
--rollback MATCH (n:Person) WHERE n.name = 'Keanu Reeves'
--rollback DELETE n

