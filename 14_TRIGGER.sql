-- TRIGGER
/*
    <TRIGGER>
        테이블이 INSERT, UPDATE, DELETE 등 DML 구문에 의해서 변경될 경우
        자동으로 실행될 내용을 정의해놓는 객체이다.
        
        * 트리거의 종류
          1) SQL 문의 실행 시기에 따른 분류
            - BEFORE TRIGGER : 해당 SQL 문장 실행 전에 트리거를 실행한다.
            - AFTER TRIGGER : 해당 SQL 문장 실행 후에 트리거를 실행한다.
          
          2) SQL 문에 의해 영향을 받는 행에 따른 분류
            - 문장 트리거 : 해당 SQL 문에 한 번만 트리거를 실행한다.
            - 행 트리거 : 해당 SQL 문에 영향을 받는 행마다 트리거를 실행한다.
            
        [문법]
            CREATE OR REPLACE TRIGGER 트리거명
            BEFORE|AFTER INSERT|UPDATE|DELETE ON 테이블명
            [FOR EACH ROW]
            DECLARE
                선언부
            BEGIN
                실행부
            EXCEPTION
                예외처리부
            END;
            /
*/


CREATE TABLE PRODUCT(
    PNAME VARCHAR2(100)
    , CNT NUMBER
)
;

CREATE TABLE P_ORDER(
    PNAME VARCHAR2(100)
    , PCNT NUMBER
)
;

SELECT * FROM PRODUCT;
SELECT * FROM P_ORDER;

INSERT INTO PRODUCT VALUES ('갤럭시S23' , 100);
INSERT INTO PRODUCT VALUES ('아이폰14' , 100);

CREATE TRIGGER TRG_P_ORDER_GALAXY
AFTER INSERT ON P_ORDER
BEGIN
    UPDATE PRODUCT SET CNT = CNT - 1 WHERE PNAME = '갤럭시S23';
END;
/

INSERT INTO P_ORDER(PNAME, PCNT) VALUES('갤럭시S23', 1);



