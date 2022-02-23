1. PL/SQL (Procedual Language SQL)
    - 표준 SQL의 기능을 확장한 SQL
    - 서버에 실행가능한 형태의 모듈화 된 서브프로그램
    - block 구조로 구성
    - 모듈화, 캡슐화
    - Anonymous Block, User Defined Function(Function), Stored Procedure(Procedure), Package, Trigger 등이 제공됨
                            --반환값이 있으면 Function, 없으면 Procedure
    (1) 익명블록(Anonymous Block) --이름이 없어 다시 불러 쓸 수 없다.
        - PL/SQL의 기본구조
        - 단순 스크립트에서 실행되는 블록
            (기술형식)
            DECLARE
              선언부(변수,상수,커서 선언); -- 일반변수 [V_..] 매개변수 [P_..]
            BEGIN
              실행부(비즈니스 로직 처리를 위한 sql문)
              [EXCEPTION
                  예외처리부
              ]
            END;
            
            사용예) 키보드로 10-110사이의 부서번호를 입력받아 해당부서직워중 가장 입사일이 빠른 사원 정보를 출력하시오.
                Alias는 사원번호, 사원명, 입사일, 직책코드이다.
                
                ACCEPT P_DID PROMPT '부서코드(10~110)'
                DECLARE
                  V_EID HR.EMPLOYEES.EMPLOYEE_ID%TYPE; --테이블명.컬럼명.TYPE 해당 테이블의 컬럼과 같은 타입을 선언해줌.(참조)
                  V_NAME HR.EMPLOYEES.EMP_NAME%TYPE;
                  V_HIRE HR.EMPLOYEES.HIRE_DATE%TYPE;
                  V_JOBID HR.EMPLOYEES.JOB_ID%TYPE;
                BEGIN
                  SELECT A.EMPLOYEE_ID, A.EMP_NAME, A.HIRE_DATE, A.JOB_ID -- SELECT - INTO - FROM - WHERE ... 이렇게 된다 PL/SQL에서는
                    INTO V_EID, V_NAME, V_HIRE, V_JOBID -- 가장 밖에 있는 SELECT문은 INTO를 써야하며, 자동으로 각 순서대로 할당 시킴.
                    FROM (SELECT EMPLOYEE_ID, EMP_NAME, HIRE_DATE, JOB_ID
                            FROM HR.EMPLOYEES
                          WHERE DEPARTMENT_ID = TO_NUMBER('&P_DID')
                          ORDER BY 3) A
                   WHERE ROWNUM = 1;
                
                   DBMS_OUTPUT.PUT_LINE('사원번호 : '||V_EID); --DBMS에서 제공하는 OUTPUT.PUT_LINE(콘솔출력).(줄바꿈) 을 쓰겠다.
                   DBMS_OUTPUT.PUT_LINE('사원명 : '||V_NAME);
                   DBMS_OUTPUT.PUT_LINE('입사일 : '||V_HIRE);
                   DBMS_OUTPUT.PUT_LINE('직책코드 : '||V_JOBID);
                   
                   EXCEPTION WHEN OTHERS THEN
                     DBMS_OUTPUT.PUT_LINE('예외발생 : ')||SQLERRM); --SQLERRM : SQL 에러 메세지
                END;
                
            1) 변수와 상수
                - 실행부에서 사용할 변수와 상수
                - SCLAR 변수 : 하나의 데이터를 저장하는 변수
                    - REFERENCE 변수 : 임의의 테이블에 존재하는 컬럼의 타입과 크기를 참조하는 변수
                    - COMPOSITE 변수 : PL/SQL에서 사용하는 배열 변수(RECORD TYPE, TABLE TYPE)
                    - BIND 변수 : 파라미터로 넘겨지는 IN, OUT에서 사용되는 변수, 리턴값을 전달하기 위해 사용되는 변수
                    --매겨변수로 값이 넘겨지는 타입 IN(밖에서 안으로 넘겨받음), OUT(안에서 바깥으로 내보냄), INOUT(밖에서 안으로 넘겨받아 결과값을 밖으로 내보냄. 쓰지않는 것을 권고.)
                (사용형식)
                변수명[CONSTANT] 데이터타입[(크기)]|테이블명.컬럼명%TYPE|테이블명%ROWTYPE[:=초기값]; -- 콜론하고 띄우지않음. 숫자인 경우 0으로 초기화해야함. 그렇지 않으면 런타임오류 발생
                    - 'CONSTANT' : 상수 선언
                    - '테이블명.컬럼명%TYPE|테이블명%ROWTYPE' : 참조타입
                    - 숫자형 변수인 경우 반드시 초기화 해야함
                    - 데이터타입 : SQL에서 사용하는 데이터 타입
                        - BINARY_INTEGER, PLS_INTEHER : -2147483648 ~ 2147483647 사이의 정수 취급
                        - BOOLEAN : true, false, null을 취급하는 논리형 변수
                        
            2) 분기명령
                - 프로그램의 실행 순서를 변경하는 명령
                - IF, CASE WHEN 등이 제공 

                (1) IF 문
                    - 개발언어의 IF문과 동일한 기능 제공
                    (사용형식 - 1)
                    IF 조건 THEN --조건이 괄호로 안 묶여 있어도 된다.
                       명령1;
                    [ELSE
                       명령2;]
                    END IF;
                    
                    (사용형식 - 2) -- 병렬 IF
                    IF 조건 THEN
                       명령1;
                    ELSIF 조건 THEN --ELSIF ELSE에 E 가 없어야해!.
                       명령2;
                         :
                    ELSE 명령n;
                    END IF;
                    
                    (사용형식 - 3)
                    IF 조건 THEN
                       명령1;
                       IF 조건 THEN
                          명령2;
                       ELSE
                          명령3;
                       END IF;  -- 마감 쳐야해! 끝을 내야 해!
                    ELSE
                       명령n;
                    END IF; --들여쓰기 내쓰기 안하면 큰일나...^_^!!
                    
                사용예) 임의의 수를 입력 받아 짝수인지 홀수인지 판별하시오
                    ACCEPT P_NUM PROMPT '수 입력 : '
                    DECLARE
                      V_NUM NUMBER := TO_NUMBER('&P_NUM');
                      V_RES VARCHAR2(100);
                    BEGIN
                      IF MOD(V_NUM,2)=0 THEN
                        V_RES:=TO_CHAR(V_NUM)||'은 짝수 입니다.';
                      ELSE
                        V_RES:=TO_CHAR(V_NUM)||'은 홀수 입니다.';
                      END IF;
                    
                      DBMS_OUTPUT.PUT_LINE(V_RES);
                    END;
                
                사용예) 회원테이블에서 회원들의 마일리지를 조회하여 그 값이 5000 이상이면 비고란에 'VIP 회원',
                       3000 이상이면 '정회원', 그 이하이면 '준회원'을 회원번호, 회원명, 마일리지와 함께 출력하시오.
                       
                       DECLARE
                         V_MID MEMBER.MEM_ID%TYPE;
                         V_NAME MEMBER.MEM_NAME%TYPE;
                         V_MILE MEMBER.MEM_MILEAGE%TYPE;
                         V_RES VARCHAR2(100);
                         
                         CURSOR CUR_MEM01 IS
                           SELECT MEM_ID, MEM_NAME, MEM_MILEAGE
                             FROM MEMBER;
                       BEGIN
                         OPEN CUR_MEM01;
                         LOOP
                           FETCH CUR_MEM01 INTO V_MID, V_NAME, V_MILE;
                           EXIT WHEN CUR_MEM01%NOTFOUND;
                           IF V_MILE >= 5000 THEN
                             V_RES:= V_MID||', '||V_NAME||', '||V_MILE||', '||'VIP 회원';
                           ELSIF V_MILE >= 3000 THEN
                             V_RES:= V_MID||', '||V_NAME||', '||V_MILE||', '||'정회원';
                           ELSE
                             V_RES:= V_MID||', '||V_NAME||', '||V_MILE||', '||'준회원';
                           END IF;
                           --DBMS_OUTPUT.PUT_LINE('회원수 : '||CUR_MEM01%ROWCOUNT||'명');
                           DBMS_OUTPUT.PUT_LINE(V_RES);
                           DBMS_OUTPUT.PUT_LINE('------------------------');
                         END LOOP;
                         CLOSE CUR_MEM01;
                       END;
                
                사용예) 사용자로부터 수도 사용량(톤 단위)을 입력 받아 수도요금을 계산하여 출력하시오.
                    사용량(톤)      수도단가
                      1~10           275
                     11~20           305
                     21~30           350
                     31~40           415
                    41톤 이상         500원
                    
                    하수도 사용요금 : 사용량 * 120원
                    
                    ex) 27톤을 사용한 경우
                    처음 10톤  : 275 * 10 = 2,750
                    11-20     : 305 * 10 = 3,050
                    나머지 7톤 : 350 * 7  = 2,450
                    ---------------------------------
                    하수도 사용요금 : 120 * 27 = 3,240
                    ---------------------------------
                                               11,490
                    ACCEPT P_NUM PROMPT '수도 사용량 입력 : '
                    DECLARE
                      V_NUM NUMBER := TO_NUMBER('&P_NUM');
                      V_RES VARCHAR2(100);
                    BEGIN
                      IF (V_NUM <= 10) THEN
                        V_RES:= V_NUM * 275;
                      ELSIF (V_NUM <= 20) THEN
                        V_RES:= (275 * 10) + (V_NUM - 10) * 305;
                      ELSIF (V_NUM <= 30) THEN
                        V_RES:= (275 * 10) + (305 * 10) + (V_NUM - 20) * 350;
                      ELSIF (V_NUM <= 40) THEN
                        V_RES:= (275 * 10) + (305 * 10) + (350 * 10) + (V_NUM - 30) * 415;
                      ELSIF (V_NUM >= 41) THEN
                        V_RES:= (275 * 10) + (305 * 10) + (350 * 10) + (415 * 10) + (V_NUM - 40) * 500;
                      END IF;
                      V_RES:= V_RES+ (V_NUM * 120);
                      DBMS_OUTPUT.PUT_LINE('사용량 : '||V_NUM||'톤');
                    DBMS_OUTPUT.PUT_LINE('수도요금 : '||TO_CHAR(V_RES,'99,999'));
                    END;
                      
                사용예) 사원테이블에서 사원들의 평균급여보다 더 많은 급여를 받는 사원의 사원번호, 사원명, 급여, 부서명을 출력하시오.
                
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
                    
                    
    (3)저장 프로시져(Stored Procedure)
        - 서버에 저장된 컴파일된 특정목적을 위한 모듈
        - 처리속도의 향상 : 프로시져 내의 모든 구문을 하나의 Batch로 인식하여 한번에 분석 및 최적화 시키고 실행 시킴
        - 네트워크의 Traffic 감소 : Client에서 Server로 전송할 SQL구문을 서버가 미리 저장하고 있어 Client에서 다량의 SQL구문대신 프로시져 이름과 매개변수만 전송
        - 반환값이 없음
        
        (사용형식)
        CREATE [OR REPLACE] PROCEDURE 프로시져명[(
          매개변수 [MODE] 타입 [:=값][, 
              :
          매개변수 [MODE] 타입 [:=값1]])]
        IS|AS
          선언영역
        BEGIN
          실행영역
        END;
            - 'OR PLACE' : 같은 이름의 프로시져가 존재하면 OVERWRITE, 없으면 새롭게 생성 -- CALL BY VALUE 방식
            - 'MODE' : 매개변수의 성격을 나타내며 IN(입력용), OUT(출력용), INOUT(입출력 공용)을 사용할 수 있으며 생략하면 IN으로 기준
            - '타입' : 매개변수의 데이터 타입으로 크기를 지정하지 않음
            
        (사용형식 - 실행)
          EXEC|EXECUTE 프로시저명[(매개변수list)];
          
          OR
          
          프로시저명[(매개변수list)]; -- 익명블록이나 다른 PL/SQL객체 내에서 실행
                
            사용예) 년도와 월과 제품코드를 입력 받아 해당제품의 입고수량을 집계하여 재고수불테이블에서 해당 제품의 재고를 갱신하는 프로시져 작성
                CREATE OR REPLACE PROCEDURE PROC_BUY_REMAIN(
                  P_YEAR  IN CHAR,
                  P_MONTH IN VARCHAR, --크기 지정하지않음.
                  P_PID   IN VARCHAR2)
                IS
                  V_IAMT NUMBER(5):=0; --매입 수량
                  V_FLAG NUMBER:=0; --매입자료 유무
                  V_DATE DATE := TO_DATE(P_YEAR||P_MONTH||'01'); --날짜
                BEGIN
                  SELECT COUNT(*),SUM(BUY_QTY) INTO V_FLAG, V_IAMT --일반 함수가 쓰이지 않았으므로 GROUP BY를 쓰지 않아도된다.
                    FROM BUYPROD
                   WHERE BUY_PROD = P_PID
                     AND BUY_DATE BETWEEN V_DATE AND LAST_DAY(V_DATE);
                     
                  IF V_FLAG !=0 THEN
                     UPDATE REMAIN
                        SET REMAIN_I = REMAIN_I + V_IAMT,
                            REMAIN_J_99 = REMAIN_J_99 + V_IAMT,
                            REMAIN_DATE = LAST_DAY(V_DATE)
                      WHERE REMAIN_YEAR = P_YEAR
                        AND PROD_ID = P_PID;
                  END IF;
                END;
                
                
                EXECUTE PROC_BUY_REMAIN('2005','03','P201000017');
                
            사용예) 사원번호를 입력받아 해당사원이 소속된 부서의 부서명, 인원수, 평균급여를 반환하는 프로시져를 작성하시오. -- HR 계정에서해야함.
                
                CREATE OR REPLACE PROCEDURE PROC_EMP01(
                  P_EID IN EMPLOYEES.EMPLOYEE_ID%TYPE, -- IN 입력
                  P_DNAME OUT DEPARTMENTS.DEPARTMENT_NAME%TYPE, -- OUT 출력
                  P_CNT OUT NUMBER, --직원수
                  P_SAL OUT NUMBER) --평균급여
                  IS
                  BEGIN
                    SELECT B.DEPARTMENT_NAME, COUNT(*), ROUND(AVG(C.SALARY))
                      INTO P_DNAME, P_CNT, P_SAL
                      FROM (SELECT DEPARTMENT_ID AS DID
                              FROM HR.EMPLOYEES
                             WHERE EMPLOYEE_ID = P_EID) A, DEPARTMENTS B, EMPLOYEES C
                     WHERE A.DID = B.DEPARTMENT_ID
                       AND C.DEPARTMENT_ID = A.DID
                     GROUP BY B.DEPARTMENT_NAME;
                  END;
                  
                (실행)
                DECLARE
                  V_DNAME DEPARTMENTS.DEPARTMENT_NAME%TYPE;
                  V_CNT NUMBER:=0;
                  V_SAL NUMBER:=0;
                BEGIN
                  PROC_EMP01(109,V_DNAME,V_CNT,V_SAL); --블럭 안에서 쓸 때는 EXCUTE를 여기서 쓰면 안된당~
                  DBMS_OUTPUT.PUT_LINE('부서명 : '||V_DNAME);
                  DBMS_OUTPUT.PUT_LINE('직원수 : '||V_CNT);
                  DBMS_OUTPUT.PUT_LINE('평균급여 : '||V_SAL);
                END;
                
    (4) PACKAGE
        - 논리적 연관성이 있는 PL/SQL의 변수, 상수커서, 서브프로그램(함수, 프로시저) 들의 항목을 묶어 놓은 객체
        - 다른 객체에서 패키지 항목들을 공유, 실행
        - 모듈화 기능 제공
        - 프로그램 설계의 용이성 제공
        - 캡슐화 기능 제공
        - 선언부와 본문부로 구성
        1) 패키지 선언부 -- 헤더만 작성 한다.
            - 패키지에서 사용할 변수, 상수, 함수 등의 선언 영역(명세)
            (사용형식)
            
            CREATE [OR REPLACE] PACKAGE 패키지명 IS
              변수, 상수, 커서 선언;
              FUNCTION 함수명[(매개변수 list)] -- 함수, 프로시져 기술 순서 상관 없다.
                RETURN 반환타입;
                          :
              PROCEDURE 프로시져명(매개변수 list);
                           :
            END 패키지명;
            
        2)패키지 본문부
            - 선언부에서 선언된 PL/SQL 객체들의 구현내용 기술
            (사용형식)
            CREATE [OR REPLACE] PACKAGE BODY 패키지명 IS
              변수명 타입;
              상수명 CONSTANT 타입;
              커서 정의;
              
              FUNCTION 함수명[(매개변수list)]
                RETURN 타입
              IS
                선언부;
              BEGIN
                실행부;
                RETURN expr;
              END 함수명;
                            :
              PROCEDURE 프로시져명[(매개변수list)]
              IS
                선언부;
              BEGIN
                실행부;
              END 프로시져명;
            END 패키지명;

