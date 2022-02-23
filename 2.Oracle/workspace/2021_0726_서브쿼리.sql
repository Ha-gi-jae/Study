2021_0726
1. ��������
    - SQL�����ȿ� �� �ٸ� SQL������ ���Ե� ����
    - ���� ������ ��������, ���� ������ ���� ������ ��
    - ���������� ���������� ����� ��ȯ�ϱ� ���� �߰� ����� ���
    - ���������� ( )�� ���� �����(���� INSERT���� ���Ǵ� ���������� '( )'�� ������� ����)
    - ���������� ���Ǵ� ��ġ�� ���� �Ϲݼ�������(SELECT ��), �ζ��μ�������(FROM ��), ��ø��������(WHERE ��)�� ���� -- �ζ��μ��������� Ư¡: ��������Ǿ����
    - ��ȯ�ϴ� ����� ��/���� ���������� ������/���Ͽ�, ������/���߿�, ������/���Ͽ�, ������/���߿��� ���� -- WHERE ���� ���Ǵ� ��ø���������� �ݵ�� ���迬���� ������ ��ġ�ؾ���
    - ���������� ���������� ���Ǵ� ���̺� ���� ���� ���ο� ���� ���ü����� ��������/�������������� ����
    - �˷��������� ���ǿ� �ٰ��ϸ� �����͸� �˻��ϴ� ��� ����
    
    1) ������ ��������
        - �ϳ��� ��� ����� ��ȯ
        - ������ �����ڴ� ���迬����(=, >, <, !=, >=, <=) ��
        
            ��뿹) 
                SELECT EMPLOYEE_ID, EMP_NAME
                  FROM HR.EMPLOYEES
                 WHERE (DEPARTMENT_ID, MANAGER_ID) = (SELECT DEPARTMENT_ID, MANAGER_ID -- ���(���迬���� ����)�� 8�� // �������� 1����. 50, 121 ��� ���� �߻����ϰ� �Ǵ���?
                                          FROM HR.DEPARTMENTS                          -- 8 : 1�̶���ص� ���Ҷ� 1:1�� ����. �㳪 �������� �������� �������ȴ�.
                                         WHERE MANAGER_ID=121);                        -- ���������� �ѹ��� ����ȴ�. ���������� ����ɶ����� ��.
               --��ȣ�� ��� ���ÿ� �� �� ����
               -- EMPLOYEES���� DEPARTMENT_ID�� MANAGER_ID�� �����ͼ� ������ DEPARTMENTS�� DEPARTMENT_ID, MANAGER_ID�� ��.
               -- MANAGER 121���� �Ŵ�����, �μ��ڵ� 50���� ���� ����� ����ȴ�.  
               
    2)������ ��������
        - �ϳ� �̻��� ���� ��ȯ�ϴ� ��������
        - ������ ������ : IN, ANY, SOME, ALL, EXISTS
        
            ��뿹) ������̺��� ������ ���� 10�� �̻��� �Ǵ� �μ��� �μ��ڵ�, �μ����� ��� --������ �μ�, ����� ���
                ��������: �μ��ڵ�, �μ���        ��������:������ ���� 10�� �̻��� �Ǵ� �μ��� �μ��ڵ�        -- ���������� �츮�� ����� �κ��� ��������.
                SELECT A.DEPARTMENT_ID AS �μ��ڵ�,
                       A.DEPARTMENT_NAME AS �μ���
                  FROM HR.DEPARTMENTS A
                 WHERE A.DEPARTMENT_ID = ( �������� )
                 
                 SELECT DEPARTMENT_ID,
                        COUNT(*)
                   FROM HR.EMPLOYEES
                  GROUP BY DEPARTMENT_ID
                  HAVING COUNT(*) >= 10; --ī��Ʈ�� WHERE ���� �ƴ� HAVING ��!
                  -- 10���̻��� �μ��ڵ常 �ʿ���. �ٵ� ���� ���������� �μ��ڵ�� ������� ���̳���! �긦 �ٽ� �������� ������ �������.
                  (��������)
                  SELECT B.DID
                    FROM (SELECT DEPARTMENT_ID AS DID,
                                 COUNT(*)
                            FROM HR.EMPLOYEES
                            GROUP BY DEPARTMENT_ID
                            HAVING COUNT(*) >= 10) B;
                (���)
                SELECT A.DEPARTMENT_ID AS �μ��ڵ�,
                       A.DEPARTMENT_NAME AS �μ���
                  FROM HR.DEPARTMENTS A
                 WHERE A.DEPARTMENT_ID = ANY(SELECT B.DID -- = �� ������ ANY OR SOME�� �����.
                                               FROM (SELECT DEPARTMENT_ID AS DID,
                                                            COUNT(*)
                                                       FROM HR.EMPLOYEES
                                                      GROUP BY DEPARTMENT_ID
                                                     HAVING COUNT(*) >= 10) B);  
            
                (����: EXISTS)
                    - EXISTS ������ ������ ǥ����(�� or �÷���) �� ���� 
                    - EXISTS ������ �������� �ݵ�� ���������� �;��Ѵ�.
                
                SELECT A.DEPARTMENT_ID AS �μ��ڵ�,
                       A.DEPARTMENT_NAME AS �μ���
                  FROM HR.DEPARTMENTS A
                 WHERE EXISTS (SELECT 1 
                                 FROM (SELECT B.DEPARTMENT_ID AS DID, --C���̺��ִ� �÷� DID�� A���̺��� �÷� A.DEPARTMENT_ID�� �����Ѱ���.
                                              COUNT(*) 
                                         FROM HR.EMPLOYEES B
                                        GROUP BY B.DEPARTMENT_ID
                                        HAVING COUNT(*) >=10) C
                                WHERE C.DID = A.DEPARTMENT_ID); -- ��, ������ �ִ� ��������.
                                --WHERE C.DID=50 OR C.DID=80���� �ϸ� ���� 1 �� ��µȴ�. ���������� ���� 1���� �����ϸ� �������� ��ü�� ���̵ȴ�.

    3)���߿� ��������
        - �ϳ� �̻��� ���� ��ȯ�Ǵ� ��������
        - PAIRWISE(�ֺ�) �������� �Ǵ� Nonpairwise(��ֺ�)���������� ����
        
            ��뿹) 80�� �μ����� �޿��� ����̻��� ����� ��ȸ�Ͻÿ�.
                Alias�� �����ȣ, �޿�, �μ��ڵ�
                (�����)
                SELECT A.EMPLOYEE_ID AS �����ȣ,
                       A.SALARY AS �޿�,
                       A.DEPARTMENT_ID AS �μ��ڵ�
                  FROM HR.EMPLOYEES A
                 WHERE (A.EMPLOYEE_ID, A.DEPARTMENT_ID) IN (SELECT B.EMPLOYEE_ID, B.DEPARTMENT_ID
                                                            FROM HR.EMPLOYEES B
                                                           WHERE B.SALARY > (SELECT AVG(C.SALARY)
                                                                               FROM HR.EMPLOYEES C
                                                                              WHERE C.DEPARTMENT_ID = B.DEPARTMENT_ID)
                                                             AND B.DEPARTMENT_ID=80)
                 ORDER BY 3, 2;   
                 (����)
                 SELECT A.EMPLOYEE_ID AS �����ȣ,
                       A.SALARY AS �޿�,
                       A.DEPARTMENT_ID AS �μ��ڵ�
                  FROM HR.EMPLOYEES A
                 WHERE A.DEPARTMENT_ID = 80
                   AND A.SALARY >= (SELECT AVG(SALARY)
                                      FROM HR.EMPLOYEES
                                     WHERE DEPARTMENT_ID=80);