2021_0729
    4) MINUS
        - MINUS ������ �տ� ��ġ�� ������ ������� MINUS �ڿ� ����� ������ ����� ������ ��� ��ȯ
        
        ��뿹) ��ٱ������̺��� 4���� 5���� �Ǹŵ� ��ǰ �� 4���� �Ǹŵ� ��ǰ�� ��ǰ��ȣ, ��ǰ��, �����հ�, �Ǹűݾ��հ踦 ���Ͻÿ�.
            SELECT DISTINCT A.CART_PROD AS ��ǰ��ȣ,
                   B.PROD_NAME AS ��ǰ��
              FROM CART A, PROD B
             WHERE A.CART_PROD = B.PROD_ID
               AND A.CART_NO LIKE '200504%'
           MINUS
             SELECT DISTINCT A.CART_PROD AS ��ǰ��ȣ,
                   B.PROD_NAME AS ��ǰ��
              FROM CART A, PROD B
             WHERE A.CART_PROD = B.PROD_ID
               AND A.CART_NO LIKE '200505%'