** 사원테이블에 퇴직일자컬럼을 추가하시오.
    컬럼명         타입             NULL여부
    RETIRE_DATE DATE 
    
    ALTER TABLE EMPLOYEES
      ADD RETIRE_DATE DATE;
      
사용예) 사원관리에 필요한 함수 등을 관리
            - 패키지명 : PKG_EMP
            - FN_GET_NAME : 사원번호를 입력 받아 이름을 반환하는 함수
            - PROC_NEW_EMP : 신규사원정보 입력 프로시져(사원번호, LAST_NAME, 이메일, 입사일, JOB_ID)
            - PROC_RETIRE_EMP : 퇴직자처리 프로시져(사원번호 입력)
                (패키지 선언부)
                CREATE OR REPLACE PACKAGE PKG_EMP
                IS
                  --변서, 상수, 커서 뭐 들어올지모름.
                  --이름 반환 함수
                  FUNCTION FN_GET_NAME(
                  P_EID IN EMPLOYEES.EMPLOYEE_ID%TYPE) --입력용 매개변수니까 IN
                  RETURN VARCHAR2;
                
                  --신규사원정보 입력 프로시져
                  PROCEDURE PROC_NEW_EMP( -- 입사일은 SYSDATE 로 오늘 날짜 집어넣을거라서 안씀.
                  P_EID IN EMPLOYEES.EMPLOYEE_ID%TYPE,
                  P_LNAME IN EMPLOYEES.LAST_NAME%TYPE,
                  P_EMAIL IN EMPLOYEES.EMAIL%TYPE,
                  P_JOB_ID IN JOBS.JOB_ID%TYPE);
                  
                  --퇴직자 처리
                  PROCEDURE PROC_RETIRE_EMP(
                  P_EID IN EMPLOYEES.EMPLOYEE_ID%TYPE);
                END PKG_EMP;
            --본문부없이 선언부 만으로도 컴파일 가능하다.
                
                
                (패키지 본문부)
                CREATE OR REPLACE PACKAGE BODY PKG_EMP
                IS                
                   FUNCTION FN_GET_NAME(
                     P_EID IN EMPLOYEES.EMPLOYEE_ID%TYPE)
                     RETURN VARCHAR2
                   IS
                     V_ENAME EMPLOYEES.EMP_NAME%TYPE;
                   BEGIN
                     SELECT EMP_NAME INTO V_ENAME
                       FROM EMPLOYEES
                      WHERE EMPLOYEE_ID = P_EID;
                      
                     RETURN V_ENAME; 
                   END FN_GET_NAME;
                   
                   PROCEDURE PROC_NEW_EMP(
                     P_EID IN EMPLOYEES.EMPLOYEE_ID%TYPE,
                     P_LNAME IN EMPLOYEES.LAST_NAME%TYPE,
                     P_EMAIL IN EMPLOYEES.EMAIL%TYPE,
                     P_JOB_ID IN JOBS.JOB_ID%TYPE)
                   IS
                   BEGIN
                     INSERT INTO EMPLOYEES(EMPLOYEE_ID, LAST_NAME, EMAIL, JOB_ID, HIRE_DATE, EMP_NAME)
                       VALUES(P_EID, P_LNAME, P_EMAIL, P_JOB_ID, SYSDATE-1, P_LNAME||'길동');
                       COMMIT; --트리거 커밋 X 프로시져 함수는 가능하니 저장시켜주기.
                   END PROC_NEW_EMP;
                   
                   PROCEDURE PROC_RETIRE_EMP(
                     P_EID IN EMPLOYEES.EMPLOYEE_ID%TYPE)
                   IS
                   BEGIN
                     UPDATE EMPLOYEES
                        SET RETIRE_DATE = SYSDATE
                      WHERE EMPLOYEE_ID = P_EID;
                     COMMIT;
                   END PROC_RETIRE_EMP;  
                END PKG_EMP;
                
                (실행)
                   SELECT EMPLOYEE_ID, PKG_EMP.FN_GET_NAME(EMPLOYEE_ID)
                     FROM EMPLOYEES
                    WHERE DEPARTMENT_ID = 60; 
                    
                   EXECUTE PKG_EMP.PROC_NEW_EMP(250, '홍', 'gdhong22@gmail.com', 'FI_ACCOUNT');
                   
                   EXEC PKG_EMP.PROC_RETIRE_EMP(150);
        
        
    (5) 트리거(TRIGGER)
        - 특정 이벤트의 발생 전 또는 이후 자동으로 실행되야할 프로시져
        - 트리거는 문장단위 트리거와 행단위 트리거로 구분
        - 문장단위 트리거 수행 시 트리거가 완료되지 않은 상태에서 또 다른 트리거 호출시 테이블의 일관성 유지를 위해 해당 테이블의 접근이 금지됨
        (사용형식)
        CREATE [OR REPLACE] TRIGGER 트리거명                --dml쓰고 commit 잊지마.
          timming[BEFORE|AFTER] event[INSERT|UPDATE|DELETE]
          ON 테이블명
          [FOR EACH ROW]
          [WHEN 조건]
          [DECLARE
            선언부
          ]
          BEGIN
            실행부 -- 트리거에서 실행할것들~
          END;
            - 'BEFORE|AFTER' : '실행부'(트리거 본문)가 실행될 시점
            - 'INSERT|UPDATE|DELETE' : 트리거를 발생시키는 이벤트로 OR 연산자로 복수개 사용 가능
                ex) INSERT OR DELETE, INSERT OR UPDATE OR DELETE etc..
            - 'FOR EACH ROW' : 행단위 트리거 시 기술(생략하면 문장단위 트리거)
            - 'WHEN 조건' : 행단위 트리거에서만 사용 가능하며, 이벤트 발생에 대한 구체적인 조건 기술
            
            (문장단위 트리거) 분류테이블 새로운 분류코드를 삽입하시오. 삽입 후 '새로운 분류가 추가되었습니다.'를 출력하는 트리거를 작성하시오.
                [분류코드 : 'P502', 분류명 : '임산물', 순번 : 11]
            
                CREATE OR REPLACE TRIGGER TG_LPROD_INSERT --문장단위이므로 FOR EACH ROW를 안씀.  FOR EACH ROW를 쓰면 행단위
                AFTER INSERT ON LPROD 
                BEGIN
                  DBMS_OUTPUT.PUT_LINE('새로운 분류가 추가되었습니다.');
                END;
                
                INSERT INTO LPROD(LPROD_ID, LPROD_GU, LPROD_NM)
                       VALUES(13, 'P504', '농축산물');
                COMMIT;
                SELECT * FROM LPROD;
                
                
                CREATE OR REPLACE TRIGGER TG_LPROD_DELETE -- 델리트 트리거
                  AFTER DELETE ON LPROD 
                BEGIN
                  DBMS_OUTPUT.PUT_LINE('분류가 제거되었습니다.');
                END;
                
                  DELETE LPROD
                  WHERE LPROD_ID = 13;
                COMMIT;
                
            (행단위 트리거) 오늘이 2005년 6월 11일이라고 가정하고, 제품코드가 'P102000005'인 상품을 10대를 매입했다고 하자,
                           이 정보를 매입테이블에 저장한 후, 재고 수불테이블을 변경하는 트리거를 작성하시오.
                           
            CREATE OR REPLACE TRIGGER TG_BUYPROD_INSERT     --새로들어가는 자료들을 참조할 때  :NEW 를 사용
              AFTER INSERT ON BUYPROD
              FOR EACH ROW 
            DECLARE
              V_QTY NUMBER := :NEW.BUY_QTY;
              V_PROD PROD.PROD_ID%TYPE := :NEW.BUY_PROD;
            BEGIN
              UPDATE REMAIN
                 SET REMAIN_I = REMAIN_I + V_QTY, -- :NEW.BUY_QTY로 써도된다. 위에서 변수 선언 하지 않고, 밑에서 바로 써도된다.
                     REMAIN_J_99 = REMAIN_J_99 + V_QTY,
                     REMAIN_DATE = TO_DATE('20050611')
               WHERE REMAIN_YEAR='2005'
                 AND PROD_ID = :NEW.BUY_PROD;
                 
               DBMS_OUTPUT.PUT_LINE(:NEW.BUY_PROD||'상품이 '||V_QTY||'개 입고되었습니다.');
            END;
            
            INSERT INTO BUYPROD
              SELECT TO_DATE('20050611'),PROD_ID,10,PROD_COST
                FROM PROD
               WHERE PROD_ID='P102000005';
             
               COMMIT;

        1) 트리거 의사레코드 (행단위 트리거에서만 사용 가능)
            (1) :NEW
                - INSERT, UPDATE 이벤트시 사용
                - 데이터가 삽입(갱신)되는 경우 새롭게 들어온 값
                - DELETE 시에는 모두 NULL임
            
            (2) :OLD -- 존재하고있는 데이터를 지칭
                - DELETE, UPDATE 이벤트시 사용
                - 데이터가 삭제(갱신)되는 경우 이미 존재하고 있던 값
                - INSERT 시에는 모두 NULL임
        
        2) 트리거 함수
            - 트리거의 이벤트를 구별하기 위한 함수
            
            (1) INSERTING : 트리거의 이벤트가 INSERT 이면 참     --INSERT||UPDATE||DELETE 복수개를 쓸때 구별하기 위해 사용
            (2) UPDATING : 트리거의 이벤트가 UPDATE 이면 참
            (3) DELETING : 트리거의 이벤트가 DELETE 이면 참
            
                사용예) 오늘(2005/08/06) 'h001'회원(라준호)이 상품 'P202000019'을 5개 구입했을때 CART테이블과 재고수불테이블에 자료를 삽입 및 갱신하시오.(트리거 이용)
                    CREATE OR REPLACE TRIGGER TG_CART_CHANGE         --new 새롭게 구매한 수량. old 먼저 구매한 수량.  new - old = 반품수량
                      AFTER INSERT OR UPDATE OR DELETE ON CART
                      FOR EACH ROW
                    DECLARE
                      V_QTY NUMBER := 0;
                      V_PID PROD.PROD_ID%TYPE;
                      V_DATE DATE;
                    BEGIN
                      IF INSERTING THEN
                         V_QTY := NVL(:NEW.CART_QTY,0);
                         V_PID := :NEW.CART_PROD;
                         V_DATE := TO_DATE(SUBSTR(:NEW.CART_NO,1,8));
                      ELSIF UPDATING THEN
                         V_QTY := NVL(:NEW.CART_QTY,0) - NVL(:OLD.CART_QTY,0);
                         V_PID := :NEW.CART_PROD;
                         V_DATE := TO_DATE(SUBSTR(:NEW.CART_NO,1,8));
                      ELSE
                         V_QTY := -(NVL(:OLD.CART_QTY,0));
                         V_PID := :OLD.CART_PROD;
                         V_DATE := TO_DATE(SUBSTR(:OLD.CART_NO,1,8));
                      END IF;
                      
                      UPDATE REMAIN
                         SET REMAIN_O = REMAIN_O + V_QTY,
                             REMAIN_J_99 = REMAIN_J_99 - V_QTY,
                             REMAIN_DATE = V_DATE
                       WHERE REMAIN_YEAR = '2005'
                         AND PROD_ID = V_PID;
                         
                      EXCEPTION WHEN OTHERS THEN
                         DBMS_OUTPUT.PUT_LINE('오류발생 : '||SQLERRM);
                    END;
                    
                    (실행)
                    ACCEPT P_AMT PROMPT '수량 : '
                    DECLARE
                      V_CNT NUMBER := 0;
                      V_CARTNO CHAR(13);
                      V_AMT NUMBER := TO_NUMBER('&P_AMT');
                    BEGIN
                      SELECT COUNT(*) INTO V_CNT         --데이터가 있어서 1 이니까 INSERT가 아니라 UPDATE나 DELETE가 실행된다.
                        FROM CART
                       WHERE CART_NO LIKE '20050806%';
                    
                      IF V_CNT = 0 THEN
                         V_CARTNO := '2005080600001';
                         INSERT INTO CART(CART_MEMBER, CART_NO, CART_PROD, CART_QTY)
                           VALUES('h001', V_CARTNO, 'P202000019', V_AMT);
                      ELSE
                         IF V_AMT != 0 THEN
                            UPDATE CART
                               SET CART_QTY = V_AMT
                             WHERE CART_NO = '2005080600001'
                               AND CART_PROD = 'P202000019';
                         ELSE
                            DELETE CART
                             WHERE CART_NO = '2005080600001'
                               AND CART_PROD = 'P20200019';
                         END IF;
                      END IF;
                    END;
                    
                사용예) 사원테이블에서 사원번호 125번(Julia Nayer)사원의 직무가 'ST_CLERK'에서 'ST_MAN'으로 승진되었다.
                       이 정보를 사원테이블에 반영하고 난 후 직무 변동 테이블을 갱신하시오.
                    CREATE OR REPLACE TRIGGER TG_JOB_CHANGE
                    AFTER UPDATE ON EMPLOYEES
                    FOR EACH ROW -- NEW, OLD 를 쓸꺼임.
                    DECLARE
                      V_EID EMPLOYEES.EMPLOYEE_ID%TYPE:= :OLD.EMPLOYEE_ID; --125를 직접 넣어줘도된다.
                      V_CNT NUMBER := 0; 
                      V_SDATE DATE; --직무 시작
                      V_EDATE DATE; --직무 종료
                    BEGIN
                      SELECT COUNT(*) INTO V_CNT
                        FROM JOB_HISTORY
                       WHERE EMPLOYEE_ID = 125; 
                       
                       IF V_CNT = 0 THEN
                          V_SDATE := :OLD.HIRE_DATE+1;
                          V_EDATE := SYSDATE-1;
                       ELSE 
                          SELECT A.END_DATE INTO V_SDATE
                            FROM (SELECT START_DATE, END_DATE
                                    FROM JOB_HISTORY
                                   WHERE EMPLOYEE_ID = 125
                                   ORDER BY 2 DESC)A
                           WHERE ROWNUM = 1;
                          V_SDATE:= V_SDATE + 1;
                          V_EDATE:= SYSDATE - 1;
                        END IF;
                         INSERT INTO JOB_HISTORY
                           VALUES(V_EID, V_SDATE, V_EDATE, :OLD.JOB_ID, :OLD.DEPARTMENT_ID);
                    END;
                    
                    (실행)
                    DECLARE
                    BEGIN
                      UPDATE EMPLOYEES
                         SET (SALARY, JOB_ID) = (SELECT A.MIN_SALARY, 'ST_MAN'
                                                 FROM (SELECT MIN_SALARY
                                                         FROM JOBS
                                                        WHERE JOB_ID = 'ST_MAN') A)
                       WHERE EMPLOYEE_ID = 125;
                    END;