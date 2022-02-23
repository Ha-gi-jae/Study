2021_0809
    (4) PACKAGE
        - ���� �������� �ִ� PL/SQL�� ����, ���Ŀ��, �������α׷�(�Լ�, ���ν���) ���� �׸��� ���� ���� ��ü
        - �ٸ� ��ü���� ��Ű�� �׸���� ����, ����
        - ���ȭ ��� ����
        - ���α׷� ������ ���̼� ����
        - ĸ��ȭ ��� ����
        - ����ο� �����η� ����
        1) ��Ű�� ����� -- ����� �ۼ� �Ѵ�.
            - ��Ű������ ����� ����, ���, �Լ� ���� ���� ����(��)
            (�������)
            
            CREATE [OR REPLACE] PACKAGE ��Ű���� IS
              ����, ���, Ŀ�� ����;
              FUNCTION �Լ���[(�Ű����� list)] -- �Լ�, ���ν��� ��� ���� ��� ����.
                RETURN ��ȯŸ��;
                          :
              PROCEDURE ���ν�����(�Ű����� list);
                           :
            END ��Ű����;
            
        2)��Ű�� ������
            - ����ο��� ����� PL/SQL ��ü���� �������� ���
            (�������)
            CREATE [OR REPLACE] PACKAGE BODY ��Ű���� IS
              ������ Ÿ��;
              ����� CONSTANT Ÿ��;
              Ŀ�� ����;
              
              FUNCTION �Լ���[(�Ű�����list)]
                RETURN Ÿ��
              IS
                �����;
              BEGIN
                �����;
                RETURN expr;
              END �Լ���;
                            :
              PROCEDURE ���ν�����[(�Ű�����list)]
              IS
                �����;
              BEGIN
                �����;
              END ���ν�����;
            END ��Ű����;

** ������̺� ���������÷��� �߰��Ͻÿ�.
    �÷���         Ÿ��             NULL����
    RETIRE_DATE DATE 
    
    ALTER TABLE EMPLOYEES
      ADD RETIRE_DATE DATE;
      
��뿹) ��������� �ʿ��� �Լ� ���� ����
            - ��Ű���� : PKG_EMP
            - FN_GET_NAME : �����ȣ�� �Է� �޾� �̸��� ��ȯ�ϴ� �Լ�
            - PROC_NEW_EMP : �űԻ������ �Է� ���ν���(�����ȣ, LAST_NAME, �̸���, �Ի���, JOB_ID)
            - PROC_RETIRE_EMP : ������ó�� ���ν���(�����ȣ �Է�)
                (��Ű�� �����)
                CREATE OR REPLACE PACKAGE PKG_EMP
                IS
                  --����, ���, Ŀ�� �� ��������.
                  --�̸� ��ȯ �Լ�
                  FUNCTION FN_GET_NAME(
                  P_EID IN EMPLOYEES.EMPLOYEE_ID%TYPE) --�Է¿� �Ű������ϱ� IN
                  RETURN VARCHAR2;
                
                  --�űԻ������ �Է� ���ν���
                  PROCEDURE PROC_NEW_EMP( -- �Ի����� SYSDATE �� ���� ��¥ ��������Ŷ� �Ⱦ�.
                  P_EID IN EMPLOYEES.EMPLOYEE_ID%TYPE,
                  P_LNAME IN EMPLOYEES.LAST_NAME%TYPE,
                  P_EMAIL IN EMPLOYEES.EMAIL%TYPE,
                  P_JOB_ID IN JOBS.JOB_ID%TYPE);
                  
                  --������ ó��
                  PROCEDURE PROC_RETIRE_EMP(
                  P_EID IN EMPLOYEES.EMPLOYEE_ID%TYPE);
                END PKG_EMP;
            --�����ξ��� ����� �����ε� ������ �����ϴ�.
                
                
                (��Ű�� ������)
                CREATE OR REPLACE PACKAGE BODY PKG_EMP
                IS                
                   FUNCTION FN_GET_NAME(
                     P_EID IN EMPLOYEES.EMPLOYEE_ID%TYPE)
                     RETURN VARCHAR2
                   IS
                     V_ENAME EMPLOYEES.EMP_NAME%TYPE;
                   BEGIN
                     SELECT EMP_NAME INTO V_ENAME
                       FROM EMPLOYEES
                      WHERE EMPLOYEE_ID = P_EID;
                      
                     RETURN V_ENAME; 
                   END FN_GET_NAME;
                   
                   PROCEDURE PROC_NEW_EMP(
                     P_EID IN EMPLOYEES.EMPLOYEE_ID%TYPE,
                     P_LNAME IN EMPLOYEES.LAST_NAME%TYPE,
                     P_EMAIL IN EMPLOYEES.EMAIL%TYPE,
                     P_JOB_ID IN JOBS.JOB_ID%TYPE)
                   IS
                   BEGIN
                     INSERT INTO EMPLOYEES(EMPLOYEE_ID, LAST_NAME, EMAIL, JOB_ID, HIRE_DATE, EMP_NAME)
                       VALUES(P_EID, P_LNAME, P_EMAIL, P_JOB_ID, SYSDATE-1, P_LNAME||'�浿');
                       COMMIT; --Ʈ���� Ŀ�� X ���ν��� �Լ��� �����ϴ� ��������ֱ�.
                   END PROC_NEW_EMP;
                   
                   PROCEDURE PROC_RETIRE_EMP(
                     P_EID IN EMPLOYEES.EMPLOYEE_ID%TYPE)
                   IS
                   BEGIN
                     UPDATE EMPLOYEES
                        SET RETIRE_DATE = SYSDATE
                      WHERE EMPLOYEE_ID = P_EID;
                     COMMIT;
                   END PROC_RETIRE_EMP;  
                END PKG_EMP;
                
                (����)
                   SELECT EMPLOYEE_ID, PKG_EMP.FN_GET_NAME(EMPLOYEE_ID)
                     FROM EMPLOYEES
                    WHERE DEPARTMENT_ID = 60; 
                    
                   EXECUTE PKG_EMP.PROC_NEW_EMP(250, 'ȫ', 'gdhong22@gmail.com', 'FI_ACCOUNT');
                   
                   EXEC PKG_EMP.PROC_RETIRE_EMP(150);