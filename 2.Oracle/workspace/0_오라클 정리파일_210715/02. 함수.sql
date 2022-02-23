1. �Լ�(FUNCTION)
    - Ư�� ����� ��ȯ�ϱ� ���Ͽ� �̸� �ۼ��Ͽ� �����ϵ� ���
    - ��ȯ���� ����
    - ������ ��Ʈ��ũ ���� ������ �⿩
    - ������ �Լ��� ������ �Լ�(�����Լ�: SUM,AVG,COUNT,MAX,MIN)�� ����
    - ���ڿ�, ����, ��¥, ����ȯ, NULLó��, �����Լ� ���� ����
    - ��ø��� �� �� ����
    --�Լ��� ������ ���� �����ڵ� �ٲ����
    -- = �� �ȵǰ� IN�� ��
    SELECT EMP_NAME,SALARY
        FROM HR.EMPLOYEES
        WHERE DEPARTMENT_ID IN (SELECT A.DID
                                FROM(SELECT DEPARTMENT_ID AS DID,
                                            COUNT(*)
                                        FROM HR.EMPLOYEES
                                        GROUP BY DEPARTMENT_ID
                                        HAVING COUNT(*)>=5)A);
                                        
    1) ���ڿ� �Լ�
        (1) || (���ڿ� ���� ������)
            - �ڹ��� ���ڿ����� ���Ǵ� '+'�� ����
            - �� ���ڿ��� �����Ͽ� ���ο� ���忭�� ��ȯ
            ��뿹) ȸ�����̺��� �泲�� �����ϴ� ȸ�������� ��ȸ�Ͻÿ�
                Alias ȸ����ȣ, ȸ����, �ֹι�ȣ('xxxxxx-xxxxxxx'����), �ּ�
                SELECT MEM_ID AS ȸ����ȣ,
                       MEM_NAME AS ȸ����,
                       MEM_REGNO1||'-'||MEM_REGNO2 AS �ֹι�ȣ,
                       MEM_ADD1||' '||MEM_ADD2 AS �ּ�
                    FROM MEMBER
                    WHERE MEM_ADD1 LIKE '�泲%'
                    ORDER BY 1;
                    
        (2) CONCAT(c1,c2)--�߾Ⱦ�
            - �־��� ���ڿ� �ڷ� C1�� C2�� �����Ͽ� ��ȯ
            ��뿹) ȸ�����̺��� �泲�� �����ϴ� ȸ�������� ��ȸ�Ͻÿ�
                Alias ȸ����ȣ, ȸ����, �ֹι�ȣ('xxxxxx-xxxxxxx'����), �ּ�
                SELECT MEM_ID AS ȸ����ȣ,
                       MEM_NAME AS ȸ����,
                       CONCAT(CONCAT(MEM_REGNO1,'-'),MEM_REGNO2) AS �ֹι�ȣ,
                       CONCAT(CONCAT(MEM_ADD1,' '),MEM_ADD2) AS �ּ�
                    FROM MEMBER
                    WHERE MEM_ADD1 LIKE '�泲%'
                    ORDER BY 1;
                    
         (3) ASCII(c1), CHR(n2)
            - ASCII(c1) : ���ڿ� n1�� �ش��ϴ� ASCII �ڵ尪 ��ȯ--���ڿ��� ���� ���� �ִ� ���ڿ� ���ؼ��� ����, ���ڿ� ��ü X
            - CHR(n1) : c1�� �ش��ϴ� ���ڸ� ��ȯ
            ��뿹)
                SELECT ASCII(MEM_NAME),CHR(65) 
                    FROM MEMBER;
                SELECT ASCII(PROD_ID),CHR(65) FROM PROD;
            ��뿹)
                DECLARE
                
                    BEGIN
                        FOR I IN 1..255 LOOP
                            DBMS_OUTPUT.PUT_LINE(I||'='||CHR(I));
                    END LOOP;
                END;            
                
         (4) RPAD(c1, n[,c2]),LPAD(c1, n[,c2])
            - RPAD : ������ ���� n�� c1�� �����ϰ� ���� ������ ������ c2�� �����Ѵ�.
            - LPAD : ������ ���� n�� c1�� �����ϰ� ���� ���� ������ c2�� �����Ѵ�.
            - c2�� �����Ǹ� ������ ä��
            ��뿹) 
                SELECT LPAD('12345',7,'*') AS COL1,
                        RPAD('9876',6) AS COL2
                    FROM DUAL;
                
                SELECT LPAD(TO_CHAR(PROD_COST),10,'#') AS "COST"
                    FROM PROD;
                    
        (5) RTRIM(c1 [,c2]), LTRIM(c1 [,c2])
            - RTRIM : �־��� ���ڿ� c1 ���ο� c2 ���ڿ��� �����ʿ��� ã�� ���� 
            - LTRIM : �־��� ���ڿ� c1 ���ο� c2 ���ڿ��� ���ʿ��� ã�� ���� 
            - c2�� �����Ǹ� ������ ����(�ܾ� ���� ���� ���Ŵ� �Ұ���)
            ��뿹) 
                - VARCHAR2(80)Ÿ���� CHAR(80)Ÿ������ �ٲٸ� ��ȿ������ ����
                - CHAR(80)���� VARCHAR2(80)���� �ٽ� �ٲٸ� ��ȿ������� ��ȿ�������� �޾Ƶ鿩��
                ==> UPDATE EMPLOYEES
                        SET EMP_NAME=RTRIM(EMP_NAME);
        
        (6) TRIM(c1)    
            - �ܾ� ���� �Ǵ� �����ʿ� �߻��� ������ ��� ����
            - �ܾ� ���� ���� ���Ŵ� �Ұ���
            ��뿹)
                SELECT MEM_NAME, MEM_HP, MEM_JOB,MEM_MILEAGE
                    FROM MEMBER
                    WHERE MEM_NAME=TRIM('������');
        
        (7) SUBSTR(c, n1 [,n2])
            - �־��� ���ڿ� c���� n1��° ���� n2 ������ŭ ���ڸ� �����Ͽ� �κ� ���ڿ��� ��ȯ
            - ����� ���ڿ���
            - n1, n2�� 1���� ���۵�
            - n2�� �����ǰų� ������ ������ ū n2�� ����ϸ� n1���� ��� ���ڿ��� ������
            - n1�� �����̸� �������� �������� ó����
            ��뿹)
                SELECT SUBSTR('������ �߱� ���ﵿ',2,5),
                        SUBSTR('������ �߱� ���ﵿ',2),
                        SUBSTR('������ �߱� ���ﵿ',2,20),
                        (SUBSTR('������ �߱� ���ﵿ',-2,5))
                    FROM DUAL;
            ��뿹) ������ 2005�� 4�� 1���� ��� CART_NO�� �ڵ� �����Ͻÿ�
                SELECT TO_CHAR(SYSDATE,'YYYYMMDD')||TRIM(TO_CHAR(TO_NUMBER(SUBSTR(MAX(CART_NO),9))+1,'00000'))
                    FROM CART
                    WHERE CART_NO LIKE '20050401%';
                -- CART_NO�� ���ڷ� �ٲ� �� �ֱ� ������ ==> ������ �� ���ڰ� ������ ���ڸ� ������ ���ڷ� �ٲٰ� �ϸ� ��.
                SELECT MAX(CART_NO)+1
                    FROM CART
                    WHERE CART_NO LIKE '20050401%';
                
        (8) REPLACE(c1,c2[,c3])
            - �־��� ���ڿ� c1�� ���Ե� c2�� ã�� c3�� ġȯ��Ŵ
            - c3�� �����Ǹ� ã�� c2�� ������Ŵ
            - �ܾ� ������ ���� ���ſ� ���� �� ����
            ��뿹)
                SELECT REPLACE('���������� �߱� ���ﵿ','��������','����'), 
                        REPLACE('���������� �߱� ���ﵿ','����'),
                        REPLACE('���������� �߱� ���ﵿ','��') --�ϳ��� �����ϴ°� �ƴ϶� �־��� ���ڿ����� �ִ� ��� ���ڸ� ����
                    FROM DUAL;
                    
        (9) INSTR(c1, c2 [, m[,n]])
            - �־��� ���ڿ� c1���� c2���ڿ��� ó�� ���� ��ġ���� ��ȯ
            - m�� �˻� ������ġ�� ���� ������ �� ���
            - n�� c2���ڿ��� �ݺ� Ƚ���� ���Ͽ� �˻��ϴ� ��� ���
            ��뿹)
                SELECT INSTR('APPLE PERSIMON PEAR BEAR','E'),
                        INSTR('APPLE PERSIMON PEAR BEAR','P',5),
                        INSTR('APPLE PERSIMON PEAR BEAR','P',5,2),
                        INSTR('APPLE PERSIMON PEAR BEAR','P',5,3)
                    FROM DUAL;
        
            
    2) �����Լ�
        (1) GREATEST(n1, n2 [,n3,...]), LEAST(n1, n2 [,n3,...])
            - GREATEST : �־��� �� (n1 ~ ..) �� ���� ū ���� ��ȯ
            - LEAST : �־��� �� (n1 ~ ..) �� ���� ���� ���� ��ȯ
            ��뿹) 
                SELECT GREATEST(50,70,90),
                        LEAST(50,70,90)
                    FROM DUAL;
            ��뿹) ȸ�����̺��� ���ϸ����� 1000�̸��� ��� ȸ���� ���ϸ����� 1000���� ���� ����Ͻÿ�.
                Alias ȸ����ȣ, ȸ����, ���� ���ϸ���, ���� ���ϸ���
                SELECT MEM_ID AS ȸ����ȣ,
                        MEM_NAME AS ȸ����,
                        MEM_MILEAGE AS "���� ���ϸ���",
                        GREATEST(1000,MEM_MILEAGE) AS "���� ���ϸ���"
                    FROM LYW96.MEMBER;
        
        (2) ROUND(n [,i]), TRUNC(n [,i]) --�� �Ⱦ�. (��� ���� ó���ϴ°� ����)
            - ROUND : �־��� �� n�� �Ҽ��� ���� i+1 ��° �ڸ����� �ݿø��Ͽ� i��°���� ���--���� �ٶ��� �ݿø��ؼ� ��(�ٵ� DB���� �� ����)
                      i�� �����̸� �����κ� i��°���� �ݿø�
                      i�� �����Ǹ� 0���� ���ֵ�
            - TRUNC : ROUND�� ���� ����ǳ� �ݿø��� �ƴ϶� ����ó�� --���� ���� ���� �����ؼ� ����.
                ��뿹) ������̺��� �޿��� ���޾��� ����Ͽ� ���
                    Alias �����ȣ, �����, �޿�, ����, ���޾�
                            ����=�޿����� 17%
                            �޿����� �޿� - ����
                            �Ҽ��� 1�ڸ����� ���
                    SELECT EMPLOYEE_ID AS �����ȣ,
                            FIRST_NAME||' '||LAST_NAME AS �����,
                            SALARY AS �޿�,
                            TRUNC(SALARY*0.17,1) AS ����,
                            SALARY-(TRUNC(SALARY*0.17,1)) AS ���޾�
                        FROM HR.EMPLOYEES;               
                ��뿹) 2005�� 1��~3�� ��ǰ�з��� ��ո��Ծ��� ��ȸ�Ͻÿ�.
                    Alias �з��ڵ�, �з���, ��ո��Աݾ�
                            ��ո��Աݾ� ������ ǥ��                            
                    SELECT C.PROD_LGU AS �з��ڵ�,
                            B.LPROD_NM AS �з���,
                            AVG(A.BUY_QTY*C.PROD_COST) AS ��ո��Աݾ� 
                        FROM BUYPROD A, LPROD B, PROD C
                        WHERE A.BUY_PROD=C.PROD_ID
                            AND C.PROD_LGU = B.LPROD_GU
                            AND A.BUY_DATE BETWEEN '20050101' AND '20050331'
                        GROUP BY C.PROD_LGU, B.LPROD_NM
                        ORDER BY 1;
                        
        (3) FLOOR(n)(����), CEIL(n)(�ø�) 
            - n�� ����� ������ ��ȯ
            - FLOOR : n�� ���ų� ũ�� ���� ���� �� ���� ū ����
            - CEIL(n) : n�� ���ų� ū ���� �� ���� ���� ����
            - ����, �޿�ó�� �ݾװ� ���õ� ���Ŀ� �ַ� ���
            ��뿹) 
                SELECT FLOOR(12.1), CEIL(12.1),
                        FLOOR(12), CEIL(12),
                        FLOOR(-12.1), CEIL(-12.1)
                    FROM DUAL;
                    
        (4) MOD(n,i), REMAINDER(n,i)
            - �������� ��ȯ
            - MOD : n�� i�� ���� ������ ��ȯ
                    ������ = ������ - ���� * (FLOOR(������/����))
                    ex) 15/6 �� ������ = 15 - 6 * (FLOOR(15/6))
                                      = 15 - 6 * (FLOOR(2.5))
                                      = 15 - 12
                                      = 3
            - REMAINDER : n�� i�� ���� �������� i�� ���������̸� MOD�� ���� �������� ��ȯ�ϰ�
                          �������� ���� �ʰ��̸� ���� �򿡼� �Ǳ� ���� �������� �� �� ��ȯ
                          ex) 15/6 �� ������ = 15 - 6 * (ROUND(15/6))
                                      = 15 - 6 * (ROUND(2.5))
                                      = 15 - 18
                                      = -3
                ��뿹) 
                    SELECT MOD(15,6), REMAINDER(15,6),
                            MOD(15,7), REMAINDER(15,7)
                        FROM DUAL;
                ��뿹) ������ �⵵�� �Է� �޾� ���� ����� �����Ͻÿ�.
                        ���� : (4�� ����̸鼭 100�� ����� �ƴϰų�) (400�� ����� �Ǵ� ��)
                        
                        ACCEPT P_YEAR PROMPT '�⵵ �Է�'
                        DECLARE
                            V_YEAR NUMBER(4):=TO_NUMBER('&P_YEAR');
                            V_RES VARCHAR2(100);
                        BEGIN
                            IF (MOD(V_YEAR,4)=0 AND MOD(V_YEAR,100)!=0) OR MOD(V_YEAR,400)=0 THEN
                                V_RES:=TO_CHAR(V_YEAR)||'���� �����Դϴ�.';
                            ELSE
                                V_RES:=TO_CHAR(V_YEAR)||'���� ����Դϴ�.';
                            END IF;
                            
                            DBMS_OUTPUT.PUT_LINE(V_RES);
                        END;
                        
        (5) WIDTH_BUCKET(n, min, max, b) --min�� ����, max�� ����X
            - min ���� max ������ b���� �������� ������ �־��� �� n �� �� ���� �� ��� ������ ���ϴ����� �Ǻ��Ͽ�
              ������ �ε����� ��ȯ
            ��뿹) SELECT WIDTH_BUCKET(51,0,101,10) FROM DUAL;
            ��뿹) ȸ�����̺��� ȸ������ ���ϸ����� 3���� �׷����� ������ �� ȸ������ ���ϸ����� ���� �׷��� 
                   ��ȸ�Ͽ� 1�׷쿡 ���� ȸ���� '����ȸ��', 2�׷쿡 ���� ȸ���� '���� ȸ��', 3�׷쿡 ���� ȸ����
                   'VIP ȸ��'�� ����� ����Ͻÿ�
                   Alias ȸ����ȣ, ȸ����, ����, ���ϸ���, ���
                   SELECT MEM_ID AS ȸ����ȣ,
                         MEM_NAME AS ȸ����, 
                         MEM_JOB AS ����,
                         MEM_MILEAGE AS ���ϸ���,
                         -- CASE WHEN �� SELECT �������� ���.
                         CASE WHEN WIDTH_BUCKET(MEM_MILEAGE,(SELECT MIN(MEM_MILEAGE) FROM MEMBER),
                                                (SELECT MAX(MEM_MILEAGE) FROM MEMBER)+1,5) =5 THEN
                                    '����ȸ��'
                              WHEN WIDTH_BUCKET(MEM_MILEAGE,(SELECT MIN(MEM_MILEAGE) FROM MEMBER),
                                                (SELECT MAX(MEM_MILEAGE) FROM MEMBER)+1,5) =4 THEN
                                    '����ȸ��'
                              WHEN WIDTH_BUCKET(MEM_MILEAGE,(SELECT MIN(MEM_MILEAGE) FROM MEMBER),
                                                (SELECT MAX(MEM_MILEAGE) FROM MEMBER)+1,5) =3 THEN
                                    'VIP'
                              WHEN WIDTH_BUCKET(MEM_MILEAGE,(SELECT MIN(MEM_MILEAGE) FROM MEMBER),
                                                (SELECT MAX(MEM_MILEAGE) FROM MEMBER)+1,5) =2 THEN
                                    'VVIP'
                             WHEN WIDTH_BUCKET(MEM_MILEAGE,(SELECT MIN(MEM_MILEAGE) FROM MEMBER),
                                                (SELECT MAX(MEM_MILEAGE) FROM MEMBER)+1,5) =1 THEN
                                    'VVVIP'
                        END AS ���
                    FROM MEMBER;            
            ��뿹) ȸ�����̺��� ȸ������ ���ϸ����� 5���� �׷����� ������ ����� ����� ���
                    Alias ȸ����ȣ, ȸ����, ����, ���ϸ���, ����̸� 
                          ����� ���ϸ����� ���� ȸ���� 1����̰�, ���� ���� ȸ���� 5����̴�.
                 SELECT MEM_ID AS ȸ����ȣ,
                         MEM_NAME AS ȸ����, 
                         MEM_JOB AS ����,
                         MEM_MILEAGE AS ���ϸ���,
                         -- CASE WHEN �� SELECT �������� ���.
                         6-WIDTH_BUCKET(MEM_MILEAGE,(SELECT MIN(MEM_MILEAGE) FROM MEMBER),
                                                (SELECT MAX(MEM_MILEAGE) FROM MEMBER)+1,5)||'���' AS ���
                    FROM MEMBER;
        
        
    3) ��¥�Լ�
        (1) SYSDATE
            - �ý��ۿ��� �����ϴ� ��¥����(��, ��, ��, ��, ��, ��) ��ȯ
            - '+', '-' ������ ���
            - ��¥ - ��¥ : �� ��¥ ������ ����(DAYS)
            ��뿹) 
                SELECT SYSDATE-10,
                        TO_CHAR(SYSDATE,'YYYY MM DD HH24:MI:SS'),
                        TRUNC(SYSDATE - TO_DATE('19960907')),
                        TO_DATE('2024-01-22','YYYY-MM-DD'),
                        TO_DATE('19960906')+10000
                    FROM DUAL;
        
        (2) ADD_MONTHS(d,n)
            - ��¥������ �ڷ� d�� n��ŭ�� ���� ���� ��¥ ��ȯ
            ��뿹) ����� ���� �Ի����� ���� 3������ ���� ��¥�̴�. �� ����� �� ȸ�翡 ó�� �������� �Ի��� ��¥�� ���Ͻÿ�
                    Alias �����ȣ, �����, �Ի���, �����Ի���, �ҼӺμ���
                    SELECT EMPLOYEE_ID AS �����ȣ,
                            EMP_NAME AS �����,
                            HIRE_DATE AS �Ի���,
