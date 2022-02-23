2021-07-06
1) SQL ����� ����
    (1) Query
        ���� �� ��ȸ
        SELECT ��
    (2) DML(Data Manipulation Language : ������ ���۾�)
        INSERT, UPDATE, DELETE ��
    (3) DCL(Data Control Language : ������ �����)
        COMMIT, ROLLBACK, SAVEPOINT, GRANT
    (4) DDL(Data Definition Language : ������ ���Ǿ�)
        CREATE, DROP, ALTER

2) CREATE ��ɾ�
    CREATE ��üŸ�� ��ü��;
    **��üŸ��: �����Ϸ� �ϴ� ��ü�� ������ USER, VIEW, INDEX, SYNONYM, TABLE...etc
    
    ��뿹) ���̺� ����
            CREATE TABLE EMPLOYEE(
                EMP_ID  CHAR(4) NOT NULL,
                EMP_NAME  VARCHAR2(30) NOT NULL,
                E_ADDR  VARCHAR2(80),
                E_TEL  VARCHAR2(20),
                E_POSITION  VARCHAR2(30),
                E_DEPT  VARCHAR2(50),
                CONSTRAINT PK_EMPLOYEE PRIMARY KEY(EMP_ID));

            CREATE TABLE SITE(
                SITE_ID CHAR(4),
                SITE_NAME VARCHAR2(30) NOT NULL,
                SITE_ADDR VARCHAR2(80),
                REMARKS VARCHAR2(255),
                CONSTRAINT pk_site PRIMARY KEY(SITE_ID));

            CREATE TABLE WORK(
                EMP_ID   CHAR(4) NOT NULL,
                SITE_ID   CHAR(4) NOT NULL,
                INPUT_DATE DATE,
                CONSTRAINT PK_WORK PRIMARY KEY(EMP_ID,SITE_ID),
                CONSTRAINT FK_WORK_EMP FOREIGN KEY (EMP_ID)
                    REFERENCES EMPLOYEE(EMP_ID),
                CONSTRAINT FK_WORK_SIT FOREIGN KEY (SITE_ID)
                    REFERENCES SITE(SITE_ID));

    ��뿹) ����� ����
            CREATE USER ������ IDENTIFIED BY ��ȣ;
    
3) GRANT ��ɾ�
    ��뿹) ���Ѻο�
            GRANT CONNECT, RESOURCE, DBA TO ������;
    
    
4) INSERT ��ɾ�
    INSERT INTO ���̺��[(�÷���,...)]
        VALUES (������,...);
        
    ��뿹) 
            INSERT INTO SITE(SITE_ID,SITE_NAME,SITE_ADDR,REMARKS)
                VALUES ('S100','�����ʵ��б���������','������ �߱� ���ﵿ',NULL);
5) DELETE ��ɾ�
    DELETE ���̺��
        [WHERE ����];
    **ROLLBACK�� ���
    **����(�θ� ���̺�)�� ������ �ڷ�� ������ �� ����.
    ��뿹) ������̺��� 'A101'��������� �����Ͻÿ�.
            DELETE EMPLOYEE
                WHERE UPPER(EMP_ID)='A101';
                
                
