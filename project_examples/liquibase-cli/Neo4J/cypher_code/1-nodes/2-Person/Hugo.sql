-- liquibase formatted sql

-- changeset MarioD:1
CREATE (Hugo:Person {name:'Hugo weaving', born:1962})
--rollback MATCH (n:Person) WHERE n.name = 'Hugo weaving'
--rollback DELETE n

