--liquibase formatted sql

--changeset MikeO:45556-CreatePROC_add_job_history114 context:DEV,deployment_1B labels:Jira-167 endDelimiter:/ splitStatements:false runOnChange:true
CREATE OR REPLACE PROCEDURE add_job_history114
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
--rollback DROP PROCEDURE add_job_history114;