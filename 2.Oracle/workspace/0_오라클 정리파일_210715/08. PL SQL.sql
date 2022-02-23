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
                        V_RES:= V_NUM * 275;
                      ELSIF (V_NUM <= 20) THEN
                        V_RES:= (275 * 10) + (V_NUM - 10) * 305;
                      ELSIF (V_NUM <= 30) THEN
                        V_RES:= (275 * 10) + (305 * 10) + (V_NUM - 20) * 350;
                      ELSIF (V_NUM <= 40) THEN
                        V_RES:= (275 * 10) + (305 * 10) + (350 * 10) + (V_NUM - 30) * 415;
                      ELSIF (V_NUM >= 41) THEN
                        V_RES:= (275 * 10) + (305 * 10) + (350 * 10) + (415 * 10) + (V_NUM - 40) * 500;
                      END IF;
                      V_RES:= V_RES+ (V_NUM * 120);
                      DBMS_OUTPUT.PUT_LINE('��뷮 : '||V_NUM||'��');
                    DBMS_OUTPUT.PUT_LINE('������� : '||TO_CHAR(V_RES,'99,999'));
                    END;
                      
                ��뿹) ������̺��� ������� ��ձ޿����� �� ���� �޿��� �޴� ����� �����ȣ, �����, �޿�, �μ����� ����Ͻÿ�.
                
    (2) User Defined Function(�Լ�)
        - ���ν����� ���� ���� ����
        - ��ȯ ���� ����
        - ���� ���Ǵ� �������� �Ǵ� ������ ����� ���� �Լ��� ����
        - SELECT ���� SELECT��, WHERE ���� ��� ����
        
        (�������)
        CREATE [OR REPLACE] FUNCTION �Լ���[(
          �Ű����� [MODE] Ÿ�� [:=��][,
              :
          �Ű����� [MODE] Ÿ�� [:=��]])]
          RETURN ������ Ÿ�� -- ������ ������Ÿ���� �Ӵ�!
        IS|AS
          ���𿵿�
        BEGIN
          ���࿵��
          RETURN ��|expr;                  -- ������ Ÿ�� ��ġ�ؾ���. 
        END;
            - 'RETURN ������ Ÿ��' : ��ȯ�� ������ Ÿ��
            - 'RETURN ��|expr' : ��ȯ�ؾ��ϴ� ���̳� ���� �����ϴ� ���� ������ �ݵ�� 1�� �̻� ���� �ؾ���.
        
            (��뿹)'����'�� �����ϴ� ȸ����ȣ�� �Է¹޾� �ش�ȸ���� 2005�� 6�� ���űݾ��� ����ϴ� �Լ��� �ۼ��Ͻÿ�.
                (�Լ�)
                CREATE OR REPLACE FUNCTION FN_SUM01(
                  P_MID MEMBER.MEM_ID%TYPE)
                  RETURN NUMBER
                IS
                  V_SUM NUMBER:= 0; -- ���űݾ� �հ�
                  V_CNT NUMBER:= 0; -- 2005�� 6�� �ش� ȸ���� �ڷ�(CART) �������� Ȯ��
                BEGIN
                  SELECT COUNT(*) INTO V_CNT
                    FROM CART
                   WHERE CART_NO LIKE '200506%'
                     AND CART_MEMBER = P_MID;
                  
                  IF V_CNT != 0 THEN
                     SELECT SUM(A.CART_QTY*B.PROD_PRICE) INTO V_SUM
                       FROM CART A, PROD B
                      WHERE CART_NO LIKE '200506%'
                        AND CART_MEMBER = P_MID
                        AND A.CART_PROD = B.PROD_ID;
                  ELSE
                    V_SUM:= 0;
                  END IF;
                  RETURN V_SUM;
                END;
                
                (����)
                SELECT MEM_ID AS ȸ����ȣ,
                       MEM_NAME AS ȸ����,
                       MEM_ADD1||' '||MEM_ADD2 AS �ּ�,
                       FN_SUM01(MEM_ID) AS ���űݾ�
                  FROM MEMBER
                 WHERE MEM_ADD1 LIKE '����%'
                 ORDER BY 1;
                
                (��뿹) ��ǰ�ڵ�� �⵵ �� ���� �Է¹޾� �ش� ��ǰ�� ���ż����� ���űݾ��� ����ϴ� �Լ��� �ۼ��Ͻÿ�.
                    (�Լ�) : FN_BUY01
                        CREATE OR REPLACE FUNCTION FN_BUY01(
                          P_PID IN PROD.PROD_ID%TYPE,
                          P_YEAR CHAR,
                          P_MONTH CHAR)
                          RETURN VARCHAR2 -- ���ż���, ���űݾ� 2���� ���������ϱ� ������. 
                        IS
                          V_DATE DATE:= TO_DATE(P_YEAR||P_MONTH||'01');
                          V_AMT NUMBER:= 0; --���Լ���
                          V_SUM NUMBER:= 0; --���Աݾ�
                          V_CNT NUMBER:= 0; --�ڷ��
                          V_RES VARCHAR2(100);
                        BEGIN
                          SELECT COUNT(*) INTO V_CNT
                            FROM BUYPROD
                           WHERE BUY_DATE BETWEEN V_DATE AND LAST_DAY(V_DATE)
                             AND BUY_PROD = P_PID;
                             
                          IF V_CNT != 0 THEN
                             SELECT SUM(BUY_QTY), SUM(BUY_QTY * BUY_COST) INTO V_AMT, V_SUM
                               FROM BUYPROD
                              WHERE BUY_DATE BETWEEN V_DATE AND LAST_DAY(V_DATE)
                                AND BUY_PROD = P_PID;
                          ELSE
                            V_SUM:= 0;
                            V_AMT:= 0;
                          END IF;
                          V_RES:= '���ż��� : '||V_AMT||', '||'���űݾ� : '||V_SUM;
                          RETURN V_RES;
                        END;
                        
                    (����)
                        SELECT '2005-05', PROD_ID, PROD_NAME, FN_BUY01(PROD_ID, '2005', '05')
                          FROM PROD;
                    
                    (Ŀ���̿�)
                        CREATE OR REPLACE FUNCTION FN_BUY02(
                        P_PID IN PROD.PROD_ID%TYPE,
                        P_YEAR CHAR,
                        P_MONTH CHAR,
                        P_AMT OUT NUMBER)
                          RETURN NUMBER
                        IS
                          V_DATE DATE:= TO_DATE(P_YEAR||P_MONTH||'01');
                          V_AMT NUMBER:= 0;
                          V_SUM NUMBER:= 0;
                          V_CNT NUMBER:= 0;
                        BEGIN
                          SELECT COUNT(*) INTO V_CNT
                            FROM BUYPROD
                           WHERE BUY_DATE BETWEEN V_DATE AND LAST_DAY(V_DATE)
                             AND BUY_PROD = P_PID;
                          IF V_CNT != 0 THEN -- �������ߴ�.
                             SELECT SUM(BUY_QTY), SUM(BUY_QTY * BUY_COST) INTO V_AMT, V_SUM
                               FROM BUYPROD
                              WHERE BUY_DATE BETWEEN V_DATE AND LAST_DAY(V_DATE)
                                AND BUY_PROD = P_PID;
                          ELSE
                             V_SUM:=0;
                             V_AMT:=0;
                          END IF;
                            P_AMT:=V_AMT;
                          RETURN V_SUM;
                        END;
                    
                    (����)
                        DECLARE
                          V_AMT NUMBER:=0;
                          V_SUM NUMBER:=0;
                          CURSOR CUR_PROD IS
                            SELECT PROD_ID, PROD_NAME
                              FROM PROD;
                        BEGIN
                          FOR REC IN CUR_PROD LOOP
                              V_SUM:=FN_BUY02(REC.PROD_ID,'2005','05',V_AMT);
                              DBMS_OUTPUT.PUT_LINE('��ǰ�ڵ� : '||REC.PROD_ID);
                              DBMS_OUTPUT.PUT_LINE('��ǰ�� : '||REC.PROD_NAME);
                              DBMS_OUTPUT.PUT_LINE('���Լ��� : '||V_AMT);
                              DBMS_OUTPUT.PUT_LINE('���Աݾ� : '||V_SUM);
                              DBMS_OUTPUT.PUT_LINE('-----------------------------');
                          END LOOP;
                        END;
                        
                (��뿹) �⵵�� ���� 6�ڸ� ���ڿ��� �Է� �޾� �ش���� ���� ���� ��ǰ�� ����(�ݾױ���)�� ȸ���� �̸��� ���űݾ��� ����ϴ� �Լ��� �ۼ��Ͻÿ�.
                    CREATE OR REPLACE FUNCTION FN_MAXMEM(
                      P_YRMH CHAR)
                      RETURN VARCHAR2
                    IS
                      V_NAME MEMBER.MEM_NAME%TYPE; -- �̸�
                      V_SUM NUMBER:=0; -- ���űݾ�
                      V_RES VARCHAR2(100);
                      V_DATE CHAR(7):=P_YRMH||'%';
                    BEGIN
                     SELECT A.M_NAME, A.M_SUM INTO V_NAME, V_SUM
                       FROM (SELECT B.MEM_NAME AS M_NAME,
                                    SUM(A.CART_QTY*C.PROD_PRICE) AS M_SUM
                               FROM CART A, MEMBER B, PROD C
                              WHERE A.CART_MEMBER = B.MEM_ID
                                AND A.CART_PROD = C.PROD_ID
                                AND A.CART_NO LIKE V_DATE
                              GROUP BY B.MEM_NAME
                              ORDER BY 2 DESC) A
                      WHERE ROWNUM = 1;
                      V_RES:= '�̸� : '||V_NAME||'���űݾ� : '||TO_CHAR(V_SUM,'99,999,999');
                      RETURN V_RES; 
                    END;
                      
                      SELECT FN_MAXMEM('200505') FROM DUAL;
                      
                    -- ���� �Է��ؼ�
                    ACCEPT P_DATE PROMPT '���(YYYYMM) : '
                    DECLARE
                      V_RES VARCHAR2(100);
                    BEGIN
                      V_RES:= FN_MAXMEM('&P_DATE');
                      DBMS_OUTPUT.PUT_LINE(SUBSTR('&P_DATE',1,4)||'��'||SUBSTR('&P_DATE',5)||'��');
                      DBMS_OUTPUT.PUT_LINE(V_RES);
                    END;  
                    
                    
    (3)���� ���ν���(Stored Procedure)
        - ������ ����� �����ϵ� Ư�������� ���� ���
        - ó���ӵ��� ��� : ���ν��� ���� ��� ������ �ϳ��� Batch�� �ν��Ͽ� �ѹ��� �м� �� ����ȭ ��Ű�� ���� ��Ŵ
        - ��Ʈ��ũ�� Traffic ���� : Client���� Server�� ������ SQL������ ������ �̸� �����ϰ� �־� Client���� �ٷ��� SQL������� ���ν��� �̸��� �Ű������� ����
        - ��ȯ���� ����
        
        (�������)
        CREATE [OR REPLACE] PROCEDURE ���ν�����[(
          �Ű����� [MODE] Ÿ�� [:=��][, 
              :
          �Ű����� [MODE] Ÿ�� [:=��1]])]
        IS|AS
          ���𿵿�
        BEGIN
          ���࿵��
        END;
            - 'OR PLACE' : ���� �̸��� ���ν����� �����ϸ� OVERWRITE, ������ ���Ӱ� ���� -- CALL BY VALUE ���
            - 'MODE' : �Ű������� ������ ��Ÿ���� IN(�Է¿�), OUT(��¿�), INOUT(����� ����)�� ����� �� ������ �����ϸ� IN���� ����
            - 'Ÿ��' : �Ű������� ������ Ÿ������ ũ�⸦ �������� ����
            
        (������� - ����)
          EXEC|EXECUTE ���ν�����[(�Ű�����list)];
          
          OR
          
          ���ν�����[(�Ű�����list)]; -- �͸����̳� �ٸ� PL/SQL��ü ������ ����
                
            ��뿹) �⵵�� ���� ��ǰ�ڵ带 �Է� �޾� �ش���ǰ�� �԰������ �����Ͽ� ���������̺��� �ش� ��ǰ�� ��� �����ϴ� ���ν��� �ۼ�
                CREATE OR REPLACE PROCEDURE PROC_BUY_REMAIN(
                  P_YEAR  IN CHAR,
                  P_MONTH IN VARCHAR, --ũ�� ������������.
                  P_PID   IN VARCHAR2)
                IS
                  V_IAMT NUMBER(5):=0; --���� ����
                  V_FLAG NUMBER:=0; --�����ڷ� ����
                  V_DATE DATE := TO_DATE(P_YEAR||P_MONTH||'01'); --��¥
                BEGIN
                  SELECT COUNT(*),SUM(BUY_QTY) INTO V_FLAG, V_IAMT --�Ϲ� �Լ��� ������ �ʾ����Ƿ� GROUP BY�� ���� �ʾƵ��ȴ�.
                    FROM BUYPROD
                   WHERE BUY_PROD = P_PID
                     AND BUY_DATE BETWEEN V_DATE AND LAST_DAY(V_DATE);
                     
                  IF V_FLAG !=0 THEN
                     UPDATE REMAIN
                        SET REMAIN_I = REMAIN_I + V_IAMT,
                            REMAIN_J_99 = REMAIN_J_99 + V_IAMT,
                            REMAIN_DATE = LAST_DAY(V_DATE)
                      WHERE REMAIN_YEAR = P_YEAR
                        AND PROD_ID = P_PID;
                  END IF;
                END;
                
                
                EXECUTE PROC_BUY_REMAIN('2005','03','P201000017');
                
            ��뿹) �����ȣ�� �Է¹޾� �ش����� �Ҽӵ� �μ��� �μ���, �ο���, ��ձ޿��� ��ȯ�ϴ� ���ν����� �ۼ��Ͻÿ�. -- HR ���������ؾ���.
                
                CREATE OR REPLACE PROCEDURE PROC_EMP01(
                  P_EID IN EMPLOYEES.EMPLOYEE_ID%TYPE, -- IN �Է�
                  P_DNAME OUT DEPARTMENTS.DEPARTMENT_NAME%TYPE, -- OUT ���
                  P_CNT OUT NUMBER, --������
                  P_SAL OUT NUMBER) --��ձ޿�
                  IS
                  BEGIN
                    SELECT B.DEPARTMENT_NAME, COUNT(*), ROUND(AVG(C.SALARY))
                      INTO P_DNAME, P_CNT, P_SAL
                      FROM (SELECT DEPARTMENT_ID AS DID
                              FROM HR.EMPLOYEES
                             WHERE EMPLOYEE_ID = P_EID) A, DEPARTMENTS B, EMPLOYEES C
                     WHERE A.DID = B.DEPARTMENT_ID
                       AND C.DEPARTMENT_ID = A.DID
                     GROUP BY B.DEPARTMENT_NAME;
                  END;
                  
                (����)
                DECLARE
                  V_DNAME DEPARTMENTS.DEPARTMENT_NAME%TYPE;
                  V_CNT NUMBER:=0;
                  V_SAL NUMBER:=0;
                BEGIN
                  PROC_EMP01(109,V_DNAME,V_CNT,V_SAL); --�� �ȿ��� �� ���� EXCUTE�� ���⼭ ���� �ȵȴ�~
                  DBMS_OUTPUT.PUT_LINE('�μ��� : '||V_DNAME);
                  DBMS_OUTPUT.PUT_LINE('������ : '||V_CNT);
                  DBMS_OUTPUT.PUT_LINE('��ձ޿� : '||V_SAL);
                END;
                
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
        
        
    (5) Ʈ����(TRIGGER)
        - Ư�� �̺�Ʈ�� �߻� �� �Ǵ� ���� �ڵ����� ����Ǿ��� ���ν���
        - Ʈ���Ŵ� ������� Ʈ���ſ� ����� Ʈ���ŷ� ����
        - ������� Ʈ���� ���� �� Ʈ���Ű� �Ϸ���� ���� ���¿��� �� �ٸ� Ʈ���� ȣ��� ���̺��� �ϰ��� ������ ���� �ش� ���̺��� ������ ������
        (�������)
        CREATE [OR REPLACE] TRIGGER Ʈ���Ÿ�                --dml���� commit ������.
          timming[BEFORE|AFTER] event[INSERT|UPDATE|DELETE]
          ON ���̺��
          [FOR EACH ROW]
          [WHEN ����]
          [DECLARE
            �����
          ]
          BEGIN
            ����� -- Ʈ���ſ��� �����Ұ͵�~
          END;
            - 'BEFORE|AFTER' : '�����'(Ʈ���� ����)�� ����� ����
            - 'INSERT|UPDATE|DELETE' : Ʈ���Ÿ� �߻���Ű�� �̺�Ʈ�� OR �����ڷ� ������ ��� ����
                ex) INSERT OR DELETE, INSERT OR UPDATE OR DELETE etc..
            - 'FOR EACH ROW' : ����� Ʈ���� �� ���(�����ϸ� ������� Ʈ����)
            - 'WHEN ����' : ����� Ʈ���ſ����� ��� �����ϸ�, �̺�Ʈ �߻��� ���� ��ü���� ���� ���
            
            (������� Ʈ����) �з����̺� ���ο� �з��ڵ带 �����Ͻÿ�. ���� �� '���ο� �з��� �߰��Ǿ����ϴ�.'�� ����ϴ� Ʈ���Ÿ� �ۼ��Ͻÿ�.
                [�з��ڵ� : 'P502', �з��� : '�ӻ깰', ���� : 11]
            
                CREATE OR REPLACE TRIGGER TG_LPROD_INSERT --��������̹Ƿ� FOR EACH ROW�� �Ⱦ�.  FOR EACH ROW�� ���� �����
                AFTER INSERT ON LPROD 
                BEGIN
                  DBMS_OUTPUT.PUT_LINE('���ο� �з��� �߰��Ǿ����ϴ�.');
                END;
                
                INSERT INTO LPROD(LPROD_ID, LPROD_GU, LPROD_NM)
                       VALUES(13, 'P504', '����깰');
                COMMIT;
                SELECT * FROM LPROD;
                
                
                CREATE OR REPLACE TRIGGER TG_LPROD_DELETE -- ����Ʈ Ʈ����
                  AFTER DELETE ON LPROD 
                BEGIN
                  DBMS_OUTPUT.PUT_LINE('�з��� ���ŵǾ����ϴ�.');
                END;
                
                  DELETE LPROD
                  WHERE LPROD_ID = 13;
                COMMIT;
                
            (����� Ʈ����) ������ 2005�� 6�� 11���̶�� �����ϰ�, ��ǰ�ڵ尡 'P102000005'�� ��ǰ�� 10�븦 �����ߴٰ� ����,
                           �� ������ �������̺� ������ ��, ��� �������̺��� �����ϴ� Ʈ���Ÿ� �ۼ��Ͻÿ�.
                           
            CREATE OR REPLACE TRIGGER TG_BUYPROD_INSERT     --���ε��� �ڷ���� ������ ��  :NEW �� ���
              AFTER INSERT ON BUYPROD
              FOR EACH ROW 
            DECLARE
              V_QTY NUMBER := :NEW.BUY_QTY;
              V_PROD PROD.PROD_ID%TYPE := :NEW.BUY_PROD;
            BEGIN
              UPDATE REMAIN
                 SET REMAIN_I = REMAIN_I + V_QTY, -- :NEW.BUY_QTY�� �ᵵ�ȴ�. ������ ���� ���� ���� �ʰ�, �ؿ��� �ٷ� �ᵵ�ȴ�.
                     REMAIN_J_99 = REMAIN_J_99 + V_QTY,
                     REMAIN_DATE = TO_DATE('20050611')
               WHERE REMAIN_YEAR='2005'
                 AND PROD_ID = :NEW.BUY_PROD;
                 
               DBMS_OUTPUT.PUT_LINE(:NEW.BUY_PROD||'��ǰ�� '||V_QTY||'�� �԰�Ǿ����ϴ�.');
            END;
            
            INSERT INTO BUYPROD
              SELECT TO_DATE('20050611'),PROD_ID,10,PROD_COST
                FROM PROD
               WHERE PROD_ID='P102000005';
             
               COMMIT;

        1) Ʈ���� �ǻ緹�ڵ� (����� Ʈ���ſ����� ��� ����)
            (1) :NEW
                - INSERT, UPDATE �̺�Ʈ�� ���
                - �����Ͱ� ����(����)�Ǵ� ��� ���Ӱ� ���� ��
                - DELETE �ÿ��� ��� NULL��
            
            (2) :OLD -- �����ϰ��ִ� �����͸� ��Ī
                - DELETE, UPDATE �̺�Ʈ�� ���
                - �����Ͱ� ����(����)�Ǵ� ��� �̹� �����ϰ� �ִ� ��
                - INSERT �ÿ��� ��� NULL��
        
        2) Ʈ���� �Լ�
            - Ʈ������ �̺�Ʈ�� �����ϱ� ���� �Լ�
            
            (1) INSERTING : Ʈ������ �̺�Ʈ�� INSERT �̸� ��     --INSERT||UPDATE||DELETE �������� ���� �����ϱ� ���� ���
            (2) UPDATING : Ʈ������ �̺�Ʈ�� UPDATE �̸� ��
            (3) DELETING : Ʈ������ �̺�Ʈ�� DELETE �̸� ��
            
                ��뿹) ����(2005/08/06) 'h001'ȸ��(����ȣ)�� ��ǰ 'P202000019'�� 5�� ���������� CART���̺�� ���������̺� �ڷḦ ���� �� �����Ͻÿ�.(Ʈ���� �̿�)
                    CREATE OR REPLACE TRIGGER TG_CART_CHANGE         --new ���Ӱ� ������ ����. old ���� ������ ����.  new - old = ��ǰ����
                      AFTER INSERT OR UPDATE OR DELETE ON CART
                      FOR EACH ROW
                    DECLARE
                      V_QTY NUMBER := 0;
                      V_PID PROD.PROD_ID%TYPE;
                      V_DATE DATE;
                    BEGIN
                      IF INSERTING THEN
                         V_QTY := NVL(:NEW.CART_QTY,0);
                         V_PID := :NEW.CART_PROD;
                         V_DATE := TO_DATE(SUBSTR(:NEW.CART_NO,1,8));
                      ELSIF UPDATING THEN
                         V_QTY := NVL(:NEW.CART_QTY,0) - NVL(:OLD.CART_QTY,0);
                         V_PID := :NEW.CART_PROD;
                         V_DATE := TO_DATE(SUBSTR(:NEW.CART_NO,1,8));
                      ELSE
                         V_QTY := -(NVL(:OLD.CART_QTY,0));
                         V_PID := :OLD.CART_PROD;
                         V_DATE := TO_DATE(SUBSTR(:OLD.CART_NO,1,8));
                      END IF;
                      
                      UPDATE REMAIN
                         SET REMAIN_O = REMAIN_O + V_QTY,
                             REMAIN_J_99 = REMAIN_J_99 - V_QTY,
                             REMAIN_DATE = V_DATE
                       WHERE REMAIN_YEAR = '2005'
                         AND PROD_ID = V_PID;
                         
                      EXCEPTION WHEN OTHERS THEN
                         DBMS_OUTPUT.PUT_LINE('�����߻� : '||SQLERRM);
                    END;
                    
                    (����)
                    ACCEPT P_AMT PROMPT '���� : '
                    DECLARE
                      V_CNT NUMBER := 0;
                      V_CARTNO CHAR(13);
                      V_AMT NUMBER := TO_NUMBER('&P_AMT');
                    BEGIN
                      SELECT COUNT(*) INTO V_CNT         --�����Ͱ� �־ 1 �̴ϱ� INSERT�� �ƴ϶� UPDATE�� DELETE�� ����ȴ�.
                        FROM CART
                       WHERE CART_NO LIKE '20050806%';
                    
                      IF V_CNT = 0 THEN
                         V_CARTNO := '2005080600001';
                         INSERT INTO CART(CART_MEMBER, CART_NO, CART_PROD, CART_QTY)
                           VALUES('h001', V_CARTNO, 'P202000019', V_AMT);
                      ELSE
                         IF V_AMT != 0 THEN
                            UPDATE CART
                               SET CART_QTY = V_AMT
                             WHERE CART_NO = '2005080600001'
                               AND CART_PROD = 'P202000019';
                         ELSE
                            DELETE CART
                             WHERE CART_NO = '2005080600001'
                               AND CART_PROD = 'P20200019';
                         END IF;
                      END IF;
                    END;
                    
                ��뿹) ������̺��� �����ȣ 125��(Julia Nayer)����� ������ 'ST_CLERK'���� 'ST_MAN'���� �����Ǿ���.
                       �� ������ ������̺� �ݿ��ϰ� �� �� ���� ���� ���̺��� �����Ͻÿ�.
                    CREATE OR REPLACE TRIGGER TG_JOB_CHANGE
                    AFTER UPDATE ON EMPLOYEES
                    FOR EACH ROW -- NEW, OLD �� ������.
                    DECLARE
                      V_EID EMPLOYEES.EMPLOYEE_ID%TYPE:= :OLD.EMPLOYEE_ID; --125�� ���� �־��൵�ȴ�.
                      V_CNT NUMBER := 0; 
                      V_SDATE DATE; --���� ����
                      V_EDATE DATE; --���� ����
                    BEGIN
                      SELECT COUNT(*) INTO V_CNT
                        FROM JOB_HISTORY
                       WHERE EMPLOYEE_ID = 125; 
                       
                       IF V_CNT = 0 THEN
                          V_SDATE := :OLD.HIRE_DATE+1;
                          V_EDATE := SYSDATE-1;
                       ELSE 
                          SELECT A.END_DATE INTO V_SDATE
                            FROM (SELECT START_DATE, END_DATE
                                    FROM JOB_HISTORY
                                   WHERE EMPLOYEE_ID = 125
                                   ORDER BY 2 DESC)A
                           WHERE ROWNUM = 1;
                          V_SDATE:= V_SDATE + 1;
                          V_EDATE:= SYSDATE - 1;
                        END IF;
                         INSERT INTO JOB_HISTORY
                           VALUES(V_EID, V_SDATE, V_EDATE, :OLD.JOB_ID, :OLD.DEPARTMENT_ID);
                    END;
                    
                    (����)
                    DECLARE
                    BEGIN
                      UPDATE EMPLOYEES
                         SET (SALARY, JOB_ID) = (SELECT A.MIN_SALARY, 'ST_MAN'
                                                 FROM (SELECT MIN_SALARY
                                                         FROM JOBS
                                                        WHERE JOB_ID = 'ST_MAN') A)
                       WHERE EMPLOYEE_ID = 125;
                    END;