6) SELECT ��ɾ�
    - ���� ���� ���Ǵ� SQL ��
    - �ڷ� �˻�(��ȸ)���
    SELECT [DISTINCT(�ߺ�����)] �÷��� [AS]["][��Ī(��ɹ��� ���� " " �� �����)]["][,]
                      .
                      .
                �÷��� [AS]["][��Ī]["]
        FROM ���̺�� [��Ī]
        [WHERE ����]
        [GROUP BY �÷���[,�÷���,...]]
        [HAVING ����]
        [ORDER BY �÷���|�÷��ε��� [ASC|DESC]
                    [,�÷���|�÷��ε��� [ASC|DESC],...]]
    ��뿹) ȸ�����̺� (MEMBER)�� �ֹι�ȣ(MEM_REGNO1)�� ����Ͽ� ȸ���� ���̸� ��ȸ�Ͻÿ�.
            Alias ȸ����ȣ, ȸ����, �ֹι�ȣ, ����
    
            SELECT MEM_ID AS ȸ����ȣ,
                    MEM_NAME AS ȸ����,
                    MEM_REGNO1||'-'||MEM_REGNO2 AS �ֹι�ȣ,
                    EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(MEM_REGNO1,1,2))+1900) AS ����
                FROM MEMBER
                
    ��뿹) ȸ�����̺��� ����ȸ�������� ��ȸ�Ͻÿ�.
            Alias ȸ����ȣ, ȸ����, �������, ���ϸ���,���
            SELECT MEM_ID AS ȸ����ȣ, 
                MEM_NAME AS ȸ����, 
                MEM_REGNO2 AS �������,
                MEM_MILEAGE AS ���ϸ���,
                CASE WHEN SUBSTR(MEM_REGNO2,1,1)='2' OR 
                            SUBSTR(MEM_REGNO2,1,1)='4' THEN
                                '����ȸ��'
                    ELSE
                                '����ȸ��'
                    END AS ���
                FROM MEMBER
                WHERE SUBSTR(MEM_REGNO2,1,1)=ANY('2','4');
        
            SELECT MEM_ID, MEM_REGNO1, MEM_REGNO2, MEM_BIR
                FROM MEMBER
                WHERE MEM_ID IN ('d001','v001','n001');
                
                
7) ������
    ��뿹) HR������ ������̺��� ���ʽ��� ����Ͽ� �޿��� ���ݾ��� ��ȸ�Ͻÿ�.
            SELECT SALARY + (SALARY*COMMISSION_PCT*0.35)
                FROM EMPLOYEES;
    
    ��뿹) ȸ�����̺��� ���ϸ����� 4000�̻��� ȸ���� ȸ����ȣ, ȸ����, ����, ���ϸ����� ��ȸ�Ͻÿ�
            ���ϸ����� ���� ȸ������ ��ȸ
            
            SELECT MEM_ID AS ȸ����ȣ,
                    MEM_NAME AS ȸ����,
                    MEM_JOB AS ����
        --            MEM_MILEAGE AS ���ϸ���
                FROM MEMBER
                WHERE MEM_MILEAGE >=4000
                ORDER BY MEM_ID,MEM_MILEAGE DESC;
        
                     
8) UPDATE ��
            
    ��뿹) ȸ�����̺� ���� ����
            1) d001ȸ���� �ֹι�ȣ 460409-2000000, ������� 1946/04/09 
                     ==> �ֹι�ȣ 010409-4234765, ������� 2001/04/09
                UPDATE MEMBER 
                    SET MEM_REGNO1 = "010409",
                        MEM_REGNO2 = "4234765",
                        MEM_BIR = TO_DATE('20010409')
                    WHERE MEM_ID='d001';
                    
            2) n001ȸ���� �ֹι�ȣ 750323-1011014, ������� 1975/03/23 
                     ==> �ֹι�ȣ 000323-3011014, ������� 2000/03/23
                UPDATE MEMBER 
                    SET MEM_REGNO1 = "000323",
                        MEM_REGNO2 = "3011014",
                        MEM_BIR = TO_DATE('000323')
                    WHERE MEM_ID='n001';              
                    
            3) v001ȸ���� �ֹι�ȣ 520131-2402712, ������� 1952/01/31 
                     ==> �ֹι�ȣ 020131-4402712, ������� 2002/01/31 
                UPDATE MEMBER 
                    SET MEM_REGNO1 = "020131",
                        MEM_REGNO2 = "4402712",
                        MEM_BIR = TO_DATE('020131')
                    WHERE MEM_ID='v001';
                 
                    
