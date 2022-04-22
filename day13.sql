SELECT * FROM EMPLOYEES e ;

SELECT * FROM EMP_DETAILS_VIEW edv ;

-- view create
-- EMPLOYEES 테이블에서 job_id가 'ST_CLERK' 인 데이터만을 조회
CREATE VIEW v_emp(emp_id, first_name, job_id, hiredate, dept_id)
	AS SELECT 	EMPLOYEE_ID , FIRST_NAME , JOB_ID , HIRE_DATE , DEPARTMENT_ID 
	   FROM		EMPLOYEES e
	   WHERE 	JOB_ID = 'ST_CLERK';
	   
SELECT * FROM V_EMP ve ;

-- view 삭제
DROP VIEW V_EMP ;

-- job_id가 SH_CLERK인 사람의 정보로 view생성
CREATE OR REPLACE VIEW v_emp( emp_id, first_name, job_id, hiredate, dept_id )
	AS 	SELECT 	NVL(EMPLOYEE_ID, NULL), NVL(FIRST_NAME, NULL), JOB_ID , HIRE_DATE , DEPARTMENT_ID  
		FROM	employees
		WHERE 	JOB_ID = 'ST_CLERK'
;

SELECT * FROM V_EMP ;

CREATE VIEW v_emp2(emp_id, first_name, job_id, hiredate, dept_id)
	AS SELECT 	EMPLOYEE_ID , FIRST_NAME , JOB_ID , HIRE_DATE , DEPARTMENT_ID 
	   FROM		EMPLOYEES e
	   WHERE 	JOB_ID = 'ST_CLERK';
	  
SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID = 127;

-- Julia(125)
-- James(127)
SELECT * FROM V_EMP2;
UPDATE v_emp2 SET FIRST_NAME = 'kim' WHERE EMP_ID = 125;

-- 함수로 작성한 부분은 수정 불가
UPDATE v_emp SET FIRST_NAME = 'kim' WHERE EMP_ID = 127;
SELECT * FROM V_EMP2 WHERE EMP_ID = 125;
SELECT * FROM V_EMP WHERE EMP_ID = 127;

-- EMPLOYEES 테이블 UPDATE 
-- UPDATE EMPLOYEES SET FIRST_NAME = 'Julia' WHERE EMPLOYEE_ID = 125;
-- UPDATE EMPLOYEES SET FIRST_NAME = 'James' WHERE EMPLOYEE_ID = 127;

SELECT * FROM EMPLOYEES e WHERE EMPLOYEE_ID IN (125, 127);

-- 뷰 이름 : v_emp_salary, 
-- EMPLOYEES 테이블에서 employee_id, last_name, salary(월급), 연봉
CREATE VIEW v_emp_salary(emp_id, last_name, salary, anl_salary)
	AS	SELECT	EMPLOYEE_ID , LAST_NAME , SALARY , (SALARY + NVL(COMMISSION_PCT, 0)) * 12
		FROM 	EMPLOYEES e 
;

SELECT * FROM V_EMP_SALARY ;

-- read only
CREATE VIEW v_emp_salary_readonly(emp_id, last_name, salary, anl_salary)
	AS	SELECT	EMPLOYEE_ID , LAST_NAME , SALARY , (SALARY + NVL(COMMISSION_PCT, 0)) * 12
		FROM 	EMPLOYEES e 
WITH READ ONLY
;

SELECT * FROM V_EMP_SALARY_readonly ;

-- update
-- King(100)
UPDATE V_EMP_SALARY_READONLY SET last_name = 'kim' WHERE emp_id = 100;

-- 문제1
-- 50번 부서, job_id가 ST_CLERK, 연봉이 40000 이상인 사람들의 사번, last_name, department_id, hire_date
CREATE VIEW v_emp_ST(emp_id, last_name, department_id, hire_date)
	AS	SELECT	EMPLOYEE_ID , LAST_NAME , DEPARTMENT_ID , HIRE_DATE 
		FROM 	EMPLOYEES e 
		WHERE 	((SALARY + NVL(COMMISSION_PCT, 0)) * 12) >= 40000
		AND 	DEPARTMENT_ID = 50
		AND 	JOB_ID = 'ST_CLERK'
;

SELECT * FROM V_EMP_ST ;

-- 문제2
-- 50번 부서 사원들의 사번, first_name(띄어쓰기)last_name, department_id, hire_date
CREATE VIEW v_emp_50(emp_id, name, department_id, hire_date)
	AS	SELECT 	EMPLOYEE_ID , FIRST_NAME || ' ' || LAST_NAME , DEPARTMENT_ID , HIRE_DATE 
		FROM 	EMPLOYEES e 
		WHERE 	DEPARTMENT_ID = 50
;
SELECT * FROM v_emp_50;

-- 문제3
-- 사번, 이름, 부서번호, 부서명, 입사일 출력 view 생성
CREATE VIEW v_emp3(emp_id, name, department_id, department_name, hire_date)
	AS 	SELECT	e.EMPLOYEE_ID 	,  e.FIRST_NAME || ' ' || e.LAST_NAME
			,	d.DEPARTMENT_ID 	,  d.DEPARTMENT_NAME 
			,	e.HIRE_DATE
		FROM 	EMPLOYEES e
		LEFT OUTER JOIN DEPARTMENTS d ON d.DEPARTMENT_ID = e.DEPARTMENT_ID 
;
SELECT * FROM v_emp3;

-- sequence
-- 제품번호 생성하는 시퀀스 만들기
CREATE SEQUENCE seq_serial_no
INCREMENT BY 1
START WITH 100
MAXVALUE 110
MINVALUE 99
CYCLE
cache 2
;

CREATE TABLE good(
	good_no		number(3),
	good_name	varchar2(10)
);

SELECT * FROM GOOD ;
-- nextval : 다음 값
INSERT INTO good VALUES (seq_serial_no.nextval, '제품1');

-- 시퀀스 삭제
DROP SEQUENCE seq_serial_no;

-- 시퀀스 현재값
SELECT 	seq_serial_no.currval
FROM	dual
;











