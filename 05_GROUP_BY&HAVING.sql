-- GROUP BY
/*
    <GROUP BY>
        특정 기준에 따라 그룹 분리
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
        그룹으로 조건 검사
*/

SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
WHERE SALARY < 5000000
    AND DEPT_CODE IN ('D5', 'D6', 'D9')
GROUP BY DEPT_CODE
HAVING SUM(SALARY) > 10000000
ORDER BY DEPT_CODE; -- ORDER BY 는 SELECT 보다 나중에 실행됨. -> 별칭 사용가능.