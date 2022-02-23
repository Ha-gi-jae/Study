2021_0727
    **재고 수불처리를 위한 테이블을 생성하시오.
    1) 테이블명 : REMAIN
    2) 컬럼명
    -----------------------------------------------------------------
    컬럼명             데이터타입         NULL허용여부        제약사항    
    -----------------------------------------------------------------
    REMAIN_YEAR        CHAR(4)             N.N               FK
    PROD_ID          VARCHAR2(10)          N.N              PK/FK
    REMAIN_J_00       NUMBER(5)                           DEFAULT 0
    REMAIN_I          NUMBER(5)                           DEFAULT 0  
    REMAIN_O          NUMBER(5)                           DEFAULT 0  
    REMAIN_J_99       NUMBER(5)                           DEFAULT 0  
    REMAIN_DATE        DATE
    -----------------------------------------------------------------
    CREATE TABLE REMAIN(
    REMAIN_YEAR  CHAR(4),
    PROD_ID      VARCHAR2(10),
    REMAIN_J_00  NUMBER(5)  DEFAULT 0,
    REMAIN_I     NUMBER(5)  DEFAULT 0, 
    REMAIN_O     NUMBER(5)  DEFAULT 0,
    REMAIN_J_99  NUMBER(5)  DEFAULT 0,  
    REMAIN_DATE  DATE,
    
    CONSTRAINT pk_remain PRIMARY KEY (REMAIN_YEAR,PROD_ID),
    CONSTRAINT fk_remain_prod FOREIGN KEY (PROD_ID)
      REFERENCES PROD(PROD_ID));
      
      4)DML 명령에 서브쿼리 사용
        (1) INSERT 문에 서브쿼리 사용
            - '( )'를 사용하지 않고 서브쿼리 기술
            - INSERT 문의 VALUES절도 생략
            
                사용예) 재고수불테이블(REMAIN)에 PROD 테이블의 자료를 이용하여 기초데이터를 입력하시오.
                년도 : '2005'
                상품코드 : PROD테이블의 상품코드(PROD_ID)
                기초재고수량 : PROD테이블의 PROD_PROPERSTOCK
                입고 및 출고 수량 : 없음
                기말재고수량 : PROD테이블의 PROD_PROPERSTOCK
                날짜 : '2004-12-31'
                
                    INSERT INTO REMAIN(REMAIN_YEAR,PROD_ID,REMAIN_J_00,REMAIN_J_99,REMAIN_DATE)
                      SELECT '2005',PROD_ID,PROD_PROPERSTOCK,PROD_PROPERSTOCK,TO_DATE('20041231')
                        FROM PROD;
                        --SELECT 절에서 제어함. SELECT절의 데이터들이 INSERT 할 항목의 데이터들이다.~~
                        
        (2) UPDATE 문에 서브쿼리 사용
            - 복수개의 컬럼을 갱신하는 경우 '( )'안에 변경할 컬럼을 기술하여 하나의 SET절로 처리
            
                사용예) 2005년 1월 상품별 매입정보를 이용하여 REMAIN테이블을 변경하시오
                    메인쿼리: REMAIN테이블 업데이트   서브쿼리: 2005년 1월달 상품별 매입정보 추출
                    UPDATE REMAIN
                       SET REMAIN_I = (서브쿼리1),
                           REMAIN_J_99 = (서브쿼리2),
                           REMAIN_DATE = TO_DATE('20050131')
                     WHERE 조건
                                  ↓
                    UPDATE REMAIN
                       SET (REMAIN_I, REMAIN_J_99, REMAIN_DATE) = (서브쿼리1)
                     WHERE 조건
                     
            - 서브쿼리: 2005년 1월 상품별 매입정보
                SELECT BUY_PROD,
                       SUM(BUY_QTY)
                  FROM BUYPROD
                 WHERE BUY_DATE BETWEEN TO_DATE('20050101') AND TO_DATE('20050131')
                 GROUP BY BUY_PROD;
                 
                 (결합)
                 UPDATE REMAIN B
                    SET (B.REMAIN_I, B.REMAIN_J_99, B.REMAIN_DATE) =
                        (SELECT B.REMAIN_I + A.AMT, B.REMAIN_J_99 + A.AMT, TO_DATE('20050131')
                        FROM (SELECT BUY_PROD AS BID,
                                     SUM(BUY_QTY) AS AMT
                                FROM BUYPROD
                               WHERE BUY_DATE BETWEEN TO_DATE('20050101') AND TO_DATE('20050131')
                               GROUP BY BUY_PROD) A
                       WHERE B.PROD_ID = A.BID)        
                  WHERE B.REMAIN_YEAR = '2005'
                    AND B.PROD_ID IN (SELECT DISTINCT BUY_PROD AS BID
                                       FROM BUYPROD
                                      WHERE BUY_DATE BETWEEN TO_DATE('20050101')
                                            AND TO_DATE('20050131'));
                
    (3) DELETE 문에 서브쿼리 사용
                - WHERE 조건절에 IN이나 EXISTS 연산자를 사용하여 삭제할 자료를 좀 더 세밀하게 선택 할 수 있음
            
                    사용예) 장바구니테이블에서 2005년 5월 회원번호가 'P001'인 자료를 삭제하시오.
                        서브쿼리: 2005년 5월달 회원번호가 p001 인 자료 조회
                        SELECT CART_MEMBER,
                               MEM_NAME 
                         FROM CART A, MEMBER B
                         WHERE A.CART_MEMBER = B.MEM_ID
                           AND CART_MEMBER = 'p001'
                           AND A.CART_NO LIKE '200505%';
                           
                        메인쿼리: 서브쿼리의 결과 자료 삭제
                        DELETE CART C
                         WHERE C.CART_MEMBER = 'p001' 
                           AND C.CART_NO LIKE '200505%';
                          
                사용예) 2005년 6월 상품 'P302000001'의 매출자료 중 판매 수량이 5개 이상인 자료만 삭제하시오
                    DELETE CART
                     WHERE CART_NO LIKE '200506%'
                       AND CART_MEMBER = 'P302000001'
                       AND SUM(CART_QTY) >= 5;
                       
                사용예) 2005년 4월 판매자료 중 판매 금액이 5만원 이하의 자료만 삭제하시오.
                    서브쿼리: 2005년 4월 판매자료 중 판매 금액이 5만원 이하의 자료 검색)
                    SELECT CART_PROD,
                           CART_QTY*PROD_PRICE
                      FROM CART, PROD
                     WHERE CART_PROD = PROD_ID
                       AND CART_NO LIKE '200504%';
                       AND CART_QTY * PROD_PRICE <= 50000;
                           
                    메인쿼리: 장바구니테이블에서 자료 삭제
                    DELETE FROM CART A
                     WHERE EXISTS (SELECT 1
                                     FROM PROD
                                    WHERE A.CART_PROD = PROD_ID
                                      AND A.CART_QTY * PROD_PRICE <= 50000)
                       AND A.CART_NO LIKE '200504%';
                       
                사용예) 회원테이블에서 평균마일리지보다 많은 마일리지를 보유한 회원의 회원번호, 회원명, 마일리지를 출력하시오.                      
                    SELECT MEM_ID AS 회원번호,
                               MEM_NAME AS 회원명,
                               MEM_MILEAGE AS 마일리지
                          FROM MEM_MILEAGE >= (SELECT AVG(MEM_MILEAGE)
                                               FROM MEMBER)  
                                               
                사용예) 회원테이블에서 평균마일리지보다 많은 마일리지를 보유한 회원의 회원번호, 회원명 ,마일리지, 평균마일리지를 출력하시오.    
                    SELECT MEM_ID AS 회원번호,
                           MEM_NAME AS 회원명,
                           MEM_MILEAGE AS 마일리지,
                           (SELECT ROUND(AVG(MEM_MILEAGE)) --WHERE 절에서 조건이 참인 수만큼 실행.
                              FROM MEMBER) AS 평균마일리지
                      FROM MEMBER
                     WHERE MEM_MILEAGE >= (SELECT AVG(MEM_MILEAGE) -- 멤버 수 만큼 실행.
                                           FROM MEMBER);
                        --셀렉트 절에서 서브쿼리 쓸 수 있음.   인라인 서브쿼리.
                    (서브쿼리 한번만쓰고 하기)
                    SELECT MEM_ID AS 회원번호,
                           MEM_NAME AS 회원명,
                           MEM_MILEAGE AS 마일리지,
                           A.AMILE AS 평균마일리지
                      FROM MEMBER, (SELECT ROUND(AVG(MEM_MILEAGE)) AS AMILE
                                      FROM MEMBER) A
                     WHERE MEM_MILEAGE >= A.AMILE
                
                사용예) 회원들의 자료에서 성별 평균마일리지를 구하고 자신의 성별 평균마일리지보다 적은 마일리지를 보유한 회원의  2005년 4-6월 구매현황을 조회하시오.
                    Alias는 회원번호, 회원명, 구매금액합계
                    
                    1)회원들의 자료에서 성별 평균마일리지를 구하고 자신의 성별 평균마일리지보다 적은 마일리지를 보유한 회원정보
                        메인쿼리: 회원테이블에서 (서브쿼리)조건을 만족하는 회원정보 출력
                        SELECT MEM_ID, MEM_NAME 
                          FROM MEMBER
                         WHERE MEM_MILEAGE < (서브쿼리) 
                        
                        서브쿼리: 성별 평균 마일리지
                        SELECT TBLA.AMILE
                          FROM (SELECT CASE WHEN SUBSTR(MEM_REGNO2,1,1) = '1' OR SUBSTR(MEM_REGNO2,1,1) = '3' THEN
                                                 '남성회원'
                                       ELSE      '여성회원' END,
                                       ROUND(AVG(MEM_MILEAGE)) AS AMILE
                                  FROM MEMBER
                                 GROUP BY CASE WHEN SUBSTR(MEM_REGNO2,1,1) = '1' OR SUBSTR(MEM_REGNO2,1,1) = '3' THEN
                                                    '남성회원'
                                          ELSE      '여성회원' END) TBLA,MEMBER B
                         WHERE MEM
                         
                        SELECT MEM_ID, MEMNAME
                          FROM (SELECT SUBSTR(MEM_REGNO2,1,1) AS GEN,
                                       AVG(MEM_MILEAGE) AS AMILE
                                  FROM MEMBER
                                  GROUP BY SUBSTR(MEM_REGNO2,1,1) AS GEN
                            
                    2)2005년 4-6월 구매현황 
                        SELECT CART_MEMBER AS 회원번호,
                               TBLB.CNAME AS 회원명,
                               SUM(CART_QTY*PROD_PRICE) AS 구매금액합계
                          FROM CART, PROD, 
                               (SELECT C.MEM_ID AS CID,
                                       C.MEM_NAME AS CNAME, 
                                       B.G1,
                                       C.MEM_MILEAGE,
                                       round(B.AMILE) 
                                  FROM (SELECT A.GEN AS G1,
                                               AVG(A.MEM_MILEAGE) AS AMILE
                                          FROM (SELECT MEM_ID,MEM_NAME,
                                                       CASE WHEN SUBSTR(MEM_REGNO2,1,1)='1' OR SUBSTR(MEM_REGNO2,1,1)='3' THEN
                                                                 '남'
                                                       ELSE
                                                                 '여'
                                                       END AS GEN,
                                                       MEM_MILEAGE
                                                  FROM MEMBER) A
                                                 GROUP BY A.GEN) B ,
                                               (SELECT MEM_ID,MEM_NAME,
                                                       CASE WHEN SUBSTR(MEM_REGNO2,1,1)='1' OR SUBSTR(MEM_REGNO2,1,1)='3' THEN
                                                                 '남'
                                                       ELSE
                                                                 '여'
                                                       END AS GEN,
                                                       MEM_MILEAGE
                                                  FROM MEMBER) C 
                                 WHERE C.GEN=B.G1
                                   AND C.MEM_MILEAGE>=B.AMILE
                                 ORDER BY 3, 4) TBLB
                         WHERE CART_MEMBER=TBLB.CID
                           AND CART_PROD=PROD_ID
                           AND SUBSTR(CART_NO,1,6) BETWEEN '200504' AND '200506'
                         GROUP BY CART_MEMBER,TBLB.CNAME;