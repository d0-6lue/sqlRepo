-- SUBQUERY

/*
    <SUBQUERY>
    하나의 SQL 문 안에 포함된 또 다른 SQL 문을 뜻한다.
    메인 쿼리(기존 쿼리)를 보조하는 역할을 하는 쿼리문이다.
*/

/*
    <서브 쿼리 구분>
        서브 쿼리는 서브 쿼리를 수행한 결과값의 행과 열의 개수에 따라서 분류할 수 있다.
        
        1) 단일행 서브 쿼리        : 서브 쿼리의 조회 결과 값의 행과 열의 개수가 1개 일 때
        2) 다중행 서브 쿼리        : 서브 쿼리의 조회 결과 값의 행의 개수가 여러 행 일 때
        3) 다중열 서브 쿼리        : 서브 쿼리의 조회 결과 값이 한 행이지만 컬럼이 여러개 일때
        4) 다중행, 다중열 서브 쿼리 : 서브 쿼리의 조호 결과 값이 여러행, 여러열 일 때
        
        * 서브 쿼리의 유형에 따라서 서브 쿼리 앞에 붙는 연산자가 달라진다.
        
    <단일행 서브 쿼리>
        서브 쿼리의 조회 결과 값의 행과 열의 개수가 1개 일 때 (단일행, 단일열)
        비교 연산자(단일행 연산자) 사용 가능 (=, !=, <>, ^=, >, <, >=, <=, ...)
*/

-- 노옹철 사원과 같은 부서원 조회
-- 1. 노옹철 사원 부서코드 조회 result
-- 2. 1번의 result 와 같은 부서코드를 가진 사원 조회

SELECT *
FROM EMPLOYEE
WHERE 
    DEPT_CODE =(
                SELECT DEPT_CODE
                FROM EMPLOYEE
                WHERE EMP_NAME = '노옹철')
;

-- 전체 직원의 평균 급여보다 급여가 적은 사원의 이름, 급여
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY < (
                SELECT AVG(NVL(SALARY, 0))
                FROM EMPLOYEE
                )
;

-- 최저 급여를 받는 직원의 이름, 급여 조회
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY = (
                SELECT MIN(SALARY)
                FROM EMPLOYEE
                )
;

-- 노옹철 사원의 급여보다 더 많은 급여를 받는 사원의 이름, 급여 조회
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY > (
                SELECT SALARY
                FROM EMPLOYEE
                WHERE EMP_NAME = '노옹철'
)
;
-- 부서별 급여의 합이 가장 큰 부서의 부서코드, 급여의 합 조회
SELECT DEPT_CODE, SUM(NVL(SALARY,0))
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING SUM(SALARY) = (
                    SELECT MAX(SUM(NVL(SALARY,0)))
                    FROM EMPLOYEE
                    GROUP BY DEPT_CODE
                    )
;

-- 전지연 사원이 속해있는 부서원들의 모든 칼럼 조회(단, 전지연 사원은 제외)

SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE = (
                    SELECT DEPT_CODE
                    FROM EMPLOYEE
                    WHERE EMP_NAME = '전지연'
                )
    AND EMP_NAME != '전지연'
;

/*
    <다중행 서브 쿼리>
        서브 쿼리의 조회 결과 값의 행의 개수가 여러 행 일 때
        
        IN / NOT IN (서브 쿼리) : 여러 개의 결과값 중에서 한 개라도 일치하는 값이 있다면 혹은 없다면 TRUE를 리턴한다.
        ANY : 여러 개의 값들 중에서 한 개라도 만족하면 TRUE, IN과 다른 점은 비교 연산자를 함께 사용한다는 점이다. 
            ANY(100, 200, 300)
            SALARY = ANY(...)  : IN과 같은 결과
            SALARY != ANY(...) : NOT IN과 같은 결과
            SALARY > ANY(...)  : 최소값 보다 크면 TRUE
            SALARY < ANY(...)  : 최대값 보다 작으면 TRUE
        ALL : 여러 개의 값들 모두와 비교하여 만족해야 TRUE, IN과 다른 점은 비교 연산자를 함께 사용한다는 점이다.
            ALL(100, 200, 300)
            SALARY > ALL(...)  : 최대값 보다 크면 TRUE
            SALARY < ALL(...)  : 최소값 보다 작으면 TRUE
*/

