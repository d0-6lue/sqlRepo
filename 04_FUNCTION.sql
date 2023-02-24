-- 함수( FUNCTION )

/*
    <함수>
    컬럼값을 읽어서 계산 결과를 반환한다.
    - 단일행 함수 : N개의 값을 읽어서 N개의 결과를 리턴한다. (매 행 함수 실행 -> 결과 반환)
    - 그룹 함수   : N개의 값을 읽어서 1개의 결과를 리턴한다. (하나의 그룹별로 함수 실행 -> 결과 반환)
    SELECT 절에 단일행 함수와 그룹 함수를 함께 사용하지 못한다. (결과 행의 개수가 다르기 때문에)
    함수를 기술할 수 있는 위치는 SELECT, WHERE, ORDER BY, GROUP BY, HAVING 절에 기술할 수 있다.
*/

-------------------------------------------------------------------------------
-------------------------------<문자 관련 함수>----------------------------------

/*
    1) LENGTH / LENGTHB
      - LENGTH(컬럼|'문자값') : 글자 수 반환
      - LENGTHB(컬럼|'문자값') : 글자의 바이트 수 반환
    한글 한 글자 -> 3BYTE
    영문자, 숫자, 특수문자 한 글자 -> 1BYTE
    
    https://mine-it-record.tistory.com/57
*/

SELECT LENGTH(EMAIL)
FROM EMPLOYEE;

SELECT LENGTHB('안녕') AS "글자의 바이트 수"
FROM DUAL; -- SYS사용자 소유의 1행 1열의 오라클 표준 DUMMY 테이블이지만 모두 접근 가능. 오라클 표준 테이블

/*
    2) INSTR
      - INSTR(컬럼|'문자값', '문자'[, POSITION[, OCCURRENCE]])
      - 지정한 위치부터 지정된 숫자 번째로 나타나는 문자의 시작 위치를 반환한다.
      
      POSITION : N or -N
      - 기본값은 1
      - N : 앞에서부터, N번째부터 탐색
      - -N : 뒤에서부터, N번째부터 탐색
      OCCURRENCE : 1~N
      - N번째로 찾은 위치
      
      https://gent.tistory.com/22
*/

SELECT INSTR('HELLO', 'L', 1, 2)
FROM DUAL;

SELECT INSTR('AABAACAABBAA', 'B') FROM DUAL; -- 3번째 자리의 B의 위치값 출력
SELECT INSTR('AABAACAABBAA', 'B', 1) FROM DUAL; -- 3번째 자리의 B의 위치값 출력
SELECT INSTR('AABAACAABBAA', 'B', 1, 2) FROM DUAL; -- 9번째 자리의 B의 위치값 출력
SELECT INSTR('AABAACAABBAA', 'B', -1) FROM DUAL; -- 10번째 자리의 B의 위치값 출력
SELECT INSTR('AABAACAABBAA', 'B', -1, 3) FROM DUAL; -- 3번째 자리의 B의 위치값 출력

SELECT INSTR(EMAIL, '@')
FROM EMPLOYEE;

SELECT (LENGTH(EMAIL)- INSTR(EMAIL, '@'))
FROM EMPLOYEE;

/* 
    3) LPAD / RPAD
      - LPAD/RPAD(컬럼|'문자값', 길이(바이트)[, '덧붙이려고 하는 문자'])
      - 제시된 컬럼|'문자값'에 임의의 문자를 왼쪽 또는 오른쪽에 덧붙여 최종 N 길이 만큼의 문자열을 반환한다.
      - 문자에 대해 통일감 있게 표시하고자 할 때 사용한다.
*/

SELECT LPAD(EMAIL, 20)
FROM EMPLOYEE;

SELECT LPAD(EMAIL, 20, '*')
FROM EMPLOYEE;

/*
    4) LTRIM / RTRIM
      - LTRIM/RTRIM(컬럼|'문자값'[, '제거하고자 하는 문자'])
      - 문자열의 왼쪽 혹은 오른쪽에서 제거하고자 하는 문자들을 찾아서 제거한 결과를 반환한다.
      - 제거하고자 하는 문자값을 생략 시 기본값으로 공백을 제거한다.
*/



/*
    5) TRIM
       - TRIM([[LEADING|TRAILING|BOTH] '제거하고자 하는 문자값' FROM] 컬럼|'문자값')
       - 문자값 앞/뒤/양쪽에 있는 지정한 문자를 제거한 나머지를 반환한다. 
       - 제거하고자 하는 문자값을 생략 시 기본적으로 양쪽에 있는 공백을 제거한다. 
*/

