-- liquibase formatted sql

-- changeset Tsvi:3
CREATE (TheMatrix:Movie {title:'The Matrix', released:1999, tagline:'Welcome to the Real World'})
--rollback MATCH (n:Movie) WHERE n.title = 'The Matrix'
--rollback DELETE n

