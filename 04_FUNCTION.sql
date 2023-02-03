-- 함수( FUNCTION )

/*
    <함수>
    컬럼값을 읽어서 계산 결과를 반환한다.
    - 단일행 함수 : N개의 값을 읽어서 N개의 결과를 리턴한다. (매 행 함수 실행 -> 결과 반환)
    - 그룹 함수   : N개의 값을 읽어서 1개의 결과를 리턴한다. (하나의 그룹별로 함수 실행 -> 결과 반환)
    SELECT 절에 단일행 함수와 그룹 함수를 함께 사용하지 못한다. (결과 행의 개수가 다르기 때문에)
    함수를 기술할 수 있는 위치는 SELECT, WHERE, ORDER BY, GROUP BY, HAVING 절에 기술할 수 있다.
*/

/*
    <문자 관련 함수>
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