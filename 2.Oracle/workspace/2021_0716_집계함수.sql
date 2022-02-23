�����Լ�
    - �־����ڷḦ Ư�� �÷��� �������� �׷����� ������ �׷캰�� �ڷῡ ���� ���踦 ��ȯ�ϴ� �Լ�
    - SUM, AVG, COUNT, MIN, MAX
        (�������)
            SELECT [�÷�]list], --�����Լ� ���� SELECT �� �����ؾ���. �ȱ׷��� ����
                   SUM|AVG|MIN|MAX(expr)|COUNT(column|*),
                                :
                FROM ���̺��
                [WHERE ����]
                [GROUP BY �÷���[,�÷���,...]] -- ���������� ���̺� ��ü
                [HAVING ����]
                [ORDER BY �÷���|�÷��ε���[ASC|DESC][,�÷���|�÷��ε���[ASC|DESC],...];
            --���ʿ��ϸ� �ۼ���. �ʿ��ϸ� �ۼ��Ҷ� ���� ���Ѿ���. where having ������ �ٸ�.
        1. SUM(expr)
            - 'expr'�� ǥ���Ǵ� ���� �Ǵ� �÷��� ���� ���� �հ踦 ��ȯ
                ��뿹) ������̺��� ��� ����� �޿� �Ѿ��� ���Ͻÿ�.
                    SELECT SUM(SALARY)
                        FROM HR.EMPLOYEES;                     --EMP_NAME �̸��� ��ġ�� �ʴ� �̻� ��� �ϳ��ϳ��� �׷�.
                
                ��뿹) ������̺��� �μ��� �޿� �հ踦 ���Ͻÿ�.        
                    SELECT DEPARTMENT_ID AS �μ��ڵ�,
                           SUM(SALARY) AS �޿��հ�
                        FROM HR.EMPLOYEES
                        GROUP BY DEPARTMENT_ID
                        ORDER BY 1;
                        --���� ������ WHERE ���� �μ����� ������ϴ� GROUP BY SELECT ���� ���� �����ض� �׷��� Ʋ������ �� ���� �����ؼ� ã�� ����.
                        -- ORDER BY �μ��ڵ庰 ���Ľ�ų����.
                        
                ��뿹) ������̺��� �μ��� �޿� �հ踦 ���ϵ� �հ谡 10000�̻��� �μ��� ��ȸ�Ͻÿ�.        
                    SELECT DEPARTMENT_ID AS �μ��ڵ�,
                           SUM(SALARY) AS �޿��հ�
                        FROM HR.EMPLOYEES
--                        WHERE SUM(SALARY)  10000
                        GROUP BY DEPARTMENT_ID
                        HAVING SUM(SALARY) >= 10000
                        ORDER BY 1;
                
                ��뿹) 2005�� 5�� ȸ���� ������Ȳ(ȸ����ȣ, ���ż����հ�, ���űݾ��հ�)�� ��ȸ�Ͻÿ�.
                    SELECT A.CART_MEMBER AS ȸ����ȣ,
                           SUM(A.CART_QTY) AS ���ż����հ�,
                           SUM(A.CART_QTY*B.PROD_PRICE) AS ���űݾ��հ�
                        FROM CART A, PROD B
                        WHERE A.CART_PROD = B.PROD_ID
                            AND A.CART_NO LIKE '200505%'
                        GROUP BY A.CART_MEMBER;
                        
                ��뿹) 2005�� ���� ȸ���� ������Ȳ(��, ȸ����ȣ, ���ż����հ�, ���űݾ��հ�)�� ��ȸ�Ͻÿ�.
                    SELECT SUBSTR(A.CART_NO,5,2) AS ��,
                           A.CART_MEMBER AS ȸ����ȣ,
                           SUM(A.CART_QTY) AS ���ż����հ�,
                           SUM(A.CART_QTY * B.PROD_PRICE) AS ���űݾ��հ�
                        FROM CART A, PROD B
                        WHERE A.CART_PROD = B.PROD_ID
                            AND SUBSTR(CART_NO,1,4)='2005'
                        GROUP BY SUBSTR(A.CART_NO,5,2),A.CART_MEMBER
                        ORDER BY 1;
                        
                ��뿹) ȸ�����̺��� ������ ���ϸ��� �հ踦 ���Ͻÿ�.
                    SELECT MEM_JOB AS ������,
                           SUM(MEM_MILEAGE) AS "���ϸ��� �հ�" 
                        FROM MEMBER                --ȸ�����̺�
                        GROUP BY MEM_JOB           -- ������
                        ORDER BY SUM(MEM_MILEAGE); --����
                
                ����