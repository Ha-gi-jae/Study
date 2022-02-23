2021_0713_01)
    3. ��¥ �ڷ�
        - date, timestamp Ÿ������
        - ������ ������ ���
      1)date
          �⺻ ��¥��
      (�������)
        �÷��� DATE
        - �� �� �� �� �� �� ������ �������
        - ��¥�� �ڷ��� ���� : �γ�¥������ �ϼ� ��ȯ
        - ��¥�� + ���� : '��¥'���� '����'��ŭ ����� ���� ��¥ ��ȯ
        - ��¥�� - ���� : '��¥'���� '����'��ŭ ������ ��¥ ��ȯ
        
      1)timestamp
          �ð��� ������ ������ �ð�(10����� 1��) ����
      (�������)
        �÷��� timestamp; -- �ð��� ���� ���� ��¥ ����
        �÷��� timestamp with time zone; -- �ð��� ����(���ø�/�����)�� ��¥ ����
        �÷��� timestamp with local time zone; -- ������ ��ġ�� ������ �ð��� ����(���ø�/�����)�� ��¥ ����
        -- timestamp�� ��� ���� ex)����.
        
        
��뿹) CREATE TABLE T_DATE(
            COL1 DATE,
            COL2 DATE,
            COL3 TIMESTAMP,
            COL4 TIMESTAMP WITH TIME ZONE,
            COL5 TIMESTAMP WITH LOCAL TIME ZONE);
            
            INSERT INTO T_DATE VALUES(SYSDATE, TO_DATE('20201015')+30,SYSDATE,SYSDATE,SYSDATE);
            
                SELECT * FROM T_DATE;
                
            SELECT TO_CHAR(COL1,'YYYY-MM-DD PM HH24:MI:SS'),
                   TRUNC(COL1-COL2)
               FROM T_DATE;
    
    
    4.��Ÿ �ڷ�
       - 2�� �ڷḦ ����
       - RAW, LONG RAW, BLOB, BFILE
                -- 4�Ⱑ �ȿ� // �ۿ�
 
      1)BFILE
          2�� �ڷ� ����
          �����ڷḦ �����ͺ��̽� �ܺο� �����ϰ� �����ͺ��̽����� ��������� ����
          4GB ���� ����
      (�������)
         �÷��� BFILE;
            - ����Ŭ������ �����ڷ�(2���ڷ�)�� ���Ͽ� �ؼ��ϰų� ��ȯ���� ����
            - 2���ڷ� ������ ���� DIRECTORY ��ü�� �ʿ� 
            -- ���ϸ��� �ѱ��̸� DIRECTORY�� ������
            
��뿹)
        CREATE TABLE T_BFILE(
            COL1 BFILE);
        
        
      1. ���丮 ��ü ����
         CREATE DIRECTORY ���丮��Ī AS '�����θ�';
         
         CREATE DIRECTORY TEMP_DIR AS 'D:\A_TeachingMaterial\2.Oracle';
            
      2. �̹��� �ڷ� ����
         INSERT INTO ���̺��
              VALUES(BFILENAME('���丮 ��Ī', '���ϸ�'));
              
         INSERT INTO T_BFILE
              VALUES(BFILENAME('TEMP_DIR', 'SAMPLE.JPG'));
            
            
         SELECT * FROM T_BFILE;   
            
      2) BLOB
           2�� �ڷ�����
           4GB ���� ���� ����
           �����ڷḦ �����ͺ��̽� ���ο� ����
      (�������)
         �÷��� BLOB;
           
           
       ** BLOB ������
            (1)���̺� ����
            (2)���丮��ü ����
            (3)�͸��� ����
            
��뿹) 
       a)���̺� ����
        CREATE TABLE T_BLOB(
            COL1 BLOB);
       
       b)���丮 ����
        TEMP_DIR ���
        
       C)�͸��� ����
       
        DECLARE
            L_DIR VARCHAR2(20) := 'TEMP_DIR'; --���丮���� 20byte ���ϸ��� 30byte ����. �ý��ۿ��� �������ִ� ����.
            L_FILE VARCHAR2(30) := 'SAMPLE.JPG';
            L_BFILE BFILE;
            L_BLOB BLOB;
         BEGIN
            INSERT INTO T_BLOB(COL1) VALUES(EMPTY_BLOB())
                RETURN COL1 INTO L_BLOB;
            L_BFILE:=BFILENAME(L_DIR, L_FILE);
            DBMS_LOB.FILEOPEN(L_BFILE, DBMS_LOB.FILE_READONLY);
            DBMS_LOB.LOADFROMFILE(L_BLOB, L_BFILE, DBMS_LOB.GETLENGTH(L_BFILE));
            DBMS_LOB.FILECLOSE(L_BFILE);
            
            COMMIT;
         END;   
            
         SELECT * FROM T_BLOB;
         
            
            
            
          
               
               