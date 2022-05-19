CREATE OR REPLACE TRIGGER secure_employees  
  BEFORE INSERT OR UPDATE OR DELETE ON employees  
BEGIN  
  secure_dml;  
END secure_employees; 