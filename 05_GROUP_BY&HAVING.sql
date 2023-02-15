-- GROUP BY
/*
    <GROUP BY>
        특정 기준에 따라 그룹 분리
*/
/*
    <SQL 실행 순서>
        5 : SELECT
        1 : FROM
        2 : WHERE
        3 : GROUP BY
        4 : HAVING
        6 : ORDER BY
*/

-- 전체 사원 대상
SELECT SUM(SALARY)
FROM EMPLOYEE;

-- 부서별로
SELECT DEPT_CODE, SUM(SALARY) AS "부서별 급여합계"
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- 직급별로
SELECT JOB_CODE, SUM(SALARY) AS "직급별 급여함계"
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY JOB_CODE;

-- 직급별 급여평균
SELECT JOB_CODE, AVG(SALARY) "직급별 급여평균"
FROM EMPLOYEE
GROUP BY JOB_CODE;

-- 부서별 급여평균
SELECT DEPT_CODE, AVG(SALARY) "직급별 급여평균"
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- 직급별 총인원수
SELECT JOB_CODE, COUNT(EMP_ID)
FROM EMPLOYEE
GROUP BY JOB_CODE;

-- 부서별 총인원수
SELECT DEPT_CODE, COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE;


SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
WHERE SALARY < 5000000
    AND DEPT_CODE IN ('D5', 'D6', 'D9')
GROUP BY DEPT_CODE;


/*
    <HAVING>
        GROUP 을 대상으로 조건 검사
*/

SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
WHERE SALARY < 5000000
    AND DEPT_CODE IN ('D5', 'D6', 'D9')
GROUP BY DEPT_CODE
HAVING SUM(SALARY) > 10000000
ORDER BY DEPT_CODE; -- ORDER BY 는 SELECT 보다 나중에 실행됨. -> 별칭 사용가능.

SELECT DEPT_CODE
    , FLOOR(AVG(NVL(SALARY, 0))) AS "부서별 평균급여"
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING AVG(NVL(SALARY, 0)) > 3000000
ORDER BY DEPT_CODE
;

-- 전체 사원의 급여합계
SELECT SUM(SALARY)
FROM EMPLOYEE
;
-- 전체 사원 중에서 보너스가 NULL 이 아닌 급여 합계
SELECT SUM(SALARY)
FROM EMPLOYEE
WHERE BONUS IS NOT NULL
;
-- 보너스가 NULL 이 아닌 사원과 NULL 인 사원
SELECT SUM(SALARY)
FROM EMPLOYEE
GROUP BY NVL2(BONUS, 1, 0)
;
-- 전체 사원 중에서 보너스가 NULL 이 아닌 급여 합계
-- + 부서별 급여 합계
SELECT DEPT_CODE "부서코드", SUM(SALARY) "부서별 급여합계"
FROM EMPLOYEE
WHERE BONUS IS NOT NULL
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE DESC NULLS LAST -- 내림차순, NULL 이 마지막
;
-- 전체 사원 중에서 보너스가 NULL 이 아닌 급여 평균
-- + 부서별 급여 평균
SELECT DEPT_CODE "부서코드", AVG(SALARY) "부서별 급여평균(보너스가 NULL이 아닌)"
FROM EMPLOYEE
WHERE BONUS IS NOT NULL
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE DESC NULLS LAST -- 내림차순, NULL 이 마지막
;

-- 전체 사원 중에서 보너스가 NULL 이 아닌 급여 평균
-- + 부서별 급여 평균
-- + 부서코드 기준 내림차순 ( NULL 제일 마지막)
-- + 부서별 급여 평균이 300만원 이하인 경우
SELECT DEPT_CODE "부서코드", AVG(SALARY) "부서별 급여평균(보너스가 NULL이 아닌)"
FROM EMPLOYEE
WHERE BONUS IS NOT NULL
GROUP BY DEPT_CODE
HAVING AVG(SALARY) < 3000000
ORDER BY DEPT_CODE DESC NULLS LAST
;
-- + 부서코드가 NULL 인 경우 제외
SELECT DEPT_CODE "부서코드", AVG(SALARY) "부서별 급여평균(보너스가 NULL이 아닌)"
FROM EMPLOYEE
WHERE BONUS IS NOT NULL
    AND DEPT_CODE IS NOT NULL
GROUP BY DEPT_CODE
HAVING AVG(SALARY) < 3000000
ORDER BY DEPT_CODE DESC NULLS LAST
;
-- 전체 사원 모든 정보 조회
-- 재직중인 사원만 조회
-- 가장 높은, 낮은 급여
-- 직급별 가장 높은 급여
-- 직급별 급여 평균 , SALARY 가 NULL 인 경우 제외, 만원단위로만 표시
-- 직급별 인원 수, SALARY 가 NULL 인 경우 방어
-- 직급 기준으로 정렬
SELECT JOB_CODE "직급"
    , MAX(SALARY) "직급별 가장 높은 급여"
    , MIN(SALARY) "직급별 가장 낮은 급여"
    , TRUNC(AVG(NVL(SALARY, 0)), -4) "직급별 평균 급여"
    , COUNT(EMP_ID) "직급별 인원 수"
FROM EMPLOYEE
WHERE  ENT_YN = 'N'
GROUP BY JOB_CODE
HAVING COUNT(EMP_ID) >= 3
ORDER BY "직급별 인원 수"
    , "직급별 평균 급여" DESC
;

/*
    <집합 연산자>
        여러 개의 쿼리문을 가지고 하나의 쿼리문으로 만드는 연산자이다.
        
        UNION       : 두 쿼리문을 수행한 결과값을 더한 후 중복되는 행은 제거한다. (합집합)
        UNION ALL   : UNION과 동일하게 두 쿼리문을 수행한 결과값을 더하고 중복은 허용한다. (합집합)
        INTERSECT   : 두 쿼리문을 수행한 결과값에 중복된 결과값만 추출한다. (교집합)
        MINUS       : 선행 쿼리의 결과값에서 후행 쿼리의 결과값을 뺀 나머지 결과값만 추출한다. (차집합)
*/

-- 1. UNION

-- 부서코드가 D5인 사원의 이름, 부서코드, 급여 조회
-- 급여가 300만원 초과인 사원의 이름, 부서코드, 급여

SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'

UNION

SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000
;

-- 2. UNION ALL
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'

UNION ALL

SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000
;

-- 3. INTERSECT
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'

INTERSECT

SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000
;

-- 4. MINUS
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'

MINUS

SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000
;