9) �� ������
      ----------------------------
      �Է�       ���       
      A   B    (OR) (AND) (EX-OR)
      0   0     0     0     0
      0   1     1     0     1 
      1   0     1     0     1 
      1   1     1     1     0 
      ----------------------------
    MEM_MILEAGE>=2000 OR EXTRACT(YEAR FROM MEM_BIR) <=2000

    ��뿹) ������̺��� ��ձ޿� �̻� �޿��� �޴� ����� ��ȸ�Ͻÿ�
            Alias �����ȣ, �����, �޿�, �μ���ȣ
            SELECT EMPLOYEE_ID AS �����ȣ,
                    FIRST_NAME AS �����,
                    SALARY AS �޿�,
                    DEPARTMENT_ID AS �μ���ȣ,
                    ROUND((SELECT AVG(SALARY)
                            FROM HR.EMPLOYEES),0) AS ��ձ޿�
                FROM HR.EMPLOYEES
                WHERE SALARY >= (SELECT AVG(SALARY)
                                        FROM HR.EMPLOYEES)
                ORDER BY 4;


10) ALTER ��ɾ�
    (1) �÷��� �߰�
        (�������)
        ALTER TABLE ���̺��
            ADD (�÷��� ������Ÿ��[(ũ��)] [DEFAULT �ʱⰪ]);     
        
    (2) �÷��̸� ����
        (�������)
        ALTER TABLE ���̺�� 
            RENAME COLUMN �����÷��� TO ���ο��÷���;
        
    (3) �÷�Ÿ�� ����
        (�������)
        ALTER TABLE ���̺��
            MODIFY (�÷��� ������Ÿ��[(ũ��)] [DEFAULT �ʱⰪ]);
    
    (4) �÷� ����
        (�������)
        ALTER TABLE ���̺��
            DROP COLUMN �÷���;
    
    (5) ��뿹
    ** ������̺��� FIRST_NAME�� LAST_NAME�� ���ļ� EMP_NAME VARCHAR(80) �̶�� �÷����� �ٲܰ�.
        (EMP_NAME�� ��)
        ALTER TABLE HR.EMPLOYEES 
            ADD(EMP_NAME VARCHAR(80));
        COMMIT;
        
        (FIRST_NAME�� LAST_NAME�� ���� EMP_NAME�� ����)
        UPDATE HR.EMPLOYEES
            SET EMP_NAME=FIRST_NAME||' '||LAST_NAME;

