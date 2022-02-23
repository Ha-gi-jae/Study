2021_0726
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