1. CASE��
    - ǥ�� SQL�� SELECT ���� ���Ǵ� CASEǥ���İ� ����
    - ���� �б� ��� ����
        (������� - 1)
        CASE ����|���� WHEN ��1 THEN -- ����|���� �� �� �� �� ��~
                           ���1;   -- break ��� �˾Ƽ� ��������.
                      WHEN ��2 THEN
                           ���2;
                             :
                      ELSE ���n;
        END CASE;
             
         (������� - 2)
         CASE WHEN ����1 THEN -- WHEN���� ������ ���� ������ ELSE ����~
                   ���1;
              WHEN ����2 THEN
                   ���2;
                     :
              ELSE ���n;
         END CASE;
             
         (��뿹) 10~110 ������ ������ �߻����� �߻��� ������ �ش��ϴ� �μ��� ���� ��� �� ù��° ����� �޿��� ��ȸ�Ͽ� 5000�����̸� '���ӱ� ���',
                 10000�����̸� '����ӱ� ���', �� �̻��̸� '���ӱ� ���'�� �� �����ȣ, �����, �μ���� �Բ� ����Ͻÿ�.
                 --�ڡڡ� PL/SQL���� ���� ������ SELECT�� ���� INTO FROM WHERE //INTO �� ���� ����. 
                 DECLARE
                   V_EID HR.EMPLOYEES.EMPLOYEE_ID%TYPE; -- ��� ��ȣ 
                   V_ENAME HR.EMPLOYEES.EMP_NAME%TYPE; -- ��� �̸�
                   V_DNAME HR.DEPARTMENTS.DEPARTMENT_NAME%TYPE; -- �μ� �̸�
                   V_SAL HR.EMPLOYEES.SALARY%TYPE; -- �޿� ������ ����Ÿ��
                   V_MESSAGE VARCHAR2(20); -- ����(���ӱ�,����ӱ�,���ӱ� ����)
                   V_DID HR.EMPLOYEES.DEPARTMENT_ID%TYPE; -- �μ� �ڵ�(���� �߻�)
                 BEGIN
                   V_DID:= TRUNC(SYS.DBMS_RANDOM.VALUE(10,110),-1); -- ���� �ڸ� ����.
                   SELECT A.EMPLOYEE_ID, A.EMP_NAME, B.DEPARTMENT_NAME, A.SALARY
                     INTO V_EID, V_ENAME, V_DNAME, V_SAL
                     FROM HR.EMPLOYEES A, HR.DEPARTMENTS B
                    WHERE A.DEPARTMENT_ID = V_DID
                      AND A.DEPARTMENT_ID = B.DEPARTMENT_ID
                      AND ROWNUM = 1;
                          
                   CASE WHEN V_SAL < 5000 THEN
                             V_MESSAGE:= '���ӱ� ���';
                        WHEN V_SAL < 10000 THEN
                             V_MESSAGE:= '����ӱ� ���';
                        ELSE 
                             V_MESSAGE:= '���ӱ� ���';
                   END CASE;
                       
                   DBMS_OUTPUT.PUT_LINE('�μ��� : '||V_DNAME);
                   DBMS_OUTPUT.PUT_LINE('�����ȣ : '||V_EID);
                   DBMS_OUTPUT.PUT_LINE('����� : '||V_ENAME);
                   DBMS_OUTPUT.PUT_LINE('��� : '||V_MESSAGE);
                 END;