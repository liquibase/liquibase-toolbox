--liquibase formatted sql

--changeset TsviZ:1
CREATE TABLE test.t1 (x String) ENGINE = Memory AS SELECT 1;
--rollback DROP TABLE test.t1;

--changeset TsviZ:2
CREATE TABLE test.mt (x Int8) Engine = MergeTree ORDER BY x;
--rollback DROP TABLE test.mt;

--changeset TsviZ:3
CREATE VIEW test.v1 AS SELECT sum(x) FROM test.mt;
--rollback DROP VIEW test.v1;

--changeset TsviZ:4
INSERT INTO test.mt VALUES (1);
INSERT INTO test.mt VALUES (2);
INSERT INTO test.mt VALUES (3);
--rollback ALTER TABLE test.mt DELETE WHERE 0