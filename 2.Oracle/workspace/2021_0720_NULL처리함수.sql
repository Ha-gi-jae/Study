2021_0720
6) NULLó�� �Լ�
        - ����Ŭ���� �� �÷��� �⺻ �ʱⰪ�� ��� NULL��
        - NULL �ڷῡ ���� ��Ģ���� ����� ��� NULL��
        - NULL �ڷῡ ���� ������ �� �Լ��� IS NULL, IS NOT NULL, NVL, NVL2, NULLIF ���� ����
        
(1) IS NULL, IS NOT NULL
            - Ư�� �÷��̳� ���� ���� NULL���� �Ǻ��ϱ� ���� ���
            - '=' �����ڷ� NULL�� ���θ� �Ǻ����� ����
            
                ��뿹) ������̺��� ���������ڵ�(COMMISSION_PCT)�� NULL�̾ƴ� ����� �����ȣ, �����, �Ի���, �μ��ڵ�, �޿��� ��ȸ�Ͻÿ�.
                    SELECT EMPLOYEE_ID AS �����ȣ,
                           EMP_NAME AS �����,
                           HIRE_DATE AS �Ի���,
                           DEPARTMENT_ID AS �μ��ڵ�,
                           SALARY AS �޿�
                        FROM HR.EMPLOYEES
                        WHERE COMMISSION_PCT IS NOT NULL;
                        -- != NULL, <> NULL ���迬���ڷδ� NULL�� Ȯ���� �� ����.

(2) NVL(c, val)
           - 'c'�� ���� �Ǵ��Ͽ� �� ���� NULL�̸� 'val' ���� ��ȯ�ϰ�, NULL�̾ƴϸ� 'c'�� ���� ��ȯ
           - 'c'�� 'val'�� �ڷ����� �����ؾ� ��.
               ��뿹) ��ǰ���̺��� PROD_SIZE ���� NULL�̸� '��ǰũ������ ����' ���ڿ��� ����Ͻÿ�.
                   Alias�� ��ǰ�ڵ�, ��ǰ��, ũ��, ���Դܰ�
                   SELECT PROD_ID AS ��ǰ�ڵ�,
                          PROD_NAME AS ��ǰ��,
                          NVL(PROD_SIZE,'��ǰũ������ ����') AS ũ��,
                          PROD_COST AS ���Դܰ�
                       FROM PROD;
               
               ��뿹) ������̺��� �����ȣ, �����, �μ��ڵ�, �����ڵ带 ����Ͻÿ�.
                       ��, �μ��ڵ尡 NULL�̸� 'CEO'�� ����Ͻÿ�.
                    SELECT EMPLOYEE_ID AS �����ȣ,
                           EMP_NAME AS �����,
                           NVL(TO_CHAR(DEPARTMENT_ID),'CEO') AS �μ��ڵ�,
                           JOB_ID AS �����ڵ�
                        FROM HR.EMPLOYEES;
                   
               **) ��ǰ���̺��� �з��ڵ尡 P301�� ��ǰ�� �ǸŰ��� ���԰��� 90%�� UPDATE �Ͻÿ�.    
                   UPDATE PROD
                       SET PROD_PRICE = PROD_COST
                       WHERE LOWER(PROD_LGU) = 'p301'; -- ���� LGU �� �ִ� P�� �빮���� ���� �ҹ��ڷ��ϸ� �Է� ����
                                                      -- LOWER �빮�ڷ� �ٲ��. �������� �������� ��� �빮�ڷ� �ٲ��.
                    COMMIT;
                    
               ��뿹) 2005�� 7�� ��� ��ǰ�� ���� �Ǹ������� ��ȸ�Ͻÿ�  -- '���' �̶� ���� ���� (+) �� �������.
                   Alias�� ��ǰ�ڵ�, �Ǹż����հ�, �Ǹűݾ��հ�
                   SELECT B.PROD_ID AS ��ǰ�ڵ�,
                          NVL(SUM(A.CART_QTY),0) AS �Ǹż����հ�,
                          NVL(SUM(A.CART_QTY*B.PROD_PRICE),0) AS �Ǹűݾ��հ�
                       FROM CART A
                       RIGHT OUTER JOIN PROD B ON (A.CART_PROD= B.PROD_ID   -- �����ʿ� !!! (+) !!!!
                         AND A.CART_NO LIKE '200507%')
                       GROUP BY B.PROD_ID
                       ORDER BY 1;
                       
                       --�ܺ������� �ִµ� �������ε� �־ ��Ȯ�� ����� �� ������. 
                       --ANSI �Ǵ� ���������� ����Ѵ�.

