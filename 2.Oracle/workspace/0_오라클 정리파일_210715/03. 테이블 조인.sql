1. 테이블 조인
    - 관계형 데이터 베이스의 핵심 기능
    - 복수개의 테이블에 분산된 자료를 조회하기 위함
    - 테이블 사이에 관계(Relationship)가 맺어져 있어야 함
        - 구분
            - 일반 조인 / ANSI JOIN
                - 일반조인 : CARTESIAN PRODUCT, EQUI JOIN, NON EQUI JOIN, SELF JOIN, OUTER JOIN
                - ANSI JOIN : CROSS JOIN, NATURAL JOIN, INNER JOIN, OUTER JOIN
            - 내부조인 / 외부조인
            
        (일반 사용형식)
            SELECT 컬럼list
                FROM 테이블명1 [별칭1], 테이블명2 [별칭2] [,테이블명3 [별칭3],...]
                WHERE 조인조건1
                  [AND 조인조건2]
                  [AND 일반조건]...
        
            - 조인에 사용된 테이블이 n개일때 조인조건의 갯수는 n-1개 이상이어야 함
            - 조인조건과 일반조건의 기술 순서는 의미없음
      
        (ANSI INNER JOIN 사용형식)
            SELECT 컬럼list
                FROM 테이블명1 [별칭1] -- 테이블명1 이랑 테이블명2는 무조건 조인되어야함.               ex) buyer
                INNER JOIN 테이블명2 [별칭2] ON(조인조건 [AND 일반조건]) --테이블명2 에만 해당되는 조건 ex) prod
                INNER JOIN 테이블명3 [별칭3] ON(조인조건 [AND 일반조건]) --테이블명3 에만 해당되는 조건 ex) buyprod 1,2번 조인결과와 조인된다.
                        :
                [WHERE 일반조건n]...
                                     
            - '테이블명1'과 '테이블명2'는 반드시 조인 가능한 테이블 일것
            - '테이블명3' 부터는 '테이블명1'과 '테이블명2'의 결과와 조인
            - ON 절에 사용되는 일반조건1은 '테이블1'과 '테이블2'에만 해당하는 조인조건    
            - WHERE 절의 조인조건은 모든 테이블에 적용되는 조인조건
            
    1)일반조인 / ANSI JOIN        
        (1) CARTESIAN PRODUCT
            - 모든 가능한 행들의 집합을 결과로 반환
            - ANSI에서는 CROSS JOIN이 이에 해당
            - 특별한 목적 이외에는 사용되지 않음
            - 조인조건이 없거나 잘못된 경우 발생
            
            사용예) SELECT COUNT(*) --일반
                       FROM CART, BUYPROD;
                   -- cart 행 * buyprod 행
                   
                   SELECT COUNT(*) --ANSI
                       FROM CART
                       CROSS JOIN BUYPROD
                       CROSS JOIN PROD;
                   -- CART 행 * BUY PROD 행 * PROD 행
                   
        (2) EQUI-JOIN
            - 동등 조인
            - 조인 조건에 '=' 연산자가 사용된 조인
            - ANSI JOIN은 INNER JOIN이 이에 해당
            - 조인조건 또는 SELECT에 사용되는 컬럼 중 두 테이블에서 같은 컬럼명으로 정의된 경우 '테이블명.컬럼명' 또는 '테이블 별칭.컬럼명' 형식으로 기술
            
            사용예) 매입테이블에서 2005년 1월 상품별 매입현황을 조회하시오
                Alias는 상품코드, 상품명, 매입수량합계, 매입금액합계
                SELECT A.BUY_PROD AS 상품코드, --일반
                       B.PROD_NAME AS 상품명,
                       SUM(A.BUY_QTY) AS 매입수량합계,
                       SUM(A.BUY_QTY*B.PROD_COST) AS 매입금액합계
                    FROM BUYPROD A, PROD B
                    WHERE B.PROD_ID = A.BUY_PROD -- 조인조건
                      AND A.BUY_DATE BETWEEN  TO_DATE('20050101') AND TO_DATE(LAST_DAY('20050101')) 
                    GROUP BY A.BUY_PROD, B.PROD_NAME
                    ORDER BY 1;
                
                SELECT A.BUY_PROD AS 상품코드, --ANSI
                       B.PROD_NAME AS 상품명,
                       SUM(A.BUY_QTY) AS 매입수량합계,
                       SUM(A.BUY_QTY*B.PROD_COST) AS 매입금액합계
                    FROM BUYPROD A
                    INNER JOIN PROD B ON(A.BUY_PROD=B.PROD_ID AND A.BUY_DATE BETWEEN  TO_DATE('20050101') AND TO_DATE(LAST_DAY('20050101')))
                    GROUP BY A.BUY_PROD, B.PROD_NAME          --테이블을 2개만 쓰기 때문에 AND로 하지 않을시 WHERE절에 하면된다.
                    ORDER BY 1;
                    
            사용예) 사원테이블에서 관리자 사원번호가 121번인 부서에 속한 사원 정보를 조회하시오.
                Alias는 사원번호, 사원명, 부서명, 직무명
                SELECT A.EMPLOYEE_ID AS 사원번호, --일반
                       A.EMP_NAME AS 사원명,
                       B.DEPARTMENT_NAME AS 부서명,
                       C.JOB_TITLE AS 직무명
                    FROM HR.EMPLOYEES A, HR.DEPARTMENTS B, HR.JOBS C
                    WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID -- 조인조건
                       AND A.JOB_ID = C.JOB_ID -- 조인조건
                       AND B.MANAGER_ID LIKE 121 -- 숫자라 = 도 가능
                    ORDER BY 1;
                
                SELECT A.EMPLOYEE_ID AS 사원번호, --ANSI
                       A.EMP_NAME AS 사원명,
                       B.DEPARTMENT_NAME AS 부서명,
                       C.JOB_TITLE AS 직무명
                    FROM HR.EMPLOYEES A
                    INNER JOIN HR.DEPARTMENTS B ON A.DEPARTMENT_ID = B.DEPARTMENT_ID --이곳에 where절에 있는것을 써도된다.
                    INNER JOIN HR.JOBS C ON A.JOB_ID = C.JOB_ID
                    WHERE B.MANAGER_ID LIKE 121
                    ORDER BY 1;
                    
            사용예) 2005년 거래처별 매출현황을 조회하시오
                Alias는 거래처코드, 거래처명, 매출금액합계
                SELECT A.BUYER_ID AS 거래처코드,
                       A.BUYER_NAME AS 거래처명,
                       SUM(B.CART_QTY*C.PROD_PRICE) AS 매출금액합계
                    FROM BUYER A, CART B, PROD C
                    WHERE B.CART_PROD = C.PROD_ID
                      AND A.BUYER_ID = C.PROD_BUYER
                      AND B.CART_NO LIKE '2005%'
                     GROUP BY A.BUYER_ID, A.BUYER_NAME
                     ORDER BY 1;
                     
                SELECT A.BUYER_ID AS 거래처코드,
                       A.BUYER_NAME AS 거래처명,
                       SUM(B.CART_QTY*C.PROD_PRICE) AS 매출금액합계
                    FROM BUYER A
                    INNER JOIN PROD C ON A.BUYER_ID = C.PROD_BUYER
                    INNER JOIN CART B ON B.CART_PROD = C.PROD_ID
                    WHERE B.CART_NO LIKE '2005%'
                    GROUP BY A.BUYER_ID, A.BUYER_NAME
                    ORDER BY 1;
                    
            사용예)2005년 5월 회원별 판매액을 계산하고 상위 5명의 자료를 출력하시오.
                Alias는 회원번호, 회원명, 구매금액합계
                SELECT TBLA.CID AS 회원번호,
                       TBLB.MEM_NAME AS 회원명,
                       TBLA.AMT AS 구매금액합계 
                  FROM (SELECT A.CART_MEMBER AS CID, --참조되어 지는것은 영문으로 되어진 컬럼별칭을 써주는게 안전하다.
                               SUM(A.CART_QTY*B.PROD_PRICE) AS AMT
                          FROM CART A, PROD B
                         WHERE A.CART_PROD=B.PROD_ID
                           AND A.CART_NO LIKE '200505%'
                         GROUP BY A.CART_MEMBER
                         ORDER BY 2 DESC) TBLA,
                        MEMBER TBLB
                  WHERE TBLA.CID=TBLB.MEM_ID
                    AND ROWNUM <= 5;          --인라인형식을 가지고 있는 서브쿼리
                    
            사용예) 회원의 마일리지를 조회하여 상위 20%에 속한 회원들이 2005년 4-6월 구매한 정보를 조회하시오.
                Alias는 회원번호, 회원명, 상품명, 수량, 금액
                  
                  DECLARE
                    V_ID MEMBER.MEM_ID%TYPE;                 --% = 참조타입 같은 데이터타입으로 해줘~
                    V_NAME MEMBER.MEM_NAME%TYPE;
                    V_AMT NUMBER:=0;
                    
                    CURSOR CUR_MEM01 IS
                      SELECT A.MID
                        FROM (SELECT MEM_ID AS MID
                                FROM MEMBER
                               ORDER BY MEM_MILEAGE DESC) A
                       WHERE ROWNUM <= ROUND((SELECT COUNT(*)
                                          FROM MEMBER) * 0.2);
                  BEGIN
                    OPEN CUR_MEM01; 
                    LOOP -- JAVA DO{}WHILE()
                      FETCH CUR_MEM01 INTO V_ID; --FETCH 읽어와라. 첫줄부터 차례대로.
                      EXIT WHEN CUR_MEM01%NOTFOUND;      -- 커서변수 NOTFOUND 더이상 커서가 자료가 없으면 참 있으면 거짓
                      
                      SELECT C.MEM_NAME, SUM(A.CART_QTY*B.PROD_PRICE)
                        INTO V_NAME, V_AMT
                        FROM CART A, PROD B, MEMBER C
                       WHERE A.CART_MEMBER=C.MEM_ID
                         AND A.CART_PROD=B.PROD_ID
                         AND A.CART_MEMBER=V_ID
                         AND SUBSTR(A.CART_NO,1,6) BETWEEN '200504' AND '200506'
                       GROUP BY C.MEM_NAME;
                         
                       DBMS_OUTPUT.PUT_LINE('회원번호 : '||V_ID);
                       DBMS_OUTPUT.PUT_LINE('회원명 : '||V_NAME);
                       DBMS_OUTPUT.PUT_LINE('구매금액 : '||V_AMT);
                       DBMS_OUTPUT.PUT_LINE('------------------------');
                    END LOOP;
                    
                    CLOSE CUR_MEM01;
                  END;
                  
            사용예) 2005년 5월 매입액과 매출액을 조회하시오.
                Alias는 상품코드, 상품명, 매입액합계, 매출액합계
                SELECT A.BUY_PROD AS 상품코드,
                       B.PROD_NAME AS 상품명,
                       SUM(A.BUY_QTY*B.PROD_COST) AS 매입액합계
                  FROM BUYPROD A, PROD B
                  WHERE A.BUY_PROD = B.PROD_ID        --COST와 NAME을 끌고 오겠다. 같은 상품의!
                    AND A.BUY_DATE BETWEEN TO_DATE('20050501') AND LAST_DAY(TO_DATE('20050501'))
                  GROUP BY A.BUY_PROD, B.PROD_NAME
                  ORDER BY 1;
                  
                 SELECT A.CART_PROD AS 상품코드,
                       B.PROD_NAME AS 상품명,
                       SUM(A.CART_QTY*B.PROD_PRICE) AS 매출액합계
                  FROM CART A, PROD B
                  WHERE A.CART_PROD = B.PROD_ID       
                    AND A.CART_NO LIKE '200505%'
                  GROUP BY A.CART_PROD, B.PROD_NAME
                  ORDER BY 1;
                  
                (결합 - 일반조인형식)
                SELECT PROD_ID AS 상품코드,
                       PROD_NAME AS 상품명,
                       NVL(TBLA.BAMT,0) AS 매입합계               -- CART_PROD = PROD_ID 조인 2개 일반 2개 같아야함
                       NVL(TBLB.CAMT,0) AS 매출합계
                  FROM (SELECT A.BUY_PROD AS BID,
                               SUM(A.BUY_QTY*B.PROD_COST) AS BAMT
                          FROM BUYPROD A, PROD B
                         WHERE A.BUY_PROD = B.PROD_ID
                           AND A.BUY_DATE BETWEEN TO_DATE('20050501') AND LAST_DAY(TO_DATE('20050501'))
                      GROUP BY A.BUY_PROD) TBLA,            
                        (SELECT A.CART_PROD AS CID,
                                SUM(A.CART_
                        
                          FROM CART A, PROD B
                          WHERE A.CART_PROD=B.PROD_ID                 
                          AND A.CART_NO LIKE '200505%'
                        GROUP BY A.CART_PROD) TBLB,   
                       PROD   --공백을 넣어 74개로 맞춰서 연결
                 WHERE TBLA.BID (+)= PROD_ID   --매입    
                   AND TBLB.CID (+)= PROD_ID   --매출  둘다 늘려서 조인시킴.      
                 GROUP BY 1;          
                 
                 (결합 - ANSI형식)
                 SELECT A.PROD_ID AS 상품코드,
                       A.PROD_NAME AS 상품명,
                       NVL(SUM(A.PROD_COST*B.BUY_QTY),0) AS 매입합계,            
                       NVL(SUM(A.PROD_PRICE*C.CART_QTY),0) AS 매출합계
                  FROM PROD A
                  LEFT OUTER JOIN BUYPROD B ON (B.BUY_PROD = A.PROD_ID
                        AND B.BUY_DATE BETWEEN TO_DATE('20050501') AND LAST_DAY(TO_DATE('20050501')))
                  LEFT OUTER JOIN CART C ON (C.CART_PROD = A.PROD_ID
                        AND C.CART_NO LIKE '200505%')
                   GROUP BY A.PROD_ID, A.PROD_NAME
                   ORDER BY 1;
                  
                         
        (3) Non-Equi Join
            - 조인조건문이 '=' 이외의 연산자가 사용된 경우
            - IN, ANY, SOME, ALL, EXISTS 등의 복수행 연산자 사용
            
            사용예) 사원테이블에서 사원들의 평균임금보다 더 많은 임금을 받는 사원의 사원번호, 사원명, 부서명, 급여, 평균급여를 출력하시오
                SELECT A.EMPLOYEE_ID AS 사원번호,
                       A.EMP_NAME AS 사원명,
                       B.DEPARTMENT_NAME AS 부서명,
                       A.SALARY AS 급여,
                       C.ASAL AS 평균급여
                    FROM HR.EMPLOYEES A, HR.DEPARTMENTS B,
                        (SELECT ROUND(AVG(SALARY)) AS ASAL
                           FROM HR.EMPLOYEES) C -- 평균급여                서브쿼리 한번만 실행해서 결과를 ASAL에 넣어주고 비교. 효율적
                   WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
                     AND A.SALARY > C.ASAL
                   ORDER BY 4;
               
               --이런(비효율적) 방식도 있음.
               SELECT A.EMPLOYEE_ID AS 사원번호,
                       A.EMP_NAME AS 사원명,
                       B.DEPARTMENT_NAME AS 부서명,
                       A.SALARY AS 급여,
                       (SELECT ROUND(AVG(SALARY))
                         FROM HR.EMPLOYEES) AS 평균급여
                    FROM HR.EMPLOYEES A, HR.DEPARTMENTS B
                        WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
                     AND A.SALARY > (SELECT ROUND(AVG(SALARY)) 
                                      FROM HR.EMPLOYEES)        -- 필요할 때마다 실행해서 효율적이지 않음
                   ORDER BY 4;    
                   
            사용예) 2005년 6월 가장 많이 구매한 고객의 주소지 이외의 주소지에 거주하는 회원의 회원번호, 회원명, 주소를 조회하시오.
                SELECT

        (4) SELF JOIN
            - 하나의 테이블에 서로 다른 별칭을 부여하여 수행하는 조인
            
            사용예) 거래처 '마르죠'와 동일한 지역(광역시도)에 소재하고 있는 거래처 정보를 조회하시오.
                Alias는 거래처코드, 거래처명, 주소, 담당자이다.
                SELECT B.BUYER_ID AS 거래처코드,
                       B.BUYER_NAME AS 거래처명,
                       B.BUYER_ADD1||' '||B.BUYER_ADD2 AS 주소,
                       B.BUYER_CHARGER AS 담당자
                  FROM BUYER A, BUYER B
                 WHERE A.BUYER_NAME = '마르죠' -- = 으로 연결되어서 일반조건임 관계조건 아님!
                   AND SUBSTR(A.BUYER_ADD1,1,2) = SUBSTR(B.BUYER_ADD1,1,2);
                  -- A 마르죠에 대한 B 마르죠와 같은 주소지를 가지고 있는 거래처를 찾기위한 테이블
                  -- 거래처 정보를 뽑아야 하니까 B 테이블 컬럼을 쓰는것.
                  
            사용예) 사원번호 108번 사원과 같은 부서에 속한 사원의 사원번호, 사원명, 부서명, 직무코드를 조회하시오.
                SELECT B.EMPLOYEE_ID AS 사원번호,
                       B.EMP_NAME AS 사원명,
                       C.DEPARTMENT_NAME AS 부서명,
                       B.JOB_ID AS 직무코드
                  FROM HR.EMPLOYEES A, HR.EMPLOYEES B, HR.DEPARTMENTS C
                 WHERE A.EMPLOYEE_ID = 108
                   AND A.DEPARTMENT_ID = B.DEPARTMENT_ID
                   AND B.DEPARTMENT_ID = C.DEPARTMENT_ID;
                 
                  --108번 먼저 추출하고 그 부서코드랑 같은 사람 조인
        (5) 외부조인(OUTER JOIN)
            - 내부조인은 조인조건을 만족하는 데이터를 기준으로 결과를 반환
            - 외부조인은 조인조건을 만족하지 못하는 데이터를 기준으로 부족한 테이블에 NULL 값으로 채워진 행을 삽입하여 조인 수행
            - 조인조건에서 부족한 데이터를 가지고 있는 테이블에 속한 열이름 다음에 '(+)'연산자를 추가함
            - 여러 조인조건이 외부조인이 수행되어야 하는 경우 모두 '(+)'연산자를 사용해야 함
            - 동시에 한 테이블에 복수개의 '(+)'연산자를 사용할 수 없다.
              즉, A, B, C 테이블이 외부조인에 참여할 때 A를 기준으로 B를 확장함과 동시에 C를 기준으로 B를 확장 할 수 없음
              (WHERE A=B(+)AND C=B(+) => 허용안됨)
            - 일반외부조인의 경우 일반조건이 사용되면 내부조인 결과를 반환(해결방법 : ASNI 외부조인 또는 서브쿼리 사용)
            - 외부조인의 사용은 처리속도의 저하 유발
            
            (일반 외부조인 사용형식)
                SELECT 컬럼list
                  FROM 테이블명1, 테이블명2[,테이블명3,...]
                 WHERE 테이블명1.컬럼명1[(+)]=테이블명2.컬럼명[(+)] --동시에 사용 불가능 왼쪽 또는 오른쪽 한쪽만! 데이터의 종류가 작은 곳에!!
                            :
                    양쪽 모두 부족한 외부조인은 허용안됨( WHERE A.COL(+)=B.COL(+) )
            
            (ANSI 외부조인 사용형식)
                SELECT 컬럼list
                  FROM 테이블명1
                  LEFT|RIGHT|FULL OUTER JOIN 테이블명2 ON (조인조건1 [AND 일반조건1])
                  LEFT|RIGHT|FULL OUTER JOIN 테이블명3 ON (조인조건2 [AND 일반조건2])
                                        :
                 [WHERE 일반조건n]
                     - 테이블명1과 테이블명2는 반드시 조인 가능 할것
                     - 일반조건1은 테이블명1 또는 테이블명2에 국한된 조건
                     - 일반조건n은 전체 테이블에 적용되는 조건으로 조인이 모두 수행 한 후 적용됨
                     - LEFT|RIGHT|FULL : 테이블명1의 데이터 종류가 더 많은 경우 LEFT,
                                         반대인 경우 RIGHT, 양쪽 모두 부족한 경우 FULL 사용
                 
            사용예) 2005년 1월 모든 상품별 매입현황을 조회하시오. -- 모든, 전부 라는 수식어가 붙으면 OUTER JOIN을 써야한다. 상품별 = GROUP BY
                출력할 컬럼은 상품코드, 상품명, 매입수량, 매입금액이다. -- 공통으로 쓸 수 있는경우 많은쪽으로 해라. 적은걸 쓰면 NULL이 쓰임.
                (일반 외부조인)
                SELECT B.PROD_ID AS 상품코드,                          --카운터 쓰게된다면 * 말고 컬럼명을 써야함.
                       B.PROD_NAME AS 상품명,                          --NULL은 지저분하니까 NVL 
                       NVL(SUM(A.BUY_QTY),0) AS 매입수량,
                       NVL(SUM(A.BUY_QTY*B.PROD_COST),0) AS 매입금액
                  FROM BUYPROD A, PROD B
                  WHERE A.BUY_PROD(+) = B.PROD_ID
                    --AND A.BUY_DATE BETWEEN TO_DATE('20050101') AND LAST_DAY(TO_DATE('20050101')) -- 내부조인결과를 반환함.
                  GROUP BY B.PROD_ID, B.PROD_NAME
                  ORDER BY 1;
                  
                (ANSI 외부조인)  
                SELECT B.PROD_ID AS 상품코드,                         
                       B.PROD_NAME AS 상품명,                         
                       NVL(SUM(A.BUY_QTY),0) AS 매입수량,
                       NVL(SUM(A.BUY_QTY*B.PROD_COST),0) AS 매입금액
                  FROM BUYPROD A
                  RIGHT OUTER JOIN PROD B ON (A.BUY_PROD(+) = B.PROD_ID)
                  --WHERE A.BUY_DATE BETWEEN TO_DATE('20050101') AND LAST_DAY(TO_DATE('20050101')) -- 내부조인결과 반환
                  GROUP BY B.PROD_ID, B.PROD_NAME
                  ORDER BY 1;
                  
                (SUBQUERY + 일반 외부조인)
                SELECT B.PROD_ID AS 상품코드,                         
                       B.PROD_NAME AS 상품명,                          
                       NVL(SUM(A.BUY_QTY),0) AS 매입수량,
                       NVL(SUM(A.BUY_QTY*B.PROD_COST),0) AS 매입금액
                  FROM PROD B, ()--<2005년도 매입정보(내부조인)) A
                  WHERE B.컬럼명=A.컬럼명(+)
                  ORDER BY 1;
                  
                  --2005년도 1월 매입정보(내부조인) A
                SELECT BUY_PROD AS BID,
                       SUM(BUY_QTY) AS QAMT,
                       SUM(BUY_QTY*BUY_COST) AS MAMT
                  FROM BUYPROD
                 WHERE BUY_DATE BETWEEN TO_DATE('20050101') AND LAST_DAY(TO_DATE('20050101'))
                 GROUP BY BUY_PROD;
                 
                 SELECT B.PROD_ID AS 상품코드,                          --카운터 쓰게된다면 * 말고 컬럼명을 써야함.
                       B.PROD_NAME AS 상품명,                          --NULL은 지저분하니까 NVL 
                       NVL(A.QAMT,0) AS 매입수량,
                       NVL(A.MAMT,0) AS 매입금액
                  FROM PROD B, ( SELECT BUY_PROD AS BID,
                                        SUM(BUY_QTY) AS QAMT,
                                        SUM(BUY_QTY*BUY_COST) AS MAMT
                                   FROM BUYPROD
                                  WHERE BUY_DATE BETWEEN TO_DATE('20050101') AND LAST_DAY(TO_DATE('20050101'))
                                  GROUP BY BUY_PROD) A
                  WHERE B.PROD_ID = A.BID(+)
                  ORDER BY 1;
            
            사용예) 모든 부서별 사원수를 조회하시오.
                출력은 부서코드, 부서명, 사원수이다.
                SELECT B.DEPARTMENT_ID AS 부서코드, -- DEPARTMENT 가 부서가 더 많음
                       B.DEPARTMENT_NAME AS 부서명,
                       COUNT(A.EMPLOYEE_ID) AS 사원수 -- PK를 넣어줘라.
                  FROM HR.EMPLOYEES A, HR.DEPARTMENTS B
                  WHERE B.DEPARTMENT_ID = A.DEPARTMENT_ID(+)  -- 지금 A에 NULL 이있음. 출력하면 NULL인 얘 빼고 나옴 ㅜㅜ
                  GROUP BY B.DEPARTMENT_ID, B.DEPARTMENT_NAME --ROLLUP 을 쓰면 사원수 다 더해서 보여줌
                  ORDER BY 1;
                  
                (ANSI 형식)
                SELECT LPAD(NVL(TO_CHAR(B.DEPARTMENT_ID),'없음'),4) AS 부서코드, -- 부서코드가 오른쪽으로 맞춰서 출력=> 숫자    부서명은 왼쪽에 맞춰 출력=> 문자.
                       NVL(B.DEPARTMENT_NAME,'없음') AS 부서명,
                       COUNT(A.EMPLOYEE_ID) AS 사원수
                  FROM HR.EMPLOYEES A
                  FULL OUTER JOIN HR.DEPARTMENTS B ON (B.DEPARTMENT_ID = A.DEPARTMENT_ID)
                  GROUP BY B.DEPARTMENT_ID, B.DEPARTMENT_NAME
                  ORDER BY 1;
                  -- LPAD로 부서코드 이쁘게 정렬해주고 NVL로 NULL 을 없음으로 바꿔 줌. -- 부서코드는 숫자이기때문에 TO_CHAR을 써서 문자로 변경해줘야함.
              
            사용예) 2005년 4월 모든 상품에 대한 판매현황을 조회하시오.
                출력할 내용은 상품코드, 상품명, 판매수량, 판매금액이다.
                SELECT A.PROD_ID AS 상품코드,
                       A.PROD_NAME AS 상품명,
                       NVL(SUM(B.CART_QTY),0) AS 판매수량,
                       NVL(SUM(B.CART_QTY*A.PROD_PRICE),0) AS 판매금액
                  FROM PROD A 
                  LEFT OUTER JOIN CART B ON (A.PROD_ID = B.CART_PROD(+)
                  AND B.CART_NO LIKE '200504%')
                  GROUP BY A.PROD_ID, A.PROD_NAME
                  ORDER BY 1;
                  
            사용예) 2005년 4~6월 모든 분류별 매입현황을 조회하시오.
                Alias는 분류코드, 분류명, 매입수량, 매입금액
               (일반내부조인)
               SELECT D.LPROD_GU AS 분류코드,
                      D.LPROD_NM AS 분류명,
                      NVL(TBLA.BCNT,0) AS 매입수량,
                      NVL(TBLA.BAMT,0) AS 매입금액
                 FROM (SELECT B.LPROD_GU AS BID,
                              SUM(A.BUY_QTY) AS BCNT,
                              SUM(A.BUY_QTY*C.PROD_COST) AS BAMT
                         FROM BUYPROD A, LPROD B, PROD C
                        WHERE A.BUY_PROD(+) = C.PROD_ID
                          AND C.PROD_LGU(+) = B.LPROD_GU
                          AND BUY_DATE BETWEEN TO_DATE('20050401') AND TO_DATE('20050630')
                        GROUP BY B.LPROD_GU, B.LPROD_NM) TBLA,
                                 LPROD D
                  WHERE D.LPROD_GU = TBLA.BID(+) -- BID는 6개 밖에않되니까 확장해줘야함 그래야 3개 더들어감.
                       ORDER BY 1;
    
              (일반외부조인)
              SELECT B.LPROD_GU AS 분류코드,-- LPROD가 더 다양하게 분류코드가 있으므로 B.LPROD_ID를 써야함.
                     B.LPROD_NM AS 분류별,
                     SUM(A.BUY_QTY) AS 매입수량,
                     SUM(A.BUY_QTY*C.PROD_COST) AS 매입금액
                FROM BUYPROD A, LPROD B, PROD C  -- 매입테이블에 원래 매입단가 표시안함. 지금 데이터설계가 잘못된 거임.
               WHERE A.BUY_PROD(+) = C.PROD_ID -- PROD_ID 가 더 많기때문에 BUY_PROD에 (+)를 붙여줘야함.
                 AND C.PROD_LGU(+) = B.LPROD_GU
                 AND BUY_DATE BETWEEN TO_DATE('20050401') AND TO_DATE('20050630')
               GROUP BY B.LPROD_GU, B.LPROD_NM
               ORDER BY 1;
                -- ANSI나 서브쿼리를 써야함.
     
             (ANSI 외부조인)
             SELECT B.LPROD_GU AS 분류코드,
                    B.LPROD_NM AS 분류별,
                    NVL(SUM(A.BUY_QTY),0) AS 매입수량,
                    NVL(SUM(A.BUY_QTY*C.PROD_COST),0) AS 매입금액
               FROM BUYPROD A
         --   RIGHT OUTER JOIN LPROD B ON.. 직접적으로 조인할 수 있는 조건이 없음. 그렇기 때문에 PROD를 먼저 써야함.
              RIGHT OUTER JOIN PROD C ON (A.BUY_PROD = C.PROD_ID AND A.BUY_DATE BETWEEN TO_DATE('20050401') AND TO_DATE('20050630'))
              RIGHT OUTER JOIN LPROD B ON (B.LPROD_GU = C.PROD_LGU)
              GROUP BY B.LPROD_GU, B.LPROD_NM
              ORDER BY 1;
     
            사용예) 2005년 4월~6월 모든 분류별 매출현황을 조회하시오.
                Alias는 분류코드, 분류명, 매출수량, 매출금액
                (ANSI외부조인)
                SELECT B.LPROD_GU AS 분류코드,
                       B.LPROD_NM AS 분류명,
                       NVL(SUM(A.CART_QTY),0) AS 매출수량,
                       NVL(SUM(A.CART_QTY*C.PROD_PRICE),0) AS 매출금액
                  FROM CART A
                 RIGHT OUTER JOIN PROD C ON (A.CART_PROD = C.PROD_ID AND SUBSTR(A.CART_NO,1,6) BETWEEN '200504' AND '200506')
                 RIGHT OUTER JOIN LPROD B ON (B.LPROD_GU = C.PROD_LGU)
                 GROUP BY B.LPROD_GU, B.LPROD_NM
                 ORDER BY 1;
                 
            사용예) 2005년 4~6월 모든 분류별 매입/매출현황을 조회하시오.
                Alias는 분류코드, 분류명, 매입수량, 매입금액, 매출수량, 매출금액
                SELECT A.LPROD_GU AS 분류코드,
                       A.LPROD_NM AS 분류명,
                      NVL(SUM(B.BUY_QTY),0) AS 매입수량,
                      NVL(SUM(B.BUY_QTY*D.PROD_COST),0) AS 매입금액,
                      NVL(SUM(C.CART_QTY),0) AS 매출수량,
                      NVL(SUM(C.CART_QTY*D.PROD_PRICE),0) AS 매출금액
                  FROM LPROD A
                  LEFT OUTER JOIN PROD D ON (A.LPROD_GU = D.PROD_LGU)
                  LEFT OUTER JOIN BUYPROD B ON (B.BUY_PROD = D.PROD_ID AND B.BUY_DATE BETWEEN TO_DATE('20050401') AND TO_DATE('20050630'))
                  LEFT OUTER JOIN CART C ON (D.PROD_ID = C.CART_PROD AND SUBSTR(C.CART_NO,1,6) BETWEEN '200504' AND '200506')
                  GROUP BY A.LPROD_GU, A.LPROD_NM
                  ORDER BY 1;
                  
                  --서브쿼리로 만들어서 해보기.
            SELECT
                  
              FROM 
              (SELECT B.LPROD_GU AS 분류코드
                          NVL(SUM(BUY_QTY),0) AS 매입수량
                          NVL(SUM(BUY_QTY*PROD_COST),0) AS 매입금액
                     FROM BUYPROD A
                    RIGHT OUTER JOIN PROD C ON (A.BUY_PROD = C.PROD_ID AND A.BUY_DATE BETWEEN TO_DATE('20050401') AND TO_DATE('20050630'))
                    RIGHT OUTER JOIN LPROD B ON (B.LPROD_GU = C.PROD_LGU)
                    GROUP BY B.LPROD_GU) BB,
                    (SELECT B.LPROD_GU AS 분류코드
                            NVL(SUM(CART_QTY),) AS 매출수량
                            NVL(SUM(CART_QTY*PROD_PRICE),0) AS 매출금액
                       FROM CART A
                      RIGHT OUTER JOIN PROD C ON (A.CART_PROD = C.PROD_ID AND SUBSTR(A.CART_NO,1,6) BETWEEN '200504' AND '200506')
                      RIGHT OUTER JOIN LPROD B ON (B.LPROD_GU = C.PROD_LGU)
                      GROUP BY B.LPROD_GU) CC
                      --미완성임 위에
                      
            사용예) 2005년 4-6월 모든 상품별 매입현황/매출현황
                Alias는 상품코드, 상품명, 매입수량, 매입금액, 매출수량, 매출금액
                SELECT A.PROD_ID AS 상품코드,
                       A.PROD_NAME AS 상품명,
                       NVL(SUM(B.BUY_QTY),0) AS 매입수량,
                       NVL(SUM(B.BUY_QTY*A.PROD_COST),0) AS 매입금액,
                       NVL(SUM(C.CART_QTY),0) AS 매출수량,
                       NVL(SUM(C.CART_QTY*A.PROD_PRICE),0) AS 매출금액
                  FROM PROD A
                  LEFT OUTER JOIN BUYPROD B ON (A.PROD_ID = B.BUY_PROD AND BUY_DATE BETWEEN TO_DATE('20050401') AND TO_DATE('20050630'))
                  LEFT OUTER JOIN CART C ON (A.PROD_ID = C.CART_PROD AND SUBSTR(C.CART_NO,1,6) BETWEEN '200504' AND '200506')
                  GROUP BY A.PROD_ID, A.PROD_NAME
                  ORDER BY 1;