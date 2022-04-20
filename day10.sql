SELECT 	*
FROM 	EMPLOYEES e 
;

/* 
 * 1. EMPLOYEES 테이블에서 100번 부서의 최소 급여보다
 * 최소 급여가 많은 다른 모든 부서를 출력하라
 */
SELECT 	DEPARTMENT_ID , MIN(SALARY) 
FROM 	EMPLOYEES e
GROUP BY DEPARTMENT_ID 
HAVING 	MIN(SALARY) > (SELECT MIN(SALARY) FROM EMPLOYEES e2 WHERE DEPARTMENT_ID = 100)
;

/* 
 * 2. EMPLOYEES 테이블에서 사원번호가 123인 사원의 직업과 같고,
 * 사원번호가 192인 사원의 급여보다 많은 사원의 사원번호, 이름, 직업, 급여를 출력하라
 */
SELECT 	e.EMPLOYEE_ID , e.FIRST_NAME , e.JOB_ID , e.SALARY 
FROM 	EMPLOYEES e
WHERE 	JOB_ID = (SELECT JOB_ID FROM EMPLOYEES e2 WHERE EMPLOYEE_ID  = 123)
AND 	SALARY > (SELECT SALARY FROM EMPLOYEES e3 WHERE EMPLOYEE_ID  = 192)
;

/*
 * 3.EMPLOYEES 테이블에서 50번 부서의 최소 급여를 받는 사원보다 많은 급여를 받는 사원의
 * 사원번호, 이름, 업무, 입사일자, 급여, 부서번호를 출력하라.
 * 단, 50번 부서는 제외
 */
SELECT	e.EMPLOYEE_ID 	, e.FIRST_NAME 
	, 	e.JOB_ID 		, e.HIRE_DATE
 	, 	e.SALARY 		, e.DEPARTMENT_ID 
FROM 	EMPLOYEES e
WHERE	SALARY > (SELECT MIN(SALARY) FROM EMPLOYEES e2 WHERE DEPARTMENT_ID = 50)
AND 	DEPARTMENT_ID != 50 
;

/*
 * 4.EMPLOYEES 테이블에서 50번 부서의 최대 급여를 받는 사원보다 많은 급여를 받는 사원의
 * 사원번호, 이름, 업무, 입사일자, 급여, 부서번호를 출력하라.
 * 단, 50번 부서는 제외
 */
SELECT	e.EMPLOYEE_ID 	, e.FIRST_NAME 
	, 	e.JOB_ID 		, e.HIRE_DATE
 	, 	e.SALARY 		, e.DEPARTMENT_ID 
FROM 	EMPLOYEES e
WHERE	SALARY > (SELECT MAX(SALARY) FROM EMPLOYEES e2 WHERE DEPARTMENT_ID = 50)
AND 	DEPARTMENT_ID != 50 
;

/*
 * 5. EMLPYEES 테이블에서 가장 많은 사원이 속해 있는 부서 번호와, 사원 수를 출력하라.
 */
SELECT 	e.DEPARTMENT_ID , COUNT(DEPARTMENT_ID)
FROM 	EMPLOYEES e
GROUP BY DEPARTMENT_ID 
HAVING 	 COUNT(DEPARTMENT_ID) = (SELECT MAX(COUNT(DEPARTMENT_ID)) 
								 FROM EMPLOYEES e3
								 GROUP BY DEPARTMENT_ID) 
;

-----------------------------------------------------------------------------------
-- TABLE 생성
CREATE TABLE EMPLOYEES2(
	EMPLOYEES_ID	NUMBER(10),
	NAME			VARCHAR2(20),
	SALARY			NUMBER(7,2)
);

-- 기존 테이블과 동일하게 작성
CREATE TABLE EMPLOYEES3
AS
SELECT * FROM EMPLOYEES e ;

SELECT * FROM EMPLOYEES3 e ;

SELECT * FROM EMPLOYEES2 e ;

-- 테이블 수정
ALTER TABLE EMPLOYEES2 ADD(
	MANAGER_ID	VARCHAR2(20)
);


-- 컬럼 수정
ALTER TABLE EMPLOYEES2 MODIFY(
	MANAGER_ID	VARCHAR2(30)
);

-- 컬럼 삭제
-- ALTER TABLE EMPLOYEES2 DROP COLUMN MANAGER_ID;

-- 테이블 삭제
-- DROP TABLE EMPLOYEES3 ;

SELECT * FROM EMPLOYEES2 e ;

-- 데이터 입력
INSERT INTO EMPLOYEES2 VALUES(1, '직원1', 30000);
INSERT INTO EMPLOYEES2 VALUES(2, '직원2', 3000);
INSERT INTO EMPLOYEES2 VALUES(3, '직원3', 50000);
INSERT INTO EMPLOYEES2 VALUES(4, '직원4', 39000);
INSERT INTO EMPLOYEES2 VALUES(5, '직원5', 2000);

-- TRUNCATE
TRUNCATE TABLE EMPLOYEES2 ;
















