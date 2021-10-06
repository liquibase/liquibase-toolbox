--liquibase formatted sql

--changeset SteveZ:765
CREATE TABLE liquibase.immatable (foo VARCHAR, PRIMARY KEY (foo))
--rollback DROP TABLE liquibase.immatable;
--changeset SteveZ:766
CREATE TABLE liquibase.immatable2 (foo2 VARCHAR, PRIMARY KEY (foo2))
--rollback DROP TABLE liquibase.immatable2;
