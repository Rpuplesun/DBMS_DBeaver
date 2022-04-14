SELECT 	*
FROM 	EMPLOYEES e 
;

/*
 *  문제1
 *  EMPLOYEES 테이블에서 job_id가 'SA'로 시작하는 사람에 대하여
 *  급여의 평균, 최고액, 최저액, 합계를 출력하라
 */
SELECT  AVG(SALARY), MAX(SALARY), MIN(SALARY) , SUM(SALARY) 
FROM 	EMPLOYEES e 
WHERE 	JOB_ID LIKE 'SA%'
;


/*
 *  문제2
 *  EMPLOYEES 테이블에 등록되어 있는 사원 수, commission_pct가 null이 아닌 인원수,
 *  salary 평균, 등록되어 있는 부서의 수를 출력하라.
 */
SELECT  COUNT(*), COUNT(COMMISSION_PCT) , ROUND(AVG(SALARY)) , COUNT(DISTINCT DEPARTMENT_ID)
FROM 	EMPLOYEES e 
;

/*
 *  문제3
 *  EMPLOYEES 테이블에서 부서별 인원수, 평균급여, 최저급여, 최고급여, 급여의 합을 출력하라.
 */
SELECT 	DEPARTMENT_ID, COUNT(*),  AVG(SALARY), MIN(SALARY), MAX(SALARY), SUM(SALARY)  
FROM 	EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
;


/*
 *  문제4
 *  EMPLOYEES 테이블에서 부서별, 업무별로 인원수, 평균급여, 급여의 합, 부서, 업무를 출력하라
 */
SELECT 	DEPARTMENT_ID , JOB_ID , COUNT(*), AVG(SALARY), SUM(SALARY)  
FROM 	EMPLOYEES e 
GROUP BY DEPARTMENT_ID , JOB_ID 
;


/*
 *  문제5
 *  EMPLOYEES 테이블에서 부서 인원이 4명보다 많은 부서의 부서번호, 인원수, 급여의 합을 출력하라.
 */
SELECT 	DEPARTMENT_ID , COUNT(DEPARTMENT_ID), SUM(SALARY)  
FROM 	EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
HAVING COUNT(DEPARTMENT_ID) > 4 
;

/*
 *  문제6
 *  EMPLOYEES 테이블에서 급여가 최대 10000 이상인 부서에 대해서,
 *  부서번호, 평균급여, 급여의 합을 출력하라.
 */
SELECT 	DEPARTMENT_ID ,  AVG(SALARY), SUM(SALARY)  
FROM 	EMPLOYEES e 
GROUP BY DEPARTMENT_ID
HAVING 	MAX(SALARY)  >= 10000
;

/*
 *  문제7
 *  EMPLOYEES 테이블에서 업무별 급여의 평균이 10000 이상인 업무에 대해서,
 *  업무명, 평균급여, 급여의 합을 구하여 출력하라.
 */
SELECT 	JOB_ID , AVG(SALARY), SUM(SALARY)  
FROM 	EMPLOYEES e 
GROUP BY JOB_ID 
HAVING 	AVG(SALARY) >= 10000 
;

/*
 *  문제8
 *  EMPLOYEES 테이블에서 전체 월급이 10000을 초과하는 각 업무에 대해서
 *  업무와 월급의 합계를 출력하라.
 *  단, 업무가 'SA_'로 시작하는 업무는 제외하고 월 급여 합계로 내림차순으로 정렬
 */
SELECT 	JOB_ID , SUM(SALARY) 
FROM 	EMPLOYEES e 
WHERE 	JOB_ID NOT LIKE 'SA_%'
GROUP BY JOB_ID  
HAVING 	SUM(SALARY) > 10000
ORDER BY SUM(SALARY) DESC  
;

/*
 *  문제9
 *  각, job_id별 최대 급여, 최소 급여, 급여 총 합 및 평균 급여를 job_id 내림차순으로 조회
 */
SELECT 	JOB_ID , MAX(SALARY), MIN(SALARY), SUM(SALARY), AVG(SALARY)  
FROM 	EMPLOYEES e 
GROUP BY JOB_ID
ORDER BY JOB_ID DESC 
;


/*
 *  문제10
 *  EMPLOYEES 테이블에서 동일한 직업(job_id)를 가진 사원들의 총 수를 조회하라.
 */
SELECT 	JOB_ID , COUNT(*) 
FROM 	EMPLOYEES e 
GROUP BY JOB_ID 
;

/*
 *  문제11
 *  매니저의 사번 및 그 매니저가 관리하는 직원들 중 최소 연봉을 받는 사원의 연봉을 조회
 *  매니저가 없는 사람은 제외
 *  최소 연봉 기준 역순으로 조회
 */
SELECT 	MANAGER_ID , MIN(SALARY) 
FROM 	EMPLOYEES e 
WHERE 	MANAGER_ID IS NOT NULL
GROUP BY MANAGER_ID 
ORDER BY MIN(SALARY) DESC 
;

SELECT *
FROM 	EMPLOYEES e 
;

-- Lex 사원의 부서명(90)
SELECT 	*
FROM 	DEPARTMENTS d 
;

-- Neena(101) 직원의 부서 이동 내역, 이름(last name), 급여
SELECT 	*
FROM 	JOB_HISTORY jh 
;












