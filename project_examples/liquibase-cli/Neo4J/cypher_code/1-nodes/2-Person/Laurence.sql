-- liquibase formatted sql

-- changeset RobertH:4
CREATE (Laurence:Person {name:'Laurence fishburne', born:1961})
--rollback MATCH (n:Person) WHERE n.name = 'Laurence fishburne'
--rollback DELETE n