10) ��Ÿ ������
    (1) IN
        - �־��� �� �� ��� �ϳ��� ��ġ�ϸ� TRUE�� ��ȯ
        - OR �����ڷ� ġȯ ����
        - NOT IN �� ���� ��
        (�������)
            expr(�÷��� �Ǵ� ��) IN(��1,[,��2,...])
    
        ��뿹) ������̺��� 10,30,40,60�� �μ��� ���� ������� �����ȣ, �����, �μ��ڵ�,
                �Ի����� ��ȸ�Ͻÿ�.
                (IN ������ ���)
                SELECT EMPLOYEE_ID AS �����ȣ,
                        EMP_NAME AS �����,
                        DEPARTMENT_ID AS �μ��ڵ�,
                        HIRE_DATE AS �Ի���
                    FROM HR.EMPLOYEES
                    WHERE DEPARTMENT_ID NOT IN (10,30,40,60)
                    ORDER BY 3;
                
                (ANY(SOME) ������ ���)
                SELECT EMPLOYEE_ID AS �����ȣ,
                        EMP_NAME AS �����,
                        DEPARTMENT_ID AS �μ��ڵ�,
                        HIRE_DATE AS �Ի���
                    FROM HR.EMPLOYEES
                    WHERE DEPARTMENT_ID =ANY(10,30,40,60)
                    WHERE DEPARTMENT_ID =SOME(10,30,40,60)
                    ORDER BY 3;
                    
    (2) ALL (Multi Value)
        - ( )�ȿ� �־��� ������ ��� �����ؾ� ����� ��(TRUE)�� ��.
        - AND�� ġȯ ����
        
        (�������)
            �÷��� ���迬����ALL (��1[,��2,...])
            
        ��뿹) ������̺��� 20,40,70�� �μ��� ���� ������� �޿����� ���� ����� 
                �����ȣ, �����, �޿�, �μ���ȣ�� ��ȸ�Ͻÿ�
                SELECT EMPLOYEE_ID AS �����ȣ,
                        EMP_NAME AS �����,
                        SALARY AS �޿�,
                        DEPARTMENT_ID AS �μ���ȣ
                FROM HR.EMPLOYEES
                WHERE SALARY> ALL(SELECT MAX(SALARY)
                                    FROM EMPLOYEES
                                    WHERE DEPARTMENT_ID IN (20,40,70));
                --���� �Ϸ��� MAX�����ڸ� ���� �Ǵµ� �װ� ����� ��쿡 �̷��� ��
    
    (3) BETWEEN A AND B (��¥)
        - ������ �����Ͽ� ���� ��ȸ�ϴ� ���ǹ� ������ ���
        - �� ������ 'AND'�� ġȯ ����
        
        ��뿹) �����������̺�(BUYPROD)���� 2005�� 3�� ������Ȳ�� ����Ͻÿ�
                Alias�� ��¥, ��ǰ�ڵ�, ���Լ���, ���Աݾ��̴�.
                (AND ������ ���)
                SELECT BUY_DATE AS ��¥,
                        BUY_PROD AS ��ǰ�ڵ�,
                        BUY_QTY AS ���Լ���,
                        BUY_QTY*BUY_COST AS ���Աݾ�
                FROM BUYPROD 
                WHERE BUY_DATE>=TO_DATE('20050301') 
                 AND BUY_DATE<=LAST_DAY(TO_DATE('20050301'));    
    
                (BETWEEN ������ ���)
                SELECT BUY_DATE AS ��¥,
                        BUY_PROD AS ��ǰ�ڵ�,
                        BUY_QTY AS ���Լ���,
                        BUY_QTY*BUY_COST AS ���Աݾ�
                FROM HR.BUYPROD 
                WHERE BUY_DATE BETWEEN TO_DATE('20050301') AND LAST_DAY(TO_DATE('20050301'));
        
        ��뿹) ȸ�����̺��� 40�� ȸ���� ȸ����ȣ, ȸ����, ���ϸ����� ��ȸ�Ͻÿ�
                SELECT MEM_ID AS ȸ����ȣ,
                        MEM_NAME AS ȸ����,
                        MEM_MILEAGE AS ���ϸ���
                FROM LYW96.MEMBER
                WHERE EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(MEM_BIR,1,4))) BETWEEN 40 AND 49;
            --  WHERE EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM MEM_BIR) 
                ** EXTRACT �Լ�
                ** ȸ���� ������� �÷����� ���� �����Ͻÿ�.
                    SELECT EXTRACT(MONTH FROM MEM_BIR),
                            TO_MEMBER(SUBSTR(MEM_BIR,5,2))
                        FROM MEMBER;
                ** ȸ�����̺��� �̹��޿� ������ �ִ� ȸ����ȣ, ȸ������ ��ȸ
                    SELECT MEM_ID,MEM_NAME
                        FROM MEMBER
                        WHERE EXTRACT(MONTH FROM SYSDATE)=SUBSTR(MEM_BIR,6,2)
                        
        ��뿹) �з��ڵ尡 P2�� �����ϴ� ��ǰ�� ���Ͽ� 2005�� 5�� ��������� ��ȸ�Ͻÿ�
                Alias ��ǰ�ڵ�, ��ǰ��, �Ǹż���, �ݾ�
                SELECT CART_PROD AS ��ǰ�ڵ�, 
                        PROD_NAME AS ��ǰ��, 
                        SUM(CART_QTY) AS �Ǹż���,
                        SUM(CART_QTY*PROD_PRICE) AS �ݾ�
                    FROM CART, PROD
                    WHERE CART_PROD=PROD_ID
                    AND CART_NO LIKE '200505%'
                    AND PROD_LGU BETWEEN 'P200' AND 'P299'
                    GROUP BY CART_PROD,PROD_NAME
                    ORDER BY 1;
                    
                    
                    
        ��뿹) �з��ڵ尡 P2�� �����ϴ� ��ǰ�� ���Ͽ� 2005�� 5�� ��������� ��ȸ�Ͻÿ�
                Alias ��ǰ�ڵ�, ��ǰ��, /*�з��ڵ�*/, /*�з���*/, �Ǹż���, �ݾ�       
                    
                SELECT A.PID AS ��ǰ�ڵ�,
                        A.PNAME AS ��ǰ��,
                        LPROD_GU AS �з��ڵ�,
                        LPROD_NM AS �з���,
                        A.QAMT AS �Ǹż���,
                        A.MAMT AS �ݾ� 
                FROM LPROD,(SELECT CART_PROD AS PID, 
                                    PROD_NAME AS PNAME, 
                                    SUM(CART_QTY) AS QAMT,
                                    SUM(CART_QTY*PROD_PRICE) AS MAMT
                                FROM CART, PROD
                                WHERE CART_PROD=PROD_ID
                                    AND CART_NO LIKE '200505%'
                                    AND PROD_LGU BETWEEN 'P200' AND 'P299'
                                GROUP BY CART_PROD,PROD_NAME) A,
                    PROD
                WHERE PPROD_ID = A.PID
                AND PROD_LGU=LPROD_GU
                ORDER BY 1;
                
    (4) LIKE ������(���ڿ��� ���� �� �����.)
        - ������ ���� �� ���
        - ���ϵ�ī��� '%'�� '_'�� ���Ǿ� ���� ���ڿ��� ����
        - '%' : '%'�� ���� ��ġ ������ ��� ���ڿ��� ����
            ex) '����%' : '����'���� �����ϴ� ��� �ܾ�� ������
                '��%��' : ù ���ڰ� '��'�̰� ������ ���ڰ� '��'�� ��� �ܾ�� ������
                '%��'   : �����ڰ� '��'�� ��� �ܾ�� ������
                
        ��뿹) ȸ�����̺��� ������ �����ϴ� ȸ������ ��ȸ�Ͻÿ�
                Alias ȸ����ȣ, ȸ����, �ּ�, ����, ���ϸ���
                SELECT MEM_ID AS ȸ����ȣ, 
                        MEM_NAME AS ȸ����,
                        MEM_ADD1||' '||MEM_ADD2 AS �ּ�,
                        MEM_JOB AS ����,
                        MEM_MILEAGE AS ���ϸ���
                    FROM MEMBER
                    WHERE MEM_ADD1 LIKE '����%';
        
        ����) ��ٱ������̺��� 2005�� 7�� �Ǹ���Ȳ�� ��ȸ�Ͻÿ�
                Alias ����, ��ǰ�ڵ�, �Ǹż���
                SELECT TO_DATE(SUBSTR(CART_NO,1,8)) AS ����, 
                                CART_NO AS ��ǰ�ڵ�, 
                                CART_QTY AS �Ǹż���
                FROM CART
                WHERE TO_DATE(SUBSTR(CART_NO,1,8)) BETWEEN TO_DATE('20050701') AND TO_DATE('20050731');

    
    
