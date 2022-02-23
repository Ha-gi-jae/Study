4. ��ȯ�Լ�
    - Ư���������� �ٸ� Ÿ������ �Ͻ��� ����ȯ
    - TO_CHAR, TO_DATE, TO_NUMBER, CAST
    1)CAST(expr As Ÿ��)
        - 'expr'�� ���ǵ� �ڷḦ 'Ÿ��' ���·� �Ͻ��� �� ��ȯ
        
��뿹)
    SELECT MEM_NAME AS ȸ����,
            CAST(SUBSTR(MEM_REGNO1,1,2) AS NUMBER)+1900 AS ����⵵,
            EXTRACT(YEAR FROM SYSDATE) - (CAST(SUBSTR(MEM_REGNO1,1,2) AS NUMBER)+1900) AS ����
        FROM MEMBER
        WHERE NOT MEM_REGNO1 LIKE '0%';
        -- NOT. 0���� �����ϴ� ����� �����ض� 
        
        
    --  �Լ��� ���ν��� ���� 
    --  �ݵ�� �Լ��� ��ȯ���� �ִ�. SELECT WHERE ȥ�ڼ� �ҷ��� �����ִ�.
    --  ���ν����� ��ȯ���� ����. SELECT, FROM, WHERE �Ұ���. 
     
    2) TO_CHAR(expr[,[fmt]) --���� '' ���������. �ݵ�� �Լ��� ��ȯ���� �ִ�. SELECT WHERE ȥ�ڼ� �ҷ��� �����ִ�.
        - �־��� �ڷ� expr�� �������� ���ڿ� fmt�� ���߾� ���ڿ��� �����Ͽ� ��ȯ
        - expr�� ����, ��¥, ���ڿ�(CHAR, CLOB=>VARCHAR2��) Ÿ���� �ڷ�
---------------------------------------------------------------------------------------------------
         �����������ڿ�      �ǹ�          ��뿹
---------------------------------------------------------------------------------------------------
         CC                ����          SELECT TO_CHAR(SYSDATE,'CC') FROM DUAL;
         AD, BC            ����          SELECT TO_CHAR(SYSDATE,'CC BC YYYY "��"') FROM DUAL;
         YYYY,YYY,YY,Y     �⵵          SELECT TO_CHAR(SYSDATE,'CC BC YY"��"') FROM DUAL;
         Q                 �б�          SELECT TO_CHAR(SYSDATE,'CC BC YYYY"��" Q"�б�"') FROM DUAL;
         MONTH, MON        ��            SELECT TO_CHAR(SYSDATE,'YYYY MON MONTH') FROM DUAL;
         MM, RM(�θ�)      ��            SELECT TO_CHAR(SYSDATE,'YYYY MM RM') FROM DUAL;
         W, WW, WWW        ����          SELECT TO_CHAR(SYSDATE,'W WW WWW') FROM DUAL;
         DD, DDD, J        ��            SELECT TO_CHAR(SYSDATE,'DD DDD J') FROM DUAL;
         DAY, DY, D        ����          SELECT TO_CHAR(SYSDATE,'YYYY DAY DY D') FROM DUAL;
         AM, PM, A.M. P.M. ����/����      SELECT TO_CHAR(SYSDATE,'AM PM A.M. P.M.') FROM DUAL; -- '�ð��� ������' ���� ���Ķ�� ���� ����Ѵٴ°���.
         MI                ��            SELECT TO_CHAR(SYSDATE,'MI') FROM DUAL;
         SS, SSSSS          ��            SELECT TO_CHAR(SYSDATE,'SS SSSSS') FROM DUAL; -- SSSSS ���� 00��00��00�ʺ��� ����� ��
         "���ڿ�"           ���������� ����� ��ȯ ���ڿ�
---------------------------------------------------------------------------------------------------

������������ ���ڿ�
---------------------------------------------------------------------------------------------------
�����������ڿ�     �ǹ�                                  ��뿹
---------------------------------------------------------------------------------------------------
9           ���ڿ� �����Ǿ� ��ȿ���ڴ� ��ȿ���ڸ�        SELECT TO_CHAR(2345,'99,999') + 10 FROM DUAL; --2345 �տ� 2ĭ�� ������ ����. �ڸ���(.)�� ����ó��
            ����ϰ� ��ȿ�� 0�� ����ó��                -- ĳ���ͷ� ��ȯ�ȰͰ� 10�� ������. -- ,(����)�� ���Ǿ. ���� + ���� �̱⶧���� �Ұ���. , �� ���� ����. 
0           ���ڿ� �����Ǿ� ��ȿ���ڴ� ��ȿ���ڸ�       SELECT TO_CHAR(2345,'00,000') FROM DUAL;
            ����ϰ� ��ȿ�� 0�� 0�� ���
$,L         ȭ���ȣ ���                            SELECT TO_CHAR(12345,'L99,999') FROM DUAL;
PR          ������ '< >'�� ���� ���                 SELECT TO_CHAR(-12345,'99,999PR') FROM DUAL;
,(COMMA)    �ڸ���
.(DOT)      �Ҽ���
X           16������ ��ȯ ���                      SELECT TO_CHAR(255,'XXXX') FROM DUAL;
-- SELECT TO_CHAR(255,'����+����') + ���� FROM DUAL;  = ó�� ����.



3) TO_NUMBER(expr[,fmt])
- �־��� �ڷ� 'expr'�� ���� 'fmt' ���Ŀ� ���߾� ���ڷ� ��ȯ
- 'expr'�� ���ڿ� Ÿ���� �ڷ�
- 'fmt'�� ��� �����������(���ڷ� ����ȯ ������ ���ĸ� ���� ����)

��뿹)
    SELECT TO_NUMBER('12345', '9999900'),
                           --TO_NUMBER('12345', '99,999')  ,�� ���� ����
                           --TO_NUMBER('-12345', '99999PR') -�� ���� ����
                           TO_NUMBER('12345', '99999PR'),
                           TO_NUMBER('12345')
                        FROM DUAL;
(4) TO_DATE(expr[,fmt])
            - �־��� �ڷ� 'expr'�� ���� 'fmt' ���Ŀ� ���߾� ��¥�� ��ȯ
            - 'expr'�� ���ڿ� Ÿ���� �ڷ�
            - 'fmt'�� ��� ������� ����(��¥�� ����ȯ ������ ���ĸ� ���� ����)
            - �����ڷᰡ ��¥���Ŀ� �µ��� �����Ǿ�� ��
                ��뿹)
                   SELECT TO_DATE('20200320', 'YYYYMMDD'),
                           TO_DATE('20200320', 'YYYY-MM DD'),    -- - �� / �� �ٲ� ǥ��
                           --TO_DATE('20200332', 'YYYY-MM DD'),    ��¥������ ����� ����
                           --TO_DATE('20200320', 'AM YYYYMMDD'),
                           --TO_DATE('20200320', 'YYYY MONTH DD'),
                           TO_DATE('20200320')
                        FROM DUAL;