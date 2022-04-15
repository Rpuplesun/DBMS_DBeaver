SELECT 	*
FROM 	EMPLOYEES e 
;


SELECT 	DEPARTMENT_ID 
FROM 	EMPLOYEES e 
;

SELECT 	*
FROM 	DEPARTMENTS d 
;

-- inner join, EMPLOYEES(DEPARTMENT_ID) , DEPARTMENTS(DEPARTMENT_ID)
SELECT 	e.EMPLOYEE_ID	, e.FIRST_NAME
	,	e.DEPARTMENT_ID , d.DEPARTMENT_ID
	,	d.DEPARTMENT_NAME
FROM 	EMPLOYEES e 
	INNER JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID  
ORDER BY e.EMPLOYEE_ID 
;

-- inner join,
-- EMPLOYEES(DEPARTMENT_ID) , DEPARTMENTS(DEPARTMENT_ID)
-- DEPARTMENTS(LOCATION_ID)	, LOCATIONS(LOCATION_ID) 

-- LOCATIONS(COUNTRY_ID) , COUNTRIES(COUNTRY_ID)
-- COUNTRIES(REGION_ID)  , REGIONS(REGION_ID)
-- COUNTRY_NAME, REGION_NAME : select문 추가

SELECT	e.EMPLOYEE_ID 	, e.FIRST_NAME 
	,	d.DEPARTMENT_ID , d.DEPARTMENT_NAME 
	,	l.LOCATION_ID  	, l.CITY 
	, 	c.COUNTRY_ID 	, c.COUNTRY_NAME 
	,	r.REGION_ID 	, r.REGION_NAME 
FROM 	EMPLOYEES e
	INNER JOIN DEPARTMENTS d 	ON e.DEPARTMENT_ID 	= d.DEPARTMENT_ID
	INNER JOIN LOCATIONS l 		ON d.LOCATION_ID 	= l.LOCATION_ID 
	INNER JOIN COUNTRIES c 		ON l.COUNTRY_ID 	= c.COUNTRY_ID 
	INNER JOIN REGIONS r 		ON c.REGION_ID 		= r.REGION_ID 
;

/*
 *  inner join
 *	locations 테이블에 city가 'Seattle'인 경우의
 * 	first_name, last_name, department_id,department_name,
 * 	job_id, job_title, city
 */

SELECT	e.FIRST_NAME 	, e.LAST_NAME
	, 	d.DEPARTMENT_ID , d.DEPARTMENT_NAME 
	,	j.JOB_ID 		, j.JOB_TITLE 
	,	l.CITY 
FROM 	EMPLOYEES e
	INNER JOIN DEPARTMENTS d 	ON e.DEPARTMENT_ID 	= d.DEPARTMENT_ID 
	INNER JOIN LOCATIONS l 		ON d.LOCATION_ID	= l.LOCATION_ID 
	INNER JOIN JOBS j 			ON e.JOB_ID 		= j.JOB_ID 
WHERE 	l.CITY  = 'Seattle'
;

-- 106
SELECT 	COUNT(*) 
FROM 	EMPLOYEES e 
	INNER JOIN DEPARTMENTS d 	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
;

-- 107
SELECT 	COUNT(*) 
FROM 	EMPLOYEES e 
	LEFT OUTER JOIN DEPARTMENTS d 	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
;

-- left outer join
/*
 * employee_id, first_name, hire_date, start_date, end_date,
 * job_id, department_id 출력하고 employee_id 오름차순 정렬
 */
SELECT	e.EMPLOYEE_ID	, e.FIRST_NAME 
	, 	e.HIRE_DATE 	, jh.START_DATE 
	,	jh.END_DATE 	, jh.JOB_ID 
	,	e.DEPARTMENT_ID
FROM 	EMPLOYEES e
	LEFT OUTER JOIN 	JOB_HISTORY jh 	ON	e.EMPLOYEE_ID = jh.EMPLOYEE_ID 
ORDER BY e.EMPLOYEE_ID 
;

-- right outer join
SELECT	e.EMPLOYEE_ID	, e.FIRST_NAME 
	, 	e.HIRE_DATE 	, jh.START_DATE 
	,	jh.END_DATE 	, jh.JOB_ID 
	,	e.DEPARTMENT_ID
FROM 	EMPLOYEES e
	RIGHT OUTER JOIN 	JOB_HISTORY jh 	ON	e.EMPLOYEE_ID = jh.EMPLOYEE_ID 
ORDER BY e.EMPLOYEE_ID 
;

-- full outer join
SELECT	e.EMPLOYEE_ID	, e.FIRST_NAME 
	, 	e.HIRE_DATE 	, jh.START_DATE 
	,	jh.END_DATE 	, jh.JOB_ID 
	,	e.DEPARTMENT_ID
FROM 	EMPLOYEES e
	FULL OUTER JOIN 	JOB_HISTORY jh 	ON	e.EMPLOYEE_ID = jh.EMPLOYEE_ID 
ORDER BY e.EMPLOYEE_ID 
;

/*
 * 문제1.
 * 사원들의 이름, 부서번호, 부서명을 출력
 */
SELECT 	e.FIRST_NAME , d.DEPARTMENT_ID , d.DEPARTMENT_NAME 
FROM 	EMPLOYEES e 
	LEFT OUTER JOIN DEPARTMENTS d  ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
;

/*
 * 문제2.
 * 30번 부서의 사원들의 이름, 직업, 부서명 출력
 */
SELECT 	e.FIRST_NAME , j.JOB_TITLE , d.DEPARTMENT_NAME 
FROM 	EMPLOYEES e
	INNER JOIN DEPARTMENTS d 	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
	INNER JOIN JOBS j 			ON e.JOB_ID = j.JOB_ID 
WHERE  e.DEPARTMENT_ID = 30
;

/*
 * 문제3.
 * 커미션을 받는 사원들의 이름, 직업, 부서번호, 부서명 출력
 */
SELECT 	e.FIRST_NAME , j.JOB_TITLE , d.DEPARTMENT_ID , d.DEPARTMENT_NAME 
FROM 	EMPLOYEES e 
	INNER JOIN DEPARTMENTS d 	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
	INNER JOIN JOBS j 			ON e.JOB_ID = j.JOB_ID 
WHERE e.COMMISSION_PCT IS NOT NULL 
;

/*
 * 문제4.
 * 지역번호(location_id) 2500에서 근무하는 사원의 이름, 직업, 부서번호, 부서명 출력
 */
SELECT 	e.FIRST_NAME , j.JOB_TITLE , d.DEPARTMENT_ID , d.DEPARTMENT_NAME 
FROM 	EMPLOYEES e 
	INNER JOIN DEPARTMENTS d 	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
	INNER JOIN JOBS j 			ON e.JOB_ID = j.JOB_ID 
	INNER JOIN LOCATIONS l 		ON d.LOCATION_ID = l.LOCATION_ID 
WHERE l.LOCATION_ID = 2500
;

/*
 * 문제5.
 * 이름에 A가 들어가는 사원들의 이름과 부서이름을 출력
 */
SELECT 	e.FIRST_NAME , d.DEPARTMENT_NAME 
FROM 	EMPLOYEES e 
	INNER JOIN DEPARTMENTS d	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE 	e.FIRST_NAME LIKE '%A%'
;