11) ������ Ÿ��
    - ����Ŭ���� ���Ǵ� ������Ÿ���� ���ڿ�, ����, ��¥, 2���ڷ����� ����
    (1) ���ڿ� �ڷ�
        - ����Ŭ�� ���ڿ��� ' '�� ���� ǥ��
        - ��������(CHAR)�� ��������(VARCHAR, VARCHAR2, NVARCHAR2(UTF-8�̳� UTF-16���� ��ȯ�� �����͸� ����), CLOB)Ÿ������ ����
        - ������ ����, Ư�����ڴ� 1BYTE�� �ѱ��� 3BYTE�� ǥ��
        a. CHAR(�⺻Ű���� ���)
           - ���̰� ������ �÷��̳� �⺻Ű �÷��� ������ Ÿ������ �ַ� ���
           - ���ǵ� ũ���� �������� �ڷḦ �����ϰ� ���� ������ �������� ä��
           - �����ʹ� MSB���� LSB������ ����
            (�������)
                �÷��� CHAR(ũ�� [BYTE|CHAR]);
                - �ִ� 2000BYTE ���� ���尡��
                - 'BYTE|CHAR' : �����ϸ� BYTE�� ��޵Ǹ� 'CHAR'�� ���Ǹ� 'ũ��'�� ���ڼ��� ��Ÿ��.
                                �ٸ�, CHAR�� ����ص� �ִ� 2000BYTE�� �ʰ��� �� ����.
            ��뿹) 
                CREATE TABLE T_CHAR(
                    COL1 CHAR(20),
                    COL2 CHAR(20 CHAR),
                    COL3 CHAR(20 BYTE));
                    
                INSERT INTO T_CHAR(COL1, COL2, COL3)
                    VALUES('����ȭ ���� ��','����ȭ ���� �Ǿ����ϴٿ�','����ȭ');
                SELECT * FROM T_CHAR;
                SELECT LENGTHB(COL1),LENGTHB(COL2),LENGTHB(COL3)
                    FROM T_CHAR;
                    
        b. varchar2
            - �������� �ڷ����忡 ���
                (�������)
                    �÷��� VARCHAR2(ũ�� [BYTE|CHAR])
                    - �ִ� 4000BYTE���� ���� ����
                    - ����ڰ� ������ �����͸�ŭ ����ϰ� ���� ������ SYSTEM�� ��ȯ
                ��뿹) 
                    CREATE TABLE T_VARCHAR2(
                        COL1 VARCHAR(500),
                        COL2 VARCHAR(50 CHAR),
                        COL3 VARCHAR(50 BYTE));
                    
                    INSERT INTO T_VARCHAR2
                        VALUES('IL POSTONO','�ʸ� ���ܷ�','���ø� Ʈ���̽�');
                    INSERT INTO T_VARCHAR2
                        VALUES('PERSIOMON BANNA APLLE','PERSIOMON BANNA','PERSIOMON ');
                    SELECT * FROM T_VARCHAR2;
                    SELECT LENGTHB(COL1),LENGTHB(COL2),LENGTHB(COL3)
                        FROM T_VARCHAR2;
                    
        c. VARCHAR, NVARCHAR, NVARCHAR2
            - �⺻������ NVARCHAR2�� ���� ����� ����
            - NVARCHAR, NVARCHAR2�� UTF-8(��������), UTF-16(��������)����� �ڵ�� 
                ��ȯ�Ͽ� �ڷ� ����(����ǥ���ڵ� ����)
            
         d. LONG
            - �������� �ڷḦ ����
            - �ִ� 2GB���� ���� ����
            - �� ���̺� �ϳ��� �÷��� ��밡��(�������)
            - CLOB�� ��ü ����
            - ���ڿ� �Լ�(LENGTH, LENGTHB, SUBSTR ��) ����� ���ѵ�
                (�������)
                    �÷��� LONG
                ��뿹)
                    CREATE TABLE T_LONG(
                        COL1 VARCHAR2(100),
                        COL2 LONG,
                        COL3 CHAR(100));
                    
                    INSERT INTO T_LONG
                        VALUES('PERSIMON BANNA APLLE','PERSIMON BANNA','PERSIMON ');
                    SELECT * FROM T_LONG;
                    SELECT COL1,COL2,TRIM(COL3) FROM T_LONG;
                    SELECT LENGTHB(COL1),LENGTHB(COL3)
                        FROM T_LONG;
                    
         e. CLOB(Char Large OBject)
            - �������� �ڷḦ ����
            - �ִ� 4GB���� ���� �ڴ�
            - ���� �÷��� �ϳ��� ���̺� ���� ����
            - �Ϻ� ����� DBMS_LOB API�� ������ �޾ƾ� ��� ����(LENGTH, SUBSTR ��)
                (�������)
                    �÷��� CLOB
                ��뿹 
                    CREATE TABLE T_CLOB(
                        COL1 CLOB,
                        COL2 CLOB,
                        COL3 VARCHAR2(4000),
                        COL4 LONG);
                    INSERT INTO T_CLOB(COL1,COL2,COL4)
                        VALUES('������ �߱� ���ﵿ ���κ���',
                        '������ �߱� ���ﵿ ���κ���','������ �߱� ���ﵿ ���κ���');
                    SELECT * FROM T_CLOB;
                    SELECT DBMS_LOB.GETLENGTH(COL1),
