2021_0729
1. VIEW ��ü
    - ������ ���̺�
    - SELECT ���� ���ӵ��� �ʰ� ������ ��ü
    - �ʿ��� �ڷᰡ �������� ���̺� �л�Ǿ� �ִ� ���
    - Ư�� ���̺��� ������ �����ϰ� �ʿ��� ������ �����ؾ��ϴ� ��� ���
    (�������)
    CREATE [OR REPLACE] VIEW ���̸�[(�÷�list)] -- VIEW_���̸� 
    AS
      SELECT ��
      [WITH CHECK OPTION] -- ��Ÿ���̶� ���� ���ÿ� ���� �� ����. ��� DML����� ���°���.
      [WITH READ ONLY];   -- VIEW ������ ��ġ�� ���� �����͵� ������. �̰��� ���� VIEW�� DML ����� ��������.
        - 'OR REPLACE' : ���� �̸��� �䰡 �����ϸ� ��ġ�ϰ� ������ ���Ӱ� ����
        - '�÷�list' : �信�� ����� �÷���, �����ϸ� SELECT���� ���� �÷���Ī �Ǵ� �÷����� ���� �÷������� ����
        - 'WITH CHECK OPTION' : �並 �����ϴ� SELECT���� ���� ������ üũ�ϸ� �̸� �����ϴ� DML����� �信�� ������� ���ϰ� ��
        - 'WITH READ ONLY' : �б����� �� ����
        -- �� �÷��� ���� ��� 1. ������� 2. SELECT ��Ī 3. SELECT �÷���
    ��뿹) ȸ�����̺��� ���ϸ����� 3000�̻��� ȸ���� ȸ����ȣ, ȸ����, ����, ���ϸ����� ��� �����Ͻÿ�.
    
        CREATE OR REPLACE VIEW VIEW_MEM_MILEAGE(MID,MNAME,MJOB,MMILE) -- CREATE OR REPLACE �ϳ��� ��ɾ�ó�� �ܿ��� ���� ���ϴ�. 
        AS                                      --���� MID,MNAME,MJOB,MMILE�� ���÷����� �ȴ�.
        SELECT MEM_ID AS ȸ����ȣ,
               MEM_NAME AS ȸ����,
               MEM_JOB AS ����,
               MEM_MILEAGE AS ���ϸ���
          FROM MEMBER
         WHERE MEM_MILEAGE >= 3000; 
        
        CREATE OR REPLACE VIEW VIEW_MEM_MILEAGE
        AS
        SELECT MEM_ID AS ȸ����ȣ,      -- ���� ���� �÷����� ���� ������ ��Ī�� ���� �÷����� �ȴ�.
               MEM_NAME AS ȸ����,
               MEM_JOB AS ����,
               MEM_MILEAGE AS ���ϸ���
          FROM MEMBER
         WHERE MEM_MILEAGE >= 3000; 

        CREATE OR REPLACE VIEW VIEW_MEM_MILEAGE
        AS
        SELECT MEM_ID -- ���̺��� �÷����� ���� �÷����� �ȴ�.
               MEM_NAME 
               MEM_JOB
               MEM_MILEAGE
          FROM MEMBER
         WHERE MEM_MILEAGE >= 3000;          
         
         SELECT * FROM VIEW_MEM_MILEAGE;
         
        **������ �� 'VIEW_MEM_MILEAGE'���� ȸ����ȣ 'e001'ȸ���� ���ϸ����� 500���� �����Ͻÿ�.
            UPDATE VIEW_MEM_MILEAGE
               SET ���ϸ��� = 500        --�÷����� '���ϸ���' ��.
             WHERE ȸ����ȣ = 'e001';
            -- �� ���̺� ������ ���ϸ��� 3000�̻��ε� 'e001' ȸ���� ���ϸ����� 500���� �����߱� ������ �信�� ���ܵȴ�. + ���̺����� 500���� ����ȴ�.
            
            SELECT MEM_ID,MEM_NAME,MEM_MILEAGE
              FROM MEMBER
             WHERE MEM_ID = 'e001';
             
        **ȸ�����̺��� ȸ����ȣ 'g001'ȸ���� ���ϸ����� 800���� 15000���� �����Ͻÿ�.
            UPDATE MEMBER
               SET MEM_MILEAGE = 15000
             WHERE MEM_ID = 'g001';
             
    ** VIEW ���� ���ǻ���
        - WITH ���� ���� ��� ORDER BY�� ��� ����
        - �����Լ�, DISTINCT�� ���� VIEW�� ������� DML ��� ����� �� ����
        - ǥ����(CASE WHEN-THEN, DECODE ��)�̳� �Ϲ� �Լ��� �����Ͽ� �䰡 ������ ��� �ش� �÷��� ������� ����, ���� �� ������
        - CURRVAL, NEXTVAL �� �ǻ��÷�(Pseudo Column)��� ����
        - ROWNUM, ROWID �� ���� ��Ī�� ����ؾ� ��.

    ��뿹) ��ǰ�з��� ��ǰ�� ���� ����ϴ� �� ����
        CREATE OR REPLACE VIEW VIEW_PROD_LGU
        AS
          SELECT PROD_LGU AS PLGU,
                 COUNT(*) AS CNT
            FROM PROD
           GROUP BY PROD_LGU;
           
        SELECT * FROM VIEW_PROD_LGU
        
    ** �� VIEW_PROD_LGU���� 'P102'�� �ڷḦ �����Ͻÿ�.
        DELETE VIEW_PROD_LGU
         WHERE PLGU = 'P102';
         -- �����Լ��� ����߱⶧���� DML ��� �Ұ��� 
         
    ��뿹) ȸ�����̺��� ���ϸ����� 3000�̻��� ȸ����� �����ǰ� ��������(CHECK OPTION)�� ����� �並 �����Ͻÿ�.
        CREATE OR REPLACE VIEW VIEW_MEM_MILEAGE
        AS
        SELECT MEM_ID AS ȸ����ȣ,      
               MEM_NAME AS ȸ����,
               MEM_JOB AS ����,
               MEM_MILEAGE AS ���ϸ���
          FROM MEMBER
         WHERE MEM_MILEAGE >= 3000
         
        WITH CHECK OPTION;
        
        SELECT * FROM VIEW_MEM_MILEAGE;
        
    ** ��(VIEW_MEM_MILEAGE)���� ������ ȸ��('e001')�� ���ϸ����� 1500�� ����
        UPDATE VIEW_MEM_MILEAGE
           SET ���ϸ��� = 1500
         WHERE ȸ����ȣ = 'e001';
         -- ���� �Ϸ��� ���� ���ǿ� ����Ǳ⶧���� ���� �Ұ�.
    
    ** ȸ�����̺�(MEMBER)���� ������ ȸ��('e001')�� ���ϸ����� 1500�� ����
        UPDATE MEMBER
           SET MEM_MILEAGE = 1500
         WHERE MEM_ID = 'e001';
         --���� ���̺��� ������ ����. �׷��Ƿ� �����ϴ�.
         