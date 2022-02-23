집계함수
    - 주어진자료를 특정 컬럼을 기준으로 그룹으로 나누고 그룹별로 자료에 대한 집계를 반환하는 함수
    - SUM, AVG, COUNT, MIN, MAX
        (사용형식)
            SELECT [컬럼]list], --집계함수 쓸때 SELECT 잘 구성해야함. 안그러면 오류
                   SUM|AVG|MIN|MAX(expr)|COUNT(column|*),
                                :
                FROM 테이블명
                [WHERE 조건]
                [GROUP BY 컬럼명[,컬럼명,...]] -- 쓰지않으면 테이블 전체
                [HAVING 조건]
                [ORDER BY 컬럼명|컬럼인덱스[ASC|DESC][,컬럼명|컬럼인덱스[ASC|DESC],...];
            --불필요하면 작성ㄴ. 필요하면 작성할때 순서 지켜야함. where having 조건이 다름.
        1. SUM(expr)
            - 'expr'로 표현되는 수식 또는 컬럼의 값에 대한 합계를 반환
                사용예) 사원테이블에서 모든 사원의 급여 총액을 구하시오.
                    SELECT SUM(SALARY)
                        FROM HR.EMPLOYEES;                     --EMP_NAME 이름이 겹치지 않는 이상 사원 하나하나가 그룹.
                
                사용예) 사원테이블에서 부서별 급여 합계를 구하시오.        
                    SELECT DEPARTMENT_ID AS 부서코드,
                           SUM(SALARY) AS 급여합계
                        FROM HR.EMPLOYEES
                        GROUP BY DEPARTMENT_ID
                        ORDER BY 1;
                        --조건 없으니 WHERE 생략 부서별로 묶어야하니 GROUP BY SELECT 절에 써논거 복붙해라 그래야 틀렸을때 다 같이 수정해서 찾기 쉬움.
                        -- ORDER BY 부서코드별 정렬시킬거임.
                        
                사용예) 사원테이블에서 부서별 급여 합계를 구하되 합계가 10000이상인 부서만 조회하시오.        
                    SELECT DEPARTMENT_ID AS 부서코드,
                           SUM(SALARY) AS 급여합계
                        FROM HR.EMPLOYEES
--                        WHERE SUM(SALARY)  10000
                        GROUP BY DEPARTMENT_ID
                        HAVING SUM(SALARY) >= 10000
                        ORDER BY 1;
                
                사용예) 2005년 5월 회원별 구매현황(회원번호, 구매수량합계, 구매금액합계)을 조회하시오.
                    SELECT A.CART_MEMBER AS 회원번호,
                           SUM(A.CART_QTY) AS 구매수량합계,
                           SUM(A.CART_QTY*B.PROD_PRICE) AS 구매금액합계
                        FROM CART A, PROD B
                        WHERE A.CART_PROD = B.PROD_ID
                            AND A.CART_NO LIKE '200505%'
                        GROUP BY A.CART_MEMBER;
                        
                사용예) 2005년 월별 회원별 구매현황(월, 회원번호, 구매수량합계, 구매금액합계)을 조회하시오.
                    SELECT SUBSTR(A.CART_NO,5,2) AS 월,
                           A.CART_MEMBER AS 회원번호,
                           SUM(A.CART_QTY) AS 구매수량합계,
                           SUM(A.CART_QTY * B.PROD_PRICE) AS 구매금액합계
                        FROM CART A, PROD B
                        WHERE A.CART_PROD = B.PROD_ID
                            AND SUBSTR(CART_NO,1,4)='2005'
                        GROUP BY SUBSTR(A.CART_NO,5,2),A.CART_MEMBER
                        ORDER BY 1;
                        
                사용예) 회원테이블에서 직업별 마일리지 합계를 구하시오.
                    SELECT MEM_JOB AS 직업별,
                           SUM(MEM_MILEAGE) AS "마일리지 합계" 
                        FROM MEMBER                --회원테이블
                        GROUP BY MEM_JOB           -- 직업별
                        ORDER BY SUM(MEM_MILEAGE); --정렬
                
                문제