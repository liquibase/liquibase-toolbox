-- liquibase formatted sql

-- changeset WesW:1
CREATE (JoelS:Person {name:'Joel Silver', born:1952})
--rollback MATCH (n:Person) WHERE n.name = 'Joel Silver'
--rollback DELETE n

