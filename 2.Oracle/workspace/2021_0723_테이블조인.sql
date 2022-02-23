2021_0723
(4) SELF JOIN
            - �ϳ��� ���̺� ���� �ٸ� ��Ī�� �ο��Ͽ� �����ϴ� ����
            
            ��뿹) �ŷ�ó '������'�� ������ ����(�����õ�)�� �����ϰ� �ִ� �ŷ�ó ������ ��ȸ�Ͻÿ�.
                Alias�� �ŷ�ó�ڵ�, �ŷ�ó��, �ּ�, ������̴�.
                SELECT B.BUYER_ID AS �ŷ�ó�ڵ�,
                       B.BUYER_NAME AS �ŷ�ó��,
                       B.BUYER_ADD1||' '||B.BUYER_ADD2 AS �ּ�,
                       B.BUYER_CHARGER AS �����
                  FROM BUYER A, BUYER B
                 WHERE A.BUYER_NAME = '������' -- = ���� ����Ǿ �Ϲ������� �������� �ƴ�!
                   AND SUBSTR(A.BUYER_ADD1,1,2) = SUBSTR(B.BUYER_ADD1,1,2);
                  -- A �����ҿ� ���� B �����ҿ� ���� �ּ����� ������ �ִ� �ŷ�ó�� ã������ ���̺�
                  -- �ŷ�ó ������ �̾ƾ� �ϴϱ� B ���̺� �÷��� ���°�.
                  
            ��뿹) �����ȣ 108�� ����� ���� �μ��� ���� ����� �����ȣ, �����, �μ���, �����ڵ带 ��ȸ�Ͻÿ�.
                SELECT B.EMPLOYEE_ID AS �����ȣ,
                       B.EMP_NAME AS �����,
                       C.DEPARTMENT_NAME AS �μ���,
                       B.JOB_ID AS �����ڵ�
                  FROM HR.EMPLOYEES A, HR.EMPLOYEES B, HR.DEPARTMENTS C
                 WHERE A.EMPLOYEE_ID = 108
                   AND A.DEPARTMENT_ID = B.DEPARTMENT_ID
                   AND B.DEPARTMENT_ID = C.DEPARTMENT_ID;
                 
                  --108�� ���� �����ϰ� �� �μ��ڵ�� ���� ��� ����
        (5) �ܺ�����(OUTER JOIN)
            - ���������� ���������� �����ϴ� �����͸� �������� ����� ��ȯ
            - �ܺ������� ���������� �������� ���ϴ� �����͸� �������� ������ ���̺� NULL ������ ä���� ���� �����Ͽ� ���� ����
            - �������ǿ��� ������ �����͸� ������ �ִ� ���̺� ���� ���̸� ������ '(+)'�����ڸ� �߰���
            - ���� ���������� �ܺ������� ����Ǿ�� �ϴ� ��� ��� '(+)'�����ڸ� ����ؾ� ��
            - ���ÿ� �� ���̺� �������� '(+)'�����ڸ� ����� �� ����.
              ��, A, B, C ���̺��� �ܺ����ο� ������ �� A�� �������� B�� Ȯ���԰� ���ÿ� C�� �������� B�� Ȯ�� �� �� ����
              (WHERE A=B(+)AND C=B(+) => ���ȵ�)
            - �Ϲݿܺ������� ��� �Ϲ������� ���Ǹ� �������� ����� ��ȯ(�ذ��� : ASNI �ܺ����� �Ǵ� �������� ���)
            - �ܺ������� ����� ó���ӵ��� ���� ����
            
            (�Ϲ� �ܺ����� �������)
                SELECT �÷�list
                  FROM ���̺��1, ���̺��2[,���̺��3,...]
                 WHERE ���̺��1.�÷���1[(+)]=���̺��2.�÷���[(+)] --���ÿ� ��� �Ұ��� ���� �Ǵ� ������ ���ʸ�! �������� ������ ���� ����!!
                            :
                    ���� ��� ������ �ܺ������� ���ȵ�( WHERE A.COL(+)=B.COL(+) )
            
            (ANSI �ܺ����� �������)
                SELECT �÷�list
                  FROM ���̺��1
                  LEFT|RIGHT|FULL OUTER JOIN ���̺��2 ON (��������1 [AND �Ϲ�����1])
                  LEFT|RIGHT|FULL OUTER JOIN ���̺��3 ON (��������2 [AND �Ϲ�����2])
                                        :
                 [WHERE �Ϲ�����n]
                     - ���̺��1�� ���̺��2�� �ݵ�� ���� ���� �Ұ�
                     - �Ϲ�����1�� ���̺��1 �Ǵ� ���̺��2�� ���ѵ� ����
                     - �Ϲ�����n�� ��ü ���̺� ����Ǵ� �������� ������ ��� ���� �� �� �����
                     - LEFT|RIGHT|FULL : ���̺��1�� ������ ������ �� ���� ��� LEFT,
                                         �ݴ��� ��� RIGHT, ���� ��� ������ ��� FULL ���
                 
            ��뿹) 2005�� 1�� ��� ��ǰ�� ������Ȳ�� ��ȸ�Ͻÿ�. -- ���, ���� ��� ���ľ ������ OUTER JOIN�� ����Ѵ�. ��ǰ�� = GROUP BY
                ����� �÷��� ��ǰ�ڵ�, ��ǰ��, ���Լ���, ���Աݾ��̴�. -- �������� �� �� �ִ°�� ���������� �ض�. ������ ���� NULL�� ����.
                (�Ϲ� �ܺ�����)
                SELECT B.PROD_ID AS ��ǰ�ڵ�,                          --ī���� ���Եȴٸ� * ���� �÷����� �����.
                       B.PROD_NAME AS ��ǰ��,                          --NULL�� �������ϴϱ� NVL 
                       NVL(SUM(A.BUY_QTY),0) AS ���Լ���,
                       NVL(SUM(A.BUY_QTY*B.PROD_COST),0) AS ���Աݾ�
                  FROM BUYPROD A, PROD B
                  WHERE A.BUY_PROD(+) = B.PROD_ID
                    --AND A.BUY_DATE BETWEEN TO_DATE('20050101') AND LAST_DAY(TO_DATE('20050101')) -- �������ΰ���� ��ȯ��.
                  GROUP BY B.PROD_ID, B.PROD_NAME
                  ORDER BY 1;
                  
                (ANSI �ܺ�����)  
                SELECT B.PROD_ID AS ��ǰ�ڵ�,                         
                       B.PROD_NAME AS ��ǰ��,                         
                       NVL(SUM(A.BUY_QTY),0) AS ���Լ���,
                       NVL(SUM(A.BUY_QTY*B.PROD_COST),0) AS ���Աݾ�
                  FROM BUYPROD A
                  RIGHT OUTER JOIN PROD B ON (A.BUY_PROD(+) = B.PROD_ID)
                  --WHERE A.BUY_DATE BETWEEN TO_DATE('20050101') AND LAST_DAY(TO_DATE('20050101')) -- �������ΰ�� ��ȯ
                  GROUP BY B.PROD_ID, B.PROD_NAME
                  ORDER BY 1;
                  
                (SUBQUERY + �Ϲ� �ܺ�����)
                SELECT B.PROD_ID AS ��ǰ�ڵ�,                         
                       B.PROD_NAME AS ��ǰ��,                          
                       NVL(SUM(A.BUY_QTY),0) AS ���Լ���,
                       NVL(SUM(A.BUY_QTY*B.PROD_COST),0) AS ���Աݾ�
                  FROM PROD B, ()--<2005�⵵ ��������(��������)) A
                  WHERE B.�÷���=A.�÷���(+)
                  ORDER BY 1;
                  
                  --2005�⵵ 1�� ��������(��������) A
                SELECT BUY_PROD AS BID,
                       SUM(BUY_QTY) AS QAMT,
                       SUM(BUY_QTY*BUY_COST) AS MAMT
                  FROM BUYPROD
                 WHERE BUY_DATE BETWEEN TO_DATE('20050101') AND LAST_DAY(TO_DATE('20050101'))
                 GROUP BY BUY_PROD;
                 
                 SELECT B.PROD_ID AS ��ǰ�ڵ�,                          --ī���� ���Եȴٸ� * ���� �÷����� �����.
                       B.PROD_NAME AS ��ǰ��,                          --NULL�� �������ϴϱ� NVL 
                       NVL(A.QAMT,0) AS ���Լ���,
                       NVL(A.MAMT,0) AS ���Աݾ�
                  FROM PROD B, ( SELECT BUY_PROD AS BID,
                                        SUM(BUY_QTY) AS QAMT,
                                        SUM(BUY_QTY*BUY_COST) AS MAMT
                                   FROM BUYPROD
                                  WHERE BUY_DATE BETWEEN TO_DATE('20050101') AND LAST_DAY(TO_DATE('20050101'))
                                  GROUP BY BUY_PROD) A
                  WHERE B.PROD_ID = A.BID(+)
                  ORDER BY 1;
            
            ��뿹) ��� �μ��� ������� ��ȸ�Ͻÿ�.
                ����� �μ��ڵ�, �μ���, ������̴�.
                SELECT B.DEPARTMENT_ID AS �μ��ڵ�, -- DEPARTMENT �� �μ��� �� ����
                       B.DEPARTMENT_NAME AS �μ���,
                       COUNT(A.EMPLOYEE_ID) AS ����� -- PK�� �־����.
                  FROM HR.EMPLOYEES A, HR.DEPARTMENTS B
                  WHERE B.DEPARTMENT_ID = A.DEPARTMENT_ID(+)  -- ���� A�� NULL ������. ����ϸ� NULL�� �� ���� ���� �̤�
                  GROUP BY B.DEPARTMENT_ID, B.DEPARTMENT_NAME --ROLLUP �� ���� ����� �� ���ؼ� ������
                  ORDER BY 1;
                  
                (ANSI ����)
                SELECT LPAD(NVL(TO_CHAR(B.DEPARTMENT_ID),'����'),4) AS �μ��ڵ�, -- �μ��ڵ尡 ���������� ���缭 ���=> ����    �μ����� ���ʿ� ���� ���=> ����.
                       NVL(B.DEPARTMENT_NAME,'����') AS �μ���,
                       COUNT(A.EMPLOYEE_ID) AS �����
                  FROM HR.EMPLOYEES A
                  FULL OUTER JOIN HR.DEPARTMENTS B ON (B.DEPARTMENT_ID = A.DEPARTMENT_ID)
                  GROUP BY B.DEPARTMENT_ID, B.DEPARTMENT_NAME
                  ORDER BY 1;
                  -- LPAD�� �μ��ڵ� �̻ڰ� �������ְ� NVL�� NULL �� �������� �ٲ� ��. -- �μ��ڵ�� �����̱⶧���� TO_CHAR�� �Ἥ ���ڷ� �����������.
              
            ��뿹) 2005�� 4�� ��� ��ǰ�� ���� �Ǹ���Ȳ�� ��ȸ�Ͻÿ�.
                ����� ������ ��ǰ�ڵ�, ��ǰ��, �Ǹż���, �Ǹűݾ��̴�.
                SELECT A.PROD_ID AS ��ǰ�ڵ�,
                       A.PROD_NAME AS ��ǰ��,
                       NVL(SUM(B.CART_QTY),0) AS �Ǹż���,
                       NVL(SUM(B.CART_QTY*A.PROD_PRICE),0) AS �Ǹűݾ�
                  FROM PROD A 
                  LEFT OUTER JOIN CART B ON (A.PROD_ID = B.CART_PROD(+)
                  AND B.CART_NO LIKE '200504%')
                  GROUP BY A.PROD_ID, A.PROD_NAME
                  ORDER BY 1;