2021_0713_02)
    �Լ�(FUNCTION)
       - Ư�� ����� ��ȯ�ϱ� ���Ͽ� �̸� �ۼ��Ͽ� �����ϵ� ���
       - ��ȯ���� ����
       - ������ ��Ʈ��ũ ���� ������ �⿩
       - ������ �Լ��� ������ �Լ�(�����Լ�:SUM, AVG, COUNT, MAX, MIN)�� ����
       - ���ڿ�, ����, ��¥, ����ȯ, NULLó��, �����Լ� ���� ���� 
       - ��ø��� �� �� ����
       
       
   1. ���ڿ� �Լ�
     1) || (���ڿ� ���� ������)
         - �ڹ��� ���ڿ����� ���Ǵ� '+'�� ���� 
         - �� ���ڿ��� �����ϸ� ���ο� ���ڿ��� ��ȯ
         
��뿹)ȸ�����̺��� �泲�� �����ϴ� ȸ�������� ��ȸ�Ͻÿ�.
      Alias�� ȸ����ȣ,ȸ����,�ֹι�ȣ,�ּ��̸� �ֹι�ȣ�� 'XXXXXX-XXXXXXX'�������� ���
      
      SELECT MEM_ID AS ȸ����ȣ,
             MEM_NAME AS ȸ����,
             MEM_REGNO1||'-'||MEM_REGNO2 AS �ֹι�ȣ,
             MEM_ADD1||' '||MEM_ADD2 AS �ּ�
        FROM MEMBER
      WHERE MEM_ADD1 LIKE '�泲%'
      ORDER BY 1;
      --MEM_ID �Ǵ� 1 �� ��.
      
      
      
         
    2. CONCAT(c1, c2) 
      - �־��� ���ڿ� �ڷ� c1�� c2�� �����Ͽ� ��ȯ

��뿹)ȸ�����̺��� �泲�� �����ϴ� ȸ�������� ��ȸ�Ͻÿ�.
      Alias�� ȸ����ȣ,ȸ����,�ֹι�ȣ,�ּ��̸� �ֹι�ȣ�� 'XXXXXX-XXXXXXX'�������� ���
      SELECT MEM_ID AS ȸ����ȣ,
             MEM_NAME AS ȸ����,
             CONCAT(CONCAT(MEM_REGNO1,'-'),MEM_REGNO2) AS �ֹι�ȣ,
             CONCAT(MEM_ADD1,CONCAT(' ',MEM_ADD2)) AS �ּ�
        FROM MEMBER
      WHERE MEM_ADD1 LIKE '�泲%'
      ORDER BY 1;   

--���� ��ȣ���� ����.

    3. ASCII(c1), CHR(11) 
      - ASCII(c1) : c1�� �ش��ϴ� ASCII �ڵ尪 ��ȯ
      - CHR(n1) : ���� n1�� �ش��ϴ� ���ڸ� ��ȯ

��뿹)
        SELECT ASCII(PROD_ID), CHR(65) FROM PROD;

��뿹)

DECLARE
BEGIN
    FOR I IN 1..255 LOOP
        DBMS_OUTPUT.PUT_LINE(I||'='||CHR(I));
    END LOOP;
END;    
-- ���� - DBMS ���
         
         
         
         
         
         
         
         
--
SELECT EMP_NAME, SALARY
    FROM HR.EMPLOYEES
  WHERE DEPARTMENT_ID IN(SELECT A.DID
                         FROM(SELECT DEPARTMENT_ID AS DID,
                                     COUNT (*)
                                  FROM HR.EMPLOYEES
                                GROUP BY DEPARTMENT_ID
                                HAVING COUNT (*) >= 5) A);
                                --������ 5���̻��� �μ��ڵ�
--                                