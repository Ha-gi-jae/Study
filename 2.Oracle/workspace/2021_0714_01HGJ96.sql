2021_0713_)�̾.
-- DB = ����� �ƴ� ����
    4) RPAD(c1, n[, c2]), LPAD(c1, n[, c2])
       - RPAD : ������ ���� n�� c1�� �����ϰ� ����  ������ ������ c2�� �����Ѵ�.
       - LPAD : ������ ���� n�� c1�� �����ϰ� ����  ���� ������ c2�� �����Ѵ�.
       - c2�� �����Ǹ� ������ ä��
       - �е� = ������(��������) ä���ִ�~

��뿹) SELECT LPAD('12345', 7,'*') AS COL1,
              RPAD('9876', 6) AS COL2
              FROM DUAL;
 -- COL1 = '**12345'    COL2 = '9876  '
 
       SELECT TO_CHAR(PROD_COST) AS COL1,
              LPAD(PROD_NAME,30) AS COL3
              LPAD(TO_CHAR(PROD_COST),10) AS COL2,
              LPAD(TO_CHAR(PROD_COST),10,'#') AS "COST"
         FROM PROD;
-- COL1 = 210000  COL2 = '    210000'  COL3 = ####210000
-- COL1 = 1150000 COL2 = '   1150000'  COL3 = ###1150000 
-- LPAD�� �� �̿��ϸ� �������� ���Ľ�ų������. �ٵ� �� �Ⱦ�


    5) RTRIM(c1[, c2]), LTRIM(c1[, c2])   -- ������ �̰� �� �� ����. ���� �������ſ� ���δ�..
         - RTRIM : �־��� ���ڿ� C1 ���ο� C2 ���ڿ��� �����ʿ��� ã�� ����
         - LTRIM : �־��� ���ڿ� C1 ���ο� C2 ���ڿ��� ���ʿ��� ã�� ����
         - c2�� �����Ǹ� ������ ����(�ܾ� ���� ���� ���Ŵ� �Ұ���)
         -- ��ȿ ���鸸 ����. �ܾ� ������ ������ ��ȿ ����
    
    6) TRIM(c1)
         - �ܾ� ���� �Ǵ� �����ʿ� �߻��� ������ ��� ����
         - �ܾ� ���� ���� ���Ŵ� �Ұ���
         
SELECT MEM_NAME, MEM_HP,MEM_JOB,MEM_MILEAGE
  FROM MEMBER
 WHERE MEM_NAME = TRIM('     ������      ');
-- ã��. �յ� ������ �� �ڸ�.
SELECT MEM_NAME, MEM_HP,MEM_JOB,MEM_MILEAGE
  FROM MEMBER
 WHERE MEM_NAME = TRIM('     �� �� ��      ');
-- ��ã��. ���� ���̻��̿� ������ ����.
SELECT MEM_NAME, MEM_HP,MEM_JOB,MEM_MILEAGE
  FROM MEMBER
 WHERE MEM_NAME = '������';
-- ã��.
SELECT MEM_NAME, MEM_HP,MEM_JOB,MEM_MILEAGE
  FROM MEMBER
 WHERE MEM_NAME = '������    '; 
--������ ���� x '' ���� ������ ���ڿ�. ������ �ȳ���. '������' �� '������     ' �� �ٸ��� ������. 
         
         
c ���� n ����
    7) SUBSTR(c,n1[,n2])
         - �־��� ���ڿ� c���� n1��° ���� n2 ���� ��ŭ ���ڸ� �����Ͽ� �κ� ���ڿ��� ��ȯ
         - ����� ���ڿ���
         - n1, n2�� 1���� ���۵�
         - n2�� �����ǰų� ������ ������ ū n2�� ����ϸ� n1���� ��� ���ڿ��� ������
         - n1�� �����̸� �������� �������� ó����
         
��뿹) SELECT SUBSTR('������ �߱� ���ﵿ', 2,5),
              SUBSTR('������ �߱� ���ﵿ', 2),
              SUBSTR('������ �߱� ���ﵿ', 2,20),
              SUBSTR('������ �߱� ���ﵿ', -2,5),
              SUBSTR('������ �߱� ���ﵿ', -7,5)
         FROM DUAL;
       
��뿹) ������ 2005�� 4�� 1���� ��� CART_NO�� �ڵ� �����Ͻÿ�. -- ��ư�
          SELECT TO_CHAR(SYSDATE,'YYYYMMDD')||TRIM(TO_CHAR(TO_NUMBER(SUBSTR(MAX(CART_NO),9)) + 1,'00000'))
            FROM CART
           WHERE CART_NO LIKE '20050401%';
         -- TO_CHAR(SYSDATE,'YYYYMMDD')||TO_CHAR(TO_NUMBER(SUBSTR(MAX(CART_NO),9)) + 1,'00000')
         -- ������ �߻���. �̰� �߶󳻾���. TRIM�� �ڿ� �����ش�. �ڿ� ������ �߻��Ѱ���
         
       SELECT MAX(CART_NO) +1 --����
               --���� + ���� �ϸ鼭 ���ڷ� �ٲ�.
         FROM CART
        WHERE CART_NO LIKE '20050401%';
         --�Խ��� �� �ο��Ҷ�.
         
         
    8) REPLACE(c1,c2[,c3])
           - �־��� ���ڿ� c1�� ���Ե� c2�� ã�� c3�� ġȯ ��Ŵ
           - c3�� �����Ǹ� ã�� c2�� ������Ŵ
           - �ܾ� ������ ���� ���ſ� ���� �� ����

��뿹) SELECT REPLACE('���������� �߱� ���ﵿ','��������','����'), --�������ø� ���÷� �ٲ�
              REPLACE('���������� �߱� ���ﵿ','����'),   -- ������ ����.
              REPLACE('���������� �߱� ���ﵿ',' '), -- ''�� ' '����
              REPLACE('���������� �߱� ���ﵿ','��') --  ��ġ�ϴ� ��� ���� ����!
         FROM DUAL;
         
         
         
    9) INSTR(c1, c2[, m[, n]])
        - �־��� ���ڿ� c1���� c2���ڿ��� ó�� ���� ��ġ���� ��ȯ
        - m�� �˻� ������ġ�� ���� ������ �� ���
        - n�� c2���ڿ��� �ݺ� Ƚ���� ���Ͽ� �˻��ϴ� ��� ���
        
��뿹) SELECT INSTR('APPLE PERSIMON PEAR BEAR','E'), -- ó������ ������ E�� ��° = 5
              INSTR('APPLE PERSIMON PEAR BEAR','P',5), -- 5��°(E)���� �����ؼ� ù��° p ��ġ = 7
              INSTR('APPLE PERSIMON PEAR BEAR','P',5,2), -- 5��°(E)���� �����ؼ� �ι�° p ��ġ = 16
              INSTR('APPLE PERSIMON PEAR BEAR','P',5,3) -- 5��°(E)���� �����ؼ� ����° p ��ġ = 0 // 3��° P�� ����.
          FROM DUAL;
        
         
    10)
         
         