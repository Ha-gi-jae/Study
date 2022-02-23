2021_0709)
 1) 기타연산자
   (1) IN
       주어진 값 중 어느 하나와 일치하면 TRUE를 반환
       OR 연산자로 치환 가능
       NOT 연산자와 함께 사용 가능함
    (사용형식)
     expr IN(값1,[값2,...])
     -- expr = 컬럼명이나 수식이 될 수 있음.     
     -- 범위가 불규칙적이거나 연속적이지 않을 경우 이용. ex) 10 70 110 130 OR IN = ANY = SOME 사용
**사원테이블에서 EMP_NAME VARCHAR2(80) 컬럼을 추가
    (컬럼 추가)
           ALTER TABLE 테이블명
              ADD(컬럼명 데이터타입[(크기)] [DEFAULT 초기값]
    (컬럼 삭제)
           ALTER TABLE 테이블명
              DROP COLUMN 컬럼명;
    (컬럼이름 변경)
           ALTER TABLE 테이블명
              RENAME COLUMN 원래컬럼명 TO 새로운컬럼명;
    (컬럼타입 변경)
           ALTER TABLE 테이블명
              MODIFY(컬럼명 데이터타입[(크기)] [DEFAULT 초기값)
    
           ALTER TABLE HR.EMPLOYEES
              ADD(EMP_NAME VARCHAR2(80)); 
           COMMIT;
           
**FIRST_NAME과 LAST_NAME의 값을 EMP_NAME에 저장 --이미 존재하므로 UPDATE 를 써야함.
    UPDATE HR.EMPLOYEES
        SET EMP_NAME = FIRST_NAME||' '||LAST_NAME;
    COMMIT;
사용예) 사원테이블에서 10, 30, 40, 60번 부서에 속한 사원들의 사원번호, 사원명, 부서코드, 입사일을 조회하시오.
        (OR 연산자 사용)
        SELECT EMPLOYEE_ID AS 사원번호,
               EMP_NAME AS 사원명,
               DEPARTMENT_ID AS 부서코드,
               HIRE_DATE AS 입사일
        FROM HR.EMPLOYEES
         WHERE DEPARTMENT_ID = 10
            OR DEPARTMENT_ID = 30
            OR DEPARTMENT_ID = 40
            OR DEPARTMENT_ID = 60
         ORDER BY 3;
-- OR 연산자를 쓸 때 컬럼을 다 써줘야함. 생략 불가.  

        (IN 연산자 사용)
        SELECT EMPLOYEE_ID AS 사원번호,
               EMP_NAME AS 사원명,
               DEPARTMENT_ID AS 부서코드,
               HIRE_DATE AS 입사일
        FROM HR.EMPLOYEES
         WHERE DEPARTMENT_ID IN(10,30,40,60)
         ORDER BY 3;
        
        (ANY(SOME) 연산자 사용)
        SELECT EMPLOYEE_ID AS 사원번호,
               EMP_NAME AS 사원명,
               DEPARTMENT_ID AS 부서코드,
               HIRE_DATE AS 입사일
        FROM HR.EMPLOYEES
         WHERE DEPARTMENT_ID =ANY(10,30,40,60)
         WHERE DEPARTMENT_ID =SOME(10,30,40,60)
         ORDER BY 3;
        
    (2)ALL
       ( )안에 주어진 값들을 모두 만족해야 결과가 참(TURE)이 됨
       AND로 치환 가능
      (사용형식)
         컬럼명 관계연산자ALL (값1[,값2,...])

사용예) 사원테이블에서 20, 40, 70번 부서에 속한 사원들의 급여보다 급여가 많은 사원의 사원번호, 사원명, 급여, 부서번호를 조회하시오.

    SELECT EMPLOYEE_ID AS 사원번호,
           EMP_NAME AS 사원명,
           SALARY AS 급여,
           DEPARTMENT_ID AS 부서번호
      FROM HR.EMPLOYEES
    WHERE SALARY>ALL(SELECT SALARY
                        FROM HR.EMPLOYEES
                        WHERE DEPARTMENT_ID IN(20,40,70));
                        
    SELECT EMPLOYEE_ID AS 사원번호,
           EMP_NAME AS 사원명,
           SALARY AS 급여,
           DEPARTMENT_ID AS 부서번호
      FROM HR.EMPLOYEES
    WHERE SALARY > (SELECT MAX(SALARY)
                        FROM HR.EMPLOYEES
                        WHERE DEPARTMENT_ID IN(20,40,70));
    
    
    (3)BETWEEN ~ AND
          범위를 지정하여 값을 조회하는 조건문 구성에 사용
          논리 연산자 'AND'로 치환 가능
          범위 지정한 곳의 데이터 타입이 상관 없음
 
 사용예)매입정보테이블(BUYPROD)에서 2005년 3월 매입현황을 출력하시오.
        Alias는 날짜, 제품코드, 매입수량, 매입금액이다.
          (AND 연산자 사용)
     SELECT BUY_DATE AS 날짜,
            BUY_PROD AS 제품코드,
            BUY_QTY AS 매입수량,
            BUY_QTY * BUY_COST AS 매입금액
          FROM BUYPROD
            WHERE BUY_DATE >= TO_DATE('20050301')
              AND BUY_DATE <= LAST_DAY(TO_DATE('20050301'));
              
            (BETWEEN 연산자 사용)
             SELECT BUY_DATE AS 날짜,
                      BUY_PROD AS 제품코드,
                      BUY_QTY AS 매입수량,
                      BUY_QTY * BUY_COST AS 매입금액
          FROM BUYPROD
            WHERE BUY_DATE BETWEEN TO_DATE('20050301') AND LAST_DAY(TO_DATE('20050301'));
            
