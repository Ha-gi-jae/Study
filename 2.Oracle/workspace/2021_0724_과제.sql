 ����) ����� �� �ڱⰡ ���� �μ��� ��� �޿����� ���� �޿��� �޴� ���������� ��ȸ�Ͻÿ�
            Alias�� �����ȣ, �����, �μ���ȣ, �μ���, �޿�, �μ���ձ޿�
            
            SELECT A.EMPLOYEE_ID AS �����ȣ,
                   A.EMP_NAME AS �����,
                   A.DEPARTMENT_ID AS �μ���ȣ,
                   B.DND AS �μ���,
                   A.SALARY AS �޿�,
                   B.ASAL AS �μ���ձ޿�
              FROM HR.EMPLOYEES A,
                   (SELECT C.DEPARTMENT_ID AS DID,
                           C.DEPARTMENT_NAME AS DND,
                           ROUND(AVG(A.SALARY)) AS ASAL
                      FROM HR.EMPLOYEES A, HR.DEPARTMENTS C
                     WHERE A.DEPARTMENT_ID = C.DEPARTMENT_ID
                     GROUP BY C.DEPARTMENT_ID, C.DEPARTMENT_NAME) B
             WHERE A.DEPARTMENT_ID = B.DID
               AND SALARY < B.ASAL
             ORDER BY 6 DESC;