--                            HIRE_DATE - 90 AS �����Ի���,
                            ADD_MONTHS(TO_DATE('20210331'),-3)) AS �׽�Ʈ,
                            ADD_MONTHS(HIRE_DATE,-3) AS �����Ի���,
                            DEPARTMENT_NAME AS �ҼӺμ���
                        FROM HR.EMPLOYEES A, HR.DEPARTMENTS B
                        WHERE A.DEPARTMENT_ID=B.DEPARTMENT_ID
                        ORDER BY 1;
                
                    SELECT 
--                        ADD(MONTHS(TO_DATE('20210301'),-3))
                            ADD_MONTHS(TO_DATE('20210331'),-1)                        
                        FROM DUAL;
                                
        (3) NEXT_DAY(d, expr)
            - �־��� ��¥ d���� �ٰ��� ���� ���� 'expr'������ ��¥ ��ȯ
            - expr : ��, ȭ,..., ��, ������, ȭ����, ..., �Ͽ���
            ��뿹) 
                SELECT NEXT_DAY(SYSDATE,'��'),
                        NEXT_DAY(SYSDATE,'�����'),
                        NEXT_DAY(SYSDATE,'��')
                    FROM DUAL;
        
        (4) LAST_DAY(d)
            - ��¥�ڷ� d�� ���Ե� ���� ������ ���� ��ȯ
            ��뿹) �������̺�(BUYPROD)���� 2���� ���Ե� ���԰Ǽ��� ��ȸ�Ͻÿ�.
                SELECT COUNT(*) AS ���԰Ǽ�
                    FROM BUYPROD
                    WHERE BUY_DATE BETWEEN TO_DATE('20050201') AND LAST_DAY(TO_DATE('20050201'));
        
        (5) MONTHS_BETWEEN(d1, d2)
            - �� ��¥ �ڷ� ������ ���� ��ȯ
            ��뿹) 
                SELECT EMP_NAME,
                        HIRE_DATE,
                        TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)/12)||'��'|| 
                        MOD(TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)),12)||'����' AS �ټӱⰣ
                        
                    FROM HR.EMPLOYEES;
                    
        (6) EXTRACT(fmt FROM d)
            - ��¥�ڷ� d ���� 'fmt'�� ����� �ڷḦ ������
            - ��ȯ������ ������ ����������
            - 'fmt' : YEAR, MONTH, DAY, HOUR, MINUTE, SECOND
            ��뿹) �̹� �޿� ������ �ִ� ȸ�������� ��ȸ�Ͻÿ�
                    Alias ȸ����ȣ, ȸ����, �������
                    SELECT MEM_ID AS ȸ����ȣ,
                            MEM_NAME AS ȸ����,
                            EXTRACT(YEAR FROM MEM_BIR)||'�� '||
                            EXTRACT(MONTH FROM MEM_BIR)||'�� '||
                            EXTRACT(DAY FROM MEM_BIR)||'��' AS �������
                        FROM MEMBER
                        WHERE (EXTRACT(MONTH FROM SYSDATE)+4)=EXTRACT(MONTH FROM MEM_BIR);
                    
                    
                    
                SELECT EXTRACT(HOUR FROM SYSTIMESTAMP) FROM DUAL;
                    
                    COMMIT;

    4) ��ȯ�Լ�
        (1) CAST(expr AS Ÿ��)
            - 'expr'�� ���ǵ� �ڷḦ 'Ÿ��' ���·� �Ͻ��� �� ��ȯ
            ��뿹) 
                SELECT MEM_NAME AS ȸ����,
                        CAST(SUBSTR(MEM_REGNO1,1,2) AS NUMBER)+1900 AS ����⵵,
                        EXTRACT(YEAR FROM SYSDATE) - (CAST(SUBSTR(MEM_REGNO1,1,2) AS NUMBER)+1900) AS ����
                    FROM MEMBER
                    WHERE NOT MEM_REGNO1 LIKE '0%';
                    
        (2) TO_CHAR(expr[,fmt])
            - �־��� �ڷ� expr�� �������� ���ڿ� fmt�� ���߾� ���ڿ��� �����Ͽ� ��ȯ
            - expr�� ����, ��¥, ���ڿ�(CHAR, CLOB=>VARCHAR2��) Ÿ���� �ڷ�
            - ������ ����ȯ
            
                - ��¥���� �������ڿ�
                ------------------------------------------------------------------------------------------
                �����������ڿ�       �ǹ�         ��뿹
                ------------------------------------------------------------------------------------------
                CC                 ����         SELECT TO_CHAR(SYSDATE,'CC') FROM DUAL;
                AD, BC             ����         SELECT TO_CHAR(SYSDATE,'CC BC YYYY"��"') FROM DUAL;
                YYYY,YYY,YY,Y      �⵵         SELECT TO_CHAR(SYSDATE,'CC BC YY"��"') FROM DUAL;
                Q                  �б�         SELECT TO_CHAR(SYSDATE,'CC BC YYYY"��" Q"�б�"') FROM DUAL;
                MONTH, MON         ��           SELECT TO_CHAR(SYSDATE,'YYYY MON MONTH') FROM DUAL;
                MM, RM             ��
                W, WW, WWW         ����
                DD, DDD, J         ��           SELECT TO_CHAR(SYSDATE,'YYYY MM DD DDD J') FROM DUAL;
                DAY, DY, D         ����
                AM, PM, A.M., P.M. ����/����     
                MI                 ��
                SS, SSSSS          ��
                "���ڿ�"            ���������� ����� ��ȯ ���ڿ�
                ------------------------------------------------------------------------------------------
                
                - �������� �������ڿ�
                ------------------------------------------------------------------------------------------------------
                �����������ڿ�        �ǹ�                                 ��뿹
                ------------------------------------------------------------------------------------------------------
                9                   ���ڿ� �����Ǿ� ��ȿ���ڴ� ��ȿ���ڸ�    SELECT TO_CHAR(2345,'99,999') FROM DUAL;
                                    ����ϰ� ��ȿ�� 0�� ����ó��
                0                   ���ڿ� �����Ǿ� ��ȿ���ڴ� ��ȿ���ڸ�    SELECT TO_CHAR(2345,'00,000') FROM, DUAL;
                                    ����ϰ� ��ȿ�� 0�� 0�� ���
                $, L                ȭ���ȣ ���                         SELECT TO_CHAR(12345, 'L99,999') FROM DUAL;
                PR                  ������ '< >'�� ���� ���               SELECT TO_CHAR(-12345, '99,999PR') FROM DUAL;
                , (COMMA)           �ڸ���
                . (DOT)             �Ҽ���
                X                   16������ ��ȯ ���                     SELECT TO_CHAR(255,'XXXX') FROM DUAL;
                ------------------------------------------------------------------------------------------------------
        
        (3) TO_NUMBER(expr[,fmt])
            - �־��� �ڷ� 'expr'�� ���� 'fmt' ���Ŀ� ���߾� ���ڷ� ��ȯ
            - 'expr'�� ���ڿ� Ÿ���� �ڷ�
            - 'fmt'�� ��� ������� ����(���ڷ� ����ȯ ������ ���ĸ� ���� ����)
                ��뿹)
                    SELECT TO_NUMBER('12345', '9999900'),
                           --TO_NUMBER('12345', '99,999')    ,�� ���� ����
                           --TO_NUMBER('-12345', '99999PR')  -�� ���� ����
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
                           TO_DATE('20200320', 'YYYY-MM DD'),   -- -�� /�� �ٲ� ǥ��
                           --TO_DATE('20200332', 'YYYY-MM DD'),   ��¥ ������ ����� ����
                           --TO_DATE('20200320', 'AM YYYYMMDD'),  
                           --TO_DATE('20200320', 'YYYY MONTH DD'),
                           TO_DATE('20200320')
                        FROM DUAL;
                        
    5) �����Լ�
        - �־��� �ڷḦ Ư�� �÷��� �������� �׷����� ������ �׷캰�� �ڷῡ ���� ���踦 ��ȯ�ϴ� �Լ�
        - SUM, AVG, COUNT, MIN, MAX
            (�������)
            SELECT [�÷�]list],
                   SUM|AVG|MIN|MAX(expr)|COUNT(column|*),
                                :
                FROM ���̺��
                [WHERE ����]
                [GROUP BY �÷���[,�÷���,...]]
                [HAVING ����]
                [ORDER BY �÷���|�÷��ε���[ASC|DESC][,�÷���|�÷��ε���[ASC|DESC],...];
            
        (1) SUM(expr)
            - 'expr'�� ǥ���Ǵ� ���� �Ǵ� �÷��� ���� ���� �հ踦 ��ȯ
                ��뿹) ������̺��� ��� ����� �޿� �Ѿ��� ���Ͻÿ�.
                    SELECT SUM(SALARY)
                        FROM HR.EMPLOYEES;
                        
                ��뿹) ������̺��� �μ��� �޿� �հ踦 ���Ͻÿ�. 
                    SELECT DEPARTMENT_ID AS �μ��ڵ�,
                           SUM(SALARY) AS �޿��հ�
                        FROM HR.EMPLOYEES
                        GROUP BY DEPARTMENT_ID
                        ORDER BY 1;
                        
                ��뿹) ������̺��� �μ��� �޿� �հ踦 ���ϵ� �հ谡 10000�̻��� �μ��� ��ȸ�Ͻÿ�.
                    SELECT DEPARTMENT_ID AS �μ��ڵ�,
                           SUM(SALARY) AS �޿��հ�
                        FROM HR.EMPLOYEES
                        GROUP BY DEPARTMENT_ID
                        HAVING SUM(SALARY) >= 10000
                        ORDER BY 1;
                        
                 ��뿹) 2005�� 5�� ȸ���� ������Ȳ(ȸ����ȣ, ���ż����հ�, ���űݾ��հ�)�� ��ȸ�Ͻÿ�.  
                    SELECT A.CART_MEMBER AS ȸ����ȣ,
                           SUM(A.CART_QTY) AS ���ż����հ�,
                           SUM(A.CART_QTY*B.PROD_PRICE) AS ���űݾ��հ�
                        FROM CART A, PROD B
                        WHERE A.CART_PROD = B.PROD_ID
                            AND A.CART_NO LIKE '200505%'
                        GROUP BY A.CART_MEMBER;
                        
                 ��뿹) 2005�� ���� ȸ���� ������Ȳ(��, ȸ����ȣ, ���ż����հ�, ���űݾ��հ�)�� ��ȸ�Ͻÿ�.
                    SELECT SUBSTR(A.CART_NO,5,2) AS ��,
                           A.CART_MEMBER AS ȸ����ȣ,
                           SUM(A.CART_QTY) AS ���ż����հ�,
                           SUM(A.CART_QTY * B.PROD_PRICE) AS ���űݾ��հ�
                        FROM CART A, PROD B
                        WHERE A.CART_PROD = B.PROD_ID
                            AND SUBSTR(CART_NO,1,4)='2005'
                        GROUP BY SUBSTR(A.CART_NO,5,2),A.CART_MEMBER
                        ORDER BY 1;
                        
                ��뿹) ȸ�����̺��� ������ ���ϸ��� �հ踦 ���Ͻÿ�.
                    SELECT MEM_JOB AS ������,
                           SUM(MEM_MILEAGE) AS "���ϸ��� �հ�" 
                        FROM MEMBER
                        GROUP BY MEM_JOB
                        ORDER BY SUM(MEM_MILEAGE);
                        
                ��뿹) ������̺��� �ٹ������� �޿��հ踦 ���Ͻÿ�     
                    SELECT D.COUNTRY_ID AS �ٹ������ڵ�,
                           D.COUNTRY_NAME AS ������,
                           TO_CHAR(SUM(A.SALARY), '999,990') AS �޿��հ�
                        FROM HR.EMPLOYEES A, HR.DEPARTMENTS B, HR.LOCATIONS C, HR.COUNTRIES D
                        WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
                          AND B.LOCATION_ID = C.LOCATION_ID
                          AND C.COUNTRY_ID = D.COUNTRY_ID
                        GROUP BY D.COUNTRY_ID, D.COUNTRY_NAME;
                        
                 ��뿹) ������̺��� �� �μ��� ���ʽ� �հ踦 ���Ͻÿ�.
                    ����� �μ��ڵ�, �μ���, ���ʽ� �հ��̰�, ���ʽ��� ��������(COMMISSION_PCT)�� �޿��� ���Ѱ���� 30%�� �����Ѵ�.    
                    SELECT A.DEPARTMENT_ID AS �μ��ڵ�,
                           B.DEPARTMENT_NAME AS �μ���,
                           NVL(SUM(A.COMMISSION_PCT * A.SALARY) * 0.3,0) AS "���ʽ� �հ�"
                        FROM HR.EMPLOYEES A, HR.DEPARTMENTS B
                        WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
                        GROUP BY A.DEPARTMENT_ID, B.DEPARTMENT_NAME
                        ORDER BY 1;
                        
        (2) AVG(expr)
            - 'expr'�� ���ǵ� �÷��̳� ������ ���� ���� ������ ���� ��ȯ
   
                ��뿹) ��� ����ȸ������ ��� ���ϸ����� ��ȸ�Ͻÿ�.
                    SELECT ROUND(AVG(MEM_MILEAGE)) AS "��� ���ϸ���"
                        FROM MEMBER
                        WHERE SUBSTR(MEM_REGNO2,1,1) IN('2','4');
    
                ��뿹) ȸ������ ���� ��� ���ϸ����� ��ȸ�Ͻÿ�.
                    SELECT CASE WHEN SUBSTR(MEM_REGNO2,1,1) = '2'
                                  OR SUBSTR (MEM_REGNO2,1,1) = '4' THEN
                                     '����ȸ��'
                                ELSE '����ȸ��' END AS ����,
                           ROUND(AVG(MEM_MILEAGE)) AS "��� ���ϸ���"
                        FROM MEMBER
                        GROUP BY CASE WHEN SUBSTR(MEM_REGNO2,1,1) = '2'
                                        OR SUBSTR (MEM_REGNO2,1,1) = '4' THEN
                                           '����ȸ��'
                                      ELSE '����ȸ��' END;
                        --SUBSTR(MEM_REGNO2,1,1) �� ���� 1, 2, 3, 4�� �����ɷ�.
            
               ��뿹) ������̺��� �� �μ��� ��ձ޿��� ��ȸ�Ͻÿ�.
                   SELECT B.DEPARTMENT_ID AS �μ��ڵ�,
                          B.DEPARTMENT_NAME AS �μ���,
                          ROUND(AVG(A.SALARY)) AS ��ձ޿�
                       FROM HR.EMPLOYEES A, HR.DEPARTMENTS B
                       WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
                       GROUP BY B.DEPARTMENT_ID, B.DEPARTMENT_NAME
                       ORDER BY 1;
                       
               ��뿹) 2005�� 1~6�� ���� ��� ���Ծ��� ��ȸ�Ͻÿ�.
                   SELECT EXTRACT(MONTH FROM BUY_DATE)||'��' AS ��,
                          ROUND(AVG(BUY_QTY*BUY_COST)) AS "��� ���Ծ�"
                       FROM BUYPROD
                       WHERE BUY_DATE BETWEEN TO_DATE('20050101') AND TO_DATE('20050630')
                       GROUP BY EXTRACT(MONTH FROM BUY_DATE)
                       ORDER BY 1;
               
               ��뿹) 2005�� 1��~6�� ���� ��� ���Ծװ� ���Ծ����� ��ȸ�ϵ� ���Ծ��� 400�����̻��� ���� ��ȸ�Ͻÿ�.
                   SELECT EXTRACT(MONTH FROM BUY_DATE)||'��' AS ��,
                          COUNT(*) AS ���԰Ǽ�,
                          ROUND(AVG(BUY_QTY*BUY_COST)) AS "��� ���Ծ�",
                          SUM(BUY_QTY*BUY_COST) AS ���Ծ���
                       FROM BUYPROD
                       WHERE BUY_DATE BETWEEN TO_DATE('20050101') AND TO_DATE('20050630')
                       GROUP BY EXTRACT(MONTH FROM BUY_DATE)
                       HAVING AVG(BUY_QTY*BUY_COST) >= '4000000'
                       ORDER BY 1;        
                ��뿹) 2005�� �з��� ��ձ��űݾ��� ��ȸ�Ͻÿ�
                    SELECT B.LPROD_GU AS �з��ڵ�,
                           B.LPROD_NM AS �з���,
                           ROUND(AVG(A.CART_QTY*C.PROD_PRICE)) AS ��ձ��űݾ�
                        FROM CART A, LPROD B, PROD C
                        WHERE B.LPROD_GU = C.PROD_LGU
                          AND A.CART_PROD = C.PROD_ID
                          AND SUBSTR(A.CART_NO,1,4) = '2005'
                        GROUP BY B.LPROD_GU, B.LPROD_NM
                        ORDER BY 1;
            
                ��뿹) 2005�� ȸ���� ���ɴ뺰 ��ձ��űݾ��� ��ȸ�Ͻÿ�.   
                    SELECT TRUNC((EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM A.MEM_BIR))/10)*10||'��' AS ȸ�����ɴ�, 
                           ROUND(AVG(B.CART_QTY*C.PROD_PRICE)) AS ��ձ��űݾ�
                        FROM MEMBER A, CART B, PROD C
                        WHERE A.MEM_ID = B.CART_MEMBER
                          AND B.CART_PROD = C.PROD_ID
                          AND B.CART_NO LIKE '2005%'
                        GROUP BY TRUNC((EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM A.MEM_BIR))/10)*10
                        ORDER BY 1;
                           
        (3) COUNT(Column��|*)
            - �׷쳻�� ���� ��(�ڷ��� ����)�� ��ȯ
            - �ܺ����ο��꿡 ���Ǵ� ��� '*'�� ����ϸ� ����Ȯ�� ����� ��ȯ�ϱ� ������ �ش� ���̺��� �÷����� ����ؾ� ��
            
                ��뿹) ������̺��� �� �μ��� ������� ��ȸ�Ͻÿ�.
                    SELECT DEPARTMENT_ID AS �μ��ڵ�
                           COUNT(*) AS �����1,
                           COUNT(LAST_NAME) AS �����2
                        FROM HR.EMPLOYEES
                        GROUP BY DEPARTMENT_ID
                        ORDER BY 1;
                
                ��뿹) 2005�� 5�� �з��� �ǸŰǼ��� ��ȸ�Ͻÿ�.
                    SELECT B.PROD_LGU AS �з�
                           COUNT(CART_QTY) AS �ǸŰǼ�
                        FROM CART A, PROD B
                        WHERE A.CART_PROD = B.PROD_ID
                          AND A.CART_NO LIKE '200505%'
                        GROUP BY B.PROD_LGU
                        ORDER BY 1;
                        
                ��뿹) 2005�� 5-6�� ȸ���� ����Ƚ���� ��ȸ�Ͻÿ�
                    Alias�� ȸ����ȣ, ����Ƚ��
                    SELECT A.CID AS ȸ����ȣ,
                           COUNT(*) AS ����Ƚ��
                        FROM (SELECT DISTINCT CART_NO AS CNO,
                                     CART_MEMBER AS CID
                                  FROM CART
                        WHERE SUBSTR(CART_NO,1,6) IN ('200505','200506')
                        ORDER BY 2) A
                        GROUP BY A.CID
                        ORDER BY 1;
                        
        (4) MAX(Column��), MIN(Column��)
            - MAX : �־��� �÷��� �� �ִ� ���� ��ȯ
            - MIN : �־��� �÷��� �� �ּ� ���� ��ȯ
            - �����Լ��� �ٸ� �����Լ��� ���� �� �� ����.
                ��뿹) 2005�� ���� ���Ծ� �� �ִ� ������ǰ�� �ּ� ������ǰ�� ��ǰ�ڵ�, ��ǰ��, �ִ���Ծ�, �ּҸ��Ծ�
                    SELECT BUY_DATE AS ��,
                           MAX(BUY_QTY*BUY_COST) AS �ִ���Ծ�,
                           MIN(BUY_QTY*BUY_COST) AS �ּҸ��Ծ�
                        FROM BUYPROD
                
                ��뿹) 2005�� 5�� �ִ뱸�� �������� ��ȸ�Ͻÿ�.
                    Alias�� ȸ����ȣ, ȸ����, ���űݾ�
                    SELECT A.CART_MEMBER AS ȸ����ȣ,
                           C.MEM_NAME AS ȸ����,
                           SUM(A.CART_QTY* B .PROD_PRICE) AS ���űݾ� -- SUM �տ� MAX�� �� �� ����.
                        FROM CART A, PROD B, MEMBER C
                        WHERE A.CART_MEMBER = C.MEM_ID
                          AND A.CART_PROD = B.PROD_ID
                          AND A.CART_NO LIKE '200505%'
                        GROUP BY A.CART_MEMBER, C.MEM_NAME
                        ORDER BY 3 DESC;
                
                (SUBQUERY)
                   SELECT D.MID AS ȸ����ȣ,
                          D.MNAME AS ȸ����,
                          E.MEM_ADD1||' '||MEM_ADD2 AS �ּ�,
                          E.MEM_HP AS ����ó,
                          D.AMT AS ���űݾ�                        --  D.AMT �տ��� max�� �� �� �ֱ��ѵ� �׷� ���̰� 2�����;��ϴ� ��ȿ����
                       FROM (SELECT A.CART_MEMBER AS MID,
                                    C.MEM_NAME AS MNAME,
                                    SUM(A.CART_QTY* B .PROD_PRICE) AS AMT
                                 FROM CART A, PROD B, MEMBER C
                                 WHERE A.CART_MEMBER = C.MEM_ID
                                   AND A.CART_PROD = B.PROD_ID
                                   AND A.CART_NO LIKE '200505%'
                                   GROUP BY A.CART_MEMBER, C.MEM_NAME
                                   ORDER BY 3 DESC) D, MEMBER E
                       WHERE D.MID = E.MEM_ID
                       AND ROWNUM = 1;
                    
    6) NULLó�� �Լ�
        - ����Ŭ���� �� �÷��� �⺻ �ʱⰪ�� ��� NULL��
        - NULL �ڷῡ ���� ��Ģ���� ����� ��� NULL��
        - NULL �ڷῡ ���� ������ �� �Լ��� IS NULL, IS NOT NULL, NVL, NVL2, NULLIF ���� ����
        (1) IS NULL, IS NOT NULL
            - Ư�� �÷��̳� ���� ���� NULL���� �Ǻ��ϱ� ���� ���
            - '=' �����ڷ� NULL�� ���θ� �Ǻ����� ����
            
                ��뿹) ������̺��� ���������ڵ�(COMMISSION_PCT)�� NULL�̾ƴ� ����� �����ȣ, �����, �Ի���, �μ��ڵ�, �޿��� ��ȸ�Ͻÿ�.
                    SELECT EMPLOYEE_ID AS �����ȣ,
                           EMP_NAME AS �����,
                           HIRE_DATE AS �Ի���,
                           DEPARTMENT_ID AS �μ��ڵ�,
                           SALARY AS �޿�
                        FROM HR.EMPLOYEES
                        WHERE COMMISSION_PCT IS NOT NULL; -- != NULL, <> NULL ���迬���ڷδ� NULL�� Ȯ���� �� ����.
        
        (2) NVL(c, val)
            - 'c'�� ���� �Ǵ��Ͽ� �� ���� NULL�̸� 'val' ���� ��ȯ�ϰ�, NULL�̾ƴϸ� 'c'�� ���� ��ȯ
            - 'c'�� 'val'�� �ڷ����� �����ؾ� ��.
            
                ��뿹) ��ǰ���̺��� PROD_SIZE ���� NULL�̸� '��ǰũ������ ����' ���ڿ��� ����Ͻÿ�.
                   Alias�� ��ǰ�ڵ�, ��ǰ��, ũ��, ���Դܰ�
                   SELECT PROD_ID AS ��ǰ�ڵ�,
                          PROD_NAME AS ��ǰ��,
                          NVL(PROD_SIZE,'��ǰũ������ ����') AS ũ��,
                          PROD_COST AS ���Դܰ�
                       FROM PROD;
                
                ��뿹) ������̺��� �����ȣ, �����, �μ��ڵ�, �����ڵ带 ����Ͻÿ�.
                       ��, �μ��ڵ尡 NULL�̸� 'CEO'�� ����Ͻÿ�.
                    SELECT EMPLOYEE_ID AS �����ȣ,
                           EMP_NAME AS �����,
                           NVL(TO_CHAR(DEPARTMENT_ID),'CEO') AS �μ��ڵ�,
                           JOB_ID AS �����ڵ�
                        FROM HR.EMPLOYEES;
                   
                ��뿹) 2005�� 7�� ��� ��ǰ�� ���� �Ǹ������� ��ȸ�Ͻÿ�  -- '���' �̶� ���� ���� (+) �� �������.
                   Alias�� ��ǰ�ڵ�, �Ǹż����հ�, �Ǹűݾ��հ�
                   SELECT B.PROD_ID AS ��ǰ�ڵ�,
                          SUM(A.CART_QTY) AS �Ǹż����հ�,
                          SUM(A.CART_QTY*B.PROD_PRICE) AS �Ǹűݾ��հ�
                       FROM CART A, PROD B
                       WHERE A.CART_PROD(+)= B.PROD_ID   -- �����ʿ� !!! (+) !!!!
                         AND A.CART_NO LIKE '200507%'
                       GROUP BY B.PROD_ID
                       ORDER BY 1;   
                   --���� ���, �ܺ������� �ִµ� �������ε� �־ ��Ȯ�� ����� �� ������. 
                   --ANSI �Ǵ� ���������� ����Ѵ�.
                       
                   SELECT B.PROD_ID AS ��ǰ�ڵ�,
                          NVL(SUM(A.CART_QTY),0) AS �Ǹż����հ�,
                          NVL(SUM(A.CART_QTY*B.PROD_PRICE),0) AS �Ǹűݾ��հ�
                       FROM CART A
                       RIGHT OUTER JOIN PROD B ON (A.CART_PROD= B.PROD_ID   
                         AND A.CART_NO LIKE '200507%')
                       GROUP BY B.PROD_ID
                       ORDER BY 1;
                    -- �Ϻ�.   

        (3) NVL2(c, val1, val2)
            - 'c'���� �Ǵ��Ͽ� �� ���� NULL�̸� 'val2'�� ��ȯ�ϰ� NULL�� �ƴϸ� 'val1'���� ��ȯ ��
            - 'val1'�� 'val2'�� ������ Ÿ���� ���ƾ� ��
            
                ��뿹) ������̺��� �����ȣ, �����, �μ��ڵ�, �����ڵ带 ����Ͻÿ�.
                       ��, �μ��ڵ尡 NULL�̸� 'CEO'�� ����Ͻÿ�.
                    
                    SELECT EMPLOYEE_ID AS �����ȣ,
                           EMP_NAME AS �����,
                           NVL2(DEPARTMENT_ID,TO_CHAR(DEPARTMENT_ID),'CEO') AS �μ��ڵ�,
                           JOB_ID AS �����ڵ�
                        FROM HR.EMPLOYEES;
                        
                ��뿹) ��ǰ���̺��� ��ǰ�� ��������(PROD_COLOR)�� ���� NULL�̸� '�������� ���� ��ǰ'�� NULL�� �ƴϸ� '�������� ���� ��ǰ'�� ����Ͻÿ�.
                    SELECT PROD_ID AS ��ǰ��ȣ,
                           PROD_NAME AS ��ǰ��,
                            NVL2(PROD_COLOR,'�������� ���� ��ǰ','�������� ���� ��ǰ') AS ����
                        FROM PROD;
                        
        (4) NULLIF(c1,c2)
            - 'c1'�� 'c2'�� ���Ͽ� ������ NULL�� ��ȯ�ϰ�, ���� ������ c1�� ��ȯ��
            
                ��뿹) ��ǰ���̺��� �ǸŰ��� ���԰��� ���Ͽ� �ǸŰ��� ���԰����� ���������� '�����ǰ' ������ '������ǰ'�� ������ ����Ͻÿ�.
                    Alias�� ��ǰ�ڵ�, ��ǰ��, ���԰�, �ǸŰ�, ���
                    SELECT PROD_ID AS ��ǰ�ڵ�,
                           PROD_NAME AS ��ǰ��,
                           PROD_COST AS ���԰�,
                           PROD_PRICE AS �ǸŰ�,
                           NVL2(NULLIF(PROD_COST,PROD_PRICE),'�����ǰ','������ǰ') AS ���
                        FROM PROD;
                
                ��뿹) ��ǰ���̺��� �ǸŰ��� ���԰��� ���Ͽ� �ǸŰ��� ���԰��� ���������� �ǸŰ���, ������ '������ǰ'�� �ǸŰ����� ����Ͻÿ�.
                    SELECT PROD_ID AS ��ǰ�ڵ�,
                           PROD_NAME AS ��ǰ��,
                           PROD_COST AS ���԰�,
                           NVL2(NULLIF(PROD_COST,PROD_PRICE),TO_CHAR(PROD_PRICE),'������ǰ') AS �ǸŰ�
                         --NVL(LPAD(TO_CHAR(NULLIF(PROD_PRICE,PROD_COST)),10),LPAD('������ǰ',11)) AS �ǸŰ�
                        FROM PROD;

        (5) ������(RANK �Լ�)
            - ����, �޿�, ���� ���� ������ ���Ҷ� ���
            - ORDER BY���� ROWNUM�� �÷��� ����Ŭ�� WHERE���� ORDER BY���� ������������� ��Ȯ�� ��� ��ȯ�� �Ұ��� ��
            - �̸� �ذ��ϱ� ���� RANK�� DENSE_RANK, ROW_NUMBER �Լ� ����
            - RANK�� DENSE_RANK �Լ��� ������
                - RANK : �ߺ� ������ �߻��ϸ� �ߺ� ���� ��ŭ ���� �������� ���� (ex 1,1,1,4,5...)
                - DENSE_RANK : �ߺ� ������ �߻��ص� ���� ������ �������� ���� ���� (ex 1,1,1,2,3,4...)
                - ROW_NUMBER : �ߺ��� ������� ���� ������ ���� (ex 1,2,3,4,5...)
            - SELECT ������ ���
            (�������)
            SELECT �÷�list,
                    RANK() OVER(ORDER BY �����÷��� DESC|ASC) AS  �÷���Ī,
                         :
              FROM ���̺��;
              
            ��뿹) ȸ�����̺��� ���ϸ����� ���� ȸ������ ���ʴ�� ����(���)�� �ο��Ͻÿ�.
                ȸ����ȣ, ȸ����, ���ϸ���, ���
                SELECT MEM_ID AS ȸ����ȣ,
                   MEM_NAME AS ȸ����,
                   MEM_MILEAGE AS ���ϸ���,
                   RANK()OVER(ORDER BY MEM_MILEAGE DESC) AS ���
              FROM MEMBER;
              
            ��뿹)ȸ�����̺��� ���ϸ����� ���� ȸ������ ���ʴ�� ����(���)�� �ο��ϰ� ���� 5���� ȸ����ȣ, ȸ����, ���ϸ���, ����� ����Ͻÿ�.
                SELECT MEM_ID AS ȸ����ȣ,
                       MEM_NAME AS ȸ����,
                       MEM_MILEAGE AS ���ϸ���,
                       MRK AS ���
                  FROM MEMBER B, (SELECT MEM_ID AS MID,
                                         RANK()OVER(ORDER BY MEM_MILEAGE DESC) AS MRK
                                    FROM MEMBER) A
                 WHERE A.MID=B.MEM_ID
                   AND A.MRK <= 5
                 ORDER BY 4; 
            
            ��뿹) ��ٱ��� ���̺��� 2005�� 5�� ���űݾ��� ���� ȸ������ ������ �ο��Ͽ� ȸ����ȣ, ȸ����, ���űݾ�, ������ ����Ͻÿ�.
                SELECT B.MEM_ID AS ȸ����ȣ,
                       B.MEM_NAME AS ȸ����,
                       SUM(A.CART_QTY*C.PROD_PRICE) AS ���űݾ�, 
                       RANK()OVER(ORDER BY SUM(A.CART_QTY*C.PROD_PRICE) DESC) AS ����
                  FROM CART A, MEMBER B, PROD C
                 WHERE A.CART_MEMBER = B.MEM_ID
                   AND A.CART_PROD = C.PROD_ID
                   AND A.CART_NO LIKE '200505%'
                 GROUP BY B.MEM_ID, B.MEM_NAME
--               ORDER BY 3 DESC; RANK���� �̹� ������� ���� ���ѳ��� �����൵�ȴ�.
            
            
                 