-- liquibase formatted sql

-- changeset CarolineG:2
CREATE (Carrie:Person {name:'Carrie-Anne Moss', born:1967})
--rollback MATCH (n:Person) WHERE n.name = 'Carrie-Anne Moss'
--rollback DELETE n