SELECT TRIM('      ABC       ') AS TEST
FROM DUAL;

SELECT TRIM('Z'FROM 'ZZZZZABCZZZZ') FROM DUAL;

SELCET TRIM(LEADING 'Z' FROM 'ZZZZZABCZZZZ')FROM TEST DUAL)

SELCET TRIM(TLAILNG 'Z' FROM 'ZZZZZABCZZZZ')FROM TEST DUAL)




/*
    5) SUBSTR
       - SUBSTR(COLUMN | '문자값', POSITION [, LENGTH)
       - POSITION 부터 LEGNTH 만큼 잘라옴.
       - LEGNTH 없으면 마지막까지
*/
SELECT 'HELLOWORLD' FROM DUAL;
SELECT SUBSTR('HELLOWORLD', 3) FROM DUAL;
SELECT SUBSTR('HELLOWORLD', 3, 2) FROM DUAL;

SELECT EMP_NAME, EMP_NO, SUBSTR(EMP_NO, 8, 1) AS GENDER
FROM EMPLOYEE;

SELECT EMP_NAME, RPAD(SUBSTR(EMP_NO, 1, 8), 14 , '*') AS 주민번호, SUBSTR(EMP_NO, 8, 1) AS GENDER
FROM EMPLOYEE;

/*
    7) LOWER / UPPER / INITCAP
        LOWER : 문자열의 문자를 모두 대문자로 변환
        UPPER : 문자열의 문자를 모두 소문자로 벼환
    I   INITCAP : 첫 문자만 대문자로 변환하고 나머지는 소문자로 변환
*/

/*
    8) CONCAT
        문자열 합치기
*/

/*
    9) REPLACE
        문자 X를 문자 Y로 변경
*/



-------------------------------------------------------------------------------
-------------------------------<숫자 관련 함수>----------------------------------

/*
    1) ABS : 절대값
    2) MOD : 나머지 연산
    3) ROUND : 반올림
        - 뒤에 파라미터로 숫자를 주면 해당 자릿수까지 표시(음수면 앞으로)
    4) CEIL : 올림
    5) FLOOR : 버림
    6) TRUNC : 절삭
        - 뒤에 파라미터로 숫자를 주면 해당 자릿수까지 표시(음수면 앞으로)
*/

SELECT ABS(-1.23)
FROM DUAL;

SELECT MOD(10, 3)
FROM DUAL;

SELECT ROUND(9.8765, 2)
FROM DUAL;

SELECT ROUND(123.45678, -1)
FROM DUAL;

SELECT CEIL(4.56)
FROM DUAL;

SELECT FLOOR(2.34)
FROM DUAL;

SELECT TRUNC(1234.567, 1)
FROM DUAL;

SELECT TRUNC(1234.567, -2)
FROM DUAL;


-------------------------------------------------------------------------------
-------------------------------<날짜 관련 함수>----------------------------------

/*
    1) SYSDATE : 시스템의 현재 날짜와 시간
    2) MONTHS_BETWEEN : 두 날짜 사이의 개월 수
    3) ADD_MONTHS : 개월 수 더하기
    4) NEXT_DAY : 구하려는 요일의 가장 가까운 날짜
    5) LAST_DAY : 해달 월의 마지막 날짜
    6) EXTRACT : 연, 월, 일 정보 추출. 결과값은 NUMBER 타입
*/

SELECT SYSDATE
FROM DUAL;

SELECT EMP_NAME, HIRE_DATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) AS 근무개월수
FROM EMPLOYEE;

SELECT ADD_MONTHS('22/1/1', 6)
FROM DUAL;

SELECT NEXT_DAY(SYSDATE, '수')
    ,NEXT_DAY(SYSDATE, 4)
FROM DUAL;

ALTER SESSION SET NLS_LANGUAGE = AMERICAN;
SELECT NEXT_DAY(SYSDATE, 'WED')
    ,NEXT_DAY(SYSDATE, 'WEDNESDAY')
FROM DUAL;

ALTER SESSION SET NLS_LANGUAGE = KOREAN;

SELECT LAST_DAY(SYSDATE)
FROM DUAL;

SELECT EXTRACT(YEAR FROM SYSDATE)
FROM DUAL;

-- 날짜 포맷 지정
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MON-DD HH24:MI:SS';
SELECT SYSDATE
FROM DUAL;
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';


-------------------------------------------------------------------------------
------------------------------<형변환 함수>--------------------------------------

/*
    1) TO_CHAR
    2) TO_DATE
    3) TO_NUMBER
*/

