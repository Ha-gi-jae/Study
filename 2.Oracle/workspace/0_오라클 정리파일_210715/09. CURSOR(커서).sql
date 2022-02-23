1. Ŀ��(CURSOR) -- FOR���� �� ����.
    - ����Ŭ SQL��ɾ ���Ͽ� ������� ����� ����
    - SELECT���� ���� ��ȯ�� ��� ������ ����� ���ʴ�� �����ؾ��ϴ� ��� ���
    - �����ڰ� ����� ���������� ������ �ʿ䰡 �ִ� ��� ���
    - IMPLICITE, EXPLICITE CURSOR
    - Ŀ���� ����� FOR���� �����ϰ� ����(����) -> OPEN -> FETCH -> CLOSE �ܰ踦 ���ʴ�� ����
    
    (1) �͸�Ŀ��(IMPLICITE CURSOR)
        - �̸��� ���� Ŀ��
        - SELECT���� ����Ǹ� ���(Ŀ��)�� �ڵ����� OPEN�� �� ��� ����� �Ϸ�� �� �� �ڵ����� CLOSE ��(���� �Ұ���)
        - Ŀ���Ӽ�
            - SQL%ISOPEN : Ŀ���� OPEN �����̸� ��(true) ��ȯ - �׻� ����(false)
            - SQL%NOTFOUND : Ŀ���� �ڷᰡ �������� ������ ��(true) ��ȯ
            - SQL%FOUND : Ŀ���� �ڷᰡ ���������� ��(true) ��ȯ
            - SQL%ROWCOUNT : Ŀ���� �����ϴ� �ڷ��� ����
            
    (2) Ŀ��(EXPLICITE CURSOR)
        - �̸��� �ο��� Ŀ��
        - ����ο��� ����
        
        (�������� - �����)
        CURSOR Ŀ����[(���� Ÿ�Ը�, [���� Ÿ�Ը�,...])] -- CUR_   ������ Ÿ�Ը� 
        IS
          SELECT ��;
        
        (�����)  
        OPEN Ŀ����[(�Ű�����[, �Ű�����,...])];
        
        FETCH Ŀ���� INTO ����list; -- ��
        
        CLOSE Ŀ����; --�ݺ��� ��
        
            ��뿹) 2005�� 5�� �԰��ǰ�� �����Ȳ�� ��ȸ�ϴ� ����� Ŀ���� �̿��Ͽ� �ۼ��Ͻÿ�.
                Alias�� ��ǰ�ڵ�, ��ǰ��, ����
                DECLARE
                  V_PID PROD.PROD_ID%TYPE;
                  V_PNAME PROD.PROD_NAME%TYPE;
                  V_AMT NUMBER:= 0;
                  V_CNT NUMBER:= 0;
                  
                  CURSOR CUR_BUY01(PDATE DATE) IS --�Ű����� ��� ���!
                    SELECT DISTINCT BUY_PROD
                      FROM BUYPROD
                     WHERE BUY_DATE BETWEEN PDATE AND LAST_DAY(PDATE);   -- BEGIN ���� �ƴ϶� INTO �ʿ� ����.
                BEGIN
                  OPEN CUR_BUY01(TO_DATE('20050501'));
                  LOOP
                    FETCH CUR_BUY01 INTO V_PID; -- ���� 2���� , ���� 1�� ��!// ������� �־��ش� �ݺ����鼭 ���� ������.
                    EXIT WHEN CUR_BUY01%NOTFOUND;
                    SELECT COUNT(*) INTO V_CNT
                      FROM CART
                     WHERE CART_PROD = V_PID 
                       AND CART_NO LIKE '200505%';
                       
                    IF V_CNT !=0 THEN
                        SELECT PROD_NAME, SUM(CART_QTY) INTO V_PNAME,V_AMT
                          FROM CART, PROD
                         WHERE CART_PROD = V_PID
                           AND CART_PROD = PROD_ID
                           AND CART_NO LIKE '200505%'
                         GROUP BY PROD_NAME;
                    
                    DBMS_OUTPUT.PUT_LINE('��ǰ�ڵ� : '||V_PID);
                    DBMS_OUTPUT.PUT_LINE('��ǰ�� : '||V_PNAME);
                    DBMS_OUTPUT.PUT_LINE('�Ǹż��� : '||V_AMT);
                    DBMS_OUTPUT.PUT_LINE('----------------------');
                    END IF;
                  END LOOP;  
                  DBMS_OUTPUT.PUT_LINE('�ǸŻ�ǰ �� : '||CUR_BUY01%ROWCOUNT);
                  CLOSE CUR_BUY01;
                END;
                
            ��뿹) 2005�⵵ ��ǰ�� �԰�����հ踦 ����ϴ� ����� Ŀ���� �̿��Ͽ� �ۼ��Ͻÿ�.
                Alias�� ��ǰ�ڵ�, ��ǰ��, �԰����
                --������
                 DECLARE
                  V_PID PROD.PROD_ID%TYPE;
                  V_PNAME PROD.PROD_NAME%TYPE;
                  V_AMT NUMBER:=0;
                  CURSOR CUR_BUY02 IS
                    SELECT B.BUY_PROD AS BID,
                           A.PROD_NAME AS PNAME,
                           SUM(B.BUY_QTY) AS AMT 
                    FROM PROD A, BUYPROD B
                   WHERE A.PROD_ID = B.BUY_PROD
                     AND EXTRACT(YEAR FROM B.BUY_DATE) = 2005 
                   GROUP BY B.BUY_PROD, A.PROD_NAME;
                BEGIN
                 OPEN CUR_BUY02;
                  LOOP
                    FETCH CUR_BUY02 INTO V_PID, V_PNAME, V_AMT;
                    EXIT WHEN CUR_BUY02%NOTFOUND;
                    
                    DBMS_OUTPUT.PUT_LINE('��ǰ�ڵ� : '||V_PID);
                    DBMS_OUTPUT.PUT_LINE('��ǰ�� : '||V_PNAME);
                    DBMS_OUTPUT.PUT_LINE('���Լ��� : '||V_AMT);
                    DBMS_OUTPUT.PUT_LINE('----------------------');
                  END LOOP;
                 CLOSE CUR_BUY02;
                END;
                
                
                (2005�⵵ ��ǰ�� �԰�����հ� ���� �����.)
                  SELECT B.BUY_PROD, A.PROD_NAME, SUM(B.BUY_QTY)
                    FROM PROD A, BUYPROD B
                   WHERE A.PROD_ID = B.BUY_PROD
                     AND EXTRACT(YEAR FROM B.BUY_DATE) = 2005 
                   GROUP BY B.BUY_PROD, A.PROD_NAME
                
                
                
                
                --��
                DECLARE
                  V_PID PROD.PROD_ID%TYPE;
                  V_PNAME PROD.PROD_NAME%TYPE;
                  V_AMT NUMBER:=0;
                  V_CNT NUMBER:=0;
                  
                    CURSOR CUR_BUY(PDATE DATE) IS
                      SELECT DISTINCT BUY_PROD
                        FROM BUYPROD
                       WHERE BUY_DATE BETWEEN PDATE AND LAST_DAY(TO_DATE('20051201'));
                BEGIN
                  OPEN CUR_BUY(TO_DATE('20050101'));
                  LOOP
                    FETCH CUR_BUY INTO V_PID;
                    EXIT WHEN CUR_BUY%NOTFOUND;
                      SELECT COUNT(*) INTO V_CNT
                        FROM BUYPROD
                       WHERE BUY_PROD = V_PID 
                         AND TO_CHAR(BUY_DATE,'YYYYMMDD') LIKE '2005%';
                    
                      IF V_CNT !=0 THEN
                        SELECT PROD_NAME, SUM(BUY_QTY) INTO V_PNAME,V_AMT
                          FROM BUYPROD, PROD
                         WHERE BUY_PROD = V_PID
                           AND BUY_PROD = PROD_ID
                           AND TO_CHAR(BUY_DATE,'YYYYMMDD') LIKE '2005%'
                         GROUP BY PROD_NAME; 
                
                    DBMS_OUTPUT.PUT_LINE('��ǰ�ڵ� : '||V_PID);
                    DBMS_OUTPUT.PUT_LINE('��ǰ�� : '||V_PNAME);
                    DBMS_OUTPUT.PUT_LINE('�԰���� : '||V_AMT);
                    DBMS_OUTPUT.PUT_LINE('----------------------');
                    END IF;
                  END LOOP;  
                  CLOSE CUR_BUY;
                END;
                
                