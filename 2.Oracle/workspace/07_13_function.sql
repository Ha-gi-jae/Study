1. 함수(FUNCTION)
    - 특정 결과를 반환하기 위하여 미리 작성하여 컴파일된 모듈
    - 반환값이 존재
    - 서버와 네트워크 성능 개선에 기여
    - 단일행 함수와 복수행 함수(집계함수: SUM,AVG,COUNT,MAX,MIN)로 구분
    - 문자열, 숫자, 날짜, 형변환, NULL처리, 집계함수 등이 있음
    - 중첩사용 할 수 있음
    --함수의 종류에 따라 연산자도 바꿔야함
    -- = 은 안되고 IN은 됨
    SELECT EMP_NAME,SALARY
        FROM HR.EMPLOYEES
        WHERE DEPARTMENT_ID IN (SELECT A.DID
                                FROM(SELECT DEPARTMENT_ID AS DID,
                                            COUNT(*)
                                        FROM HR.EMPLOYEES
                                        GROUP BY DEPARTMENT_ID
                                        HAVING COUNT(*)>=5)A);
                                        
    1) 문자열 함수
        (1) || (문자열 결함 연산자)
            - 자바의 문자열에서 사용되는 '+'와 같음
            - 두 문자열을 결합하여 새로운 문장열을 반환
            사용예) 회원테이블에서 충남에 거주하는 회원정보를 조회하시오
                Alias 회원번호, 회원명, 주민번호('xxxxxx-xxxxxxx'형식), 주소
                SELECT MEM_ID AS 회원번호,
                       MEM_NAME AS 회원명,
                       MEM_REGNO1||'-'||MEM_REGNO2 AS 주민번호,
                       MEM_ADD1||' '||MEM_ADD2 AS 주소
                    FROM MEMBER
                    WHERE MEM_ADD1 LIKE '충남%'
                    ORDER BY 1;
                    
        (2) CONCAT(c1,c2)--잘안씀
            - 주어진 문자열 자료 C1과 C2를 결합하여 반환
            사용예) 회원테이블에서 충남에 거주하는 회원정보를 조회하시오
                Alias 회원번호, 회원명, 주민번호('xxxxxx-xxxxxxx'형식), 주소
                SELECT MEM_ID AS 회원번호,
                       MEM_NAME AS 회원명,
                       CONCAT(CONCAT(MEM_REGNO1,'-'),MEM_REGNO2) AS 주민번호,
                       CONCAT(CONCAT(MEM_ADD1,' '),MEM_ADD2) AS 주소
                    FROM MEMBER
                    WHERE MEM_ADD1 LIKE '충남%'
                    ORDER BY 1;
                    
         (3) ASCII(c1), CHR(n2)
            - ASCII(c1) : 문자열 n1에 해당하는 ASCII 코드값 반환--문자열의 왼쪽 끝에 있는 문자에 대해서만 수행, 문자열 전체 X
            - CHR(n1) : c1에 해당하는 문자를 반환
            사용예)
                SELECT ASCII(MEM_NAME),CHR(65) 
                    FROM MEMBER;
                SELECT ASCII(PROD_ID),CHR(65) FROM PROD;
            사용예)
                DECLARE
                
                    BEGIN
                        FOR I IN 1..255 LOOP
                            DBMS_OUTPUT.PUT_LINE(I||'='||CHR(I));
                    END LOOP;
                END;            
                
         (4) RPAD(c1, n[,c2]),LPAD(c1, n[,c2])
            - RPAD : 지정된 길이 n에 c1을 저장하고 남는 오른쪽 공간에 c2를 삽입한다.
            - LPAD : 지정된 길이 n에 c1을 저장하고 남는 왼쪽 공간에 c2를 삽입한다.
            - c2가 생략되면 공백을 채움
            사용예) 
                SELECT LPAD('12345',7,'*') AS COL1,
                        RPAD('9876',6) AS COL2
                    FROM DUAL;
                
                SELECT LPAD(TO_CHAR(PROD_COST),10,'#') AS "COST"
                    FROM PROD;
                    
        (5) RTRIM(c1 [,c2]), LTRIM(c1 [,c2])
            - RTRIM : 주어진 문자열 c1 내부에 c2 문자열을 오른쪽에서 찾아 삭제 
            - LTRIM : 주어진 문자열 c1 내부에 c2 문자열을 왼쪽에서 찾아 삭제 
            - c2가 생략되면 공백을 제거(단어 내부 공백 제거는 불가능)
            사용예) 
                - VARCHAR2(80)타입을 CHAR(80)타입으로 바꾸면 무효공백이 생김
                - CHAR(80)에서 VARCHAR2(80)으로 다시 바꾸면 무효공백들이 유효공백으로 받아들여짐
                ==> UPDATE EMPLOYEES
                        SET EMP_NAME=RTRIM(EMP_NAME);
        
        (6) TRIM(c1)    
            - 단어 왼쪽 또는 오른쪽에 발생된 공백을 모두 제거
            - 단어 내부 공백 제거는 불가능
            사용예)
                SELECT MEM_NAME, MEM_HP, MEM_JOB,MEM_MILEAGE
                    FROM MEMBER
                    WHERE MEM_NAME=TRIM('이혜나');
        
        (7) SUBSTR(c, n1 [,n2])
            - 주어진 문자열 c에서 n1번째 부터 n2 갯수만큼 글자를 추출하여 부분 문자열을 반환
            - 결과도 문자열임
            - n1, n2는 1부터 시작됨
            - n2가 생략되거나 문자의 수보다 큰 n2를 사용하면 n1이후 모든 문자열을 추출함
            - n1이 음수이면 오른쪽을 기준으로 처리됨
            사용예)
                SELECT SUBSTR('대전시 중구 대흥동',2,5),
                        SUBSTR('대전시 중구 대흥동',2),
                        SUBSTR('대전시 중구 대흥동',2,20),
                        (SUBSTR('대전시 중구 대흥동',-2,5))
                    FROM DUAL;
            사용예) 오늘이 2005년 4월 1일인 경우 CART_NO를 자동 생성하시오
                SELECT TO_CHAR(SYSDATE,'YYYYMMDD')||TRIM(TO_CHAR(TO_NUMBER(SUBSTR(MAX(CART_NO),9))+1,'00000'))
                    FROM CART
                    WHERE CART_NO LIKE '20050401%';
                -- CART_NO가 숫자로 바뀔 수 있기 때문에 ==> 시작할 때 문자가 있으면 문자를 떼놓고 숫자로 바꾸고 하면 됨.
                SELECT MAX(CART_NO)+1
                    FROM CART
                    WHERE CART_NO LIKE '20050401%';
                
        (8) REPLACE(c1,c2[,c3])
            - 주어진 문자열 c1에 포함된 c2를 찾아 c3로 치환시킴
            - c3가 생략되면 찾은 c2를 삭제시킴
            - 단어 내부의 공백 제거에 사용될 수 있음
            사용예)
                SELECT REPLACE('대전광역시 중구 대흥동','전광역시','전시'), 
                        REPLACE('대전광역시 중구 대흥동','광역'),
                        REPLACE('대전광역시 중구 대흥동','대') --하나만 삭제하는게 아니라 주어진 문자열내에 있는 모든 문자를 삭제
                    FROM DUAL;
                    
        (9) INSTR(c1, c2 [, m[,n]])
            - 주어진 문자열 c1에서 c2문자열이 처음 나온 위치값을 반환
            - m은 검색 시작위치를 직접 지정할 때 사용
            - n은 c2문자열의 반복 횟수를 정하여 검색하는 경우 사용
            사용예)
                SELECT INSTR('APPLE PERSIMON PEAR BEAR','E'),
                        INSTR('APPLE PERSIMON PEAR BEAR','P',5),
                        INSTR('APPLE PERSIMON PEAR BEAR','P',5,2),
                        INSTR('APPLE PERSIMON PEAR BEAR','P',5,3)
                    FROM DUAL;
        
            
    2) 숫자함수
        (1) GREATEST(n1, n2 [,n3,...]), LEAST(n1, n2 [,n3,...])
            - GREATEST : 주어진 수 (n1 ~ ..) 중 가장 큰 값을 반환
            - LEAST : 주어진 수 (n1 ~ ..) 중 가장 작은 값을 반환
            사용예) 
                SELECT GREATEST(50,70,90),
                        LEAST(50,70,90)
                    FROM DUAL;
            사용예) 회원테이블에서 마일리지가 1000미만인 모든 회원의 마일리지를 1000으로 수정 출력하시오.
                Alias 회원번호, 회원명, 원본 마일리지, 수정 마일리지
                SELECT MEM_ID AS 회원번호,
                        MEM_NAME AS 회원명,
                        MEM_MILEAGE AS "원본 마일리지",
                        GREATEST(1000,MEM_MILEAGE) AS "수정 마일리지"
                    FROM LYW96.MEMBER;
        
        (2) ROUND(n [,i]), TRUNC(n [,i]) --잘 안씀. (고급 언어에서 처리하는게 좋음)
            - ROUND : 주어진 수 n의 소수점 이하 i+1 번째 자리에서 반올림하여 i번째까지 출력--돈을 줄때는 반올림해서 줌(근데 DB에선 잘 안함)
                      i가 음수이면 정수부분 i번째에서 반올림
                      i가 생략되면 0으로 간주됨
            - TRUNC : ROUND와 같이 수행되나 반올림이 아니라 절삭처리 --돈을 받을 때는 절삭해서 받음.
                사용예) 사원테이블에서 급여의 지급액을 계산하여 출력
                    Alias 사원번호, 사원명, 급여, 세금, 지급액
                            세금=급여액의 17%
                            급여액은 급여 - 세금
                            소수점 1자리까지 출력
                    SELECT EMPLOYEE_ID AS 사원번호,
                            FIRST_NAME||' '||LAST_NAME AS 사원명,
                            SALARY AS 급여,
                            TRUNC(SALARY*0.17,1) AS 세금,
                            SALARY-(TRUNC(SALARY*0.17,1)) AS 지급액
                        FROM HR.EMPLOYEES;               
                사용예) 2005년 1월~3월 제품분류별 평균매입액을 조회하시오.
                    Alias 분류코드, 분류명, 평균매입금액
                            평균매입금액 정수로 표현                            
                    SELECT C.PROD_LGU AS 분류코드,
                            B.LPROD_NM AS 분류명,
                            AVG(A.BUY_QTY*C.PROD_COST) AS 평균매입금액 
                        FROM BUYPROD A, LPROD B, PROD C
                        WHERE A.BUY_PROD=C.PROD_ID
                            AND C.PROD_LGU = B.LPROD_GU
                            AND A.BUY_DATE BETWEEN '20050101' AND '20050331'
                        GROUP BY C.PROD_LGU, B.LPROD_NM
                        ORDER BY 1;
                        
                        
                        
    3)FLOOR(n), CEIL(n)  -- 내림, 올림
       - n에 가까운 정수를 반환
       - FLOOR : n과 같거나 크지않은 정수 중 가장 큰 정수
       - CEIL : n과 같거나 큰 정수 중 가장 작은 정수
       - 세금, 급여 처럼 금액과 관련된 수식에 주로 사용     
            사용예) SELECT FLOOR(12.5), CEIL(12.5),
                          FLOOR(12), CEIL(12),
                          FLOOR(-12.5), CEIL(-12.5)
                    FROM DUAL;
    
    4)MOD(n,i), REMAINDER(n,i)
       - 나머지를 반환
       - MOD : n을 i로 나눈 나머지 반환
               나머지 = 피젯수 - 젯수 * (FLOOR(피젯수/젯수))
          ex) 15/6 의 나머지 = 15 - 6 * (FLOOR(15/6))
                            = 15 - 6 * (FLOOR(2.5))
                            = 15 - 12
                            = 3
       - REMAINDER : n을 i로 나눈 나머지가 i의 절반 이하의 값이면 MOD와 같은 나머지를 반환하고 
                                나머지가 그 이상의 값이면 다음몫이 되기위해 더해져야 할 수 반환
              나머지 = 피젯수 - 젯수 * (ROUND(피젯수/젯수)
          ex) 15/6 의 나머지 = 15 - 6 * (ROUND(15/6))
                            = 15 - 6 * (ROUND(2.5))
                            = 15 - 18
                            = -3
            
            사용예) SELECT MOD(15,6), REMAINDER(17,6),
                          MOD(15,7), REMAINDER(15,7)
                     FROM DUAL;
            
            사용예)임의의 년도를 입력 받아 윤년과 평년을 구별하시오.
                  윤년 : (4의 배수이면서 100의 배수가 아니거나) (400의 배수가 되는 해)
                  
                  ACCEPT P_YEAR PROMPT '년도 입력'
                  DECLARE
                     V_YEAR NUMBER(4) := TO_NUMBER('&P_YEAR');
                     V_RES VARCHAR2(100);
                  BEGIN
                     IF (MOD(V_YEAR,4) = 0 AND MOD(V_YEAR,100) != 0) OR MOD(V_YEAR, 400) = 0 THEN
                         V_RES := TO_CHAR(V_YEAR)||'년은 윤년입니다';
                     ELSE
                         V_RES := TO_CHAR(V_YEAR)||'년은 평년입니다';
                     END IF;
                    
                    
                     DBMS_OUTPUT.PUT_LINE(V_RES);
                  END;
                     
    5)WIDTH_BUCKET(n, min, max, b)
       - min에서 max 값 까지를 b개의 구간으로 나누고 주어진 수 n이 그 구간 중 어느 구간에 속하는지를
         판별하여 구간의 인덱스를 반환함
      사용예) SELECT WIDTH_BUCKET(0,700,8700,10) FROM DUAL;   
                -- 값이 n = -1 => 0 구간    n = max => 구간+1
                
      사용예)회원테이블에서 회원들의 마일리지를 3개의 그룹으로 나누고 각 회원들의 마일리지가 속한 그룹을
            조회하여 1그룹에 속한 회원은 '새싹 회원', 2그룹에 속한 회원은 '정규 회원', 3그룹에 속한 회원은 'VIP 회원'을
            비고란에 출력하시오.
                 Alias는 회원번호, 회원명, 직업, 마일리지, 비고    
            SELECT MEM_ID AS 회원번호,
                   MEM_NAME AS 회원명,
                   MEM_JOB AS 직업,
                   MEM_MILEAGE AS 마일리지,
                   CASE WHEN WIDTH_BUCKET(MEM_MILEAGE,500,9000,3) = 1 THEN
                             '새싹 회원'
                        WHEN WIDTH_BUCKET(MEM_MILEAGE,500,9000,3) = 2 THEN
                             '정규 회원'
                        ELSE 
                             'VIP 회원'     
                   END AS 비고
              FROM MEMBER 
              
              --CASE WHEN은 SELECT 절에서만 사용가능

      사용예)회원테이블에서 회원들의 마일리지를 5개의 그룹으로 나누고 등급을 비고란에 출력
                 Aliase는 회원번호, 회원명, 직업, 마일리지, 비고이며 등급은 마일리지가 많은 회원이 1등급이고,
                 제일 작은 회원이 5등급이다.
                
           SELECT MEM_ID AS 회원번호,
                   MEM_NAME AS 회원명,
                   MEM_JOB AS 직업,
                   MEM_MILEAGE AS 마일리지,
                   CASE WHEN WIDTH_BUCKET(MEM_MILEAGE,,5) = 1 THEN
                             '5등급'
                        WHEN WIDTH_BUCKET(MEM_MILEAGE,500,9000,5) = 2 THEN
                             '4등급'
                        WHEN WIDTH_BUCKET(MEM_MILEAGE,500,9000,5) = 3 THEN
                             '3등급'
                        WHEN WIDTH_BUCKET(MEM_MILEAGE,500,9000,5) = 4 THEN
                             '2등급'     
                        ELSE 
                             '1등급'     
                   END AS 비고
              FROM MEMBER 



(MEM_MILEAGE,500,9000,3)
         : --위 아래 같음
(SELECT MIN(MEM_MILEAGE)
 FROM MEMBER,
(SELECT MAX(MEM_MILEAGE)+1
 FROM MEMBER,(구간[그룹수]))











