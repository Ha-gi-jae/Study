2021_0805
    (2) User Defined Function(함수)
        - 프로시저와 장점 등이 유사
        - 반환 값이 있음
        - 자주 사용되는 서브쿼리 또는 복잡한 산술식 등을 함수로 구현
        - SELECT 문의 SELECT절, WHERE 절에 사용 가능
        
        (사용형식)
        CREATE [OR REPLACE] FUNCTION 함수명[(
          매개변수 [MODE] 타입 [:=값][,
              :
          매개변수 [MODE] 타입 [:=값]])]
          RETURN 데이터 타입 -- 참조형 데이터타입은 앙대!
        IS|AS
          선언영역
        BEGIN
          실행영역
          RETURN 값|expr;                  -- 데이터 타입 일치해야함. 
        END;
            - 'RETURN 데이터 타입' : 반환할 데이터 타입
            - 'RETURN 값|expr' : 반환해야하는 값이나 값을 산출하는 수식 등으로 반드시 1개 이상 존재 해야함.
        
            (사용예)'대전'에 거주하는 회원번호를 입력받아 해당회원의 2005년 6월 구매금액을 출력하는 함수를 작성하시오.
                (함수)
                CREATE OR REPLACE FUNCTION FN_SUM01(
                  P_MID MEMBER.MEM_ID%TYPE)
                  RETURN NUMBER
                IS
                  V_SUM NUMBER:= 0; -- 구매금액 합계
                  V_CNT NUMBER:= 0; -- 2005년 6월 해당 회원의 자료(CART) 존재유무 확인
                BEGIN
                  SELECT COUNT(*) INTO V_CNT
                    FROM CART
                   WHERE CART_NO LIKE '200506%'
                     AND CART_MEMBER = P_MID;
                  
                  IF V_CNT != 0 THEN
                     SELECT SUM(A.CART_QTY*B.PROD_PRICE) INTO V_SUM
                       FROM CART A, PROD B
                      WHERE CART_NO LIKE '200506%'
                        AND CART_MEMBER = P_MID
                        AND A.CART_PROD = B.PROD_ID;
                  ELSE
                    V_SUM:= 0;
                  END IF;
                  RETURN V_SUM;
                END;
                
                (실행)
                SELECT MEM_ID AS 회원번호,
                       MEM_NAME AS 회원명,
                       MEM_ADD1||' '||MEM_ADD2 AS 주소,
                       FN_SUM01(MEM_ID) AS 구매금액
                  FROM MEMBER
                 WHERE MEM_ADD1 LIKE '대전%'
                 ORDER BY 1;
                
                (사용예) 상품코드와 년도 및 월을 입력받아 해당 상품의 구매수량과 구매금액을 출력하는 함수를 작성하시오.
                    (함수) : FN_BUY01
                        CREATE OR REPLACE FUNCTION FN_BUY01(
                          P_PID IN PROD.PROD_ID%TYPE,
                          P_YEAR CHAR,
                          P_MONTH CHAR)
                          RETURN VARCHAR2 -- 구매수량, 구매금액 2개를 내보내야하기 때문에. 
                        IS
                          V_DATE DATE:= TO_DATE(P_YEAR||P_MONTH||'01');
                          V_AMT NUMBER:= 0; --매입수량
                          V_SUM NUMBER:= 0; --매입금액
                          V_CNT NUMBER:= 0; --자료수
                          V_RES VARCHAR2(100);
                        BEGIN
                          SELECT COUNT(*) INTO V_CNT
                            FROM BUYPROD
                           WHERE BUY_DATE BETWEEN V_DATE AND LAST_DAY(V_DATE)
                             AND BUY_PROD = P_PID;
                             
                          IF V_CNT != 0 THEN
                             SELECT SUM(BUY_QTY), SUM(BUY_QTY * BUY_COST) INTO V_AMT, V_SUM
                               FROM BUYPROD
                              WHERE BUY_DATE BETWEEN V_DATE AND LAST_DAY(V_DATE)
                                AND BUY_PROD = P_PID;
                          ELSE
                            V_SUM:= 0;
                            V_AMT:= 0;
                          END IF;
                          V_RES:= '구매수량 : '||V_AMT||', '||'구매금액 : '||V_SUM;
                          RETURN V_RES;
                        END;
                        
                    (실행)
                        SELECT '2005-05', PROD_ID, PROD_NAME, FN_BUY01(PROD_ID, '2005', '05')
                          FROM PROD;
                    
                    (커서이용)
                        CREATE OR REPLACE FUNCTION FN_BUY02(
                        P_PID IN PROD.PROD_ID%TYPE,
                        P_YEAR CHAR,
                        P_MONTH CHAR,
                        P_AMT OUT NUMBER)
                          RETURN NUMBER
                        IS
                          V_DATE DATE:= TO_DATE(P_YEAR||P_MONTH||'01');
                          V_AMT NUMBER:= 0;
                          V_SUM NUMBER:= 0;
                          V_CNT NUMBER:= 0;
                        BEGIN
                          SELECT COUNT(*) INTO V_CNT
                            FROM BUYPROD
                           WHERE BUY_DATE BETWEEN V_DATE AND LAST_DAY(V_DATE)
                             AND BUY_PROD = P_PID;
                          IF V_CNT != 0 THEN -- 매입을했다.
                             SELECT SUM(BUY_QTY), SUM(BUY_QTY * BUY_COST) INTO V_AMT, V_SUM
                               FROM BUYPROD
                              WHERE BUY_DATE BETWEEN V_DATE AND LAST_DAY(V_DATE)
                                AND BUY_PROD = P_PID;
                          ELSE
                             V_SUM:=0;
                             V_AMT:=0;
                          END IF;
                            P_AMT:=V_AMT;
                          RETURN V_SUM;
                        END;
                    
                    (실행)
                        DECLARE
                          V_AMT NUMBER:=0;
                          V_SUM NUMBER:=0;
                          CURSOR CUR_PROD IS
                            SELECT PROD_ID, PROD_NAME
                              FROM PROD;
                        BEGIN
                          FOR REC IN CUR_PROD LOOP
                              V_SUM:=FN_BUY02(REC.PROD_ID,'2005','05',V_AMT);
                              DBMS_OUTPUT.PUT_LINE('상품코드 : '||REC.PROD_ID);
                              DBMS_OUTPUT.PUT_LINE('상품명 : '||REC.PROD_NAME);
                              DBMS_OUTPUT.PUT_LINE('매입수량 : '||V_AMT);
                              DBMS_OUTPUT.PUT_LINE('매입금액 : '||V_SUM);
                              DBMS_OUTPUT.PUT_LINE('-----------------------------');
                          END LOOP;
                        END;
                        
                (사용예) 년도와 월을 6자리 문자열로 입력 받아 해당월에 가장 많은 상품을 구매(금액기준)한 회원의 이름과 구매금액을 출력하는 함수를 작성하시오.
                    CREATE OR REPLACE FUNCTION FN_MAXMEM(
                      P_YRMH CHAR)
                      RETURN VARCHAR2
                    IS
                      V_NAME MEMBER.MEM_NAME%TYPE; -- 이름
                      V_SUM NUMBER:=0; -- 구매금액
                      V_RES VARCHAR2(100);
                      V_DATE CHAR(7):=P_YRMH||'%';
                    BEGIN
                     SELECT A.M_NAME, A.M_SUM INTO V_NAME, V_SUM
                       FROM (SELECT B.MEM_NAME AS M_NAME,
                                    SUM(A.CART_QTY*C.PROD_PRICE) AS M_SUM
                               FROM CART A, MEMBER B, PROD C
                              WHERE A.CART_MEMBER = B.MEM_ID
                                AND A.CART_PROD = C.PROD_ID
                                AND A.CART_NO LIKE V_DATE
                              GROUP BY B.MEM_NAME
                              ORDER BY 2 DESC) A
                      WHERE ROWNUM = 1;
                      V_RES:= '이름 : '||V_NAME||'구매금액 : '||TO_CHAR(V_SUM,'99,999,999');
                      RETURN V_RES; 
                    END;
                      
                      SELECT FN_MAXMEM('200505') FROM DUAL;
                      
                    -- 직접 입력해서
                    ACCEPT P_DATE PROMPT '년월(YYYYMM) : '
                    DECLARE
                      V_RES VARCHAR2(100);
                    BEGIN
                      V_RES:= FN_MAXMEM('&P_DATE');
                      DBMS_OUTPUT.PUT_LINE(SUBSTR('&P_DATE',1,4)||'년'||SUBSTR('&P_DATE',5)||'월');
                      DBMS_OUTPUT.PUT_LINE(V_RES);
                    END;  