2021_0708_01)
1)SELECT �� ����
  SELECT [DISTINCT] �÷���|����|������ [AS]["][��Ī]["] �� �� �� ����.
        'DISTINCT' : �ߺ��� ���� ���� ,�����, ���� �ʾƵ��ȴ�.
        [AS]["][��Ī]["] : �÷��� �ο��� �� �ٸ� �̸����� Ư������ ���� " " �� ���� ����ؾ��Ѵ�.
        - ��½� �÷��� �������� ���ȴ�. 
        - �� ������ ����� �װ� �÷��� ������ �ȴ�. �װ� ���̷��� ���� ���� �ȴ�.
        
��뿹) ȸ�����̺�(MEMBER)�� �ֹι�ȣ(MEM_REGNO1)�� ����Ͽ� ����Ͽ� ȸ���� ���̸� ��ȸ�Ͻÿ�.
--              ���̺�                �÷�

        Alias�� ȸ����ȣ, ȸ����, �ֹι�ȣ, ����
--             [���� �÷��� ��� ���̺����� �˾ƾ���.]

        SELECT MEM_ID AS ȸ����ȣ,   -- ȸ����ȣ�� �ƴ� FROM ���� ���� ��Ī���� ������ " "�� ���ش�.
               MEM_NAME AS ȸ����,
               MEM_REGNO1||'-'||MEM_REGNO2 AS "�ֹ� ��ȣ",
               EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(MEM_REGNO1,1,2))+1900) AS ����
            FROM MEMBER;
            
            
--���� ������ �����Ƿ� WHERE �� ����.
-- 2000����� �����Ƿ� 1900�� ������.
-- �� ���� ��. year - year �̴ϱ�.
-- ���� EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(MEM_REGNO1,1,2))+1900) �� �̸����� �Ǿ�����.
-- EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(MEM_REGNO1,1,2))+1900) AS ����
-- �� ó�� �ٲٸ� ��Ī�� ���̷� �ٲ�鼭 ����ϰ� �ٲ�. ���� ��Ī�� �÷��� �������� ��.
-- �ڹٴ� 0���� ����Ŭ�� 1���� ī����.
-- ��Ī�� ���⸦�ϸ� FROM Ű�� ���ٰ� ����. ���� �� ���� , �� ��� ����� �����ɷ� �ν���.
-- "�ֹ� ��ȣ" �̷��� �ֵ���ǥ�� ������� ����� �ȴ�.

    (1) ������(OPERATER)
        - ��� ������
            +, -, /, *
    ��뿹)HR������ ��� ���̺�(EMPLOYEES)���� ���ʽ��� ����Ͽ� �޿��� ���޾��� ��ȸ�Ͻÿ�.
            ���ʽ� = �޿�* ���������ڵ�(COMMISSION_PCT)�� 35%
            ���޾� = �޿� + ���ʽ�
            ���: �����ȣ, �����, �޿�, ���ʽ�, ���޾�
            
            SELECT EMPLOYEE_ID AS �����ȣ,
            FIRST_NAME||' '||LAST_NAME AS �����,
            SALARY AS �޿�,
            NVL(SALARY * COMMISSION_PCT * 0.35,0) AS ���ʽ�,
            SALARY + NVL(SALARY * COMMISSION_PCT * 0.35,0) AS ���޾�
             FROM HR.EMPLOYEES;
-- NVL �� �� �� �ڿ� 0 �� ���ָ� NULL���� 0�� �־������.
--FROM ���� ���� �ڵ����� � ������ ��!            
--FROM���� HR.EMPLOYEES�� ���ָ� SELECT���� HR. �� ���� �ʰ� �ٷ� EMPLOYEES ���̺��� ����� �� �ִ�.
-- �������� �������� �ʴ´�. MOD��� �Լ��� ����.  
-- JAVA => "75" + 20 JAVA������ ���. 1. ������ Ÿ���� ��ġ ��Ŵ
--      2. "75" + "20" ���� ��ȯ.
--      3. "7520" ���� ����� ����.
-- ���ڰ� �ֿ켱����.
-- ORACLE => ���ڰ� �켱. "75" + 20 �� 75 + 20���� ��ȯ �ǰ� 95 �� ����� ����.
-- JAVA/ "AB" + 20 = "AB20"
-- ORACLE/ "AB" + 20 = ERROR "AB"�� ���ڷ� �ٲ� �� ����.

        - ���� ������ : ��Һ�, TRUE/FALSE�� ����� ��ȯ
            >, <, >=, <=, =, !=(<>)
    ��뿹)ȸ�����̺��� ���ϸ����� 4000�̻��� ȸ���� ȸ����ȣ, ȸ����, ����, ���ϸ����� ��ȸ�Ͻÿ�.
          (���ϸ����� ���� ȸ������ ��ȸ)
          
    SELECT MEM_ID AS ȸ����ȣ,
           MEM_NAME AS ȸ����,
           MEM_JOB AS ����,
           MEM_MILEAGE AS ���ϸ���
           FROM MEMBER 
         WHERE MEM_MILEAGE >= 4000
          ORDER BY MEM_MILEAGE DESC;
        
**ȸ�����̺� ���� ���� --ȸ�� ���̺� ���̰� ����.
1) d001ȸ���� �ֹι�ȣ460409-2000000, ��������� 1946/04/09 = > �ֹι�ȣ 010409-4234765, ��������� 2001/04/09
2) n001ȸ���� �ֹι�ȣ750323-1011014, ��������� 1975/03/23 = > �ֹι�ȣ 000323-3011014, ��������� 2000/03/23
3) v001ȸ���� �ֹι�ȣ520131-2402712, ��������� 1952/01/31 = > �ֹι�ȣ 020131-4402712, ��������� 2002/01/31     
    
