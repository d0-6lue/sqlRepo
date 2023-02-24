-- PL/SQL
/*
    <PL/SQL>
        오라클 자체에 내장되어 있는 절차적 언어로 SQL 문장 내에서 변수의 정의, 조건 처리(IF), 반복 처리(LOOP, FOR, WHILE) 등을 지원한다.
        (다수의 SQL 문을 한 번에 실행이 가능하다.)
        
        [PL/SQL의 구조]
            1) 선언부(DECLAER SECTION) : DECLARE로 시작, 변수나 상수를 선언 및 초기화하는 부분이다.
            2) 실행부(EXECUTABLE SECTION) : BEGIN로 시작, SQL 문, 제어문(조건, 반복문) 등의 로직을 기술하는 부분이다.
            3) 예외 처리부(EXCEPTION SECTION) : EXCEPTION로 시작, 예외 발생 시 해결하기 위한 구문을 기술하는 부분이다.
            
        
    <PL/SQL 선언부(DECLAER SECTION)>
        변수 및 상수를 선언해 놓는 공간이다.(선언과 동시에 초기화도 가능)
        변수 및 상수는 일반 타입 변수, 레퍼런스 타입 변수, ROW 타입 변수로 선언해서 사용할 수 있다.
        
        1) 일반 타입 변수의 선언 및 초기화
            [문법]
                변수명 [CONSTANT] 자료형(크기) [:= 값];
*/

-- 출력 기능 활성화
SET SERVEROUTPUT ON;


DECLARE
    X NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('HELLO WORLD');
END;
/

DECLARE
    X NUMBER;
    Y CONSTANT VARCHAR2(100) := 'FINAL';
BEGIN
    X := 9999;
    DBMS_OUTPUT.PUT_LINE('Y의값 ::: ' || Y || ' / X의 값 ::: ' || X);
END;
/

/*
        2) 레퍼런스 타입 변수 선언 및 초기화
            [표현법]
                변수명 테이블명.컬럼명%TYPE;
            
            - 해당하는 테이블의 컬럼에 데이터 타입을 참조해서 그 타입으로 변수를 지정한다.
*/


DECLARE
    X EMPLOYEE.EMP_NAME%TYPE;
BEGIN
    SELECT EMP_NAME
    INTO X
    FROM EMPLOYEE 
    WHERE EMP_ID = 207;
    
    DBMS_OUTPUT.PUT_LINE(X);
END;
/

/*
        3) ROW 타입 변수 선언 및 초기화
            [표현법]
                변수명 테이블명%ROWTYPE;
                
            - 하나의 테이블의 여러 컬럼의 값을 한꺼번에 저장할 수 있는 변수를 의미한다.
            - 모든 컬럼을 조회하는 경우에 사용하기 편리하다.
*/

DECLARE
    X EMPLOYEE%ROWTYPE;
BEGIN
    SELECT *
    INTO X
    FROM EMPLOYEE 
    WHERE EMP_ID = 207;
    
    DBMS_OUTPUT.PUT_LINE(X.EMP_ID);
    DBMS_OUTPUT.PUT_LINE(X.EMP_NAME);
    DBMS_OUTPUT.PUT_LINE(X.DEPT_CODE);
END;
/



/*
    <PL/SQL 실행부(EXECUTABLE SECTION)>
        1) 선택문
          1-1) 단일 IF 구문
            [문법]
                IF 조건식 THEN
                    실행 문장
                END IF;
*/

DECLARE
    X NUMBER;
BEGIN
    X := '&숫자를입력하세요';
    
    IF (MOD(X,2) = 0) THEN DBMS_OUTPUT.PUT_LINE('짝수 : ' ||  X);
    ELSE DBMS_OUTPUT.PUT_LINE('짝수 : ' ||  X);
    END IF;
END;
/

DECLARE
    X NUMBER;