사용예)회원테이블에서 40대 회원의 회원번호, 회원명, 마일리지를 조회하시오.
        SELECT MEM_ID AS 회원번호,
               MEM_NAME AS 회원명,
               MEM_MILEAGE AS 마일리지
        FROM MEMBER
            WHERE EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM MEM_BIR) BETWEEN 40 AND 49;
            
**회원의 생년월일 컬럼에서 월을 추출하시오.
    SELECT EXTRACT(MONTH FROM MEM_BIR),
     --    SUBSTR(MEM_BIR,5,2) 
     --SUBSTR은 문자열에서 일부를 추출하는것. 즉, 추출 값은 문자열임.
        FROM MEMBER;
**회원테이블에서 이번달에 생일이 있는 회원번호, 회원명을 조회
    SELECT MEM_ID AS 회원번호,
           MEM_NAME AS 회원명
        FROM MEMBER;
           WHERE EXTRACT(MONTH FROM SYSDATE) = EXTRACT (MONTH FROM MEM_BIR);
사용예) 분류코드가 P2로 시작하는 상품에 대하여 2005년 5월 매출실적을 조회하시오.
    상품코드, 상품명, 판매수량, 금액
    
SELECT A.PID AS 상품코드,
       A.PNAME AS 상품명,
       LPROD_GU AS 분류코드,
       LPROD_NM AS 분류명,
       A.QAMT AS 판매수량,
       A.MAMT AS 금액
    FROM LPROD, SELECT CART_PROD AS PID,
                       PROD_NAME AS PNAME,
                       SUM(CART_QTY) AS QAMT,
                       SUM(CART_QTY*PROD_PRICE)  AS MAMT
                  FROM CART, PROD
                 WHERE CART_PROD=PROD_ID
                   AND CART_NO LIKE '200505%'
                   AND PROD_LGU BETWEEN 'P200' AND 'P299'
              GROUP BY CART_PROD, PROD_NAME A,
        PROD
 WHERE PROD_ID=A.PID
    AND PROD_LGU=LPROD_GU
    ORDER BY 1;
    --문자열도 BETWEEN 으로 쓸 수 있다.
-- SYSDATE에서 연도 뽑고 생년월일에서 연도 뽑아서 - 하면 나이가나옴. 그걸 BETWEEN 해서 40 AND 49 하면 나온다.
-- 숫자>날짜>문자 임. '20050301'은 날짜. DATE TYPE // TO_DATE 날짜로 변환 . LAST_DAY()해당하는 N연도 N달의 마지막 일로 변환.
--AUTO CAST 자동으로 변환되는 형
-- 40 <= 나이 < 50
    
    
    
    