1.��ü
    (1) VIEW ��ü
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
             
            ** ������ �� 'VIEW_MEM_MILEAGE'���� ȸ����ȣ 'e001'ȸ���� ���ϸ����� 500���� �����Ͻÿ�.
                UPDATE VIEW_MEM_MILEAGE
                   SET ���ϸ��� = 500        --�÷����� '���ϸ���' ��.
                 WHERE ȸ����ȣ = 'e001';
                -- �� ���̺� ������ ���ϸ��� 3000�̻��ε� 'e001' ȸ���� ���ϸ����� 500���� �����߱� ������ �信�� ���ܵȴ�. + ���̺����� 500���� ����ȴ�.
                
                SELECT MEM_ID,MEM_NAME,MEM_MILEAGE
                  FROM MEMBER
                 WHERE MEM_ID = 'e001';
                 
            ** ȸ�����̺��� ȸ����ȣ 'g001'ȸ���� ���ϸ����� 800���� 15000���� �����Ͻÿ�.
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
    --      WITH CHECK OPTION  < �� �ΰ����� �丸 �ش� ���̺��� �ش� ���� ~~~~
            WITH READ ONLY; --�б⸸ �����ϹǷ� �並 ������� DML ����~ ���� ���̺�θ� ����~
            
            SELECT * FROM VIEW_MEM_MILEAGE;
            
        ** ��(VIEW_MEM_MILEAGE)���� ������ ȸ��('e001')�� ���ϸ����� 1500�� ����
            UPDATE VIEW_MEM_MILEAGE
               SET ���ϸ��� = 1500
             WHERE ȸ����ȣ = 'e001';
             -- ���� �Ϸ��� ���� ���ǿ� ����Ǳ⶧���� ���� �Ұ�.
        
        ** ȸ�����̺�(MEMBER)���� ������ ȸ��('e001')�� ���ϸ����� 1500�� ����
            UPDATE MEMBER
               SET MEM_MILEAGE = 6500
             WHERE MEM_ID = 'e001';
             --���� ���̺��� ������ ����. �׷��Ƿ� �����ϴ�.
             
    (2)SEQUENCE ��ü
        - ���������� �����ϴ� ���� ��ȯ�ϴ� ��ü.
        - ���̺�� ������
        - ������ ���̺��� �⺻Ű�� ������ ������ �÷��� ���� ���, �ڵ����� �ο��Ǵ� �������� ���� ���� �ʿ��� ��� ���
        (�������)
            CREATE SEQUENCE ��������
               [START WITH n] -- ���� ��, �����ϸ� �ּҰ�(MINVALUE)
               [INCREMENT BY n] -- ������, �����ϸ� 1
               [MAXVALUE n | NOMAXVALUE] -- �ִ밪, �⺻�� NOMAXVALUE�̸� 10^27
               [MINVALUE n | NOMINVALUE] -- �ּҰ�, �⺻�� NOMINVALUE�̰� ���� 1
               [CYCLE | NOCYCLE] -- �ּ�[�ִ�]�� ���� �� ���������� �ٽ� �������� ���� �⺻�� NOCYCLE
               [CACHE n | NOCACHE] -- ������ ���� ĳ���� �̸� �����ϰ� ������� ����, �⺻�� CACHE 20
               [ORDER | NOORDER] -- ������ ���Ǵ�� ������ ������ ����, �⺻�� NOORDER
               
        ** �ǻ��÷�
            - ��������.CURRVAL : '������'�� ������ �ִ� ���簪 ��ȯ
            - ��������.NEXTVAL : '������'�� ������ ��ȯ
            ** ������ ��ü�� ������ �� �� ó�� ����� �ݵ�� '��������.NEXTVAL'�̾�� ��
            ** ��������.NEXTVAL�� ����Ͽ� ������ ���� �ٽ� ������� �� ����
            
            ��뿹) ���̺� LPROD�� LPROD - ID(�� ����� �������� �����Ͻÿ�.
                SELECT MAX_(LPROD_ID) FROM LPROD;
                
                CREATE SEQUENCE SEQ_LPROD
                 START WITH 10;       
                
                INSERT INTO LPROD
                    VALUES(SEQ_LPROD.NEXTVAL, 'P501', '��깰');
                    
                SELECT * FROM LPROD;

            ��뿹) ������ 2005�� 4�� 18���̶�� �����ϰ� CART_NO�� �����Ͻÿ�.
                SELECT TO_CHAR(TO_DATE('2005/04/18'),'YYYYMMDD')||TRIM(TO_CHAR(TO_NUMBER(SUBSTR(MAX(CART_NO),9))+1,'00000'))
                  FROM CART
                 WHERE CART_NO LIKE '20050418%'
                 
            ** �������� ����� ���ѵǴ� ��� --INSERT�������� ���������� �� ���ִ�.
                - SELECT, DELETE, UPDATE���� ���Ǵ� ��������
                - VIEW�� ��������� QUERY
                - DISTINCT�� ���Ǵ� SELECT��
                - GROUP BY, ORDER BY���� ���Ǵ� SELECT��
                - ���տ���(UNION, UNION ALL, INTERSECT, MINUS)�� ���Ǵ� SELECT��
                - WHERE��
                
    (3) SYNONYM ��ü
        - ���Ǿ�(��Ī)�� �ǹ�
        - ����Ŭ���� ���Ǵ� ��ü�� ������ �̸��� �ο��Ͽ� ���� ��� ����
        - �ַ� ���̸��� ��ü���� ����ϱ� ���� ��ü������ ��ü �� �� ���
        (�������)
            CREATE [OR REPLACE] SYNONYM �ó봽�� FOR ��ü��
                - '��ü��'�� ������ �̸��� '�ó봽��'�� �ο�
                - �÷��� ��Ī�� ���̺��� ��Ī���� ������
                    - '�ó봽��'�� �ش� ���̺� �����̽� ��ü���� ���
                    - '�÷��� ��Ī�� ���̺��� ��Ī'�� �ش� ���������� ��� ����

            ��뿹) HR�� ���̺� EMPLOYEES, DEPARTMENTS, JOB_HISTORY�� EMP,DEPT,JOBH��Ī�� �ο��Ͻÿ�.
            CREATE OR REPLACE SYNONYM EMP FOR HR.EMPLOYEES;
            CREATE OR REPLACE SYNONYM DEPT FOR HR.DEPARTMENTS;
            CREATE OR REPLACE SYNONYM JOBH FOR HR.JOB_HISTORY;
        
            SELECT * FROM DEPT;
            SELECT * FROM JOBH;
            
    (4) INDEX ��ü
        - �������� �˻� ȿ������ �����ϱ� ���� ��ü
        - WHERE �������� ���Ǵ� �÷�, SORT�� GROUP�� �����÷� ���� �÷��� �������� INDEX�� �����ϸ� DBMS�� ���ϸ� �ٿ� ��ü ���� ���
        - ������ ������ �ҿ�(INDEX FILE), �ε��� ������ ���������� ���� �ý��� �ڿ� �ʿ�, ������ ���� � ���� �ð��� �ҿ�
        - �ε��� ����
            - Unique Index : �ߺ� ���� ������� �ʴ� �ε���
            - Non-Unique : �ߺ� ���� ����ϴ� �ε����� Null���� ����ϳ� �ϳ��� ��� -- �⺻��
            - Single Index : �ε��� ������ �ϳ��� �÷��� ���
            - Composite Index : �ε��� ������ �������� �÷��� ���Ǹ�, where���� ���� ��� �׸�(�ε��� �����׸�)�� ������ ȿ������ �����Ŵ
            - Normal Index : �⺻ �ε���(Ʈ������ ���-��� ����� ��� �˻�Ƚ���� ����)�� ROWID�� �÷� ������ �ּ� ����
            - Function-Based Normal Index : �ε��� ���� �÷��� �Լ��� ���� ���� where ������ ���� ���� �Լ� ����� ȿ���� ���� ���
            - Bitmap Index : ROWID�� �÷� ���� ����(binary)���� �������� �ּ� ����, Cardinality�� ���� ��� ȿ�����̸�, �߰�, ����, ������ ���� ��� ��ȿ����
        (�������)
            CREATE [UNIQUE|BITMAP] INDEX �ε�����
                ON ���̺��(�÷���1[, �÷���2,...][ASC|DESC]);
                
            ��뿹) ȸ�����̺��� �ֹι�ȣ�������� �ε����� �����Ͻÿ�.
                CREATE INDEX IDX_MEM_REGNO
                    ON MEMBER(MEM_REGNO1,MEM_REGNO2);
                
                CREATE INDEX IDX_MEM_NAME
                    ON MEMBER(MEM_NAME);
                    
                SELECT * FROM MEMBER
                 WHERE MEM_ADD1 LIKE '����%';
            
            ��뿹) ȸ�����̺��� MEM_REGNO2�� �ֹε�Ϲ�ȣ �� 2~5��° ���ڷ� ������ �ε����� �����Ͻÿ�.
            
            CREATE INDEX IDX_MEM_REGNO_SUBSTR
                ON MEMBER(SUBSTR(MEM_REGNO2,2,4));
            
            SELECT * FROM MEMBER
             WHERE SUBSTR(MEM_REGNO2,2,4)='4489';
            
            ** �ε����� �籸��
                - �ش� ���̺��� �ڷᰡ ���� ������ ���
                - �ε����� �ٸ� ���̺����̽��� �̵� ��Ų ��
                ALTER INDEX �ε����� REBUILD