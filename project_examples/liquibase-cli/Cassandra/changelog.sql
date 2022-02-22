--liquibase formatted sql

--changeset TsviZ:765
CREATE TABLE monkey_species (
    species text PRIMARY KEY,
    common_name text,
    population varint,
    average_size int
) WITH comment='Important biological records';
--rollback DROP TABLE monkey_species;

--changeset AmyS:766
CREATE TABLE timeline (
    userid uuid,
    posted_month int,
    posted_time uuid,
    body text,
    posted_by text,
    PRIMARY KEY (userid, posted_month, posted_time)
) WITH compaction = { 'class' : 'LeveledCompactionStrategy' };
--rollback DROP TABLE timeline;

--changeset MarthaB:777
CREATE TABLE loads (
    machine inet,
    cpu int,
    mtime timeuuid,
    load float,
    PRIMARY KEY ((machine, cpu), mtime)
) WITH CLUSTERING ORDER BY (mtime DESC);
--rollback DROP TABLE loads;

--changeset TsviZ:778
CREATE TABLE t2 (
    a int,
    b int,
    c int,
    d int,
    PRIMARY KEY (a, b, c)
);
--rollback DROP TABLE t2;

--changeset AmyS:779
INSERT INTO t2 (a, b, c, d) VALUES (0,0,0,0);
INSERT INTO t2 (a, b, c, d) VALUES (0,0,1,1);
INSERT INTO t2 (a, b, c, d) VALUES (0,1,2,2);
INSERT INTO t2 (a, b, c, d) VALUES (0,1,3,3);
INSERT INTO t2 (a, b, c, d) VALUES (1,1,4,4);
--rollback DELETE FROM t2 WHERE a=0;
--rollback DELETE FROM t2 WHERE a=1;

--changeset TsviZ:781
CREATE TABLE race_winners (
   race_name text, 
   race_position int, 
   cyclist_name text, 
   PRIMARY KEY (race_name, race_position));
--rollback DROP TABLE race_winners;

--changeset TsviZ:782
CREATE MATERIALIZED VIEW cyclist_by_age 
AS SELECT race_name, race_position, cyclist_name 
FROM race_winners 
WHERE race_name IS NOT NULL AND race_position IS NOT NULL 
PRIMARY KEY (race_name, race_position)
WITH caching = { 'keys' : 'ALL', 'rows_per_partition' : '100' }
   AND comment = 'Based on table cyclist' ;
--rollback DROP MATERIALIZED VIEW cyclist_by_age;
