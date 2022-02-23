2021_0713_02)
    함수(FUNCTION)
       - 특정 결과를 반환하기 위하여 미리 작성하여 컴파일된 모듈
       - 반환값이 존재
       - 서버와 네트워크 성능 개선에 기여
       - 단일행 함수와 복수행 함수(집계함수:SUM, AVG, COUNT, MAX, MIN)로 구분
       - 문자열, 숫자, 날짜, 형변환, NULL처리, 집계함수 등이 있음 
       - 중첩사용 할 수 있음
       
       
   1. 문자열 함수
     1) || (문자열 결합 연산자)
         - 자바의 문자열에서 사용되는 '+'와 같음 
         - 두 문자열을 결합하며 새로운 문자열을 반환
         
사용예)회원테이블에서 충남에 거주하는 회원정보를 조회하시오.
      Alias는 회원번호,회원명,주민번호,주소이며 주민번호는 'XXXXXX-XXXXXXX'형식으로 출력
      
      SELECT MEM_ID AS 회원번호,
             MEM_NAME AS 회원명,
             MEM_REGNO1||'-'||MEM_REGNO2 AS 주민번호,
             MEM_ADD1||' '||MEM_ADD2 AS 주소
        FROM MEMBER
      WHERE MEM_ADD1 LIKE '충남%'
      ORDER BY 1;
      --MEM_ID 또는 1 을 써.
      
      
      
         
    2. CONCAT(c1, c2) 
      - 주어진 문자열 자료 c1과 c2를 결합하여 반환

사용예)회원테이블에서 충남에 거주하는 회원정보를 조회하시오.
      Alias는 회원번호,회원명,주민번호,주소이며 주민번호는 'XXXXXX-XXXXXXX'형식으로 출력
      SELECT MEM_ID AS 회원번호,
             MEM_NAME AS 회원명,
             CONCAT(CONCAT(MEM_REGNO1,'-'),MEM_REGNO2) AS 주민번호,
             CONCAT(MEM_ADD1,CONCAT(' ',MEM_ADD2)) AS 주소
        FROM MEMBER
      WHERE MEM_ADD1 LIKE '충남%'
      ORDER BY 1;   

--안쪽 괄호먼저 실행.

    3. ASCII(c1), CHR(11) 
      - ASCII(c1) : c1에 해당하는 ASCII 코드값 반환
      - CHR(n1) : 숫자 n1에 해당하는 문자를 반환

사용예)
        SELECT ASCII(PROD_ID), CHR(65) FROM PROD;

사용예)

DECLARE
BEGIN
    FOR I IN 1..255 LOOP
        DBMS_OUTPUT.PUT_LINE(I||'='||CHR(I));
    END LOOP;
END;    
-- 보기 - DBMS 출력
         
         
         
         
         
         
         
         
--
SELECT EMP_NAME, SALARY
    FROM HR.EMPLOYEES
  WHERE DEPARTMENT_ID IN(SELECT A.DID
                         FROM(SELECT DEPARTMENT_ID AS DID,
                                     COUNT (*)
                                  FROM HR.EMPLOYEES
                                GROUP BY DEPARTMENT_ID
                                HAVING COUNT (*) >= 5) A);
                                --직원이 5명이상인 부서코드
--                                