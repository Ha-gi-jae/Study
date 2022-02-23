2021_0802
1. PL/SQL (Procedual Language SQL)
    - ǥ�� SQL�� ����� Ȯ���� SQL
    - ������ ���డ���� ������ ���ȭ �� �������α׷�
    - block ������ ����
    - ���ȭ, ĸ��ȭ
    - Anonymous Block, User Defined Function(Function), Stored Procedure(Procedure), Package, Trigger ���� ������
                            --��ȯ���� ������ Function, ������ Procedure
    (1) �͸���(Anonymous Block) --�̸��� ���� �ٽ� �ҷ� �� �� ����.
        - PL/SQL�� �⺻����
        - �ܼ� ��ũ��Ʈ���� ����Ǵ� ���
            (�������)
            DECLARE
              �����(����,���,Ŀ�� ����); -- �Ϲݺ��� [V_..] �Ű����� [P_..]
            BEGIN
              �����(����Ͻ� ���� ó���� ���� sql��)
              [EXCEPTION
                  ����ó����
              ]
            END;
            
            ��뿹) Ű����� 10-110������ �μ���ȣ�� �Է¹޾� �ش�μ������� ���� �Ի����� ���� ��� ������ ����Ͻÿ�.
                Alias�� �����ȣ, �����, �Ի���, ��å�ڵ��̴�.
                
                ACCEPT P_DID PROMPT '�μ��ڵ�(10~110)'
                DECLARE
                  V_EID HR.EMPLOYEES.EMPLOYEE_ID%TYPE; --���̺��.�÷���.TYPE �ش� ���̺��� �÷��� ���� Ÿ���� ��������.(����)
                  V_NAME HR.EMPLOYEES.EMP_NAME%TYPE;
                  V_HIRE HR.EMPLOYEES.HIRE_DATE%TYPE;
                  V_JOBID HR.EMPLOYEES.JOB_ID%TYPE;
                BEGIN
                  SELECT A.EMPLOYEE_ID, A.EMP_NAME, A.HIRE_DATE, A.JOB_ID -- SELECT - INTO - FROM - WHERE ... �̷��� �ȴ� PL/SQL������
                    INTO V_EID, V_NAME, V_HIRE, V_JOBID -- ���� �ۿ� �ִ� SELECT���� INTO�� ����ϸ�, �ڵ����� �� ������� �Ҵ� ��Ŵ.
                    FROM (SELECT EMPLOYEE_ID, EMP_NAME, HIRE_DATE, JOB_ID
                            FROM HR.EMPLOYEES
                          WHERE DEPARTMENT_ID = TO_NUMBER('&P_DID')
                          ORDER BY 3) A
                   WHERE ROWNUM = 1;
                
                   DBMS_OUTPUT.PUT_LINE('�����ȣ : '||V_EID); --DBMS���� �����ϴ� OUTPUT.PUT_LINE(�ܼ����).(�ٹٲ�) �� ���ڴ�.
                   DBMS_OUTPUT.PUT_LINE('����� : '||V_NAME);
                   DBMS_OUTPUT.PUT_LINE('�Ի��� : '||V_HIRE);
                   DBMS_OUTPUT.PUT_LINE('��å�ڵ� : '||V_JOBID);
                   
                   EXCEPTION WHEN OTHERS THEN
                     DBMS_OUTPUT.PUT_LINE('���ܹ߻� : ')||SQLERRM); --SQLERRM : SQL ���� �޼���
                END;
                
            1) ������ ���
                - ����ο��� ����� ������ ���
                - SCLAR ���� : �ϳ��� �����͸� �����ϴ� ����
                    - REFERENCE ���� : ������ ���̺� �����ϴ� �÷��� Ÿ�԰� ũ�⸦ �����ϴ� ����
                    - COMPOSITE ���� : PL/SQL���� ����ϴ� �迭 ����(RECORD TYPE, TABLE TYPE)
                    - BIND ���� : �Ķ���ͷ� �Ѱ����� IN, OUT���� ���Ǵ� ����, ���ϰ��� �����ϱ� ���� ���Ǵ� ����
                    --�Űܺ����� ���� �Ѱ����� Ÿ�� IN(�ۿ��� ������ �Ѱܹ���), OUT(�ȿ��� �ٱ����� ������), INOUT(�ۿ��� ������ �Ѱܹ޾� ������� ������ ������. �����ʴ� ���� �ǰ�.)
                (�������)
                ������[CONSTANT] ������Ÿ��[(ũ��)]|���̺��.�÷���%TYPE|���̺��%ROWTYPE[:=�ʱⰪ]; -- �ݷ��ϰ� ���������. ������ ��� 0���� �ʱ�ȭ�ؾ���. �׷��� ������ ��Ÿ�ӿ��� �߻�
                    - 'CONSTANT' : ��� ����
                    - '���̺��.�÷���%TYPE|���̺��%ROWTYPE' : ����Ÿ��
                    - ������ ������ ��� �ݵ�� �ʱ�ȭ �ؾ���
                    - ������Ÿ�� : SQL���� ����ϴ� ������ Ÿ��
                        - BINARY_INTEGER, PLS_INTEHER : -2147483648 ~ 2147483647 ������ ���� ���
                        - BOOLEAN : true, false, null�� ����ϴ� ���� ����
                        
            2) �б���
                - ���α׷��� ���� ������ �����ϴ� ���
                - IF, CASE WHEN ���� ���� 

                (1) IF ��
                    - ���߾���� IF���� ������ ��� ����
                    (������� - 1)
                    IF ���� THEN --������ ��ȣ�� �� ���� �־ �ȴ�.
                       ���1;
                    [ELSE
                       ���2;]
                    END IF;
                    
                    (������� - 2) -- ���� IF
                    IF ���� THEN
                       ���1;
                    ELSIF ���� THEN --ELSIF ELSE�� E �� �������!.
                       ���2;
                         :
                    ELSE ���n;
                    END IF;
                    
                    (������� - 3)
                    IF ���� THEN
                       ���1;
                       IF ���� THEN
                          ���2;
                       ELSE
                          ���3;
                       END IF;  -- ���� �ľ���! ���� ���� ��!
                    ELSE
                       ���n;
                    END IF; --�鿩���� ������ ���ϸ� ū�ϳ�...^_^!!
                    
                ��뿹) ������ ���� �Է� �޾� ¦������ Ȧ������ �Ǻ��Ͻÿ�
                    ACCEPT P_NUM PROMPT '�� �Է� : '
                    DECLARE
                      V_NUM NUMBER := TO_NUMBER('&P_NUM');
                      V_RES VARCHAR2(100);
                    BEGIN
                      IF MOD(V_NUM,2)=0 THEN
                        V_RES:=TO_CHAR(V_NUM)||'�� ¦�� �Դϴ�.';
                      ELSE
                        V_RES:=TO_CHAR(V_NUM)||'�� Ȧ�� �Դϴ�.';
                      END IF;
                    
                      DBMS_OUTPUT.PUT_LINE(V_RES);
                    END;
                
                ��뿹) ȸ�����̺��� ȸ������ ���ϸ����� ��ȸ�Ͽ� �� ���� 5000 �̻��̸� ������ 'VIP ȸ��',
                       3000 �̻��̸� '��ȸ��', �� �����̸� '��ȸ��'�� ȸ����ȣ, ȸ����, ���ϸ����� �Բ� ����Ͻÿ�.
                       
                       DECLARE
                         V_MID MEMBER.MEM_ID%TYPE;
                         V_NAME MEMBER.MEM_NAME%TYPE;
                         V_MILE MEMBER.MEM_MILEAGE%TYPE;
                         V_RES VARCHAR2(100);
                         
                         CURSOR CUR_MEM01 IS
                           SELECT MEM_ID, MEM_NAME, MEM_MILEAGE
                             FROM MEMBER;
                       BEGIN
                         OPEN CUR_MEM01;
                         LOOP
                           FETCH CUR_MEM01 INTO V_MID, V_NAME, V_MILE;
                           EXIT WHEN CUR_MEM01%NOTFOUND;
                           IF V_MILE >= 5000 THEN
                             V_RES:= V_MID||', '||V_NAME||', '||V_MILE||', '||'VIP ȸ��';
                           ELSIF V_MILE >= 3000 THEN
                             V_RES:= V_MID||', '||V_NAME||', '||V_MILE||', '||'��ȸ��';
                           ELSE
                             V_RES:= V_MID||', '||V_NAME||', '||V_MILE||', '||'��ȸ��';
                           END IF;
                           --DBMS_OUTPUT.PUT_LINE('ȸ���� : '||CUR_MEM01%ROWCOUNT||'��');
                           DBMS_OUTPUT.PUT_LINE(V_RES);
                           DBMS_OUTPUT.PUT_LINE('------------------------');
                         END LOOP;
                         CLOSE CUR_MEM01;
                       END;
                
                ��뿹) ����ڷκ��� ���� ��뷮(�� ����)�� �Է� �޾� ��������� ����Ͽ� ����Ͻÿ�.
                    ��뷮(��)      �����ܰ�
                      1~10           275
                     11~20           305
                     21~30           350
                     31~40           415
                    41�� �̻�         500��
                    
                    �ϼ��� ����� : ��뷮 * 120��
                    
                    ex) 27���� ����� ���
                    ó�� 10��  : 275 * 10 = 2,750
                    11-20     : 305 * 10 = 3,050
                    ������ 7�� : 350 * 7  = 2,450
                    ---------------------------------
                    �ϼ��� ����� : 120 * 27 = 3,240
                    ---------------------------------
                                               11,490
                    ACCEPT P_NUM PROMPT '���� ��뷮 �Է� : '
                    DECLARE
                      V_NUM NUMBER := TO_NUMBER('&P_NUM');
                      V_RES VARCHAR2(100);
                    BEGIN
                      IF (V_NUM <= 10) THEN
                        V_RES:= V_NUM * 275 + (V_NUM * 120);
                      ELSIF (V_NUM <= 20) THEN
                        V_RES:= (275 * 10) + (V_NUM - 10) * 305 + (V_NUM * 120);
                      ELSIF (V_NUM <= 30) THEN
                        V_RES:= (275 * 10) + (305 * 10) + (V_NUM - 20) * 350 + (V_NUM * 120);
                      ELSIF (V_NUM <= 40) THEN
                        V_RES:= (275 * 10) + (305 * 10) + (350 * 10) + (V_NUM - 30) * 415 + (V_NUM * 120);
                      ELSIF (V_NUM >= 41) THEN
                        V_RES:= (275 * 10) + (305 * 10) + (350 * 10) + (415 * 10) + (V_NUM - 40) * 500 + (V_NUM * 120);
                      END IF;
                      DBMS_OUTPUT.PUT_LINE('��뷮 : '||V_NUM||'��');
                    DBMS_OUTPUT.PUT_LINE('������� : '||TO_CHAR(V_RES,'99,999'));
                    END;
                      
                ��뿹) ������̺��� ������� ��ձ޿����� �� ���� �޿��� �޴� ����� �����ȣ, �����, �޿�, �μ����� ����Ͻÿ�.
                    