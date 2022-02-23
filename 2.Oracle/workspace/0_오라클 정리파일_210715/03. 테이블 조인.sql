1. ���̺� ����
    - ������ ������ ���̽��� �ٽ� ���
    - �������� ���̺� �л�� �ڷḦ ��ȸ�ϱ� ����
    - ���̺� ���̿� ����(Relationship)�� �ξ��� �־�� ��
        - ����
            - �Ϲ� ���� / ANSI JOIN
                - �Ϲ����� : CARTESIAN PRODUCT, EQUI JOIN, NON EQUI JOIN, SELF JOIN, OUTER JOIN
                - ANSI JOIN : CROSS JOIN, NATURAL JOIN, INNER JOIN, OUTER JOIN
            - �������� / �ܺ�����
            
        (�Ϲ� �������)
            SELECT �÷�list
                FROM ���̺��1 [��Ī1], ���̺��2 [��Ī2] [,���̺��3 [��Ī3],...]
                WHERE ��������1
                  [AND ��������2]
                  [AND �Ϲ�����]...
        
            - ���ο� ���� ���̺��� n���϶� ���������� ������ n-1�� �̻��̾�� ��
            - �������ǰ� �Ϲ������� ��� ������ �ǹ̾���
      
        (ANSI INNER JOIN �������)
            SELECT �÷�list
                FROM ���̺��1 [��Ī1] -- ���̺��1 �̶� ���̺��2�� ������ ���εǾ����.               ex) buyer
                INNER JOIN ���̺��2 [��Ī2] ON(�������� [AND �Ϲ�����]) --���̺��2 ���� �ش�Ǵ� ���� ex) prod
                INNER JOIN ���̺��3 [��Ī3] ON(�������� [AND �Ϲ�����]) --���̺��3 ���� �ش�Ǵ� ���� ex) buyprod 1,2�� ���ΰ���� ���εȴ�.
                        :
                [WHERE �Ϲ�����n]...
                                     
            - '���̺��1'�� '���̺��2'�� �ݵ�� ���� ������ ���̺� �ϰ�
            - '���̺��3' ���ʹ� '���̺��1'�� '���̺��2'�� ����� ����
            - ON ���� ���Ǵ� �Ϲ�����1�� '���̺�1'�� '���̺�2'���� �ش��ϴ� ��������    
            - WHERE ���� ���������� ��� ���̺� ����Ǵ� ��������
            
    1)�Ϲ����� / ANSI JOIN        
        (1) CARTESIAN PRODUCT
            - ��� ������ ����� ������ ����� ��ȯ
            - ANSI������ CROSS JOIN�� �̿� �ش�
            - Ư���� ���� �̿ܿ��� ������ ����
            - ���������� ���ų� �߸��� ��� �߻�
            
            ��뿹) SELECT COUNT(*) --�Ϲ�
                       FROM CART, BUYPROD;
                   -- cart �� * buyprod ��
                   
                   SELECT COUNT(*) --ANSI
                       FROM CART
                       CROSS JOIN BUYPROD
                       CROSS JOIN PROD;
                   -- CART �� * BUY PROD �� * PROD ��
                   
        (2) EQUI-JOIN
            - ���� ����
            - ���� ���ǿ� '=' �����ڰ� ���� ����
            - ANSI JOIN�� INNER JOIN�� �̿� �ش�
            - �������� �Ǵ� SELECT�� ���Ǵ� �÷� �� �� ���̺��� ���� �÷������� ���ǵ� ��� '���̺��.�÷���' �Ǵ� '���̺� ��Ī.�÷���' �������� ���
            
            ��뿹) �������̺��� 2005�� 1�� ��ǰ�� ������Ȳ�� ��ȸ�Ͻÿ�
                Alias�� ��ǰ�ڵ�, ��ǰ��, ���Լ����հ�, ���Աݾ��հ�
                SELECT A.BUY_PROD AS ��ǰ�ڵ�, --�Ϲ�
                       B.PROD_NAME AS ��ǰ��,
                       SUM(A.BUY_QTY) AS ���Լ����հ�,
                       SUM(A.BUY_QTY*B.PROD_COST) AS ���Աݾ��հ�
                    FROM BUYPROD A, PROD B
                    WHERE B.PROD_ID = A.BUY_PROD -- ��������
                      AND A.BUY_DATE BETWEEN  TO_DATE('20050101') AND TO_DATE(LAST_DAY('20050101')) 
                    GROUP BY A.BUY_PROD, B.PROD_NAME
                    ORDER BY 1;
                
                SELECT A.BUY_PROD AS ��ǰ�ڵ�, --ANSI
                       B.PROD_NAME AS ��ǰ��,
                       SUM(A.BUY_QTY) AS ���Լ����հ�,
                       SUM(A.BUY_QTY*B.PROD_COST) AS ���Աݾ��հ�
                    FROM BUYPROD A
                    INNER JOIN PROD B ON(A.BUY_PROD=B.PROD_ID AND A.BUY_DATE BETWEEN  TO_DATE('20050101') AND TO_DATE(LAST_DAY('20050101')))
                    GROUP BY A.BUY_PROD, B.PROD_NAME          --���̺��� 2���� ���� ������ AND�� ���� ������ WHERE���� �ϸ�ȴ�.
                    ORDER BY 1;
                    
            ��뿹) ������̺��� ������ �����ȣ�� 121���� �μ��� ���� ��� ������ ��ȸ�Ͻÿ�.
                Alias�� �����ȣ, �����, �μ���, ������
                SELECT A.EMPLOYEE_ID AS �����ȣ, --�Ϲ�
                       A.EMP_NAME AS �����,
                       B.DEPARTMENT_NAME AS �μ���,
                       C.JOB_TITLE AS ������
                    FROM HR.EMPLOYEES A, HR.DEPARTMENTS B, HR.JOBS C
                    WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID -- ��������
                       AND A.JOB_ID = C.JOB_ID -- ��������
                       AND B.MANAGER_ID LIKE 121 -- ���ڶ� = �� ����
                    ORDER BY 1;
                
                SELECT A.EMPLOYEE_ID AS �����ȣ, --ANSI
                       A.EMP_NAME AS �����,
                       B.DEPARTMENT_NAME AS �μ���,
                       C.JOB_TITLE AS ������
                    FROM HR.EMPLOYEES A
                    INNER JOIN HR.DEPARTMENTS B ON A.DEPARTMENT_ID = B.DEPARTMENT_ID --�̰��� where���� �ִ°��� �ᵵ�ȴ�.
                    INNER JOIN HR.JOBS C ON A.JOB_ID = C.JOB_ID
                    WHERE B.MANAGER_ID LIKE 121
                    ORDER BY 1;
                    
            ��뿹) 2005�� �ŷ�ó�� ������Ȳ�� ��ȸ�Ͻÿ�
                Alias�� �ŷ�ó�ڵ�, �ŷ�ó��, ����ݾ��հ�
                SELECT A.BUYER_ID AS �ŷ�ó�ڵ�,
                       A.BUYER_NAME AS �ŷ�ó��,
                       SUM(B.CART_QTY*C.PROD_PRICE) AS ����ݾ��հ�
                    FROM BUYER A, CART B, PROD C
                    WHERE B.CART_PROD = C.PROD_ID
                      AND A.BUYER_ID = C.PROD_BUYER
                      AND B.CART_NO LIKE '2005%'
                     GROUP BY A.BUYER_ID, A.BUYER_NAME
                     ORDER BY 1;
                     
                SELECT A.BUYER_ID AS �ŷ�ó�ڵ�,
                       A.BUYER_NAME AS �ŷ�ó��,
                       SUM(B.CART_QTY*C.PROD_PRICE) AS ����ݾ��հ�
                    FROM BUYER A
                    INNER JOIN PROD C ON A.BUYER_ID = C.PROD_BUYER
                    INNER JOIN CART B ON B.CART_PROD = C.PROD_ID
                    WHERE B.CART_NO LIKE '2005%'
                    GROUP BY A.BUYER_ID, A.BUYER_NAME
                    ORDER BY 1;
                    
            ��뿹)2005�� 5�� ȸ���� �Ǹž��� ����ϰ� ���� 5���� �ڷḦ ����Ͻÿ�.
                Alias�� ȸ����ȣ, ȸ����, ���űݾ��հ�
                SELECT TBLA.CID AS ȸ����ȣ,
                       TBLB.MEM_NAME AS ȸ����,
                       TBLA.AMT AS ���űݾ��հ� 
                  FROM (SELECT A.CART_MEMBER AS CID, --�����Ǿ� ���°��� �������� �Ǿ��� �÷���Ī�� ���ִ°� �����ϴ�.
                               SUM(A.CART_QTY*B.PROD_PRICE) AS AMT
                          FROM CART A, PROD B
                         WHERE A.CART_PROD=B.PROD_ID
                           AND A.CART_NO LIKE '200505%'
                         GROUP BY A.CART_MEMBER
                         ORDER BY 2 DESC) TBLA,
                        MEMBER TBLB
                  WHERE TBLA.CID=TBLB.MEM_ID
                    AND ROWNUM <= 5;          --�ζ��������� ������ �ִ� ��������
                    
            ��뿹) ȸ���� ���ϸ����� ��ȸ�Ͽ� ���� 20%�� ���� ȸ������ 2005�� 4-6�� ������ ������ ��ȸ�Ͻÿ�.
                Alias�� ȸ����ȣ, ȸ����, ��ǰ��, ����, �ݾ�
                  
                  DECLARE
                    V_ID MEMBER.MEM_ID%TYPE;                 --% = ����Ÿ�� ���� ������Ÿ������ ����~
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
                      FETCH CUR_MEM01 INTO V_ID; --FETCH �о�Ͷ�. ù�ٺ��� ���ʴ��.
                      EXIT WHEN CUR_MEM01%NOTFOUND;      -- Ŀ������ NOTFOUND ���̻� Ŀ���� �ڷᰡ ������ �� ������ ����
                      
                      SELECT C.MEM_NAME, SUM(A.CART_QTY*B.PROD_PRICE)
                        INTO V_NAME, V_AMT
                        FROM CART A, PROD B, MEMBER C
                       WHERE A.CART_MEMBER=C.MEM_ID
                         AND A.CART_PROD=B.PROD_ID
                         AND A.CART_MEMBER=V_ID
                         AND SUBSTR(A.CART_NO,1,6) BETWEEN '200504' AND '200506'
                       GROUP BY C.MEM_NAME;
                         
                       DBMS_OUTPUT.PUT_LINE('ȸ����ȣ : '||V_ID);
                       DBMS_OUTPUT.PUT_LINE('ȸ���� : '||V_NAME);
                       DBMS_OUTPUT.PUT_LINE('���űݾ� : '||V_AMT);
                       DBMS_OUTPUT.PUT_LINE('------------------------');
                    END LOOP;
                    
                    CLOSE CUR_MEM01;
                  END;
                  
            ��뿹) 2005�� 5�� ���Ծװ� ������� ��ȸ�Ͻÿ�.
                Alias�� ��ǰ�ڵ�, ��ǰ��, ���Ծ��հ�, ������հ�
                SELECT A.BUY_PROD AS ��ǰ�ڵ�,
                       B.PROD_NAME AS ��ǰ��,
                       SUM(A.BUY_QTY*B.PROD_COST) AS ���Ծ��հ�
                  FROM BUYPROD A, PROD B
                  WHERE A.BUY_PROD = B.PROD_ID        --COST�� NAME�� ���� ���ڴ�. ���� ��ǰ��!
                    AND A.BUY_DATE BETWEEN TO_DATE('20050501') AND LAST_DAY(TO_DATE('20050501'))
                  GROUP BY A.BUY_PROD, B.PROD_NAME
                  ORDER BY 1;
                  
                 SELECT A.CART_PROD AS ��ǰ�ڵ�,
                       B.PROD_NAME AS ��ǰ��,
                       SUM(A.CART_QTY*B.PROD_PRICE) AS ������հ�
                  FROM CART A, PROD B
                  WHERE A.CART_PROD = B.PROD_ID       
                    AND A.CART_NO LIKE '200505%'
                  GROUP BY A.CART_PROD, B.PROD_NAME
                  ORDER BY 1;
                  
                (���� - �Ϲ���������)
                SELECT PROD_ID AS ��ǰ�ڵ�,
                       PROD_NAME AS ��ǰ��,
                       NVL(TBLA.BAMT,0) AS �����հ�               -- CART_PROD = PROD_ID ���� 2�� �Ϲ� 2�� ���ƾ���
                       NVL(TBLB.CAMT,0) AS �����հ�
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
                       PROD   --������ �־� 74���� ���缭 ����
                 WHERE TBLA.BID (+)= PROD_ID   --����    
                   AND TBLB.CID (+)= PROD_ID   --����  �Ѵ� �÷��� ���ν�Ŵ.      
                 GROUP BY 1;          
                 
                 (���� - ANSI����)
                 SELECT A.PROD_ID AS ��ǰ�ڵ�,
                       A.PROD_NAME AS ��ǰ��,
                       NVL(SUM(A.PROD_COST*B.BUY_QTY),0) AS �����հ�,            
                       NVL(SUM(A.PROD_PRICE*C.CART_QTY),0) AS �����հ�
                  FROM PROD A
                  LEFT OUTER JOIN BUYPROD B ON (B.BUY_PROD = A.PROD_ID
                        AND B.BUY_DATE BETWEEN TO_DATE('20050501') AND LAST_DAY(TO_DATE('20050501')))
                  LEFT OUTER JOIN CART C ON (C.CART_PROD = A.PROD_ID
                        AND C.CART_NO LIKE '200505%')
                   GROUP BY A.PROD_ID, A.PROD_NAME
                   ORDER BY 1;
                  
                         
        (3) Non-Equi Join
            - �������ǹ��� '=' �̿��� �����ڰ� ���� ���
            - IN, ANY, SOME, ALL, EXISTS ���� ������ ������ ���
            
            ��뿹) ������̺��� ������� ����ӱݺ��� �� ���� �ӱ��� �޴� ����� �����ȣ, �����, �μ���, �޿�, ��ձ޿��� ����Ͻÿ�
                SELECT A.EMPLOYEE_ID AS �����ȣ,
                       A.EMP_NAME AS �����,
                       B.DEPARTMENT_NAME AS �μ���,
                       A.SALARY AS �޿�,
                       C.ASAL AS ��ձ޿�
                    FROM HR.EMPLOYEES A, HR.DEPARTMENTS B,
                        (SELECT ROUND(AVG(SALARY)) AS ASAL
                           FROM HR.EMPLOYEES) C -- ��ձ޿�                �������� �ѹ��� �����ؼ� ����� ASAL�� �־��ְ� ��. ȿ����
                   WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
                     AND A.SALARY > C.ASAL
                   ORDER BY 4;
               
               --�̷�(��ȿ����) ��ĵ� ����.
               SELECT A.EMPLOYEE_ID AS �����ȣ,
                       A.EMP_NAME AS �����,
                       B.DEPARTMENT_NAME AS �μ���,
                       A.SALARY AS �޿�,
                       (SELECT ROUND(AVG(SALARY))
                         FROM HR.EMPLOYEES) AS ��ձ޿�
                    FROM HR.EMPLOYEES A, HR.DEPARTMENTS B
                        WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
                     AND A.SALARY > (SELECT ROUND(AVG(SALARY)) 
                                      FROM HR.EMPLOYEES)        -- �ʿ��� ������ �����ؼ� ȿ�������� ����
                   ORDER BY 4;    
                   
            ��뿹) 2005�� 6�� ���� ���� ������ ���� �ּ��� �̿��� �ּ����� �����ϴ� ȸ���� ȸ����ȣ, ȸ����, �ּҸ� ��ȸ�Ͻÿ�.
                SELECT

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