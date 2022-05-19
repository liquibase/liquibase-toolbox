-- liquibase formatted sql

--changeset NathanV:createTable_EMPLOYEES
CREATE TABLE EMPLOYEES
  (	
    EMPLOYEE_ID NUMBER(6,0) NOT NULL ENABLE, 
    FIRST_NAME VARCHAR2(20), 
    LAST_NAME VARCHAR2(25) CONSTRAINT "EMP_LAST_NAME_NN" NOT NULL ENABLE, 
    EMAIL VARCHAR2(25) CONSTRAINT "EMP_EMAIL_NN" NOT NULL ENABLE, 
    PHONE_NUMBER VARCHAR2(20), 
    HIRE_DATE DATE CONSTRAINT "EMP_HIRE_DATE_NN" NOT NULL ENABLE, 
    JOB_ID VARCHAR2(10) CONSTRAINT "EMP_JOB_NN" NOT NULL ENABLE, 
    SALARY NUMBER(8,2), 
    COMMISSION_PCT NUMBER(2,2), 
    MANAGER_ID NUMBER(6,0), 
    DEPARTMENT_ID NUMBER(4,0), 
    CONSTRAINT EMP_EMP_ID_PK PRIMARY KEY ("EMPLOYEE_ID")
    )
--rollback DROP TABLE EMPLOYEES

--changeset CharlieO:createTable_JOBS
CREATE TABLE jobs  
    ( job_id         VARCHAR2(10)  
                     CONSTRAINT job_id_pk  
      		        PRIMARY KEY 
    , job_title      VARCHAR2(35)  
	             CONSTRAINT job_title_nn  NOT NULL  
    , min_salary     NUMBER(6)  
    , max_salary     NUMBER(6)  
    )
--rollback DROP TABLE jobs

--changeset AlissaK:createTable_regions 
CREATE TABLE regions  
    ( region_id      NUMBER   
                     CONSTRAINT region_id_nn NOT NULL 
    ,                CONSTRAINT reg_id_pk  
                        PRIMARY KEY (region_id) 
    , region_name    VARCHAR2(25)   
    )
--rollback DROP TABLE regions

--changeset JimL:createTable_countries 
CREATE TABLE countries   
    ( country_id      CHAR(2)   
                      CONSTRAINT country_id_nn NOT NULL 
    ,                 CONSTRAINT country_c_id_pk   
        	         PRIMARY KEY (country_id) 
    , country_name    VARCHAR2(40)   
    , region_id       NUMBER   
    ,                 CONSTRAINT countr_reg_fk  
        	         FOREIGN KEY (region_id)  
          	         REFERENCES regions (region_id)   
    )   
    ORGANIZATION INDEX
--rollback DROP TABLE countries

--changeset AdeelM:createTable_locations
CREATE TABLE locations  
    ( location_id    NUMBER(4)  NOT NULL 
                     CONSTRAINT loc_id_pk  
       		        PRIMARY KEY  
    , street_address VARCHAR2(40)  
    , postal_code    VARCHAR2(12)  
    , city           VARCHAR2(30)  
	             CONSTRAINT loc_city_nn  NOT NULL  
    , state_province VARCHAR2(25)  
    , country_id     CHAR(2)  
    ,                CONSTRAINT loc_c_id_fk  
       		        FOREIGN KEY (country_id)  
        	        REFERENCES countries(country_id) 
    )
--rollback DROP TABLE locations

--changeset ChristineM:createTable_departments
CREATE TABLE departments  
    ( department_id    NUMBER(4) 
                       CONSTRAINT dept_id_pk  
       		          PRIMARY KEY 
    , department_name  VARCHAR2(30)  
	               CONSTRAINT dept_name_nn  NOT NULL  
    , manager_id       NUMBER(6)  
    , location_id      NUMBER(4)  
    ,                  CONSTRAINT dept_loc_fk  
       		          FOREIGN KEY (location_id)  
        	          REFERENCES locations (location_id)  
    )
--rollback drop table departments

--changeset SteveZ:createTable_job_history
CREATE TABLE job_history  
    ( employee_id   NUMBER(6)  
	            CONSTRAINT jhist_employee_nn  NOT NULL  
    ,               CONSTRAINT jhist_emp_fk  
                       FOREIGN KEY (employee_id)  
                       REFERENCES employees  
    , start_date    DATE  
	            CONSTRAINT jhist_start_date_nn  NOT NULL  
    , end_date      DATE  
	            CONSTRAINT jhist_end_date_nn  NOT NULL  
    , job_id        VARCHAR2(10)  
	            CONSTRAINT jhist_job_nn  NOT NULL  
    ,               CONSTRAINT jhist_job_fk  
                       FOREIGN KEY (job_id)  
                       REFERENCES jobs  
    , department_id NUMBER(4)  
    ,               CONSTRAINT jhist_dept_fk  
                       FOREIGN KEY (department_id)  
                       REFERENCES departments 
    , CONSTRAINT    jhist_emp_id_st_date_pk  
                       PRIMARY KEY (employee_id, start_date) 
    , CONSTRAINT    jhist_date_interval  
                       CHECK (end_date > start_date)  
    )
--rollback drop table job_history

--changeset EricD:create_TABLE_categories
CREATE TABLE categories
( category_id int NOT NULL,
  category_name char(50) NOT NULL,
  CONSTRAINT categories_pk PRIMARY KEY (category_id)
);
--rollback drop TABLE categories;
