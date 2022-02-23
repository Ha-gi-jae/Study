2021_0726
��뿹) 2005�� 4~6�� ��� �з��� ������Ȳ�� ��ȸ�Ͻÿ�.
                Alias�� �з��ڵ�, �з���, ���Լ���, ���Աݾ�
               (�Ϲݳ�������)
               SELECT D.LPROD_GU AS �з��ڵ�,
                      D.LPROD_NM AS �з���,
                      NVL(TBLA.BCNT,0) AS ���Լ���,
                      NVL(TBLA.BAMT,0) AS ���Աݾ�
                 FROM (SELECT B.LPROD_GU AS BID,
                              SUM(A.BUY_QTY) AS BCNT,
                              SUM(A.BUY_QTY*C.PROD_COST) AS BAMT
                         FROM BUYPROD A, LPROD B, PROD C
                        WHERE A.BUY_PROD(+) = C.PROD_ID
                          AND C.PROD_LGU(+) = B.LPROD_GU
                          AND BUY_DATE BETWEEN TO_DATE('20050401') AND TO_DATE('20050630')
                        GROUP BY B.LPROD_GU, B.LPROD_NM) TBLA,
                                 LPROD D
                  WHERE D.LPROD_GU = TBLA.BID(+) -- BID�� 6�� �ۿ��ʵǴϱ� Ȯ��������� �׷��� 3�� ����.
                       ORDER BY 1;
    
              (�Ϲݿܺ�����)
              SELECT B.LPROD_GU AS �з��ڵ�,-- LPROD�� �� �پ��ϰ� �з��ڵ尡 �����Ƿ� B.LPROD_ID�� �����.
                     B.LPROD_NM AS �з���,
                     SUM(A.BUY_QTY) AS ���Լ���,
                     SUM(A.BUY_QTY*C.PROD_COST) AS ���Աݾ�
                FROM BUYPROD A, LPROD B, PROD C  -- �������̺� ���� ���Դܰ� ǥ�þ���. ���� �����ͼ��谡 �߸��� ����.
               WHERE A.BUY_PROD(+) = C.PROD_ID -- PROD_ID �� �� ���⶧���� BUY_PROD�� (+)�� �ٿ������.
                 AND C.PROD_LGU(+) = B.LPROD_GU
                 AND BUY_DATE BETWEEN TO_DATE('20050401') AND TO_DATE('20050630')
               GROUP BY B.LPROD_GU, B.LPROD_NM
               ORDER BY 1;
                -- ANSI�� ���������� �����.
     
             (ANSI �ܺ�����)
             SELECT B.LPROD_GU AS �з��ڵ�,
                    B.LPROD_NM AS �з���,
                    NVL(SUM(A.BUY_QTY),0) AS ���Լ���,
                    NVL(SUM(A.BUY_QTY*C.PROD_COST),0) AS ���Աݾ�
               FROM BUYPROD A
         --   RIGHT OUTER JOIN LPROD B ON.. ���������� ������ �� �ִ� ������ ����. �׷��� ������ PROD�� ���� �����.
              RIGHT OUTER JOIN PROD C ON (A.BUY_PROD = C.PROD_ID AND A.BUY_DATE BETWEEN TO_DATE('20050401') AND TO_DATE('20050630'))
              RIGHT OUTER JOIN LPROD B ON (B.LPROD_GU = C.PROD_LGU)
              GROUP BY B.LPROD_GU, B.LPROD_NM
              ORDER BY 1;
     
            ��뿹) 2005�� 4��~6�� ��� �з��� ������Ȳ�� ��ȸ�Ͻÿ�.
                Alias�� �з��ڵ�, �з���, �������, ����ݾ�
                (ANSI�ܺ�����)
                SELECT B.LPROD_GU AS �з��ڵ�,
                       B.LPROD_NM AS �з���,
                       NVL(SUM(A.CART_QTY),0) AS �������,
                       NVL(SUM(A.CART_QTY*C.PROD_PRICE),0) AS ����ݾ�
                  FROM CART A
                 RIGHT OUTER JOIN PROD C ON (A.CART_PROD = C.PROD_ID AND SUBSTR(A.CART_NO,1,6) BETWEEN '200504' AND '200506')
                 RIGHT OUTER JOIN LPROD B ON (B.LPROD_GU = C.PROD_LGU)
                 GROUP BY B.LPROD_GU, B.LPROD_NM
                 ORDER BY 1;
                 
            ��뿹) 2005�� 4~6�� ��� �з��� ����/������Ȳ�� ��ȸ�Ͻÿ�.
                Alias�� �з��ڵ�, �з���, ���Լ���, ���Աݾ�, �������, ����ݾ�
                SELECT A.LPROD_GU AS �з��ڵ�,
                       A.LPROD_NM AS �з���,
                      NVL(SUM(B.BUY_QTY),0) AS ���Լ���,
                      NVL(SUM(B.BUY_QTY*D.PROD_COST),0) AS ���Աݾ�,
                      NVL(SUM(C.CART_QTY),0) AS �������,
                      NVL(SUM(C.CART_QTY*D.PROD_PRICE),0) AS ����ݾ�
                  FROM LPROD A
                  LEFT OUTER JOIN PROD D ON (A.LPROD_GU = D.PROD_LGU)
                  LEFT OUTER JOIN BUYPROD B ON (B.BUY_PROD = D.PROD_ID AND B.BUY_DATE BETWEEN TO_DATE('20050401') AND TO_DATE('20050630'))
                  LEFT OUTER JOIN CART C ON (D.PROD_ID = C.CART_PROD AND SUBSTR(C.CART_NO,1,6) BETWEEN '200504' AND '200506')
                  GROUP BY A.LPROD_GU, A.LPROD_NM
                  ORDER BY 1;
                  
                  --���������� ���� �غ���.
            SELECT
                  
              FROM 
              (SELECT B.LPROD_GU AS �з��ڵ�
                          NVL(SUM(BUY_QTY),0) AS ���Լ���
                          NVL(SUM(BUY_QTY*PROD_COST),0) AS ���Աݾ�
                     FROM BUYPROD A
                    RIGHT OUTER JOIN PROD C ON (A.BUY_PROD = C.PROD_ID AND A.BUY_DATE BETWEEN TO_DATE('20050401') AND TO_DATE('20050630'))
                    RIGHT OUTER JOIN LPROD B ON (B.LPROD_GU = C.PROD_LGU)
                    GROUP BY B.LPROD_GU) BB,
                    (SELECT B.LPROD_GU AS �з��ڵ�
                            NVL(SUM(CART_QTY),) AS �������
                            NVL(SUM(CART_QTY*PROD_PRICE),0) AS ����ݾ�
                       FROM CART A
                      RIGHT OUTER JOIN PROD C ON (A.CART_PROD = C.PROD_ID AND SUBSTR(A.CART_NO,1,6) BETWEEN '200504' AND '200506')
                      RIGHT OUTER JOIN LPROD B ON (B.LPROD_GU = C.PROD_LGU)
                      GROUP BY B.LPROD_GU) CC
                      --�̿ϼ��� ����
                      
            ��뿹) 2005�� 4-6�� ��� ��ǰ�� ������Ȳ/������Ȳ
                Alias�� ��ǰ�ڵ�, ��ǰ��, ���Լ���, ���Աݾ�, �������, ����ݾ�
                SELECT A.PROD_ID AS ��ǰ�ڵ�,
                       A.PROD_NAME AS ��ǰ��,
                       NVL(SUM(B.BUY_QTY),0) AS ���Լ���,
                       NVL(SUM(B.BUY_QTY*A.PROD_COST),0) AS ���Աݾ�,
                       NVL(SUM(C.CART_QTY),0) AS �������,
                       NVL(SUM(C.CART_QTY*A.PROD_PRICE),0) AS ����ݾ�
                  FROM PROD A
                  LEFT OUTER JOIN BUYPROD B ON (A.PROD_ID = B.BUY_PROD AND BUY_DATE BETWEEN TO_DATE('20050401') AND TO_DATE('20050630'))
                  LEFT OUTER JOIN CART C ON (A.PROD_ID = C.CART_PROD AND SUBSTR(C.CART_NO,1,6) BETWEEN '200504' AND '200506')
                  GROUP BY A.PROD_ID, A.PROD_NAME
                  ORDER BY 1;