-- 각 부서별 최고 급여를 받는 직원의 이름, 부서코드, 급여 조회
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY IN (
                SELECT MAX(SALARY)
                FROM EMPLOYEE
                GROUP BY DEPT_CODE
                )
;

SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY = ANY (
                SELECT MAX(SALARY)
                FROM EMPLOYEE
                GROUP BY DEPT_CODE
                )
;

-- 대리 집급임에도 과장 직급들의 최소 급여보다 많이 받는 직원의 사번, 이름 급여 조회
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE E
    JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE)
WHERE SALARY > ANY (
                    SELECT SALARY
                    FROM EMPLOYEE E
                        JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE)
                    WHERE JOB_NAME = '과장'
                    )   
AND JOB_NAME = '대리'
;
/*
SELECT E.EMP_ID, E.EMP_NAME, E.SALARY
FROM EMPLOYEE E
    JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE)
WHERE J.JOB_NAME = '대리'
 AND SALARY > (
                SELECT MIN(SALARY)
                FROM EMPLOYEE E
                  JOIN JOB J
                   ON E.JOB_CODE = J.JOB_CODE
                 WHERE JOB_NAME = '과장'
                );
*/

-- 과장 직급임에도 차장 직급의 최대 급여보다 더 많이 받는 직원들의 사번, 이름, 직급명, 급여 조회

SELECT E.EMP_ID, E.EMP_NAME, J.JOB_NAME, E.SALARY
FROM EMPLOYEE E
    JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE)
WHERE J.JOB_NAME = '과장'
AND SALARY > ALL(
                SELECT SALARY
                FROM EMPLOYEE E
                    JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE)
                WHERE J.JOB_NAME = '차장'
                )
;

/*
    <다중열 서브 쿼리>
        조회 결과 값은 한 행이지만 나열된 칼럼 수가 여러 개일 때
*/

-- 하이유 사원과 부서코드, 직급코드, 가 같은 사원들 조회

SELECT *
FROM EMPLOYEE
WHERE (DEPT_CODE, JOB_CODE) = (( 'D5', 'J5' ))
;

SELECT *
FROM EMPLOYEE
WHERE (DEPT_CODE, JOB_CODE) = (
                                SELECT DEPT_CODE, JOB_CODE
                                FROM EMPLOYEE
                                WHERE EMP_NAME = '하이유'
                            )
;

-- 박나라 사원과 직급 코드가 일치하면서 같은 사수를 가지고 있는 사원의
-- 이름, 직급 코드, 사수 사번 조회
SELECT EMP_NAME, JOB_CODE, MANAGER_ID
FROM EMPLOYEE
WHERE (JOB_CODE, MANAGER_ID) = (
                                SELECT JOB_CODE, MANAGER_ID
                                FROM EMPLOYEE
                                WHERE EMP_NAME = '박나라'
                            )
;

/*
    <다중행 다중열 서브 쿼리>
        서브 쿼리의 조회 결과값이 여러 행, 여러 열일 경우
*/

-- 각 직급별 최소 급여를 받는 사원들의 사번, 이름, 직급 코드, 급여 조회

SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE (JOB_CODE, SALARY) IN (
                                SELECT JOB_CODE, MIN(SALARY)
                                FROM EMPLOYEE
                                GROUP BY JOB_CODE
                                )
;

SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE (JOB_CODE, SALARY) = ANY (
                                SELECT JOB_CODE, MIN(SALARY)
                                FROM EMPLOYEE
                                GROUP BY JOB_CODE
                                )
;

/*
    <인라인 뷰>
        FROM 절에 서브 쿼리를 제시하고, 서브 쿼리를 수행한 결과를 테이블 대신 사용한다.
*/

