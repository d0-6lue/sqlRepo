------------------------- 종합 실습 문제 -------------------------
-- 1. 직급이 대리이면서 ASIA 지역에서 근무하는 직원들의 사번, 사원명, 직급명, 부서명, 근무지역, 급여를 조회하세요.

SELECT E.EMP_ID, E.EMP_NAME, J.JOB_NAME, D.DEPT_TITLE, L.LOCAL_NAME, E.SALARY
FROM EMPLOYEE E
    JOIN JOB J
    ON E.JOB_CODE = J.JOB_CODE
    JOIN DEPARTMENT D
    ON E.DEPT_CODE = D.DEPT_ID
    JOIN LOCATION L
    ON D.LOCATION_ID = L.LOCAL_CODE
WHERE JOB_NAME = '대리'
AND L.LOCAL_NAME LIKE 'ASIA_'
;

-- 2. 70년대생 이면서 여자이고, 성이 전 씨인 직원들의 사원명, 주민번호, 부서명, 직급명을 조회하세요.

SELECT E.EMP_NAME, E.EMP_NO, D.DEPT_TITLE, J.JOB_NAME
FROM EMPLOYEE E
    JOIN DEPARTMENT D
    ON E.DEPT_CODE = D.DEPT_ID
    JOIN JOB J
    ON E.JOB_CODE = J.JOB_CODE
WHERE SUBSTR(E.EMP_NO, 1, 2) BETWEEN 70 AND 79
AND SUBSTR(E.EMP_NO, 8, 1) = 2
AND E.EMP_NAME LIKE '전%'
;

-- 3. 보너스를 받는 직원들의 사원명, 보너스, 연봉, 부서명, 근무지역을 조회하세요.

SELECT E.EMP_NAME, E.BONUS, (E.SALARY * 12) 연봉, D.DEPT_TITLE, L.LOCAL_NAME
FROM EMPLOYEE E
    LEFT OUTER JOIN DEPARTMENT D
    ON E.DEPT_CODE = D.DEPT_ID
    LEFT OUTER JOIN LOCATION L
    ON D.LOCATION_ID = L.LOCAL_CODE
WHERE BONUS IS NOT NULL
;

-- 4. 한국과 일본에서 근무하는 직원들의 사원명, 부서명, 근무지역, 근무 국가를 조회하세요.

SELECT E.EMP_NAME, D.DEPT_TITLE, L.LOCAL_NAME, N.NATIONAL_NAME
FROM EMPLOYEE E
    JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
    JOIN LOCATION L ON D.LOCATION_ID = L.LOCAL_CODE
    JOIN NATIONAL N ON L.NATIONAL_CODE = N.NATIONAL_CODE
WHERE N.NATIONAL_NAME = '한국'
OR N.NATIONAL_NAME = '일본'
;

-- 5. 각 부서별 평균 급여를 조회하여 부서명, 평균 급여(정수 처리)를 조회하세요.

-- 5. 각 부서별 평균 급여를 조회하여 부서명, 평균 급여(정수 처리)를 조회하세요.
--    단, 부서 배치가 안된 사원들의 평균도 같이 나오게

SELECT D.DEPT_TITLE, TRUNC(AVG(NVL(E.SALARY, 0)))
FROM EMPLOYEE E
    JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
GROUP BY D.DEPT_TITLE
;

-- 6. 각 부서별 총 급여의 합이 1000만원 이상인 부서명, 급여의 합을 조회하시오.

SELECT D.DEPT_TITLE, SUM(E.SALARY)
FROM EMPLOYEE E
    JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
GROUP BY D.DEPT_TITLE
HAVING SUM(E.SALARY) > 10000000
;

-- 7. 사번, 사원명, 직급명, 급여 등급, 구분을 조회

-- 7. 사번, 사원명, 직급명, 급여 등급, 구분을 조회
--    이때 구분에 해당하는 값은 아래와 같이 조회 되도록 하시오.
--    급여 등급이 S1, S2인 경우 '고급'
--    급여 등급이 S3, S4인 경우 '중급'
--    급여 등급이 S5, S6인 경우 '초급'

SELECT E.EMP_ID, E.EMP_NAME, CASE WHEN S.SAL_LEVEL = 'S1' OR S.SAL_LEVEL = 'S2' THEN '고급'
                            WHEN S.SAL_LEVEL = 'S1' OR S.SAL_LEVEL = 'S2' THEN '중급'
                            WHEN S.SAL_LEVEL = 'S1' OR S.SAL_LEVEL = 'S2' THEN '초급'
                            END
FROM EMPLOYEE E
    JOIN SAL_GRADE S ON E.SALARY BETWEEN S.MIN_SAL AND S.MAX_SAL
    JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
;

-- 8. 보너스를 받지 않는 직원들 중 직급 코드가 J4 또는 J7인 직원들의 사원명, 직급명, 급여를 조회하시오.

-- 9. 부서가 있는 직원들의 사원명, 직급명, 부서명, 근무 지역을 조회하시오.

-- 10. 해외영업팀에 근무하는 직원들의 사원명, 직급명, 부서 코드, 부서명을 조회하시오

-- 11. 이름에 '형'자가 들어있는 직원들의 사번, 사원명, 직급명을 조회하시오.



