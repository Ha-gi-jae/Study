2021_0719
����) ������̺��� �ٹ������� �޿��հ踦 ���Ͻÿ�
    SELECT D.COUNTRY_ID AS �ٹ������ڵ�,
           D.COUNTRY_NAME AS ������,
           TO_CHAR(SUM(A.SALARY), '999,990') AS �޿��հ�
        FROM HR.EMPLOYEES A, HR.DEPARTMENTS B, HR.LOCATIONS C, HR.COUNTRIES D
       WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
         AND B.LOCATION_ID = C.LOCATION_ID
         AND C.COUNTRY_ID = D.COUNTRY_ID
       GROUP BY D.COUNTRY_ID, D.COUNTRY_NAME;

       -- �ǹ̾����� ������ �����ֱ����ؼ� ���־���� GROUP BY ���� (D.COUNTRY_NAME)
       
��뿹) ������̺��� �� �μ��� ���ʽ� �հ踦 ���Ͻÿ�.
        ����� �μ��ڵ�, �μ���, ���ʽ� �հ��̰�, ���ʽ��� ��������(COMMISSION_PCT)�� �޿��� ���Ѱ���� 30%�� �����Ѵ�.
            
        UPDATE HR.EMPLOYEES
            SET COMMISSION_PCT = 0.2
            WHERE EMPLOYEE_ID = 107;
            COMMIT;

        SELECT A.DEPARTMENT_ID AS �μ��ڵ�,
               B.DEPARTMENT_NAME AS �μ���,
               NVL(SUM(A.COMMISSION_PCT * A.SALARY) * 0.3,0) AS "���ʽ� �հ�"
            FROM HR.EMPLOYEES A, HR.DEPARTMENTS B
            WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
            GROUP BY A.DEPARTMENT_ID, B.DEPARTMENT_NAME
            ORDER BY 1;
            -- WHERE�� DEPARTMENT ID�� ���ƾ� �μ����� ������ �� ����.
            
            
            
  2.AVG(expr)
   - 'expr'�� ���ǵ� �÷��̳� ������ ���� ���� ������ ���� ��ȯ
   
    ��뿹) ��� ����ȸ������ ��� ���ϸ����� ��ȸ�Ͻÿ�.
        SELECT ROUND(AVG(MEM_MILEAGE)) AS "��� ���ϸ���"
            FROM MEMBER
            WHERE SUBSTR(MEM_REGNO2,1,1) IN('2','4');
    
    ��뿹)ȸ������ ���� ��� ���ϸ����� ��ȸ�Ͻÿ�.
        SELECT CASE WHEN SUBSTR(MEM_REGNO2,1,1) = '2'
                      OR SUBSTR (MEM_REGNO2,1,1) = '4' THEN
                        '����ȸ��'
                    ELSE '����ȸ��' END AS ����,
               ROUND(AVG(MEM_MILEAGE)) AS "��� ���ϸ���"
            FROM MEMBER
            GROUP BY CASE WHEN SUBSTR(MEM_REGNO2,1,1) = '2'
                      OR SUBSTR (MEM_REGNO2,1,1) = '4' THEN
                        '����ȸ��'
                    ELSE '����ȸ��' END;
            --SUBSTR(MEM_REGNO2,1,1) �� ���� 1, 2, 3, 4�� �����ɷ�.
            
    ��뿹) ������̺��� �� �μ��� ��ձ޿��� ��ȸ�Ͻÿ�.
        SELECT B.DEPARTMENT_ID AS �μ��ڵ�,
               B.DEPARTMENT_NAME AS �μ���,
               ROUND(AVG(A.SALARY)) AS ��ձ޿�
            FROM HR.EMPLOYEES A, HR.DEPARTMENTS B
            WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
            GROUP BY B.DEPARTMENT_ID, B.DEPARTMENT_NAME
            ORDER BY 1;
            
    ��뿹) 2005�� 1~6�� ���� ��� ���Ծ��� ��ȸ�Ͻÿ�.
        SELECT  EXTRACT(YEAR FROM BUY_DATE)||'��'||
                EXTRACT(MONTH FROM BUY_DATE)||'��' AS ����,
                ROUND(AVG(BUY_QTY*BUY_COST)) AS "��� ���Ծ�"
          FROM BUYPROD
          WHERE BUY_DATE BETWEEN TO_DATE('20050101') AND LAST_DAY(TO_DATE('20050601'))
          GROUP BY EXTRACT(YEAR FROM BUY_DATE)||'��'||
                EXTRACT(MONTH FROM BUY_DATE)||'��';
        --�� �����Ѱ� �� �������� �ϽŰ�.  
          SELECT EXTRACT(MONTH FROM BUY_DATE)||'��' AS ��,
                          ROUND(AVG(BUY_QTY*BUY_COST)) AS "��� ���Ծ�"
                       FROM BUYPROD
                       WHERE BUY_DATE BETWEEN TO_DATE('20050101') AND TO_DATE('20050630')
                       GROUP BY EXTRACT(MONTH FROM BUY_DATE)
                       ORDER BY 1;
                       
    ��뿹) 2005�� 1��~6�� ���� ��� ���Ծװ� ���Ծ����� ��ȸ�ϵ� ���Ծ��� 400�����̻��� ���� ��ȸ�Ͻÿ�.
            SELECT EXTRACT(MONTH FROM BUY_DATE)||'��' AS ��,
                   COUNT(*) AS ���԰Ǽ�,
                   ROUND(AVG(BUY_QTY*BUY_COST)) AS "��� ���Ծ�",
                   SUM(BUY_QTY*BUY_COST) AS ���Ծ���
                FROM BUYPROD
                WHERE BUY_DATE BETWEEN TO_DATE('20050101') AND TO_DATE('20050630')
                GROUP BY EXTRACT(MONTH FROM BUY_DATE)
                HAVING AVG(BUY_QTY*BUY_COST) >= '4000000'
                ORDER BY 1;
          -- ������ HAVING���� ����ؾ���.
     
     ��뿹) 2005�� �з��� ��ձ��űݾ��� ��ȸ�Ͻÿ�
        SELECT B.LPROD_GU AS �з��ڵ�,
               B.LPROD_NM AS �з���,
               ROUND(AVG(A.CART_QTY*C.PROD_PRICE)) AS ��ձ��űݾ�
            FROM CART A, LPROD B, PROD C
            WHERE B.LPROD_GU = C.PROD_LGU
              AND A.CART_PROD = C.PROD_ID
              AND SUBSTR(A.CART_NO,1,4) = '2005'
            GROUP BY B.LPROD_GU, B.LPROD_NM
            ORDER BY 1;
            
     ��뿹) 2005�� ȸ���� ���ɴ뺰 ��ձ��űݾ��� ��ȸ�Ͻÿ�.   
        SELECT TRUNC((EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM A.MEM_BIR))/10)*10||'��' AS ȸ�����ɴ�, 
               ROUND(AVG(B.CART_QTY*C.PROD_PRICE)) AS ��ձ��űݾ�
            FROM MEMBER A, CART B, PROD C
            WHERE A.MEM_ID = B.CART_MEMBER
              AND B.CART_PROD = C.PROD_ID
              AND B.CART_NO LIKE '2005%'
            GROUP BY TRUNC((EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM A.MEM_BIR))/10)*10
            ORDER BY 1;
            
    ����) ����� �� �ش����� ���� �μ��� ��� �޿����� ���� �޿��� �޴� ���������� ��ȸ�Ͻÿ�
    
            Alias�� �����ȣ, �����, �μ���ȣ, �μ���, �޿�, �μ���ձ޿�
        SELECT A.EMPLOYEE_ID AS �����ȣ,
               A.EMP_NAME AS �����,
               B.DEPARTMENT_ID AS �μ���ȣ, 
               B.DEPARTMENT_NAME AS �μ���,
               A.SALARY AS �޿�,
               AVG(SALARY) AS �μ���ձ޿�
            FROM HR.EMPLOYEES A, HR.DEPARTMENTS B
            WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
             
                

    3. COUNT(Column��|*)
        - �׷쳻�� ���� ��(�ڷ��� ����)�� ��ȯ
        - �ܺ����ο��꿡 ���Ǵ� ��� '*'�� ����ϸ� ����Ȯ�� ����� ��ȯ�ϱ� ������
          �ش� ���̺��� �÷����� ����ؾ� ��
          
          ��뿹) ������̺��� �� �μ��� ������� ��ȸ�Ͻÿ�.
              SELECT DEPARTMENT_ID AS �μ��ڵ�,
                     COUNT(*) AS �����1,
                     COUNT(LAST_NAME) AS �����2
                  FROM HR.EMPLOYEES
                  GROUP BY DEPARTMENT_ID
                  ORDER BY 1;
                  
          ��뿹) 2005�� 5�� �з��� �ǸŰǼ��� ��ȸ�Ͻÿ�.
              SELECT B.PROD_LGU AS �з�,
                     COUNT(CART_QTY) AS �ǸŰǼ�
                  FROM CART A, PROD B
                  WHERE A.CART_PROD = B.PROD_ID
                    AND A.CART_NO LIKE '200505%'
                  GROUP BY B.PROD_LGU
                  ORDER BY 1;
                  
          ��뿹) 2005�� 5-6�� ȸ���� ����Ƚ���� ��ȸ�Ͻÿ�
            Alias�� ȸ����ȣ, ����Ƚ��
            SELECT A.CID AS ȸ����ȣ,
                   COUNT(*) AS ����Ƚ��
                FROM (SELECT DISTINCT CART_NO AS CNO,
                                  CART_MEMBER AS CID
                          FROM CART
                          WHERE SUBSTR(CART_NO,1,6) IN ('200505','200506')
                          ORDER BY 2) A
                GROUP BY A.CID
                ORDER BY 1;
                
          ��뿹) ��� �μ��� ������� ��ȸ�Ͻÿ�. (NULL �μ��ڵ�� ����)
              SELECT B.DEPARTMENT_ID AS �μ��ڵ�, --�ܺ����� �Ҷ��� ���� �������� �����. HR.EMPLOYEES�� DEPARTMENT�� HR.DEPARTMENTS DEPARTMENT ���غ���ȴ�.
                     B.DEPARTMENT_NAME AS �μ���,   -- �׷��������� NULL ��.
                     COUNT(JOB_ID) AS �����1
                  FROM HR.EMPLOYEES A, HR.DEPARTMENTS B
                  WHERE A.DEPARTMENT_ID(+)= B.DEPARTMENT_ID   -- (+) �ܺ����� ������
                  GROUP BY B.DEPARTMENT_ID, B.DEPARTMENT_NAME
                  ORDER BY 1; 
                  --ī��Ʈ�� NULL ���� ���� 1�� ǥ�õȰ���. *�� �Ἥ.  �ܺ� ���� �� �� �� �� �� !
                  
                      (4) MAX(Column��), MIN(Column��)
            - MAX : �־��� �÷��� �� �ִ� ���� ��ȯ
            - MIN : �־��� �÷��� �� �ּ� ���� ��ȯ
            - �����Լ��� �ٸ� �����Լ��� ���� �� �� ����.
                ��뿹) 2005�� ���� ���Ծ� �� �ִ� ������ǰ�� �ּ� ������ǰ�� ��ǰ�ڵ�, ��ǰ��, �ִ���Ծ�, �ּҸ��Ծ�
                    SELECT EXTRACT(MONTH FROM BUY_DATE)||'��' AS ��,
                           MAX(BUY_QTY*BUY_COST) AS �ִ���Ծ�,
                           MIN(BUY_QTY*BUY_COST) AS �ּҸ��Ծ�
                        FROM BUYPROD
                        WHERE BUY_DATE LIKE '2005%' -- EXTRACT(MONTH FROM BUY_DATE) = 2005
                        GROUP BY  EXTRACT(MONTH FROM BUY_DATE)
                        ORDER BY 1;
                        
                ��뿹) 2005�� 5�� �ִ뱸�� �������� ��ȸ�Ͻÿ�.
                    Alias�� ȸ����ȣ, ȸ����, ���űݾ�
                    SELECT A.CART_MEMBER AS ȸ����ȣ,
                           C.MEM_NAME AS ȸ����,
                           SUM(A.CART_QTY* B .PROD_PRICE) AS ���űݾ� -- SUM �տ� MAX�� �� �� ����.
                        FROM CART A, PROD B, MEMBER C
                        WHERE A.CART_MEMBER = C.MEM_ID
                          AND A.CART_PROD = B.PROD_ID
                          AND A.CART_NO LIKE '200505%'
                        GROUP BY A.CART_MEMBER, C.MEM_NAME
                        ORDER BY 3 DESC;
                
                (SUBQUERY)
            SELECT D.MID AS ȸ����ȣ,
                   D.MNAME AS ȸ����,
                   E.MEM_ADD1||' '||MEM_ADD2 AS �ּ�,
                   E.MEM_HP AS ����ó,
                   D.AMT AS ���űݾ�                        --  D.AMT �տ��� max�� �� �� �ֱ��ѵ� �׷� ���̰� 2�����;��ϴ� ��ȿ����
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
                  --���ʰ� �ٱ��� ��Ī ���ĵ� ����� ����. ��¥�� �� ó���ǰ� �����.