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
                        
                        
                        
    3)FLOOR(n), CEIL(n)  -- ����, �ø�
       - n�� ����� ������ ��ȯ
       - FLOOR : n�� ���ų� ũ������ ���� �� ���� ū ����
       - CEIL : n�� ���ų� ū ���� �� ���� ���� ����
       - ����, �޿� ó�� �ݾװ� ���õ� ���Ŀ� �ַ� ���     
            ��뿹) SELECT FLOOR(12.5), CEIL(12.5),
                          FLOOR(12), CEIL(12),
                          FLOOR(-12.5), CEIL(-12.5)
                    FROM DUAL;
    
    4)MOD(n,i), REMAINDER(n,i)
       - �������� ��ȯ
       - MOD : n�� i�� ���� ������ ��ȯ
               ������ = ������ - ���� * (FLOOR(������/����))
          ex) 15/6 �� ������ = 15 - 6 * (FLOOR(15/6))
                            = 15 - 6 * (FLOOR(2.5))
                            = 15 - 12
                            = 3
       - REMAINDER : n�� i�� ���� �������� i�� ���� ������ ���̸� MOD�� ���� �������� ��ȯ�ϰ� 
                                �������� �� �̻��� ���̸� �������� �Ǳ����� �������� �� �� ��ȯ
              ������ = ������ - ���� * (ROUND(������/����)
          ex) 15/6 �� ������ = 15 - 6 * (ROUND(15/6))
                            = 15 - 6 * (ROUND(2.5))
                            = 15 - 18
                            = -3
            
            ��뿹) SELECT MOD(15,6), REMAINDER(17,6),
                          MOD(15,7), REMAINDER(15,7)
                     FROM DUAL;
            
            ��뿹)������ �⵵�� �Է� �޾� ����� ����� �����Ͻÿ�.
                  ���� : (4�� ����̸鼭 100�� ����� �ƴϰų�) (400�� ����� �Ǵ� ��)
                  
                  ACCEPT P_YEAR PROMPT '�⵵ �Է�'
                  DECLARE
                     V_YEAR NUMBER(4) := TO_NUMBER('&P_YEAR');
                     V_RES VARCHAR2(100);
                  BEGIN
                     IF (MOD(V_YEAR,4) = 0 AND MOD(V_YEAR,100) != 0) OR MOD(V_YEAR, 400) = 0 THEN
                         V_RES := TO_CHAR(V_YEAR)||'���� �����Դϴ�';
                     ELSE
                         V_RES := TO_CHAR(V_YEAR)||'���� ����Դϴ�';
                     END IF;
                    
                    
                     DBMS_OUTPUT.PUT_LINE(V_RES);
                  END;
                     
    5)WIDTH_BUCKET(n, min, max, b)
       - min���� max �� ������ b���� �������� ������ �־��� �� n�� �� ���� �� ��� ������ ���ϴ�����
         �Ǻ��Ͽ� ������ �ε����� ��ȯ��
      ��뿹) SELECT WIDTH_BUCKET(0,700,8700,10) FROM DUAL;   
                -- ���� n = -1 => 0 ����    n = max => ����+1
                
      ��뿹)ȸ�����̺��� ȸ������ ���ϸ����� 3���� �׷����� ������ �� ȸ������ ���ϸ����� ���� �׷���
            ��ȸ�Ͽ� 1�׷쿡 ���� ȸ���� '���� ȸ��', 2�׷쿡 ���� ȸ���� '���� ȸ��', 3�׷쿡 ���� ȸ���� 'VIP ȸ��'��
            ������ ����Ͻÿ�.
                 Alias�� ȸ����ȣ, ȸ����, ����, ���ϸ���, ���    
            SELECT MEM_ID AS ȸ����ȣ,
                   MEM_NAME AS ȸ����,
                   MEM_JOB AS ����,
                   MEM_MILEAGE AS ���ϸ���,
                   CASE WHEN WIDTH_BUCKET(MEM_MILEAGE,500,9000,3) = 1 THEN
                             '���� ȸ��'
                        WHEN WIDTH_BUCKET(MEM_MILEAGE,500,9000,3) = 2 THEN
                             '���� ȸ��'
                        ELSE 
                             'VIP ȸ��'     
                   END AS ���
              FROM MEMBER 
              
              --CASE WHEN�� SELECT �������� ��밡��

      ��뿹)ȸ�����̺��� ȸ������ ���ϸ����� 5���� �׷����� ������ ����� ������ ���
                 Aliase�� ȸ����ȣ, ȸ����, ����, ���ϸ���, ����̸� ����� ���ϸ����� ���� ȸ���� 1����̰�,
                 ���� ���� ȸ���� 5����̴�.
                
           SELECT MEM_ID AS ȸ����ȣ,
                   MEM_NAME AS ȸ����,
                   MEM_JOB AS ����,
                   MEM_MILEAGE AS ���ϸ���,
                   CASE WHEN WIDTH_BUCKET(MEM_MILEAGE,,5) = 1 THEN
                             '5���'
                        WHEN WIDTH_BUCKET(MEM_MILEAGE,500,9000,5) = 2 THEN
                             '4���'
                        WHEN WIDTH_BUCKET(MEM_MILEAGE,500,9000,5) = 3 THEN
                             '3���'
                        WHEN WIDTH_BUCKET(MEM_MILEAGE,500,9000,5) = 4 THEN
                             '2���'     
                        ELSE 
                             '1���'     
                   END AS ���
              FROM MEMBER 



(MEM_MILEAGE,500,9000,3)
         : --�� �Ʒ� ����
(SELECT MIN(MEM_MILEAGE)
 FROM MEMBER,
(SELECT MAX(MEM_MILEAGE)+1
 FROM MEMBER,(����[�׷��]))











