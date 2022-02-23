1. 커서(CURSOR) -- FOR문과 잘 맞음.
    - 오라클 SQL명령어에 의하여 영향받은 행들의 집합
    - SELECT문에 의해 반환된 결과 집합의 행들을 차례대로 접근해야하는 경우 사용
    - 개발자가 결과를 수동적으로 제어할 필요가 있는 경우 사용
    - IMPLICITE, EXPLICITE CURSOR
    - 커서의 사용은 FOR문을 제외하고 생성(선언) -> OPEN -> FETCH -> CLOSE 단계를 차례대로 실행
    
    (1) 익명커서(IMPLICITE CURSOR)
        - 이름이 없는 커서
        - SELECT문이 실행되면 결과(커서)가 자동으로 OPEN된 후 결과 출력이 완료된 직 후 자동으로 CLOSE 됨(참조 불가능)
        - 커서속성
            - SQL%ISOPEN : 커서가 OPEN 상태이면 참(true) 반환 - 항상 거짓(false)
            - SQL%NOTFOUND : 커서에 자료가 남아있지 않으면 참(true) 반환
            - SQL%FOUND : 커서에 자료가 남아있으면 참(true) 반환
            - SQL%ROWCOUNT : 커서에 존재하는 자료의 갯수
            
    (2) 커서(EXPLICITE CURSOR)
        - 이름이 부여된 커서
        - 선언부에서 선언
        
        (선언형식 - 선언부)
        CURSOR 커서명[(변수 타입명, [변수 타입명,...])] -- CUR_   변수명 타입명 
        IS
          SELECT 문;
        
        (실행부)  
        OPEN 커서명[(매개변수[, 매개변수,...])];
        
        FETCH 커서명 INTO 변수list; -- 안
        
        CLOSE 커서명; --반복문 밖
        
            사용예) 2005년 5월 입고상품별 출고현황을 조회하는 블록을 커서를 이용하여 작성하시오.
                Alias는 상품코드, 상품명, 수량
                DECLARE
                  V_PID PROD.PROD_ID%TYPE;
                  V_PNAME PROD.PROD_NAME%TYPE;
                  V_AMT NUMBER:= 0;
                  V_CNT NUMBER:= 0;
                  
                  CURSOR CUR_BUY01(PDATE DATE) IS --매개변수 기술 방붭!
                    SELECT DISTINCT BUY_PROD
                      FROM BUYPROD
                     WHERE BUY_DATE BETWEEN PDATE AND LAST_DAY(PDATE);   -- BEGIN 절이 아니라 INTO 필요 없음.
                BEGIN
                  OPEN CUR_BUY01(TO_DATE('20050501'));
                  LOOP
                    FETCH CUR_BUY01 INTO V_PID; -- 열이 2개면 , 변수 1개 더!// 순서대로 넣어준댜 반복돌면서 행이 내려감.
                    EXIT WHEN CUR_BUY01%NOTFOUND;
                    SELECT COUNT(*) INTO V_CNT
                      FROM CART
                     WHERE CART_PROD = V_PID 
                       AND CART_NO LIKE '200505%';
                       
                    IF V_CNT !=0 THEN
                        SELECT PROD_NAME, SUM(CART_QTY) INTO V_PNAME,V_AMT
                          FROM CART, PROD
                         WHERE CART_PROD = V_PID
                           AND CART_PROD = PROD_ID
                           AND CART_NO LIKE '200505%'
                         GROUP BY PROD_NAME;
                    
                    DBMS_OUTPUT.PUT_LINE('상품코드 : '||V_PID);
                    DBMS_OUTPUT.PUT_LINE('상품명 : '||V_PNAME);
                    DBMS_OUTPUT.PUT_LINE('판매수량 : '||V_AMT);
                    DBMS_OUTPUT.PUT_LINE('----------------------');
                    END IF;
                  END LOOP;  
                  DBMS_OUTPUT.PUT_LINE('판매상품 수 : '||CUR_BUY01%ROWCOUNT);
                  CLOSE CUR_BUY01;
                END;
                
            사용예) 2005년도 상품별 입고수량합계를 출력하는 블록을 커서를 이용하여 작성하시오.
                Alias는 상품코드, 상품명, 입고수량
                --교수님
                 DECLARE
                  V_PID PROD.PROD_ID%TYPE;
                  V_PNAME PROD.PROD_NAME%TYPE;
                  V_AMT NUMBER:=0;
                  CURSOR CUR_BUY02 IS
                    SELECT B.BUY_PROD AS BID,
                           A.PROD_NAME AS PNAME,
                           SUM(B.BUY_QTY) AS AMT 
                    FROM PROD A, BUYPROD B
                   WHERE A.PROD_ID = B.BUY_PROD
                     AND EXTRACT(YEAR FROM B.BUY_DATE) = 2005 
                   GROUP BY B.BUY_PROD, A.PROD_NAME;
                BEGIN
                 OPEN CUR_BUY02;
                  LOOP
                    FETCH CUR_BUY02 INTO V_PID, V_PNAME, V_AMT;
                    EXIT WHEN CUR_BUY02%NOTFOUND;
                    
                    DBMS_OUTPUT.PUT_LINE('상품코드 : '||V_PID);
                    DBMS_OUTPUT.PUT_LINE('상품명 : '||V_PNAME);
                    DBMS_OUTPUT.PUT_LINE('매입수량 : '||V_AMT);
                    DBMS_OUTPUT.PUT_LINE('----------------------');
                  END LOOP;
                 CLOSE CUR_BUY02;
                END;
                
                
                (2005년도 상품별 입고수량합계 쿼리 만들기.)
                  SELECT B.BUY_PROD, A.PROD_NAME, SUM(B.BUY_QTY)
                    FROM PROD A, BUYPROD B
                   WHERE A.PROD_ID = B.BUY_PROD
                     AND EXTRACT(YEAR FROM B.BUY_DATE) = 2005 
                   GROUP BY B.BUY_PROD, A.PROD_NAME
                
                
                
                
                --나
                DECLARE
                  V_PID PROD.PROD_ID%TYPE;
                  V_PNAME PROD.PROD_NAME%TYPE;
                  V_AMT NUMBER:=0;
                  V_CNT NUMBER:=0;
                  
                    CURSOR CUR_BUY(PDATE DATE) IS
                      SELECT DISTINCT BUY_PROD
                        FROM BUYPROD
                       WHERE BUY_DATE BETWEEN PDATE AND LAST_DAY(TO_DATE('20051201'));
                BEGIN
                  OPEN CUR_BUY(TO_DATE('20050101'));
                  LOOP
                    FETCH CUR_BUY INTO V_PID;
                    EXIT WHEN CUR_BUY%NOTFOUND;
                      SELECT COUNT(*) INTO V_CNT
                        FROM BUYPROD
                       WHERE BUY_PROD = V_PID 
                         AND TO_CHAR(BUY_DATE,'YYYYMMDD') LIKE '2005%';
                    
                      IF V_CNT !=0 THEN
                        SELECT PROD_NAME, SUM(BUY_QTY) INTO V_PNAME,V_AMT
                          FROM BUYPROD, PROD
                         WHERE BUY_PROD = V_PID
                           AND BUY_PROD = PROD_ID
                           AND TO_CHAR(BUY_DATE,'YYYYMMDD') LIKE '2005%'
                         GROUP BY PROD_NAME; 
                
                    DBMS_OUTPUT.PUT_LINE('상품코드 : '||V_PID);
                    DBMS_OUTPUT.PUT_LINE('상품명 : '||V_PNAME);
                    DBMS_OUTPUT.PUT_LINE('입고수량 : '||V_AMT);
                    DBMS_OUTPUT.PUT_LINE('----------------------');
                    END IF;
                  END LOOP;  
                  CLOSE CUR_BUY;
                END;
                
                