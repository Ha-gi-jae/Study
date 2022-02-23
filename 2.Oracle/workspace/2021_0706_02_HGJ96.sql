2021_0706_02) SQL ����� ����
1)Query
    ���� �� ��ȸ
    SELECT ��
2)DML(Data Manipulation Language : ������ ���۾�)
    INSERT, UPDATE, DELETE ��
3)DCL(Data Control Language : ������ �����)
    COMMIT, ROLLBACK, SAVEPOINT, GRANT
4) DDL(Data Definition Language : ������ ���Ǿ�)
    CREATE, DROP, ALTER

(1) CREATE
    ����Ŭ ��ü�� ����
    (�������)
    CREATE ��üŸ�� ��ü��;
    ��üŸ�� : �����Ϸ� �ϴ� ��ü�� ������ USER, VIEW, INDEX, SYNONYM, TABLE...etc
   
    **���̺� �������
    CREATE TABLE ���̺��(
    �÷��� ������Ÿ��[(ũ��)] [NOT NULL] [DEFAULT ��] [,]
                       :
    �÷��� ������Ÿ��[(ũ��)] [NOT NULL] [DEFAULT ��] [,]
    --���̺���� �� �������� ������ �ܾ �ϴ°� ���� ex) a, b, c �� �ϸ� �ſ� �򰥸�. tbl_ //
    -- 1���̻��� �÷��� �־����. �� �������� ��ǥ �Ҽ��ִ� �ɷ� �̸�. NOT NULL ���� �����͸� �ݵ�� �����ؾ���.
    -- DEFAULT �ڿ� ����? 
    -- [,] �� ����� ���ӵǴ� ������ �ν���. ������ �� �������� �ν�.
    [CONSTRAINT �⺻Ű������ PRIMARY KEY(�÷���[,�÷���,...])][,]
    -- �ܷ�Ű ������ [,] �Ⱦ��� ������ ��.
    [CONSTRAINT �ܷ�Ű������ FOREIGN KEY(�÷���[,�÷���,...])
      REFERENCES ���̺��(�÷���)][,]
      -- ���̺���� ���� ���̺�� ������ ���� �� �Ű� �÷����� ���� �÷��� ���� �����Ѵٴ� �ǹ�.
                            :
    [CONSTRAINT �ܷ�Ű������ FOREIGN KEY(�÷���[,�÷���,...])
     REFERENCES ���̺��(�÷���)]);
    -- CONSTRAINT ��������
    -- pk_���̺�� fk_���̺�� �ߺ��Ǹ� �ȵ�. �ߺ��Ǹ� ����ã�� �����.
    -- �⺻Ű�� �����־����, NULL �ȵ�.
     '������Ÿ��' : CHAR, VARCHAR2, DATE, NUMBER, CLOB, BLOB �� ���
     'DEFAULT ��' : ����ڰ� ������ �Է½�(INSERT��)�����͸� ������� ���� ��� ����Ǵ� ��
     '�⺻Ű������', '�ܷ�Ű������' : �⺻Ű �� �ܷ�Ű ������ �����ϱ����� �ο��� �ε��������� ������ �ĺ��� �̾�� ��.
     'REFERENCES ���̺��(�÷���)' : �������̺��(�θ����̺��)�� �װ����� ���� �÷���
     
     
     
��뿹) ���������� �����ڷ� 97�� �� ERD�� �����Ͽ� ���, �����, ���������, �ٹ� ���̺��� �����Ͻÿ�.
-- ���踦 �����ϰ� ���̺� ���� ������ ���ض�. ������� �����ؾ� �ٹ� ,��������簡 �����ϰ� �����ȣ�� �־�� �ٹ��� ����.
[������̺�]
1) ���̺��: EMPLOYEE
2) �÷�
------------------------------
�÷���  ������Ÿ��(ũ��) n.n  pk/fk
------------------------------------
emp_id   CHAR(4)       n.n      pk
emp_name varchar2(30)  n.n
e_ADDR   varchar2(80)
e_TEL     VARCHAR2(20)
e_position varchar2(30)
e_dept    varchar2(50)          
----------------------------------------
--��� ��ȣ, �̸�, �ּ�, ��ȣ, ����, �μ�

CREATE TABLE EMPLOYEE(
EMP_ID  CHAR(4) NOT NULL,
EMP_NAME  VARCHAR2(30) NOT NULL,
E_ADDR  VARCHAR2(80),
E_TEL  VARCHAR2(20),
E_POSITION  VARCHAR2(30),
E_DEPT  VARCHAR2(50),
CONSTRAINT PK_EMPLOYEE PRIMARY KEY(EMP_ID));

COMMIT;
--����Ŭ�� ��� ���ڿ������.
-- Constraint //�������
-- pk_ fk_
--constraint fk_aa fpreign key(�÷���[�÷���]) fk�� 2�� ���ÿ� ���� ��찡 �幰��. ���� 1���� ����.
--

    [����� ���̺�]
    1)���̺�� : SITE
    2)�÷�
    ---------------------------------------
     �÷���    ������Ÿ��(ũ��)  N.N   PK/FK
    ---------------------------------------
    SITE_ID   CHAR(4)                PK
    SITE_NAME VARCHAR2(30)     N.N
    SITE_ADDR VARCHAR2(80)
    REMARKS   VARCHAR2(255)
    ---------------------------------------
    -- PK�� N.N ������ �����ʾƵ� ���α׷����� �˾Ƽ� N.N������ ���ش�.
    
    CREATE TABLE SITE(
    SITE_ID CHAR(4),
    SITE_NAME VARCHAR2(30) NOT NULL,
    SITE_ADDR VARCHAR2(80),
    REMARKS VARCHAR2(255),
    CONSTRAINT pk_site PRIMARY KEY(SITE_ID));
    -- REMARKS VARCHAR2(255) ���� ,�� �������� �ű⼭ �����پ˰� ��ȣ ���ٰ� ������.
    -- �ٽ� pk_site�� ����� �ȸ������ �̹� �־.
    
    [�ٹ� ���̺�]
    1)���̺�� : WORK
    2)�÷�
    ---------------------------------------
     �÷���    ������Ÿ��(ũ��)  N.N   PK/FK
    ---------------------------------------
    EMP_ID  CHAR(4)           N.N   PK & FK
    SITE_ID CHAR(4)           N.N   PK & FK
    INPUT_DATE DATE
    ---------------------------------------
    --�ٹ� ���̺��� ��� ������̺� ��������̺��� �ڽ���.
    --�ٹ� ���̺� �����ȣ(FK) , ������ȣ(FK) �ΰ��� ������ �̰� PK��.

    CREATE TABLE WORK(
    EMP_ID   CHAR(4),
    SITE_ID   CHAR(4),
    INPUT_DATE DATE,
    CONSTRAINT PK_WORK PRIMARY KEY(EMP_ID,SITE_ID),
    CONSTRAINT FK_WORK_EMP FOREIGN KEY (EMP_ID)
     REFERENCES EMPLOYEE(EMP_ID),
    CONSTRAINT FK_WORK_SIT FOREIGN KEY (SITE_ID)
     REFERENCES SITE(SITE_ID));

    --�ܷ�Ű�� 2���� �׷��� CONSTRAINT REFERENCES �� 2������.











