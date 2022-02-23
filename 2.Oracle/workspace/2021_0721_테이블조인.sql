2021_0721
1. ���̺� ����
    - ������ ������ ���̽��� �ٽ� ���
    - �������� ���̺� �л�� �ڷḦ ��ȸ�ϱ� ����
    - ���̺� ���̿� ����(Relationship)�� �ξ��� �־�� ��
        - ����
            - �Ϲ� ���� / ANSI JOIN
                - �Ϲ����� : CARTESIAN PRODUCT, EQUI JOIN, NON EQUI JOIN, SELF JOIN, OUTER JOIN
                - ANSI JOIN : CROSS JOIN, NATURAL JOIN, INNER JOIN, OUTER JOIN
            - �������� / �ܺ�����
             
    1) CARTESIAN PRODUCT
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
               
    2) EQUI-JOIN
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
            SELECT A.EMPLOYEE_ID AS �����ȣ,
                   A.EMP_NAME AS �����,
                   B.DEPARTMENT_NAME AS �μ���,
                   C.JOB_TITLE AS ������
                FROM HR.EMPLOYEES A, HR.DEPARTMENTS B, HR.JOBS C
                WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
                   AND A.JOB_ID = C.JOB_ID
                   AND B.MANAGER_ID LIKE 121
                ORDER BY 1;
            
            SELECT A.EMPLOYEE_ID AS �����ȣ,
                   A.EMP_NAME AS �����,
                   B.DEPARTMENT_NAME AS �μ���,
                   C.JOB_TITLE AS ������
                FROM HR.EMPLOYEES A
                INNER JOIN HR.DEPARTMENTS B ON A.DEPARTMENT_ID = B.DEPARTMENT_ID
                INNER JOIN HR.JOBS C ON A.JOB_ID = C.JOB_ID
                WHERE B.MANAGER_ID LIKE 121
                ORDER BY 1;