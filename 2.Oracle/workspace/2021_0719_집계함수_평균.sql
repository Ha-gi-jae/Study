2021_0719
문제) 사원테이블에서 근무국가별 급여합계를 구하시오
    SELECT D.COUNTRY_ID AS 근무국가코드,
           D.COUNTRY_NAME AS 국가명,
           TO_CHAR(SUM(A.SALARY), '999,990') AS 급여합계
        FROM HR.EMPLOYEES A, HR.DEPARTMENTS B, HR.LOCATIONS C, HR.COUNTRIES D
       WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
         AND B.LOCATION_ID = C.LOCATION_ID
         AND C.COUNTRY_ID = D.COUNTRY_ID
       GROUP BY D.COUNTRY_ID, D.COUNTRY_NAME;

       -- 의미없지만 형식을 맞춰주기위해서 써주어야함 GROUP BY 절에 (D.COUNTRY_NAME)
       
사용예) 사원테이블에서 각 부서별 보너스 합계를 구하시오.
        출력은 부서코드, 부서명, 보너스 합계이고, 보너스는 영업실적(COMMISSION_PCT)과 급여를 곱한결과의 30%를 지급한다.
            
        UPDATE HR.EMPLOYEES
            SET COMMISSION_PCT = 0.2
            WHERE EMPLOYEE_ID = 107;
            COMMIT;

        SELECT A.DEPARTMENT_ID AS 부서코드,
               B.DEPARTMENT_NAME AS 부서명,
               NVL(SUM(A.COMMISSION_PCT * A.SALARY) * 0.3,0) AS "보너스 합계"
            FROM HR.EMPLOYEES A, HR.DEPARTMENTS B
            WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
            GROUP BY A.DEPARTMENT_ID, B.DEPARTMENT_NAME
            ORDER BY 1;
            -- WHERE에 DEPARTMENT ID가 같아야 부서명을 가져올 수 있음.
            
            
            
  2.AVG(expr)
   - 'expr'로 정의된 컬럼이나 수식의 값에 대한 산술평균 값을 반환
   
    사용예) 모든 여성회원들의 평균 마일리지를 조회하시오.
        SELECT ROUND(AVG(MEM_MILEAGE)) AS "평균 마일리지"
            FROM MEMBER
            WHERE SUBSTR(MEM_REGNO2,1,1) IN('2','4');
    
    사용예)회원들의 성별 평균 마일리지를 조회하시오.
        SELECT CASE WHEN SUBSTR(MEM_REGNO2,1,1) = '2'
                      OR SUBSTR (MEM_REGNO2,1,1) = '4' THEN
                        '여성회원'
                    ELSE '남성회원' END AS 구분,
               ROUND(AVG(MEM_MILEAGE)) AS "평균 마일리지"
            FROM MEMBER
            GROUP BY CASE WHEN SUBSTR(MEM_REGNO2,1,1) = '2'
                      OR SUBSTR (MEM_REGNO2,1,1) = '4' THEN
                        '여성회원'
                    ELSE '남성회원' END;
            --SUBSTR(MEM_REGNO2,1,1) 만 쓰면 1, 2, 3, 4로 나눈걸로.
            
    사용예) 사원테이블에서 각 부서별 평균급여를 조회하시오.
        SELECT B.DEPARTMENT_ID AS 부서코드,
               B.DEPARTMENT_NAME AS 부서별,
               ROUND(AVG(A.SALARY)) AS 평균급여
            FROM HR.EMPLOYEES A, HR.DEPARTMENTS B
            WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
            GROUP BY B.DEPARTMENT_ID, B.DEPARTMENT_NAME
            ORDER BY 1;
            
    사용예) 2005년 1~6월 월별 평균 매입액을 조회하시오.
        SELECT  EXTRACT(YEAR FROM BUY_DATE)||'년'||
                EXTRACT(MONTH FROM BUY_DATE)||'월' AS 구분,
                ROUND(AVG(BUY_QTY*BUY_COST)) AS "평균 매입액"
          FROM BUYPROD
          WHERE BUY_DATE BETWEEN TO_DATE('20050101') AND LAST_DAY(TO_DATE('20050601'))
          GROUP BY EXTRACT(YEAR FROM BUY_DATE)||'년'||
                EXTRACT(MONTH FROM BUY_DATE)||'월';
        --위 내가한거 밑 교수님이 하신거.  
          SELECT EXTRACT(MONTH FROM BUY_DATE)||'월' AS 월,
                          ROUND(AVG(BUY_QTY*BUY_COST)) AS "평균 매입액"
                       FROM BUYPROD
                       WHERE BUY_DATE BETWEEN TO_DATE('20050101') AND TO_DATE('20050630')
                       GROUP BY EXTRACT(MONTH FROM BUY_DATE)
                       ORDER BY 1;
                       
    사용예) 2005년 1월~6월 월별 평균 매입액과 매입액합을 조회하되 매입액이 400만원이상인 월만 조회하시오.
            SELECT EXTRACT(MONTH FROM BUY_DATE)||'월' AS 월,
                   COUNT(*) AS 매입건수,
                   ROUND(AVG(BUY_QTY*BUY_COST)) AS "평균 매입액",
                   SUM(BUY_QTY*BUY_COST) AS 매입액합
                FROM BUYPROD
                WHERE BUY_DATE BETWEEN TO_DATE('20050101') AND TO_DATE('20050630')
                GROUP BY EXTRACT(MONTH FROM BUY_DATE)
                HAVING AVG(BUY_QTY*BUY_COST) >= '4000000'
                ORDER BY 1;
          -- 조건을 HAVING절에 기술해야함.
     
     사용예) 2005년 분류별 평균구매금액을 조회하시오
        SELECT B.LPROD_GU AS 분류코드,
               B.LPROD_NM AS 분류명,
               ROUND(AVG(A.CART_QTY*C.PROD_PRICE)) AS 평균구매금액
            FROM CART A, LPROD B, PROD C
            WHERE B.LPROD_GU = C.PROD_LGU
              AND A.CART_PROD = C.PROD_ID
              AND SUBSTR(A.CART_NO,1,4) = '2005'
            GROUP BY B.LPROD_GU, B.LPROD_NM
            ORDER BY 1;
            
     사용예) 2005년 회원의 연령대별 평균구매금액을 조회하시오.   
        SELECT TRUNC((EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM A.MEM_BIR))/10)*10||'대' AS 회원연령대, 
               ROUND(AVG(B.CART_QTY*C.PROD_PRICE)) AS 평균구매금액
            FROM MEMBER A, CART B, PROD C
            WHERE A.MEM_ID = B.CART_MEMBER
              AND B.CART_PROD = C.PROD_ID
              AND B.CART_NO LIKE '2005%'
            GROUP BY TRUNC((EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM A.MEM_BIR))/10)*10
            ORDER BY 1;
            
    과제) 사원들 중 해당사원이 속한 부서의 평균 급여보다 적은 급여를 받는 직원정보를 조회하시오
    
            Alias는 사원번호, 사원명, 부서번호, 부서명, 급여, 부서평균급여
        SELECT A.EMPLOYEE_ID AS 사원번호,
               A.EMP_NAME AS 사원명,
               B.DEPARTMENT_ID AS 부서번호, 
               B.DEPARTMENT_NAME AS 부서명,
               A.SALARY AS 급여,
               AVG(SALARY) AS 부서평균급여
            FROM HR.EMPLOYEES A, HR.DEPARTMENTS B
            WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
             
                

    3. COUNT(Column명|*)
        - 그룹내의 행의 수(자료의 갯수)를 변환
        - 외부조인연산에 사용되는 경우 '*'를 사용하면 부정확한 결과를 반환하기 때문에
          해당 테이블의 컬럼명을 기술해야 함
          
          사용예) 사원테이블에서 각 부서별 사원수를 조회하시오.
              SELECT DEPARTMENT_ID AS 부서코드,
                     COUNT(*) AS 사원수1,
                     COUNT(LAST_NAME) AS 사원수2
                  FROM HR.EMPLOYEES
                  GROUP BY DEPARTMENT_ID
                  ORDER BY 1;
                  
          사용예) 2005년 5월 분류별 판매건수를 조회하시오.
              SELECT B.PROD_LGU AS 분류,
                     COUNT(CART_QTY) AS 판매건수
                  FROM CART A, PROD B
                  WHERE A.CART_PROD = B.PROD_ID
                    AND A.CART_NO LIKE '200505%'
                  GROUP BY B.PROD_LGU
                  ORDER BY 1;
                  
          사용예) 2005년 5-6월 회원별 매입횟수를 조회하시오
            Alias는 회원번호, 매입횟수
            SELECT A.CID AS 회원번호,
                   COUNT(*) AS 매입횟수
                FROM (SELECT DISTINCT CART_NO AS CNO,
                                  CART_MEMBER AS CID
                          FROM CART
                          WHERE SUBSTR(CART_NO,1,6) IN ('200505','200506')
                          ORDER BY 2) A
                GROUP BY A.CID
                ORDER BY 1;
                
          사용예) 모든 부서별 사원수를 조회하시오. (NULL 부서코드는 무시)
              SELECT B.DEPARTMENT_ID AS 부서코드, --외부조인 할때는 값이 많은쪽을 써야함. HR.EMPLOYEES의 DEPARTMENT랑 HR.DEPARTMENTS DEPARTMENT 비교해보면된다.
                     B.DEPARTMENT_NAME AS 부서명,   -- 그렇지않으면 NULL 뜸.
                     COUNT(JOB_ID) AS 사원수1
                  FROM HR.EMPLOYEES A, HR.DEPARTMENTS B
                  WHERE A.DEPARTMENT_ID(+)= B.DEPARTMENT_ID   -- (+) 외부조인 연산자
                  GROUP BY B.DEPARTMENT_ID, B.DEPARTMENT_NAME
                  ORDER BY 1; 
                  --카운트에 NULL 값이 들어가서 1로 표시된것임. *를 써서.  외부 조인 이 기 때 문 에 !
                  
                      (4) MAX(Column명), MIN(Column명)
            - MAX : 주어진 컬럼명 중 최대 값을 반환
            - MIN : 주어진 컬럼명 중 최소 값을 반환
            - 집계함수는 다른 집계함수를 포함 할 수 없다.
                사용예) 2005년 월별 매입액 중 최대 매입제품과 최소 매입제품의 상품코드, 상품명, 최대매입액, 최소매입액
                    SELECT EXTRACT(MONTH FROM BUY_DATE)||'월' AS 월,
                           MAX(BUY_QTY*BUY_COST) AS 최대매입액,
                           MIN(BUY_QTY*BUY_COST) AS 최소매입액
                        FROM BUYPROD
                        WHERE BUY_DATE LIKE '2005%' -- EXTRACT(MONTH FROM BUY_DATE) = 2005
                        GROUP BY  EXTRACT(MONTH FROM BUY_DATE)
                        ORDER BY 1;
                        
                사용예) 2005년 5월 최대구매 고객정보를 조회하시오.
                    Alias는 회원번호, 회원명, 구매금액
                    SELECT A.CART_MEMBER AS 회원번호,
                           C.MEM_NAME AS 회원명,
                           SUM(A.CART_QTY* B .PROD_PRICE) AS 구매금액 -- SUM 앞에 MAX가 올 수 없음.
                        FROM CART A, PROD B, MEMBER C
                        WHERE A.CART_MEMBER = C.MEM_ID
                          AND A.CART_PROD = B.PROD_ID
                          AND A.CART_NO LIKE '200505%'
                        GROUP BY A.CART_MEMBER, C.MEM_NAME
                        ORDER BY 3 DESC;
                
                (SUBQUERY)
            SELECT D.MID AS 회원번호,
                   D.MNAME AS 회원명,
                   E.MEM_ADD1||' '||MEM_ADD2 AS 주소,
                   E.MEM_HP AS 연락처,
                   D.AMT AS 구매금액                        --  D.AMT 앞에는 max를 쓸 수 있긴한데 그룹 바이가 2번나와야하니 비효율적
                FROM (SELECT A.CART_MEMBER AS MID,
                             C.MEM_NAME AS MNAME,
                             SUM(A.CART_QTY* B .PROD_PRICE) AS AMT
                          FROM CART A, PROD B, MEMBER C
                          WHERE A.CART_MEMBER = C.MEM_ID
                            AND A.CART_PROD = B.PROD_ID
                            AND A.CART_NO LIKE '200505%'
                          GROUP BY A.CART_MEMBER, C.MEM_NAME
                          ORDER BY 3 DESC) D, MEMBER E
                WHERE D.MID = E.MEM_ID
                  AND ROWNUM = 1;
                  --안쪽과 바깥쪽 별칭 겹쳐도 상관은 없음. 어짜피 다 처리되고 사라짐.