**�������� : UPDATE��
    UPDATE ���̺��
       SET �÷��� = ��[,
           �÷��� = ��,
               :     ]
     [WHERE ����];
    
    UPDATE MEMBER
        SET MEM_REGNO1 = '010409',
            MEM_REGNO2 = '4234765',
            MEM_BIR = TO_DATE('20010409')
        WHERE MEM_ID = 'd001';
        
    SELECT MEM_ID,MEM_REGNO1,MEM_REGNO2,MEM_BIR
        FROM MEMBER
      WHERE MEM_ID = 'd001';
    
    
    UPDATE MEMBER
        SET MEM_REGNO1 = '000323',
            MEM_REGNO2 = '3011014',
            MEM_BIR = TO_DATE('20000323')
      WHERE MEM_ID = 'n001';
      
      UPDATE MEMBER
        SET MEM_REGNO1 = '020131',
            MEM_REGNO2 = '4402712',
            MEM_BIR = TO_DATE('20020131')
      WHERE MEM_ID = 'v001';
    
    SELECT MEM_ID,MEM_REGNO1,MEM_REGNO2,MEM_BIR
        FROM MEMBER
      WHERE MEM_ID IN('d001', 'v001', 'n001');

--    WHERE MEM_ID = 'd001', 'v001', 'n001' �̷����� ��Ÿ�����ڸ� �������.  
-- IN�� OR ����ȰŶ� ����. 
-- �ֹε�Ϲ�ȣ�� ���ڿ��� �Ǿ�����. 
    
��뿹) ȸ�����̺��� ����ȸ�������� ��ȸ�Ͻÿ�.
        Alias ȸ����ȣ, ȸ����, �������, ���ϸ���,���
          
        SELECT MEM_ID AS ȸ����ȣ,
               MEM_NAME AS ȸ����,
               MEM_BIR AS �������,
               MEM_MILEAGE AS ���ϸ���,
               CASE WHEN SUBSTR(MEM_REGNO2,1,1) = '2' OR
                         SUBSTR(MEM_REGNO2,1,1) = '4' THEN
         -- SUBSTR(MEM_REGNO2,1,1) = ANY('2','4'); �� �ᵵ �ȴ�. 
                            '����ȸ��'
                    ELSE
                            '����ȸ��'
                END AS ���   
        FROM MEMBER
        WHERE SUBSTR(MEM_REGNO2,1,1) = '2'
            OR
            SUBSTR(MEM_REGNO2,1,1) = '4';
        
        
-- MEMBER ���̺��� �����͸� ������. ���ϸ����� 4000���� ū�� Ȯ��. ũ�� SELECT�� ���� ������ SLECT�� �ǳʶ�.  
-- ORDER BY ���� MEM_MILEAGE �� �ƴ� 4�� �ᵵ��. ������ ������ų� �Լ� ������ ��, �÷����� ���� �ʰ� �÷� INDEX�� ����.
-- SELECT ������ �÷� INDEX ����.
-- ORDER�� ��������.
-- ORDER BY MEM_ID,MEM_HP �̸� MEM_ID�� ������ ��, �ߺ��Ǵ°͸� MEM_HP�� �� �����Ѵ�. �� ���Ӱ� �����ϴ°� �ƴ�.
-- WHERE, ORDER BY �� SELECT���� �����ϴ°Ծƴ϶� MEMBER ���̺��� �����ϴ� ��.
-- ASC �������� DESC ��������. ������ ���������� �⺻�� �ȴ�. 
-- �ַ� ���ǹ�(WHERE ��) ������ ���ȴ�. ! = NOT.  <> ũ�ų� �۴� => �����ʴ�.

        - �� ������
            NOT, AND(����), OR(����)
            NOT: ������
            ---------------------------------------
             �Է�      ���
            A    B    (OR)         (AND)     (EX-OR)
            ---------------------------------------
            0    0     0             0         0
            0    1     1             0         1
            1    0     1             0         1
            1    1     1             1         0
            ---------------------------------------
            MEM_MILEAGE >=2000 OR EXTRACT(YEAR FROM MEM_BIR) <= 2000
                  A                       B

��뿹)������̺��� ��ձ޿� �̻� �޿��� �޴� ����� ��ȸ�Ͻÿ�.
      Alias�� �����ȣ, �����, �޿�, �μ���ȣ
      SELECT EMPLOYEE_ID AS �����ȣ,
             FIRST_NAME AS�����,
             SALARY AS �޿�,
             DEPARTMENT_ID AS �μ���ȣ,
             ROUND((SELECT AVG(SALARY)
                             FROM HR.EMPLOYEES),0) AS ��ձ޿�
        FROM HR.EMPLOYEES
       WHERE NOT SALARY < (SELECT AVG(SALARY)
                             FROM HR.EMPLOYEES);
        ORDER BY 4;
        
        
-- �켱 ���� NOT - AND - OR ��. ����Ǿ����� ��.

        - ��Ÿ ������
            IN, ANY, SOME, ALL, EXISTS, BETWEEN, LIKE �� ����.
--  IN���� EXISTS �����Ͱ� �ϳ� �̻� �����Ҷ�. BETWEEN ����.
        
        
        
        
        
        
        
        
        
        SELECT * FROM HR.JOBS;
-- ���̺�� �䰡 ������ �ʾƿ�~.
-- JOBS�� HR ������ �����ϱ�, JOBS �տ� HR. �� �������.
        