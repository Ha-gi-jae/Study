2021_0722)
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