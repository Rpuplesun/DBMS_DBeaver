SELECT 	*
FROM 	EMPLOYEES e ;

-- salary 4000 ~ 8000, first_name, last_name, salary
SELECT 	FIRST_NAME , LAST_NAME , SALARY 
FROM 	EMPLOYEES e 
WHERE 	SALARY >= 4000
AND 	SALARY <= 8000
;

-- between A and B
SELECT 	FIRST_NAME , LAST_NAME , SALARY 
FROM 	EMPLOYEES e 
WHERE 	SALARY BETWEEN 4000 AND 8000
;

-- salary 6500, 7700, 13000인 사람의 first_name, last_name, salary 조회
SELECT 	first_name, last_name, salary
FROM	EMPLOYEES e 
WHERE 	SALARY = 6500
or 		SALARY = 7700
OR 		SALARY = 13000
;

-- in
SELECT 	first_name, last_name, salary
FROM	EMPLOYEES e 
WHERE 	SALARY IN (6500, 7700, 13000)
;

-- employees 테이블에서 employee_id, first_name, last_name, job_id, manager_id, salary를 조회
-- department_id가 10 또는 30 또는 100 또는 90에 속하고,
-- salary가 5000이상 10000이하이고
-- manager_id가 100이 아닌 사람을 조회
SELECT	EMPLOYEE_ID , FIRST_NAME , LAST_NAME , JOB_ID , MANAGER_ID  , SALARY 
FROM	EMPLOYEES e 
WHERE 	DEPARTMENT_ID IN (10, 30, 100, 90)
AND 	SALARY BETWEEN 5000 AND 10000
AND 	MANAGER_ID != 100
;

-- like -> D로 시작하는 사람
SELECT 	FIRST_NAME , LAST_NAME 
FROM 	EMPLOYEES e 
WHERE 	FIRST_NAME LIKE 'D%'
;

-- like -> d로 끝나는 사람
SELECT	FIRST_NAME , LAST_NAME 
FROM 	EMPLOYEES e 
WHERE 	FIRST_NAME LIKE '%d'
;

-- like -> 이름의 3번째 자리에 e가 놓인 사람 
SELECT 	FIRST_NAME , LAST_NAME 
FROM 	EMPLOYEES e 
WHERE 	FIRST_NAME LIKE '__e%'
;

-- is null
SELECT	FIRST_NAME , LAST_NAME , JOB_ID , COMMISSION_PCT 
FROM 	EMPLOYEES e
WHERE 	COMMISSION_PCT IS NULL 
;

-- is not null
SELECT 	FIRST_NAME , LAST_NAME , JOB_ID , COMMISSION_PCT 
FROM 	EMPLOYEES e 
WHERE 	COMMISSION_PCT IS NOT NULL 
;

-- order by ASC -> 오름차순
SELECT 	*
FROM 	EMPLOYEES e 
ORDER BY FIRST_NAME ASC 
;

-- 생략가능
SELECT 	*
FROM 	EMPLOYEES e 
ORDER BY FIRST_NAME
;

-- order by DESC -> 내림차순
SELECT 	*
FROM 	EMPLOYEES e 
ORDER BY SALARY DESC 
;

-- 합계 sum()
SELECT 	SUM(SALARY) 
FROM 	EMPLOYEES e 
;

-- count
SELECT 	COUNT(EMPLOYEE_ID) 
FROM 	EMPLOYEES e 
;

-- 몇 개의 부서를 가지고 있는가?
SELECT 	COUNT(DISTINCT DEPARTMENT_ID) 
FROM 	EMPLOYEES e 
;

-- EMPLOYEES 테이블에서 first_name count와, 중복을 제거한 first_name count 조회
SELECT 	COUNT(FIRST_NAME) , COUNT(DISTINCT FIRST_NAME) 
FROM 	EMPLOYEES e 
;

-- AVG : 평균
SELECT 	AVG(SALARY) 
FROM 	EMPLOYEES e 
;

-- DEPARTMENT_ID = 80인 급여 평균
SELECT	AVG(SALARY)
FROM	EMPLOYEES e
WHERE	DEPARTMENT_ID = 80
;

-- max : 최대값
SELECT 	MAX(SALARY) 
FROM 	EMPLOYEES e 
;

-- 가장 나중에 입사한 사람
SELECT 	MAX(HIRE_DATE) 
FROM 	EMPLOYEES e 
;

-- min : 최솟값
SELECT 	MIN(SALARY) 
FROM 	EMPLOYEES e 
;

-- 가장 먼저 입사한 사람
SELECT 	MIN(HIRE_DATE)
FROM	EMPLOYEES e 
;

-- 절대값 : abs
SELECT 	ABS(-23)
FROM	dual
;

SELECT 	ABS(23) AS "abs"
FROM	dual
;

-- 반올림 round()
SELECT 	ROUND(0.123), ROUND(0.543)
FROM	dual
;

SELECT 	ROUND(0.123), ROUND(2.543)
FROM	dual
;

-- 절삭 : trunc
SELECT 	TRUNC(1234.123456789) 
FROM	dual
;

SELECT 	TRUNC(1234.123456789, 2) 
FROM	dual
;

SELECT 	TRUNC(1234.123456789, -1) 
FROM	dual
;

-- 1. salary가 12000 이상 되는 직원들의 last_name, salary를 오름차순(salary)으로 조회
SELECT 	LAST_NAME , SALARY 
FROM 	EMPLOYEES e 
WHERE 	SALARY >= 12000
ORDER BY SALARY 
;

-- 2. 사원번호가 176인 사람의 last_name, department_id 조회
SELECT 	LAST_NAME , DEPARTMENT_ID 
FROM 	EMPLOYEES e 
WHERE 	EMPLOYEE_ID = 176
;

-- 3. 연봉이 5000에서 12000의 범위 이외인 사람들의 last_name 및 salary 조회
SELECT 	LAST_NAME , SALARY 
FROM 	EMPLOYEES e 
WHERE 	NOT SALARY BETWEEN 5000 AND 12000
;

-- 4. 20번 부서 또는 50번 부서에서 근무하는 모든 사원들의 last_name, department_id를
--    알파벳 순으로 조회
SELECT 	LAST_NAME , DEPARTMENT_ID 
FROM 	EMPLOYEES e 
WHERE 	DEPARTMENT_ID IN (20, 50)
ORDER BY LAST_NAME  
;

-- 5. 20번 및 50번 부서에서 근무하며, 연봉이 5000 이상 12000 사이인 사원들의
---   last_name, salary를 조회
SELECT 	LAST_NAME , SALARY 
FROM 	EMPLOYEES e 
WHERE 	DEPARTMENT_ID IN (20, 50)
AND 	SALARY BETWEEN 5000 AND 12000
;

-- 6. last_name 첫 글자가 A인 사원들의 last_name을 조회
SELECT 	LAST_NAME 
FROM 	EMPLOYEES e
WHERE 	LAST_NAME LIKE 'A%'
;

-- 7. manager_id가 없는 사람의 last_name과 job_id를 조회
SELECT 	LAST_NAME , JOB_ID 
FROM 	EMPLOYEES e 
WHERE 	MANAGER_ID IS NULL 
;

-- 8. 커미션이 있는 모든 사원들의 last_name, salary, 커미션을 조회
--    연봉 역순으로 조회한다.
SELECT 	LAST_NAME , SALARY , COMMISSION_PCT 
FROM 	EMPLOYEES e 
WHERE 	COMMISSION_PCT IS NOT NULL 
ORDER BY SALARY DESC 
;








