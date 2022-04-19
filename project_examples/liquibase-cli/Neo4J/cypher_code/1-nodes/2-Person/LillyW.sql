-- liquibase formatted sql

-- changeset Erika:6
CREATE (LillyW:Person {name:'Lilly Wachowski', born:1967})
--rollback MATCH (n:Person) WHERE n.name = 'Lilly Wachowski'
--rollback DELETE n