SELECT 123 AS "칼럼명1--------------"
    ,TO_CHAR(12345) AS "칼럼명2--------------"
    ,TO_CHAR(12345, '99999') AS "칼럼명3--------------"
    ,TO_CHAR(12345, '00000') AS "칼럼명4--------------"
    ,TO_CHAR(12345, 'L999,999,999') AS "칼럼명5--------------" -- 현재 설정된 국가 화폐 단위
    ,TO_CHAR(12345, '$99999') AS "칼럼명6--------------"
    ,TO_CHAR(12345, 'L') AS "칼럼명7--------------"
FROM DUAL;

SELECT EMP_NAME, TO_CHAR(SALARY, 'L999,999,999') AS 급여
FROM EMPLOYEE;

SELECT TO_CHAR(SYSDATE)
    ,TO_CHAR(SYSDATE, 'YYYY"년"MM"월"DD"일" DAY AM HH24:MI:SS')
    ,TO_CHAR(SYSDATE, 'YYYY-MM-DD DY HH24:MI:SS')
FROM DUAL;


SELECT TO_DATE(220206)
    , TO_DATE('22/2/6')
    , TO_DATE(20230206)
FROM DUAL;


SELECT '0123456789'
    , TO_NUMBER('0123456789')
FROM DUAL;


-------------------------------------------------------------------------------
-------------------------------<NULL 처리 함수>----------------------------------

/*
    1) NVL : NULL 값을 다른 값으로 치환
    2) NVL2 : NULL 인지 아닌지 에 따라 값 변경
    3) NULLIF : 두 값이 동일하면 NULL, 그렇지 않으면 특정 값으로 변경
*/

SELECT EMP_NAME, ((SALARY*12) + (SALARY*NVL(BONUS, 0))) AS "연봉(보너스 포함)"
FROM EMPLOYEE;

SELECT NVL2(BONUS, 1, 0)
FROM EMPLOYEE;

SELECT NULLIF('ABC', 'ABC')
    , NULLIF(123,456)
FROM DUAL;


/*
    DECODE
     - DECODE(COLUMN, 조건값1, 결과값1, 조건값2, 결과값2 ... )
     - COLUMN이 조건값N과 일치하면 결과값N
*/

SELECT EMP_NAME, DECODE(SUBSTR(EMP_NO, 8, 1), 1, '남', 2, '여') "성별"
FROM EMPLOYEE;

/*
    CASE WHEN THEN
     - CASE
        WHEN 조건식1 THEN 결과1
        WHEN 조건식2 THEN 결과2
        ...
        ELSE 결과N
       END
*/

SELECT EMP_NAME
, CASE
    WHEN SUBSTR(EMP_NO, 8, 1) = 1 THEN '남'
    WHEN SUBSTR(EMP_NO, 8, 1) = 2 THEN '여'
END AS "성별"
FROM EMPLOYEE;

SELECT EMP_NAME, JOB_CODE,
CASE
    WHEN JOB_CODE = 'J1' THEN '사장'
    WHEN JOB_CODE = 'J2' THEN '부장'
    WHEN JOB_CODE = 'J3' THEN '차장'
    ELSE '사원'
END AS "직급명"
FROM EMPLOYEE;

SELECT EMP_NAME, DEPT_CODE, SALARY,
CASE
    WHEN SALARY < 3000000 THEN '초급'
    WHEN SALARY < 5000000 THEN '중급'
    ELSE '고급'
--  WHEN (SALARY >= 3000000 AND SALARY < 5000000) THEN '중급'
--  WHEN SALARY >= 5000000 THEN '고급'
END AS "급여등급"
FROM EMPLOYEE;


-------------------------------------------------------------------------------
----------------------------------<그룹 함수>------------------------------------

/*
    <그룹 함수>
        대량의 데이터들로 집계나 통게 같은 작업을 처리해야 하는 경우 사용되는 함수들이다.
        모든 그룹 함수는 NULL 값을 자졷으로 제외하고 값이 있는 것들만 계산을을 한다.
        따라사 AVG 함수를 사용할 때는 바드시 NVL() 함수와 함께 사용하는것을 권장한다.
    1) SUM
    2) AVG
    3) MIN / MAX
    4) COUNT
*/

SELECT
    SUM(SALARY) AS "급여합계"
    , COUNT(SALARY) AS 인원수
    , AVG(SALARY) AS 급여평균
    , MIN(SALARY) 최저급여
    , MAX(SALARY) 최고급여
FROM EMPLOYEE;

SELECT EMP_NAME
FROM EMPLOYEE
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE);