--                            DBMS_LOB.GETLENGTH(COL2),
                            SUBSTR(COL1,5,6),--5��° ���ں��� 6��
                            DBMS_LOB.SUBSTR(COL1,5,6)--6��° ���ں��� 5��
                        FROM T_CLOB;
                        
                        
    (2) ���� �ڷ�
        - NUMBER Ÿ���� ����
        - ������� : 1.0 x 10^-130 ~ 0.999...9 x 10^125
        - ���е� : ��ü�ڸ���(1~30)
        - ������(���) : �Ҽ��� ������ �ڸ���
          ������(����) : �����κ��� �ڸ���
          ������ ���� 84 ~ 127
        - 20 BYTE�� ǥ��
            (�������)
                �÷��� NUMBER[(���е�|*[,������])]
            ��� ��)
                NUMBER, NUMBER(10), NUMBER(10,2), NUMBER(*,2)...
                -------------------------------------------------
                �Է°�          ����                  ���Ǵ� ��
                -------------------------------------------------
                123456.6789     NUMBER              123456.6789
                123456.6789     NUMBER(10)=(10,0)   1234567        (�Ҽ� ù��° �ڸ����� �ݿø�)
                123456.6789     NUMBER(7,2)         ����           (�����κ��� �ּ� 6���� �ʿ��ѵ� �Ҽ� 2�ڸ�, ���� 5(7-2)�ڸ���)
                123456.6789     NUMBER(*,2)         123456.68      (�Ҽ� 2°�ڸ����� ǥ���ϰڴ�.)
                123456.6789     NUMBER(10,-2)       123500         (���� 2°�ڸ�(10�� �ڸ�)���� �ݿø�)
                --------------------------------------------------
                
                CREATE TABLE T_NUMBER(
                    COL1 NUMBER,
                    COL2 NUMBER(10),
                    COL3 NUMBER(7,2),
                    COL4 NUMBER(*,2),
                    COL5 NUMBER(10,-2));
                
                INSERT INTO T_NUMBER
                    VALUES(123456.6789,123456.6789,123456.6789,123456.6789,123456.6789);
                
                INSERT INTO T_NUMBER(COL5)
                    VALUES(123456.6789);
                SELECT * FROM T_NUMBER;
            **������>���е�
                - ������ : �Ҽ��� ������ ������ ��
                - ������ - ���е�: �Ҽ��� ���Ͽ� �����ؾ� �� 0�� ����
                - ���е� : �Ҽ������Ͽ� 0�� �ƴ� �ڷ��
                -------------------------------------------------
                �Է°�          ����                  ���Ǵ� ��
                -------------------------------------------------
                1.234           NUMBER(4,5)          ����         (�����κп� 0�� �ƴ� ���� ����) 
                0.23            NUMBER(3,5)          ����         (0.00���� �����ؾ���)
                0.0023          NUMBER(3,5)          ����         (��ȿ���ڰ� ����)
                0.0023          NUMBER(2,4)          0.0023
                0.012345        NUMBER(3,4)          0.0123
                --------------------------------------------------
                
        
    (3) ��¥ �ڷ�   
        - data, timestamp Ÿ������
        - ������ ������ ���
        a. date
            - �⺻ ��¥��
            - ����Ͻú��� ������ �������
            - ��¥�� �ڷ��� ���� : �� ��¥������ �ϼ� ��ȯ
            - ��¥�� + ���� : '��¥'���� '����'��ŭ ����� ���� ��¥ ��ȯ
            - ��¥�� - ���� : '��¥'���� '����'��ŭ ������ ��¥ ��ȯ
            (�������)
                �÷��� DATE;
                
        b.TIMESTAMP
            - �ð��� ������ ������ �ð�(10����� 1��) ����
            (�������)
                �÷��� TIMESTAMP; --�ð��� ���� ���� ��¥ ����
                �÷��� TIMESTAMP WITH TIME ZONE; --�ð��� ����(���ø�/�����)�� ��¥ ����
                �÷��� TIMESTAMP WITH LOCAL TIME ZONE; --������ ��ġ�� ������ �ð��� ����(���ø�/�����)�� ��¥ ����
            ��뿹)
                CREATE TABLE T_DATE(
                            COL1 DATE,
                            COL2 DATE,
                            COL3 TIMESTAMP,
                            COL4 TIMESTAMP WITH TIME ZONE,
                            COL5 TIMESTAMP WITH LOCAL TIME ZONE);
                INSERT INTO T_DATE 
                    VALUES(SYSDATE,TO_DATE('20210907'),TO_DATE('20210907'),SYSDATE,SYSDATE);
                SELECT COL2-COL1 FROM T_DATE;        
                SELECT TO_CHAR(COL1,'YYYY-MM-DD AM HH24:MI:SS'),
                        TRUNC(COL2-COL1) --TRUNC():���� �Լ�
                    FROM T_DATE;
        
        
    (3) ��Ÿ �ڷ�
        - 2�� �ڷḦ ����(16���� ����� ���� ���)
        - RAW, LONG RAW, BLOB, BFILE
        a. BFILE
            - 2�� �ڷ� ����
            - �����ڷḦ �����ͺ��̽� �ܺο� �����ϰ� �����ͺ��̽����� ��������� ����
            - 4GB ���� ����
            - ����Ŭ������ �����ڷ�(2���ڷ�)�� ���Ͽ� �ؼ��ϰų� ��ȯ���� ����
            - 2���ڷ� ������ ���� DIRECTORY ��ü�� �ʿ�
            (�������)
                �÷��� BFILE;
            ��뿹)
                CREATE TABLE T_BFILE(
                            COL1 BFILE);
                ��. ���丮 ��ü ����
                GRANT  CONNECT, RESOURCE, DBA TO HR;
                    (�������)
                        CREATE DIRECTORY ���丮��Ī AS �����θ�
                    ��뿹)
                        CREATE DIRECTORY TEMP_DIR AS 'D:\A_TeachingMaterial\2.Oracle\workspace';
