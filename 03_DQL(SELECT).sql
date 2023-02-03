-- DQL(SELECT)

/*
    [SELECT 절]
        SELECT 컬럼, 컬럼, ..., 컬럼
        FROM 테이블명;
        
    - 데이터를 조회할 때 사용하는 구문
    - SELECT를 통해서 조회된 결과 물을 RESULT SET이라고 한다.(조회된 행들의 집합)
    - 조회하고자 하는 컬럼들은 반드시 FROM 절에 기술한 테이블에 존재하는 컬럼이어야 한다.
*/

-- 진행 순서 : FROM → WHERE → SELECT

/*
    <연산자 우선순위>
        0. ()
        1. 산술 연산자
        2. 연결 연산자
        3. 비교 연산자
        4. IS NULL, LIKE, IN
        5. BETWEEN AND
        6. 논리 연산자 - NOT
        7. 논리 연산자 - AND
        8. 논리 연산자 - OR
*/

SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE;

SELECT *
FROM EMPLOYEE;

/*
    [산술연산]
    SELECT 절에 산술연산 가능
*/

SELECT SALARY * 12
FROM EMPLOYEE;

-- 산술연산중 null 값이 포함되면 결과는 null
SELECT EMP_NAME, SALARY * 12 + SALARY * BONUS
FROM EMPLOYEE;

-- SYSDATE 오늘날짜
-- 날짜 빼기 계산 후 소수점 아래 제거 FLOOR or TRUNC
-- AS 별칭 ( 빼도 되긴 함. 띄어쓰기 있다면 " " 로 감싸주면 됨.)
SELECT EMP_NAME, HIRE_DATE, SYSDATE, FLOOR(SYSDATE - HIRE_DATE) AS 근무일수
FROM EMPLOYEE;

-- NVL(값, 지정값) : 값이 NULL인 경우 지정 값으로, NULL이 아니면 원래 값.
SELECT EMP_NAME AS 이름, SALARY * 12 + SALARY * NVL(BONUS, 0) AS "연봉(보너스 포함)"
FROM EMPLOYEE;

-- LITERAL(리터럴) : 소스 코드의 고정된 값을 나타내는 표기법
SELECT 100
FROM EMPLOYEE;

SELECT EMP_NAME , '님'
FROM EMPLOYEE;

-- 오류..
SELECT EMP_NAME + '님'
FROM EMPLOYEE;

SELECT CONCAT(EMP_NAME, '님')
FROM EMPLOYEE;

-- 연결 연산자 ||
SELECT EMP_NAME || '님'
FROM EMPLOYEE;

SELECT EMP_NO || ' ' || EMP_NAME
FROM EMPLOYEE;

SELECT EMP_NAME || '의 연봉은 ' || ((SALARY * 12) + (SALARY * NVL(BONUS, 0))) || '원 입니다.'
FROM EMPLOYEE;

-- DISTINCT : 중복제거
SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE;

SELECT DISTINCT JOB_CODE
FROM EMPLOYEE;



/*
    <WHERE>
    [문법]
        SELECT 컬럼, 컬럼, ..., 컬럼
        FROM 테이블명
        WHERE 조건식;
             
    - 조회하고자 하는 테이블에서 해당 조건에 만족하는 결과만을 조회하고자 할 때 사용한다.
    - 조건식에는 다양한 연산자들을 사용할 수 있다.
        
    <비교 연산자>
        >, <, >=, <= : 대소 비교
        =            : 동등 비교
        !=, ^=, <>   : 같지 않다
*/

SELECT *
FROM EMPLOYEE
WHERE EMP_NAME = '이오리';

SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

SELECT EMP_NAME, SALARY, HIRE_DATE
FROM EMPLOYEE
WHERE SALARY >= 3000000;

SELECT EMP_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE ENT_YN = 'N'; -- 재직중

SELECT EMP_NAME, SALARY, SALARY * 12 AS 연봉, HIRE_DATE
FROM EMPLOYEE
WHERE (SALARY * 12) >= 50000000;

-- AND , OR
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6' AND SALARY >= 3000000;

SELECT * 
FROM EMPLOYEE
WHERE SALARY >= 4000000 AND JOB_CODE = 'J2';

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY >= 3500000 AND SALARY <= 6000000;

/*
    <BETWEEN A AND B>
    [문법]
        WHERE 비교대상컬럼 BETWEEN 하한값 AND 상한값
            
    - WHERE 절에서 사용되는 구문으로 범위에 대한 조건을 제시할 때 사용한다.
    - 비교대상컬럼 값이 하한값 이상이고, 상한값 이하인 경우 TRUE를 리턴한다.
*/
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY BETWEEN 3500000 AND 6000000;

SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01';

SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE NOT BETWEEN '90/01/01' AND '01/01/01';

/*
    <LIKE>
    [문법]
        WHERE 비교대상컬럼 LIKE '특정 패턴';
            
    - 비교하려는 컬럼 값이 지정된 특정 패턴에 만족할 경우 TRUE를 리턴한다.
    - 특정 패턴에는 '%', '_'를 와일드카드로 사용할 수 있다.
        '%' : 0글자 이상
        ex) 비교대상컬럼 LIKE '문자%'  => 비교대상컬럼 값 중에 '문자'로 시작하는 모든 행을 조회한다.
            비교대상컬럼 LIKE '%문자'  => 비교대상컬럼 값 중에 '문자'로 끝나는 모든 행을 조회한다.
            비교대상컬럼 LIKE '%문자%' => 비교대상컬럼 값 중에 '문자'가 포함되어 있는 모든 행을 조회한다.
                
        '_' : 1글자
        ex) 비교대상컬럼 LIKE '_문자'  => 비교대상컬럼 값 중에 '문자'앞에 무조건 한 글자가 오는 모든 행을 조회한다.
            비교대상컬럼 LIKE '__문자' => 비교대상컬럼 값 중에 '문자'앞에 무조건 두 글자가 오는 모든 행을 조회한다.
*/

SELECT *
FROM EMPLOYEE
WHERE EMP_NAME LIKE '전%';

SELECT *
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%하%';

SELECT *
FROM EMPLOYEE
WHERE PHONE LIKE '___9%';

-- % 또는 _ 포함해서 구할 경우 ESCAPE 를 사용. 아무 특수문자( 알파벳이나 숫자도 가능은 함)
SELECT *
FROM EMPLOYEE
WHERE EMAIL LIKE '___$_%' ESCAPE '$';

SELECT *
FROM EMPLOYEE
WHERE EMP_NAME NOT LIKE '김%'; -- 김씨가 아닌 사람
--WHERE NOT EMP_NAME LIKE '김%'; -- 김씨가 아닌 사람
--WHERE NOT EMP_NAME NOT LIKE '김%'; -- 김씨인 사람

SELECT *
FROM EMPLOYEE
WHERE PHONE NOT LIKE '010%';

SELECT *
FROM DEPARTMENT
WHERE DEPT_TITLE LIKE '해외영업%부';

-- IS NULL, IS NOT NULL
SELECT *
FROM EMPLOYEE
WHERE BONUS IS NULL;

SELECT *
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;

SELECT *
FROM EMPLOYEE
WHERE MANAGER_ID IS NULL;

SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL AND BONUS IS NOT NULL;

SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE LIKE 'D5' OR DEPT_CODE LIKE 'D6';
-- IN
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE IN ('D5', 'D6');

-- 정렬 ORDER BY 값 ( ASC(오름차순) or DESC(내림차순) ) 기본값은 오름차순
/*
    ORDER BY
    ORDER BY COLUMN값 ( ASC(or DESC) ) (NULLS FIRST(or LAST) )
    [문법]
    SELECT 컬럼, 컬럼, ..., 컬럼
    FROM 테이블명
    WHERE 조건식
    ORDER BY 정렬시키고자 하는 컬럼명|별칭|컬럼 순번 [ASC|DESC] [NULLS FIRST | NULLS LAST];
          
    - SELECT 문에서 가장 마지막에 기입하는 구문으로 실행 또한 가장 마지막에 진행된다.
    - ASC : 오름차순으로 정렬한다. (ASC 또는 DESC 생략 시 기본값)
    - DESC : 내림차순으로 정렬한다.
    - NULLS FIRST : 정렬하고자 하는 컬럼 값에 NULL이 있는 경우 해당 데이터 값을 맨 앞으로 정렬한다.
    - NULLS LAST : 정렬하고자 하는 컬럼 값에 NULL이 있는 경우 해당 데이터 값을 맨 뒤로 정렬한다.
*/
SELECT *
FROM EMPLOYEE
ORDER BY SALARY;

SELECT *
FROM EMPLOYEE
ORDER BY SALARY DESC;

SELECT *
FROM EMPLOYEE
ORDER BY BONUS ASC;

SELECT *
FROM EMPLOYEE
ORDER BY BONUS ASC NULLS FIRST; -- NULL 값 우선

SELECT *
FROM EMPLOYEE
ORDER BY BONUS DESC NULLS LAST; -- NULL 값을 뒤로