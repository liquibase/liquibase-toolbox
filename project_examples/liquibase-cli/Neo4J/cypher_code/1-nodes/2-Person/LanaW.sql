-- liquibase formatted sql

-- changeset RyanR:2
CREATE (LanaW:Person {name:'Lana Wachowski', born:1965})
--rollback MATCH (n:Person) WHERE n.name = 'Lana Wachowski'
--rollback DELETE n

