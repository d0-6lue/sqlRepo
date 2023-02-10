-- JOIN

/*
    두 개 이상의 테이블에서 데이터 조회
    
    1. 등가 조인(EQUAL JOIN) / 내부 조인(INNER JOIN)
        연결시키는 컬럼의 값이 일치하는 행들만 조인되서 조회한다.(일치하는 값이 없는 행은 조회 X)
        
        1) 오라클 전용 구문
            [표현법]
                SELECT 컬럼, 컬럼, ...
                FROM 테이블1, 테이블2
                WHERE 테이블1.컬럼명 = 테이블2.컬럼명;
            
            - FROM 절에 조회하고자 하는 테이블들을 콤마(,)로 구분하여 나열한다.
            - WHERE 절에 매칭 시킬 컬럼명에 대한 조건을 제시한다.
        
        2) ANSI 표준 구문
            [표현법]
                SELECT 컬럼, 컬럼, ...
                FROM 테이블1
                [INNER] JOIN 테이블2 ON (테이블1.컬럼명 = 테이블2.컬럼명);
            
            - FROM 절에 기준이 되는 테이블을 기술한다.
            - JOIN 절에 같이 조회하고자 하는 테이블을 기술 후 매칭 시킬 컬럼에 대한 조건을 기술한다.
            - 연결에 사용하려는 컬럼명이 같은 경우 ON 구문 대신에 USING(컬럼명) 구문을 사용한다.
*/

-- 사원 테이블 조회
SELECT *
FROM EMPLOYEE
;

SELECT EMP_NAME, JOB_CODE
FROM EMPLOYEE
;

-- 직급 테이블 조회
SELECT *
FROM JOB
;

-- 사원이름, 직급코드, 직급명
SELECT EMP_NAME, T1.JOB_CODE, JOB_NAME
FROM EMPLOYEE T1
JOIN JOB T2
ON T1.JOB_CODE = T2.JOB_CODE
;

-- 사원이름, 부서코드, 부서명
SELECT EMP_NAME, DEPT_CODE, DEPT_ID, DEPT_TITLE
FROM EMPLOYEE T1
JOIN DEPARTMENT T2
ON T1.DEPT_CODE = T2.DEPT_ID
ORDER BY DEPT_CODE
;

SELECT EMP_NAME, DEPT_CODE, DEPT_ID, DEPT_TITLE
FROM EMPLOYEE T1
FULL OUTER JOIN DEPARTMENT T2
ON T1.DEPT_CODE = T2.DEPT_ID
ORDER BY DEPT_CODE
;

/*
    다중 JOIN
     여러개의 테이브 조인
     순서 중요함
*/

SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE, LOCATION_ID, NATIONAL_CODE
FROM EMPLOYEE E
JOIN DEPARTMENT D ON  E.DEPT_CODE = D.DEPT_ID
JOIN LOCATION L ON D.LOCATION_ID = L.LOCAL_CODE
;

/*
    3. 외부 조인 (OUTTER JOIN)
        테이블 간의 JOIN 시 일치하지 않는 행도 포함시켜서 조회가 가능하다.
        단, 반드시 기준이되는 테이블(컬럼)을 지정해야 한다. (LEFT/RIGHT/(+))
        LEFT
        RIGHT
        FULL
*/

SELECT EMP_NAME, DEPT_ID, DEPT_TITLE
FROM EMPLOYEE E
LEFT OUTER JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
;

SELECT EMP_NAME, DEPT_ID, DEPT_TITLE
FROM EMPLOYEE E
RIGHT OUTER JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
;

SELECT EMP_NAME, DEPT_ID, DEPT_TITLE
FROM EMPLOYEE E
FULL OUTER JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
;

SELECT EMP_NAME, DEPT_ID, DEPT_TITLE, LOCATION_ID, NATIONAL_CODE
FROM EMPLOYEE E
FULL OUTER JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
FULL OUTER JOIN LOCATION L ON D.LOCATION_ID = L.LOCAL_CODE
;

/*
    4. 카테시안곱(CARTESIAN PRODUCT) / 교차 조인(CROSS JOIN)
        조인되는 모든 테이블의 각 행들이 서로서로 모두 매핑된 데이터가 검색된다.
        테이블의 행들이 모두 곱해진 행들의 조합이 출력 -> 과부화의 위험
*/


/*
    5. 비등가 조인(NON EQUAL JOIN)
        조인 조건에 등호(=)를 사용하지 않는 조인문을 비등가 조인이라고 한다.
        지정한 컬럼 값이 일치하는 경우가 아닌, 값의 범위에 포함되는 행들을 연결하는 방식이다.
        ( = 이외에 비교 연산자 >, <, >=, <=, BETWEEN AND, IN, NOT IN 등을 사용한다.)
        ANSI 구문으로는 JOIN ON 구문으로만 사용이 가능하다. (USING 사용 불가)
*/

/*
    6. 자체 조인(SELF JOIN)
        같은 테이블을 다시 한번 조인하는 경우에 사용한다.
*/