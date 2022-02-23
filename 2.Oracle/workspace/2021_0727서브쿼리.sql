2021_0727
    **��� ����ó���� ���� ���̺��� �����Ͻÿ�.
    1) ���̺�� : REMAIN
    2) �÷���
    -----------------------------------------------------------------
    �÷���             ������Ÿ��         NULL��뿩��        �������    
    -----------------------------------------------------------------
    REMAIN_YEAR        CHAR(4)             N.N               FK
    PROD_ID          VARCHAR2(10)          N.N              PK/FK
    REMAIN_J_00       NUMBER(5)                           DEFAULT 0
    REMAIN_I          NUMBER(5)                           DEFAULT 0  
    REMAIN_O          NUMBER(5)                           DEFAULT 0  
    REMAIN_J_99       NUMBER(5)                           DEFAULT 0  
    REMAIN_DATE        DATE
    -----------------------------------------------------------------
    CREATE TABLE REMAIN(
    REMAIN_YEAR  CHAR(4),
    PROD_ID      VARCHAR2(10),
    REMAIN_J_00  NUMBER(5)  DEFAULT 0,
    REMAIN_I     NUMBER(5)  DEFAULT 0, 
    REMAIN_O     NUMBER(5)  DEFAULT 0,
    REMAIN_J_99  NUMBER(5)  DEFAULT 0,  
    REMAIN_DATE  DATE,
    
    CONSTRAINT pk_remain PRIMARY KEY (REMAIN_YEAR,PROD_ID),
    CONSTRAINT fk_remain_prod FOREIGN KEY (PROD_ID)
      REFERENCES PROD(PROD_ID));
      
      4)DML ��ɿ� �������� ���
        (1) INSERT ���� �������� ���
            - '( )'�� ������� �ʰ� �������� ���
            - INSERT ���� VALUES���� ����
            
                ��뿹) ���������̺�(REMAIN)�� PROD ���̺��� �ڷḦ �̿��Ͽ� ���ʵ����͸� �Է��Ͻÿ�.
                �⵵ : '2005'
                ��ǰ�ڵ� : PROD���̺��� ��ǰ�ڵ�(PROD_ID)
                ���������� : PROD���̺��� PROD_PROPERSTOCK
                �԰� �� ��� ���� : ����
                �⸻������ : PROD���̺��� PROD_PROPERSTOCK
                ��¥ : '2004-12-31'
                
                    INSERT INTO REMAIN(REMAIN_YEAR,PROD_ID,REMAIN_J_00,REMAIN_J_99,REMAIN_DATE)
                      SELECT '2005',PROD_ID,PROD_PROPERSTOCK,PROD_PROPERSTOCK,TO_DATE('20041231')
                        FROM PROD;
                        --SELECT ������ ������. SELECT���� �����͵��� INSERT �� �׸��� �����͵��̴�.~~
                        
        (2) UPDATE ���� �������� ���
            - �������� �÷��� �����ϴ� ��� '( )'�ȿ� ������ �÷��� ����Ͽ� �ϳ��� SET���� ó��
            
                ��뿹) 2005�� 1�� ��ǰ�� ���������� �̿��Ͽ� REMAIN���̺��� �����Ͻÿ�
                    ��������: REMAIN���̺� ������Ʈ   ��������: 2005�� 1���� ��ǰ�� �������� ����
                    UPDATE REMAIN
                       SET REMAIN_I = (��������1),
                           REMAIN_J_99 = (��������2),
                           REMAIN_DATE = TO_DATE('20050131')
                     WHERE ����
                                  ��
                    UPDATE REMAIN
                       SET (REMAIN_I, REMAIN_J_99, REMAIN_DATE) = (��������1)
                     WHERE ����
                     
            - ��������: 2005�� 1�� ��ǰ�� ��������
                SELECT BUY_PROD,
                       SUM(BUY_QTY)
                  FROM BUYPROD
                 WHERE BUY_DATE BETWEEN TO_DATE('20050101') AND TO_DATE('20050131')
                 GROUP BY BUY_PROD;
                 
                 (����)
                 UPDATE REMAIN B
                    SET (B.REMAIN_I, B.REMAIN_J_99, B.REMAIN_DATE) =
                        (SELECT B.REMAIN_I + A.AMT, B.REMAIN_J_99 + A.AMT, TO_DATE('20050131')
                        FROM (SELECT BUY_PROD AS BID,
                                     SUM(BUY_QTY) AS AMT
                                FROM BUYPROD
                               WHERE BUY_DATE BETWEEN TO_DATE('20050101') AND TO_DATE('20050131')
                               GROUP BY BUY_PROD) A
                       WHERE B.PROD_ID = A.BID)        
                  WHERE B.REMAIN_YEAR = '2005'
                    AND B.PROD_ID IN (SELECT DISTINCT BUY_PROD AS BID
                                       FROM BUYPROD
                                      WHERE BUY_DATE BETWEEN TO_DATE('20050101')
                                            AND TO_DATE('20050131'));
                
    (3) DELETE ���� �������� ���
                - WHERE �������� IN�̳� EXISTS �����ڸ� ����Ͽ� ������ �ڷḦ �� �� �����ϰ� ���� �� �� ����
            
                    ��뿹) ��ٱ������̺��� 2005�� 5�� ȸ����ȣ�� 'P001'�� �ڷḦ �����Ͻÿ�.
                        ��������: 2005�� 5���� ȸ����ȣ�� p001 �� �ڷ� ��ȸ
                        SELECT CART_MEMBER,
                               MEM_NAME 
                         FROM CART A, MEMBER B
                         WHERE A.CART_MEMBER = B.MEM_ID
                           AND CART_MEMBER = 'p001'
                           AND A.CART_NO LIKE '200505%';
                           
                        ��������: ���������� ��� �ڷ� ����
                        DELETE CART C
                         WHERE C.CART_MEMBER = 'p001' 
                           AND C.CART_NO LIKE '200505%';
                          
                ��뿹) 2005�� 6�� ��ǰ 'P302000001'�� �����ڷ� �� �Ǹ� ������ 5�� �̻��� �ڷḸ �����Ͻÿ�
                    DELETE CART
                     WHERE CART_NO LIKE '200506%'
                       AND CART_MEMBER = 'P302000001'
                       AND SUM(CART_QTY) >= 5;
                       
                ��뿹) 2005�� 4�� �Ǹ��ڷ� �� �Ǹ� �ݾ��� 5���� ������ �ڷḸ �����Ͻÿ�.
                    ��������: 2005�� 4�� �Ǹ��ڷ� �� �Ǹ� �ݾ��� 5���� ������ �ڷ� �˻�)
                    SELECT CART_PROD,
                           CART_QTY*PROD_PRICE
                      FROM CART, PROD
                     WHERE CART_PROD = PROD_ID
                       AND CART_NO LIKE '200504%';
                       AND CART_QTY * PROD_PRICE <= 50000;
                           
                    ��������: ��ٱ������̺��� �ڷ� ����
                    DELETE FROM CART A
                     WHERE EXISTS (SELECT 1
                                     FROM PROD
                                    WHERE A.CART_PROD = PROD_ID
                                      AND A.CART_QTY * PROD_PRICE <= 50000)
                       AND A.CART_NO LIKE '200504%';
                       
                ��뿹) ȸ�����̺��� ��ո��ϸ������� ���� ���ϸ����� ������ ȸ���� ȸ����ȣ, ȸ����, ���ϸ����� ����Ͻÿ�.                      
                    SELECT MEM_ID AS ȸ����ȣ,
                               MEM_NAME AS ȸ����,
                               MEM_MILEAGE AS ���ϸ���
                          FROM MEM_MILEAGE >= (SELECT AVG(MEM_MILEAGE)
                                               FROM MEMBER)  
                                               
                ��뿹) ȸ�����̺��� ��ո��ϸ������� ���� ���ϸ����� ������ ȸ���� ȸ����ȣ, ȸ���� ,���ϸ���, ��ո��ϸ����� ����Ͻÿ�.    
                    SELECT MEM_ID AS ȸ����ȣ,
                           MEM_NAME AS ȸ����,
                           MEM_MILEAGE AS ���ϸ���,
                           (SELECT ROUND(AVG(MEM_MILEAGE)) --WHERE ������ ������ ���� ����ŭ ����.
                              FROM MEMBER) AS ��ո��ϸ���
                      FROM MEMBER
                     WHERE MEM_MILEAGE >= (SELECT AVG(MEM_MILEAGE) -- ��� �� ��ŭ ����.
                                           FROM MEMBER);
                        --����Ʈ ������ �������� �� �� ����.   �ζ��� ��������.
                    (�������� �ѹ������� �ϱ�)
                    SELECT MEM_ID AS ȸ����ȣ,
                           MEM_NAME AS ȸ����,
                           MEM_MILEAGE AS ���ϸ���,
                           A.AMILE AS ��ո��ϸ���
                      FROM MEMBER, (SELECT ROUND(AVG(MEM_MILEAGE)) AS AMILE
                                      FROM MEMBER) A
                     WHERE MEM_MILEAGE >= A.AMILE
                
                ��뿹) ȸ������ �ڷῡ�� ���� ��ո��ϸ����� ���ϰ� �ڽ��� ���� ��ո��ϸ������� ���� ���ϸ����� ������ ȸ����  2005�� 4-6�� ������Ȳ�� ��ȸ�Ͻÿ�.
                    Alias�� ȸ����ȣ, ȸ����, ���űݾ��հ�
                    
                    1)ȸ������ �ڷῡ�� ���� ��ո��ϸ����� ���ϰ� �ڽ��� ���� ��ո��ϸ������� ���� ���ϸ����� ������ ȸ������
                        ��������: ȸ�����̺��� (��������)������ �����ϴ� ȸ������ ���
                        SELECT MEM_ID, MEM_NAME 
                          FROM MEMBER
                         WHERE MEM_MILEAGE < (��������) 
                        
                        ��������: ���� ��� ���ϸ���
                        SELECT TBLA.AMILE
                          FROM (SELECT CASE WHEN SUBSTR(MEM_REGNO2,1,1) = '1' OR SUBSTR(MEM_REGNO2,1,1) = '3' THEN
                                                 '����ȸ��'
                                       ELSE      '����ȸ��' END,
                                       ROUND(AVG(MEM_MILEAGE)) AS AMILE
                                  FROM MEMBER
                                 GROUP BY CASE WHEN SUBSTR(MEM_REGNO2,1,1) = '1' OR SUBSTR(MEM_REGNO2,1,1) = '3' THEN
                                                    '����ȸ��'
                                          ELSE      '����ȸ��' END) TBLA,MEMBER B
                         WHERE MEM
                         
                        SELECT MEM_ID, MEMNAME
                          FROM (SELECT SUBSTR(MEM_REGNO2,1,1) AS GEN,
                                       AVG(MEM_MILEAGE) AS AMILE
                                  FROM MEMBER
                                  GROUP BY SUBSTR(MEM_REGNO2,1,1) AS GEN
                            
                    2)2005�� 4-6�� ������Ȳ 
                        SELECT CART_MEMBER AS ȸ����ȣ,
                               TBLB.CNAME AS ȸ����,
                               SUM(CART_QTY*PROD_PRICE) AS ���űݾ��հ�
                          FROM CART, PROD, 
                               (SELECT C.MEM_ID AS CID,
                                       C.MEM_NAME AS CNAME, 
                                       B.G1,
                                       C.MEM_MILEAGE,
                                       round(B.AMILE) 
                                  FROM (SELECT A.GEN AS G1,
                                               AVG(A.MEM_MILEAGE) AS AMILE
                                          FROM (SELECT MEM_ID,MEM_NAME,
                                                       CASE WHEN SUBSTR(MEM_REGNO2,1,1)='1' OR SUBSTR(MEM_REGNO2,1,1)='3' THEN
                                                                 '��'
                                                       ELSE
                                                                 '��'
                                                       END AS GEN,
                                                       MEM_MILEAGE
                                                  FROM MEMBER) A
                                                 GROUP BY A.GEN) B ,
                                               (SELECT MEM_ID,MEM_NAME,
                                                       CASE WHEN SUBSTR(MEM_REGNO2,1,1)='1' OR SUBSTR(MEM_REGNO2,1,1)='3' THEN
                                                                 '��'
                                                       ELSE
                                                                 '��'
                                                       END AS GEN,
                                                       MEM_MILEAGE
                                                  FROM MEMBER) C 
                                 WHERE C.GEN=B.G1
                                   AND C.MEM_MILEAGE>=B.AMILE
                                 ORDER BY 3, 4) TBLB
                         WHERE CART_MEMBER=TBLB.CID
                           AND CART_PROD=PROD_ID
                           AND SUBSTR(CART_NO,1,6) BETWEEN '200504' AND '200506'
                         GROUP BY CART_MEMBER,TBLB.CNAME;