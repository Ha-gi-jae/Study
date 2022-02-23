1. 반복문
    - 오라클의 반복문은 LOOP, WHILE, FOR문이 제공
        
    (1) LOOP 문
        - 반복문의 기본구조
        (사용형식)
        LOOP
          반복처리명령문(들);
          [EXIT WHEN 조건;]
        END LOOP;
            - 기본적으로 무한루프
            - 'EXIT WHEN 조건' : 조건이 참(true)이면 반복을 벗어남(END LOOP 다음으로 제어 이동)
            
            사용예) 구구단의 7단을 출력하는 블록을 작성하시오.
                DECLARE
                  V_CNT NUMBER:= 1;
                  V_RES NUMBER:= 0; --초기값 설정 하고 써야한다. 스크립런너가 계속 돌아간다 => 숫자변수 초기화를 하지 않았다.
                BEGIN
                  LOOP
                    V_RES:= 7 * V_CNT;
                    EXIT WHEN V_CNT > 9;
                    DBMS_OUTPUT.PUT_LINE(7||'*'||V_CNT||'='||V_RES);
                    V_CNT:= V_CNT + 1; --자바와 달리 증감연산자가 없으므로 수식으로 만들어줘야함.
                  END LOOP;
                END;
                    
    (2) WHILE 문
        - 개발언어의 WHILE문과 동일 기능 및 구조
        (사용형식)
        WHILE 조건 LOOP
          반복처리명령문(들);
        END LOOP;
            - '조건'이 참이면 반복 수행
            
            사용예) 구구단의 7단을 출력하시오.
                DECLARE
                  V_CNT NUMBER:= 0;
                  V_RES NUMBER:= 0;
                BEGIN
                  WHILE V_CNT <9 LOOP
                    V_CNT:=V_CNT+1;
                    V_RES:=7*V_CNT;
                    DBMS_OUTPUT.PUT_LINE(7||' * '||V_CNT||' = '||V_RES); -- 7*V_CNT 해도된다. 그럼 위에 RES 필요없음.
                  END LOOP;
                END;
                    
            숙제) 위 1번과 2번을 WHILE문을 사용하여 작성하시오.

        (3) FOR 문
        - 개발언어의 FOR문과 유사한 구조
        - 일반 반복처리를 위한 FOR문과 CURSOR처리를 위한 FOR문이 제공
        (일반 FOR문 사용형식)
            FOR 인덱스 IN [REVERSE] 초기값..최대값 LOOP
                반복처리명령문(들);
            END LOOP;
                - '인덱스' : 제어변수로 사용될 인덱스로 시스템에서 자동 설정
                - 'REVERSE' : 역순으로 반복처리시 사용
             
            사용예) 구구단의 7단을 출력하시오.
                DECLARE
                BEGIN
                  FOR I IN 1..9 LOOP
                    DBMS_OUTPUT.PUT_LINE(7||'*'||I||'='||7*I);
                  END LOOP;  
                END;
                --반복 횟수를 정확히 알때 쓰면 매우 좋음
                
            사용예) 첫날에 100원을 저축하고, 그 다음날 부터 전날의 2배씩 저축할 때 최초로 200만원을 넘는 날과 저축금액을 구하시오.
                DECLARE
                  V_SUM NUMBER:=0; --저축 합계
                  V_DSUM NUMBER:=100; --일별 저축할 액수
                  V_DAYS NUMBER:=0;
                BEGIN
                  FOR I IN 1..1000 LOOP
                    V_SUM:= V_SUM + V_DSUM;
                    IF V_SUM >= 2000000 THEN
                       EXIT;
                    END IF;
                    V_DSUM:=V_DSUM * 2;
                    V_DAYS:= I;
                  END LOOP;
                  DBMS_OUTPUT.PUT_LINE('일수 : '||V_DAYS);
                  DBMS_OUTPUT.PUT_LINE('저축금액 : '||V_SUM);
                END;
                    
        (CURSOR를 위한 FOR문 사용형식)
            FOR 레코드명 IN 커서명 LOOP
                반복처리명령문(들);
            END LOOP;
                - '레코드명' : 커서가 가르키는 행의 값을 가지고 있는 변수로 시스템에서 정의
                - 커서내의 값들(컬럼)의 참조는 '레코드명.커서의 컬럼명' 형식으로 기술
                - 커서의 OPEN, FETCH, CLOSE 명령 생략
                - '커서선언문' : 선언영역에서 선언해야할 커서선언문 중 'SELECT' 문을 서브쿼리형식으로 기술
            
            사용예)2005년도 상품별 입고수량합계를 출력하는 블록을 커서와 FOR문을 이용하여 작성하시오.
            DECLARE
            BEGIN
              FOR REC1 IN (SELECT B.BUY_PROD AS BID,
                                  A.PROD_NAME AS PNAME,
                                 SUM(B.BUY_QTY) AS AMT 
                            FROM PROD A, BUYPROD B
                           WHERE A.PROD_ID = B.BUY_PROD
                             AND EXTRACT(YEAR FROM B.BUY_DATE) = 2005 
                           GROUP BY B.BUY_PROD, A.PROD_NAME)
              LOOP
                DBMS_OUTPUT.PUT_LINE('상품코드 : '||REC1.BID);
                DBMS_OUTPUT.PUT_LINE('상품명 : '||REC1.PNAME);
                DBMS_OUTPUT.PUT_LINE('매입수량 : '||REC1.AMT);
                DBMS_OUTPUT.PUT_LINE('----------------------');
              END LOOP;
            END;