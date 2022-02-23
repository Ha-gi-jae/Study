2021_0729
    4) MINUS
        - MINUS 연산자 앞에 위치한 쿼리의 결과에서 MINUS 뒤에 기술된 쿼리의 결과를 차감한 결과 반환
        
        사용예) 장바구니테이블에서 4월과 5월에 판매된 상품 중 4월만 판매된 상품의 상품번호, 상품명, 수량합계, 판매금액합계를 구하시오.
            SELECT DISTINCT A.CART_PROD AS 상품번호,
                   B.PROD_NAME AS 상품명
              FROM CART A, PROD B
             WHERE A.CART_PROD = B.PROD_ID
               AND A.CART_NO LIKE '200504%'
           MINUS
             SELECT DISTINCT A.CART_PROD AS 상품번호,
                   B.PROD_NAME AS 상품명
              FROM CART A, PROD B
             WHERE A.CART_PROD = B.PROD_ID
               AND A.CART_NO LIKE '200505%'