(3) NVL2(c, val1, val2)
            - 'c'���� �Ǵ��Ͽ� �� ���� NULL�̸� 'val2'�� ��ȯ�ϰ� NULL�� �ƴϸ� 'val1'���� ��ȯ ��
            - 'val1'�� 'val2'�� ������ Ÿ���� ���ƾ� ��
                ��뿹) ������̺��� �����ȣ, �����, �μ��ڵ�, �����ڵ带 ����Ͻÿ�.
                       ��, �μ��ڵ尡 NULL�̸� 'CEO'�� ����Ͻÿ�.
                    
                    SELECT EMPLOYEE_ID AS �����ȣ,
                           EMP_NAME AS �����,
                           NVL2(DEPARTMENT_ID,TO_CHAR(DEPARTMENT_ID),'CEO') AS �μ��ڵ�,
                           JOB_ID AS �����ڵ�
                        FROM HR.EMPLOYEES;
                
                ��뿹) ��ǰ���̺��� ��ǰ�� ��������(PROD_COLOR)�� ���� NULL�̸� '�������� ���� ��ǰ'�� NULL�� �ƴϸ� '�������� ���� ��ǰ'�� ����Ͻÿ�.
                    SELECT PROD_ID AS ��ǰ��ȣ,
                           PROD_NAME AS ��ǰ��,
                            NVL2(PROD_COLOR,'�������� ���� ��ǰ','�������� ���� ��ǰ') AS ����
                        FROM PROD;

(4) NULLIF(c1,c2)
    - 'C1'�� 'C2'�� ���Ͽ� ������ NULL�� ��ȯ�ϰ�, ���� ������ c1�� ��ȯ ��
    
        ��뿹) ��ǰ���̺��� �ǸŰ��� ���԰��� ���Ͽ� �ǸŰ��� ���԰����� ���� ������ '�����ǰ' ������ '������ǰ'�� ������ ����Ͻÿ�.
            Alias�� ��ǰ�ڵ�, ��ǰ��, ���԰�, �ǸŰ�, ���
            SELECT PROD_ID AS ��ǰ�ڵ�,
                   PROD_NAME AS ��ǰ��,
                   PROD_COST AS ���԰�,
                   PROD_PRICE AS �ǸŰ�,
                   NVL2(NULLIF(PROD_COST,PROD_PRICE),'�����ǰ','������ǰ') AS ���
                FROM PROD;
                
        ��뿹) ��ǰ���̺��� �ǸŰ��� ���԰��� ���Ͽ� �ǸŰ��� ���԰��� ���������� �ǸŰ���, ������ '������ǰ'�� �ǸŰ����� ����Ͻÿ�.
            Alias�� ��ǰ�ڵ�, ��ǰ��, ���԰�, �ǸŰ�,
            SELECT PROD_ID AS ��ǰ�ڵ�,
                   PROD_NAME AS ��ǰ��,
                   PROD_COST AS ���԰�,
                   NVL2(NULLIF(PROD_COST,PROD_PRICE),TO_CHAR(PROD_PRICE),'������ǰ') AS �ǸŰ�
                 --NVL(LPAD(TO_CHAR(NULLIF(PROD_PRICE,PROD_COST)),10),LPAD('������ǰ',11)) AS �ǸŰ�
                FROM PROD;