1. �ݺ���
    - ����Ŭ�� �ݺ����� LOOP, WHILE, FOR���� ����
        
    (1) LOOP ��
        - �ݺ����� �⺻����
        (�������)
        LOOP
          �ݺ�ó����ɹ�(��);
          [EXIT WHEN ����;]
        END LOOP;
            - �⺻������ ���ѷ���
            - 'EXIT WHEN ����' : ������ ��(true)�̸� �ݺ��� ���(END LOOP �������� ���� �̵�)
            
            ��뿹) �������� 7���� ����ϴ� ����� �ۼ��Ͻÿ�.
                DECLARE
                  V_CNT NUMBER:= 1;
                  V_RES NUMBER:= 0; --�ʱⰪ ���� �ϰ� ����Ѵ�. ��ũ�����ʰ� ��� ���ư��� => ���ں��� �ʱ�ȭ�� ���� �ʾҴ�.
                BEGIN
                  LOOP
                    V_RES:= 7 * V_CNT;
                    EXIT WHEN V_CNT > 9;
                    DBMS_OUTPUT.PUT_LINE(7||'*'||V_CNT||'='||V_RES);
                    V_CNT:= V_CNT + 1; --�ڹٿ� �޸� ���������ڰ� �����Ƿ� �������� ����������.
                  END LOOP;
                END;
                    
    (2) WHILE ��
        - ���߾���� WHILE���� ���� ��� �� ����
        (�������)
        WHILE ���� LOOP
          �ݺ�ó����ɹ�(��);
        END LOOP;
            - '����'�� ���̸� �ݺ� ����
            
            ��뿹) �������� 7���� ����Ͻÿ�.
                DECLARE
                  V_CNT NUMBER:= 0;
                  V_RES NUMBER:= 0;
                BEGIN
                  WHILE V_CNT <9 LOOP
                    V_CNT:=V_CNT+1;
                    V_RES:=7*V_CNT;
                    DBMS_OUTPUT.PUT_LINE(7||' * '||V_CNT||' = '||V_RES); -- 7*V_CNT �ص��ȴ�. �׷� ���� RES �ʿ����.
                  END LOOP;
                END;
                    
            ����) �� 1���� 2���� WHILE���� ����Ͽ� �ۼ��Ͻÿ�.

        (3) FOR ��
        - ���߾���� FOR���� ������ ����
        - �Ϲ� �ݺ�ó���� ���� FOR���� CURSORó���� ���� FOR���� ����
        (�Ϲ� FOR�� �������)
            FOR �ε��� IN [REVERSE] �ʱⰪ..�ִ밪 LOOP
                �ݺ�ó����ɹ�(��);
            END LOOP;
                - '�ε���' : ������� ���� �ε����� �ý��ۿ��� �ڵ� ����
                - 'REVERSE' : �������� �ݺ�ó���� ���
             
            ��뿹) �������� 7���� ����Ͻÿ�.
                DECLARE
                BEGIN
                  FOR I IN 1..9 LOOP
                    DBMS_OUTPUT.PUT_LINE(7||'*'||I||'='||7*I);
                  END LOOP;  
                END;
                --�ݺ� Ƚ���� ��Ȯ�� �˶� ���� �ſ� ����
                
            ��뿹) ù���� 100���� �����ϰ�, �� ������ ���� ������ 2�辿 ������ �� ���ʷ� 200������ �Ѵ� ���� ����ݾ��� ���Ͻÿ�.
                DECLARE
                  V_SUM NUMBER:=0; --���� �հ�
                  V_DSUM NUMBER:=100; --�Ϻ� ������ �׼�
                  V_DAYS NUMBER:=0;
                BEGIN
                  FOR I IN 1..1000 LOOP
                    V_SUM:= V_SUM + V_DSUM;
                    IF V_SUM >= 2000000 THEN
                       EXIT;
                    END IF;
                    V_DSUM:=V_DSUM * 2;
                    V_DAYS:= I;
                  END LOOP;
                  DBMS_OUTPUT.PUT_LINE('�ϼ� : '||V_DAYS);
                  DBMS_OUTPUT.PUT_LINE('����ݾ� : '||V_SUM);
                END;
                    
        (CURSOR�� ���� FOR�� �������)
            FOR ���ڵ�� IN Ŀ���� LOOP
                �ݺ�ó����ɹ�(��);
            END LOOP;
                - '���ڵ��' : Ŀ���� ����Ű�� ���� ���� ������ �ִ� ������ �ý��ۿ��� ����
                - Ŀ������ ����(�÷�)�� ������ '���ڵ��.Ŀ���� �÷���' �������� ���
                - Ŀ���� OPEN, FETCH, CLOSE ��� ����
                - 'Ŀ������' : ���𿵿����� �����ؾ��� Ŀ������ �� 'SELECT' ���� ���������������� ���
            
            ��뿹)2005�⵵ ��ǰ�� �԰�����հ踦 ����ϴ� ����� Ŀ���� FOR���� �̿��Ͽ� �ۼ��Ͻÿ�.
            DECLARE
            BEGIN
              FOR REC1 IN (SELECT B.BUY_PROD AS BID,
                                  A.PROD_NAME AS PNAME,
                                 SUM(B.BUY_QTY) AS AMT 
                            FROM PROD A, BUYPROD B
                           WHERE A.PROD_ID = B.BUY_PROD
                             AND EXTRACT(YEAR FROM B.BUY_DATE) = 2005 
                           GROUP BY B.BUY_PROD, A.PROD_NAME)
              LOOP
                DBMS_OUTPUT.PUT_LINE('��ǰ�ڵ� : '||REC1.BID);
                DBMS_OUTPUT.PUT_LINE('��ǰ�� : '||REC1.PNAME);
                DBMS_OUTPUT.PUT_LINE('���Լ��� : '||REC1.AMT);
                DBMS_OUTPUT.PUT_LINE('----------------------');
              END LOOP;
            END;