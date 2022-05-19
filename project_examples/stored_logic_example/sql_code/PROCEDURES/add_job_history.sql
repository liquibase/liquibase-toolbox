-- liquibase formatted sql

--changeset JoeS:CreatePROC_add_job_history endDelimiter:/ splitStatements:false runOnChange:true rollbackEndDelimiter:/
CREATE OR REPLACE PROCEDURE add_job_history
 (  p_emp_id          job_history.employee_id%type
  , p_start_date      job_history.start_date%type
  , p_end_date        job_history.end_date%type
  , p_job_id          job_history.job_id%type
  , p_department_id   job_history.department_id%type
  )
IS
BEGIN
 INSERT INTO job_history (employee_id, start_date, end_date,
                          job_id, department_id)
   VALUES(p_emp_id, p_start_date, p_end_date, p_job_id, p_department_id);
END;
/
--rollback CREATE OR REPLACE PROCEDURE add_job_history
--rollback  (  p_emp_id          job_history.employee_id%type
--rollback   , p_start_date      job_history.start_date%type
--rollback   , p_end_date        job_history.end_date%type
--rollback  , p_job_id          job_history.job_id%type
--rollback   )
--rollback IS
--rollback BEGIN
--rollback  INSERT INTO job_history (employee_id, start_date, end_date,
--rollback                           job_id)
--rollback    VALUES(p_emp_id, p_start_date, p_end_date, p_job_id);
--rollback END;
--rollback /
