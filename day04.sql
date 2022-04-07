SELECT * FROM tab;

-- 주석
/*
	여러 라인 주석
*/

/*
	데이터 조작어(DML) : select, insert, delete, update
*/

-- select
/*
 * select	속성이름 / *
 * from		테이블이름 
 * where	검색조건
 * and		검색조건
 */

-- tab 라는 테이블에서 tname 컬럼을 조회
SELECT	TNAME 
FROM 	tab;

-- employees 테이블의 모든 항목 조회
SELECT 	*
FROM 	EMPLOYEES;

-- employees 테이블에서 last_name 컬럼값이 Austin인 사람 조회
SELECT 	*
FROM 	EMPLOYEES
WHERE 	LAST_NAME = 'Austin';

-- employees 테이블에서 departmen_id 60이고,manager_id가 102인 사람 조회
SELECT 	*
FROM 	EMPLOYEES
WHERE 	DEPARTMENT_ID  = 60
AND 	MANAGER_ID = 102
;

-- employees 테이블에서 last_name이 Smith인 사람의 employee_id와, last_name 조회
SELECT 	EMPLOYEE_ID , LAST_NAME 
FROM 	EMPLOYEES
WHERE 	LAST_NAME = 'Smith'
;

-- 2시
-- employees 테이블에서 department_id가 100이고 job_id가 FI_MGR인 사람 조회
SELECT 	*
FROM 	EMPLOYEES
WHERE 	DEPARTMENT_ID = 100
AND 	JOB_ID = 'FI_MGR'
;

-- employees 테이블에서 first_name이 Guy인 사람의 employee_id, first_name, last_name, job_id 조회
SELECT 	EMPLOYEE_ID , FIRST_NAME , LAST_NAME , JOB_ID 
FROM 	EMPLOYEES e 
WHERE 	FIRST_NAME = 'Guy'
;

-- employees 테이블에서 department_id가 50이고 manager_id가 121인 사람의 employee_id, first_name, last_name, job_id 조회
SELECT 	EMPLOYEE_ID , FIRST_NAME , LAST_NAME , JOB_ID 
FROM 	EMPLOYEES e 
WHERE 	DEPARTMENT_ID = 50
AND 	MANAGER_ID = 121
;

-- 별칭(as, 알리아스)
SELECT 	EMPLOYEE_ID AS "ID" , SALARY "SAL", DEPARTMENT_ID de
FROM 	EMPLOYEES e 
;

-- 함수
-- distinct : 중복제거
SELECT 	DISTINCT JOB_ID 
FROM 	EMPLOYEES e 
;

-- >=, >, <=, <
SELECT 	FIRST_NAME , LAST_NAME , SALARY 
FROM 	EMPLOYEES e 
WHERE 	SALARY >= 5000
;

SELECT 	*
FROM 	EMPLOYEES e 
WHERE 	SALARY < 2500
;

-- or
SELECT 	*
FROM 	EMPLOYEES e 
WHERE 	DEPARTMENT_ID = 50
OR 		MANAGER_ID = 100
;

-- not
-- EMPLOYEES : 107명,  DEPARTMENT_ID(50) : 45 -> 62
SELECT 	*
FROM 	EMPLOYEES e 
WHERE 	NOT(DEPARTMENT_ID = 50)
;

SELECT * FROM EMPLOYEES e WHERE EMPLOYEE_ID  = 178;

-- not <>
SELECT 	*
FROM 	EMPLOYEES e 
WHERE 	DEPARTMENT_ID <> 50
;

-- not !=
SELECT 	*
FROM 	EMPLOYEES e 
WHERE 	DEPARTMENT_ID != 50
;