BEGIN
    SELECT SALARY
    INTO X
    FROM EMPLOYEE
    WHERE EMP_ID = '&사번을입력하세요';
    
    IF(X > 5000000) THEN
        DBMS_OUTPUT.PUT_LINE('많이 받는다');
    ELSIF(X > 2500000) THEN
        DBMS_OUTPUT.PUT_LINE('적당히 받는다');
    ELSE
        DBMS_OUTPUT.PUT_LINE('적게 받는다');
    END IF;
END;
/


/*
        1-4) CASE 구문
          [문법]
            CASE 비교 대상
                 WHEN 비교값1 THEN 결과값1
                 WHEN 비교값2 THEN 결과값2
                 ...
                 [ELSE 결과값]
            END CASE;
*/


DECLARE
    X CHAR(1);
BEGIN

    X := 'A';

    CASE X
        WHEN 'A' THEN DBMS_OUTPUT.PUT_LINE('에~이');
        WHEN 'B' THEN DBMS_OUTPUT.PUT_LINE('비이이');
        WHEN 'C' THEN DBMS_OUTPUT.PUT_LINE('씨..');
    END CASE;
        
END;
/



/*
        2) 반복문
          2-1) BASIC LOOP
            [문법]
                LOOP
                    반복적으로 실행시킬 구문
                    
                    [반복문을 빠져나갈 조건문 작성]
                        1) IF 조건식 THEN 
                              EXIT;
                           END IF;
                           
                        2) EXIT WHEN 조건식;
                END LOOP;
*/


DECLARE
    X NUMBER;
BEGIN
    X := 0;
    
    LOOP
    
    X := X + 1;
    DBMS_OUTPUT.PUT_LINE(X);
    
    IF ( X >= 5 ) 
        THEN DBMS_OUTPUT.PUT_LINE('HELLO_WORLD');
        EXIT;
    END IF;
    
    END LOOP;
    
END;
/

DECLARE
    X NUMBER;
BEGIN
    X := 0;
    
    LOOP
    
    X := X + 1;
    DBMS_OUTPUT.PUT_LINE(X);

    EXIT WHEN X >= 5;
    
    END LOOP;
    
END;
/

/*
        2-2) WHILE LOOP
          [표현법]
            WHILE 조건식
            LOOP
                반복적으로 실행할 구문;
            END LOOP;
*/

DECLARE
    X NUMBER;
BEGIN
    X := 0;
    
    WHILE (X < 5)
    LOOP
    
    X := X + 1;
    DBMS_OUTPUT.PUT_LINE(X);
    
    END LOOP;
    
END;
/


/*
        3) FOR LOOP
          [문법]
            FOR 변수 IN [REVERSE] 초기값..최종값
            LOOP
                반복적으로 실행할 구문;
            END LOOP;
*/


/*
    <PL/SQL 예외처리부(EXCEPTION SECTION)>
        예외란 실행 중 발생하는 오류를 뜻하고 PL/SQL 문에서 발생한 예외를 예외처리부에서 코드로 처리가 가능하다.

        [문법]
            DECLARE
                ...
            BEGIN
                ...
            EXCEPTION
                WHEN 예외명 1 THEN 예외처리구문 1;
                WHEN 예외명 2 THEN 예외처리구문 2;
                ...
                WHEN OTHERS THEN 예외처리구문;
                
        * 오라클에서 미리 정의되어 있는 예외
          - NO_DATA_FOUND : SELECT 문의 수행 결과가 한 행도 없을 경우에 발생한다.
          - TOO_MANY_ROWS : 한 행이 리턴되어야 하는데 SELECT 문에서 여러 개의 행을 리턴할 때 발생한다. 
          - ZERO_DIVIDE   : 숫자를 0으로 나눌 때 발생한다.
          - DUP_VAL_ON_INDEX : UNIQUE 제약 조건을 가진 컬럼에 중복된 데이터가 INSERT 될 때 발생한다.
*/








