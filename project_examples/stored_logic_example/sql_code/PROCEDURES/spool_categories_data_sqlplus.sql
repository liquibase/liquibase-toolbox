set lines 256
set trimout on
set tab off
set pagesize 100
set trimspool on
spool categories.csv

-- SELECT category_id, category_name
SELECT * 
FROM 
categories;
