2021_0729
1. ������(RANK �Լ�)
    - ����, �޿�, ���� ���� ������ ���Ҷ� ���
    - ORDER BY���� ROWNUM�� �÷��� ����Ŭ�� WHERE���� ORDER BY���� ������������� ��Ȯ�� ��� ��ȯ�� �Ұ��� ��
    - �̸� �ذ��ϱ� ���� RANK�� DENSE_RANK, ROW_NUMBER �Լ� ����
    - RANK�� DENSE_RANK �Լ��� ������
        - RANK : �ߺ� ������ �߻��ϸ� �ߺ� ���� ��ŭ ���� �������� ����(ex 1,1,1,4,5..)
        - DENSE_RANK : �ߺ� ������ �߻��ص� ���� ������ �������� ���� ���� (ex 1,1,1,2,3,4..)
        - ROW_NUMBER : �ߺ��� ������� ���� ������ ���� (ex 1,2,3,4,5..)
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
              
            SELECT MEM_ID AS ȸ����ȣ,
                   MEM_NAME AS ȸ����,
                   MEM_MILEAGE AS ���ϸ���,
                   ROW_NUMBER()OVER(ORDER BY MEM_MILEAGE DESC) AS ���
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
--           ORDER BY 3 DESC; �̹� ��ũ���� ���� ���༭ �����൵�ȴ�.
        
        