--                        ALTER USER GRANT CONNECT, RESOURCE, DBA TO HR;
                ��. �̹��� �ڷ� ����
                    (�������)
                        INSERT INTO ���̺��
                            VALUES (BFILENAME(���丮��Ī,'���ϸ�');
                    ��뿹
                        INSERT INTO B_FILE
                            VALUES (BFILENAME('TEMP_DIR','SAMPLE.jpg'));
                    GRANT CONNECT TO HR;
                    
        b. BLOB
            - 2�� �ڷ�����
            - 4GB���� ���� ����
            - �����ڷḦ �����ͺ��̽� ���ο� ����
            (�������)
                �÷��� BLOB;
            ��뿹)
                ��. ���̺� ����
                    CREATE TABLE B_BLOB(
                            COL1 BLOB);
                ��. ���丮��ü ����
                    CREATE DIRECTORY ���丮�� AS '�����ּ�';
                ��. �͸��� ����
                    DECLARE
                        L_DIR VARCHAR2(20) :='TEMP_DIR';
                        L_FILE VARCHAR2(30) :='SAMPLE.jpg';
                        L_DFILE BFILE;
                        L_BLOB BLOB;
                    BEGIN
                        INSERT INTO T_BLOB(COL1) VALUES(EMPTY_BLOB())
                            RETURN COL1 INTO L_BLOB;
                        L_BFILE:=BFILENAME(L_DIR,L_FILE);
                        DBMS_LOB.FILEOPEN(L_BFILE,DBMS_LOB.FILE_READONLY);
                        DBMS_LOB.LOADFROMFILE(L_BLOB,L_FILE,DBMS_LOB.GETLENGTH(L_BFILE));
                        DBMS_LOB.FILECLOSE(L_BFILE);
                        
                        COMMIT;
                    END;
                
                
            
        
            
        
        
        
        
        
        
        