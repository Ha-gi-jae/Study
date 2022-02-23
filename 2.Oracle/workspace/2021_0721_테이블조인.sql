2021_0721
1. 테이블 조인
    - 관계형 데이터 베이스의 핵심 기능
    - 복수개의 테이블에 분산된 자료를 조회하기 위함
    - 테이블 사이에 관계(Relationship)가 맺어져 있어야 함
        - 구분
            - 일반 조인 / ANSI JOIN
                - 일반조인 : CARTESIAN PRODUCT, EQUI JOIN, NON EQUI JOIN, SELF JOIN, OUTER JOIN
                - ANSI JOIN : CROSS JOIN, NATURAL JOIN, INNER JOIN, OUTER JOIN
            - 내부조인 / 외부조인
             
    1) CARTESIAN PRODUCT
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
               
    2) EQUI-JOIN
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
            SELECT A.EMPLOYEE_ID AS 사원번호,
                   A.EMP_NAME AS 사원명,
                   B.DEPARTMENT_NAME AS 부서명,
                   C.JOB_TITLE AS 직무명
                FROM HR.EMPLOYEES A, HR.DEPARTMENTS B, HR.JOBS C
                WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
                   AND A.JOB_ID = C.JOB_ID
                   AND B.MANAGER_ID LIKE 121
                ORDER BY 1;
            
            SELECT A.EMPLOYEE_ID AS 사원번호,
                   A.EMP_NAME AS 사원명,
                   B.DEPARTMENT_NAME AS 부서명,
                   C.JOB_TITLE AS 직무명
                FROM HR.EMPLOYEES A
                INNER JOIN HR.DEPARTMENTS B ON A.DEPARTMENT_ID = B.DEPARTMENT_ID
                INNER JOIN HR.JOBS C ON A.JOB_ID = C.JOB_ID
                WHERE B.MANAGER_ID LIKE 121
                ORDER BY 1;