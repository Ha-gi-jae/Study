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
                        
        (3) FLOOR(n)(내림), CEIL(n)(올림) 
            - n에 가까운 정수를 반환
            - FLOOR : n과 같거나 크지 않은 정수 중 가장 큰 정수
            - CEIL(n) : n과 같거나 큰 정수 중 가장 작은 정수
            - 세금, 급여처럼 금액과 관련된 수식에 주로 사용
            사용예) 
                SELECT FLOOR(12.1), CEIL(12.1),
                        FLOOR(12), CEIL(12),
                        FLOOR(-12.1), CEIL(-12.1)
                    FROM DUAL;
                    
        (4) MOD(n,i), REMAINDER(n,i)
            - 나머지를 반환
            - MOD : n을 i로 나눈 나머지 반환
                    나머지 = 피젯수 - 젯수 * (FLOOR(피젯수/젯수))
                    ex) 15/6 의 나머지 = 15 - 6 * (FLOOR(15/6))
                                      = 15 - 6 * (FLOOR(2.5))
                                      = 15 - 12
                                      = 3
            - REMAINDER : n을 i로 나눈 나머지가 i의 절반이하이면 MOD와 같은 나머지를 반환하고
                          나머지가 절반 초과이면 다음 몫에서 되기 위해 더해져야 할 수 반환
                          ex) 15/6 의 나머지 = 15 - 6 * (ROUND(15/6))
                                      = 15 - 6 * (ROUND(2.5))
                                      = 15 - 18
                                      = -3
                사용예) 
                    SELECT MOD(15,6), REMAINDER(15,6),
                            MOD(15,7), REMAINDER(15,7)
                        FROM DUAL;
                사용예) 임의의 년도를 입력 받아 윤년 평년을 구별하시오.
                        윤년 : (4의 배수이면서 100의 배수가 아니거나) (400의 배수가 되는 해)
                        
                        ACCEPT P_YEAR PROMPT '년도 입력'
                        DECLARE
                            V_YEAR NUMBER(4):=TO_NUMBER('&P_YEAR');
                            V_RES VARCHAR2(100);
                        BEGIN
                            IF (MOD(V_YEAR,4)=0 AND MOD(V_YEAR,100)!=0) OR MOD(V_YEAR,400)=0 THEN
                                V_RES:=TO_CHAR(V_YEAR)||'년은 윤년입니다.';
                            ELSE
                                V_RES:=TO_CHAR(V_YEAR)||'년은 평년입니다.';
                            END IF;
                            
                            DBMS_OUTPUT.PUT_LINE(V_RES);
                        END;
                        
        (5) WIDTH_BUCKET(n, min, max, b) --min은 포함, max는 포함X
            - min 에서 max 값까지 b개의 구간으로 나누고 주어진 수 n 이 그 구간 중 어느 구간에 속하는지를 판별하여
              구간의 인덱스를 반환
            사용예) SELECT WIDTH_BUCKET(51,0,101,10) FROM DUAL;
            사용예) 회원테이블에서 회원들의 마일리지를 3개의 그룹으로 나누고 각 회원들의 마일리지가 속한 그룹을 
                   조회하여 1그룹에 속한 회원은 '새싹회원', 2그룹에 속한 회원은 '정규 회원', 3그룹에 속한 회원은
                   'VIP 회원'을 비고난에 출력하시오
                   Alias 회원번호, 회원명, 직업, 마일리지, 비고
                   SELECT MEM_ID AS 회원번호,
                         MEM_NAME AS 회원명, 
                         MEM_JOB AS 직업,
                         MEM_MILEAGE AS 마일리지,
                         -- CASE WHEN 은 SELECT 절에서만 사용.
                         CASE WHEN WIDTH_BUCKET(MEM_MILEAGE,(SELECT MIN(MEM_MILEAGE) FROM MEMBER),
                                                (SELECT MAX(MEM_MILEAGE) FROM MEMBER)+1,5) =5 THEN
                                    '새싹회원'
                              WHEN WIDTH_BUCKET(MEM_MILEAGE,(SELECT MIN(MEM_MILEAGE) FROM MEMBER),
                                                (SELECT MAX(MEM_MILEAGE) FROM MEMBER)+1,5) =4 THEN
                                    '정규회원'
                              WHEN WIDTH_BUCKET(MEM_MILEAGE,(SELECT MIN(MEM_MILEAGE) FROM MEMBER),
                                                (SELECT MAX(MEM_MILEAGE) FROM MEMBER)+1,5) =3 THEN
                                    'VIP'
                              WHEN WIDTH_BUCKET(MEM_MILEAGE,(SELECT MIN(MEM_MILEAGE) FROM MEMBER),
                                                (SELECT MAX(MEM_MILEAGE) FROM MEMBER)+1,5) =2 THEN
                                    'VVIP'
                             WHEN WIDTH_BUCKET(MEM_MILEAGE,(SELECT MIN(MEM_MILEAGE) FROM MEMBER),
                                                (SELECT MAX(MEM_MILEAGE) FROM MEMBER)+1,5) =1 THEN
                                    'VVVIP'
                        END AS 비고
                    FROM MEMBER;            
            사용예) 회원테이블에서 회원들의 마일리지를 5개의 그룹으로 나누고 등급을 비고난에 출력
                    Alias 회원번호, 회원명, 직업, 마일리지, 비고이며 
                          등급은 마일리지가 많은 회원이 1등급이고, 제일 작은 회원이 5등급이다.
                 SELECT MEM_ID AS 회원번호,
                         MEM_NAME AS 회원명, 
                         MEM_JOB AS 직업,
                         MEM_MILEAGE AS 마일리지,
                         -- CASE WHEN 은 SELECT 절에서만 사용.
                         6-WIDTH_BUCKET(MEM_MILEAGE,(SELECT MIN(MEM_MILEAGE) FROM MEMBER),
                                                (SELECT MAX(MEM_MILEAGE) FROM MEMBER)+1,5)||'등급' AS 비고
                    FROM MEMBER;
        
        
    3) 날짜함수
        (1) SYSDATE
            - 시스템에서 제공하는 날짜정보(년, 월, 일, 시, 분, 초) 반환
            - '+', '-' 연산의 대상
            - 날짜 - 날짜 : 두 날짜 사이의 날수(DAYS)
            사용예) 
                SELECT SYSDATE-10,
                        TO_CHAR(SYSDATE,'YYYY MM DD HH24:MI:SS'),
                        TRUNC(SYSDATE - TO_DATE('19960907')),
                        TO_DATE('2024-01-22','YYYY-MM-DD'),
                        TO_DATE('19960906')+10000
                    FROM DUAL;
        
        (2) ADD_MONTHS(d,n)
            - 날짜형식의 자료 d에 n만큼의 월을 더한 날짜 반환
            사용예) 사원의 정식 입사일은 수습 3개월이 지난 날짜이다. 각 사원이 이 회사에 처음 수습으로 입사한 날짜를 구하시오
                    Alias 사원번호, 사원명, 입사일, 수습입사일, 소속부서명
                    SELECT EMPLOYEE_ID AS 사원번호,
                            EMP_NAME AS 사원명,
                            HIRE_DATE AS 입사일,
--                            HIRE_DATE - 90 AS 수습입사일,
                            ADD_MONTHS(TO_DATE('20210331'),-3)) AS 테스트,
                            ADD_MONTHS(HIRE_DATE,-3) AS 수습입사일,
                            DEPARTMENT_NAME AS 소속부서명
                        FROM HR.EMPLOYEES A, HR.DEPARTMENTS B
                        WHERE A.DEPARTMENT_ID=B.DEPARTMENT_ID
                        ORDER BY 1;
                
                    SELECT 
--                        ADD(MONTHS(TO_DATE('20210301'),-3))
                            ADD_MONTHS(TO_DATE('20210331'),-1)                        
                        FROM DUAL;
                                
        (3) NEXT_DAY(d, expr)
            - 주어진 날짜 d에서 다가올 가장 빠른 'expr'요일의 날짜 반환
            - expr : 월, 화,..., 일, 월요일, 화요일, ..., 일요일
            사용예) 
                SELECT NEXT_DAY(SYSDATE,'월'),
                        NEXT_DAY(SYSDATE,'목요일'),
                        NEXT_DAY(SYSDATE,'일')
                    FROM DUAL;
        
        (4) LAST_DAY(d)
            - 날짜자료 d에 포함된 월의 마지말 일을 반환
            사용예) 매입테이블(BUYPROD)에서 2월에 매입된 매입건수를 조회하시오.
                SELECT COUNT(*) AS 매입건수
                    FROM BUYPROD
                    WHERE BUY_DATE BETWEEN TO_DATE('20050201') AND LAST_DAY(TO_DATE('20050201'));
        
        (5) MONTHS_BETWEEN(d1, d2)
            - 두 날짜 자료 사이의 월수 반환
            사용예) 
                SELECT EMP_NAME,
                        HIRE_DATE,
                        TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)/12)||'년'|| 
                        MOD(TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)),12)||'개월' AS 근속기간
                        
                    FROM HR.EMPLOYEES;
                    
        (6) EXTRACT(fmt FROM d)
            - 날짜자료 d 에서 'fmt'로 기술된 자료를 추출함
            - 반환값으로 형식은 숫자형식임
            - 'fmt' : YEAR, MONTH, DAY, HOUR, MINUTE, SECOND
            사용예) 이번 달에 생일이 있는 회원정보를 조회하시오
                    Alias 회원번호, 회원명, 생년월일
                    SELECT MEM_ID AS 회원번호,
                            MEM_NAME AS 회원명,
                            EXTRACT(YEAR FROM MEM_BIR)||'년 '||
                            EXTRACT(MONTH FROM MEM_BIR)||'월 '||
                            EXTRACT(DAY FROM MEM_BIR)||'일' AS 생년월일
                        FROM MEMBER
                        WHERE (EXTRACT(MONTH FROM SYSDATE)+4)=EXTRACT(MONTH FROM MEM_BIR);
                    
                    
                    
                SELECT EXTRACT(HOUR FROM SYSTIMESTAMP) FROM DUAL;
                    
                    COMMIT;

    4) 변환함수
        (1) CAST(expr AS 타입)
            - 'expr'로 정의된 자료를 '타입' 형태로 일시적 형 변환
            사용예) 
                SELECT MEM_NAME AS 회원명,
                        CAST(SUBSTR(MEM_REGNO1,1,2) AS NUMBER)+1900 AS 출생년도,
                        EXTRACT(YEAR FROM SYSDATE) - (CAST(SUBSTR(MEM_REGNO1,1,2) AS NUMBER)+1900) AS 나이
                    FROM MEMBER
                    WHERE NOT MEM_REGNO1 LIKE '0%';
                    
        (2) TO_CHAR(expr[,fmt])
            - 주어진 자료 expr을 형식지정 문자열 fmt에 맞추어 문자열로 변형하여 반환
            - expr은 숫자, 날짜, 문자열(CHAR, CLOB=>VARCHAR2로) 타입의 자료
            - 영구적 형변환
            
                - 날짜형식 지정문자열
                ------------------------------------------------------------------------------------------
                형식지정문자열       의미         사용예
                ------------------------------------------------------------------------------------------
                CC                 세기         SELECT TO_CHAR(SYSDATE,'CC') FROM DUAL;
                AD, BC             서기         SELECT TO_CHAR(SYSDATE,'CC BC YYYY"년"') FROM DUAL;
                YYYY,YYY,YY,Y      년도         SELECT TO_CHAR(SYSDATE,'CC BC YY"년"') FROM DUAL;
                Q                  분기         SELECT TO_CHAR(SYSDATE,'CC BC YYYY"년" Q"분기"') FROM DUAL;
                MONTH, MON         월           SELECT TO_CHAR(SYSDATE,'YYYY MON MONTH') FROM DUAL;
                MM, RM             월
                W, WW, WWW         주차
                DD, DDD, J         일           SELECT TO_CHAR(SYSDATE,'YYYY MM DD DDD J') FROM DUAL;
                DAY, DY, D         요일
                AM, PM, A.M., P.M. 오전/오후     
                MI                 분
                SS, SSSSS          초
                "문자열"            직접정의한 사용자 변환 문자열
                ------------------------------------------------------------------------------------------
                
                - 숫자형식 지정문자열
                ------------------------------------------------------------------------------------------------------
                형식지정문자열        의미                                 사용예
                ------------------------------------------------------------------------------------------------------
                9                   숫자와 대응되어 유효숫자는 유효숫자를    SELECT TO_CHAR(2345,'99,999') FROM DUAL;
                                    출력하고 무효의 0은 공백처리
                0                   숫자와 대응되어 유효숫자는 유효숫자를    SELECT TO_CHAR(2345,'00,000') FROM, DUAL;
                                    출력하고 무효의 0은 0을 출력
                $, L                화폐기호 출력                         SELECT TO_CHAR(12345, 'L99,999') FROM DUAL;
                PR                  음수를 '< >'로 묶어 출력               SELECT TO_CHAR(-12345, '99,999PR') FROM DUAL;
                , (COMMA)           자리점
                . (DOT)             소숫점
                X                   16진수로 변환 출력                     SELECT TO_CHAR(255,'XXXX') FROM DUAL;
                ------------------------------------------------------------------------------------------------------
        
        (3) TO_NUMBER(expr[,fmt])
            - 주어진 자료 'expr'의 값을 'fmt' 형식에 맞추어 숫자로 변환
            - 'expr'은 문자열 타입의 자료
            - 'fmt'는 모두 적용되지 않음(숫자로 형변환 가능한 형식만 적용 가능)
                사용예)
                    SELECT TO_NUMBER('12345', '9999900'),
                           --TO_NUMBER('12345', '99,999')    ,가 들어가서 오류
                           --TO_NUMBER('-12345', '99999PR')  -가 들어가서 오류
                           TO_NUMBER('12345', '99999PR'),
                           TO_NUMBER('12345')
                        FROM DUAL;
        
        (4) TO_DATE(expr[,fmt])
            - 주어진 자료 'expr'의 값을 'fmt' 형식에 맞추어 날짜로 변환
            - 'expr'은 문자열 타입의 자료
            - 'fmt'는 모두 적용되지 않음(날짜로 형변환 가능한 형식만 적용 가능)
            - 원본자료가 날짜형식에 맞도록 제공되어야 함
                사용예)
                    SELECT TO_DATE('20200320', 'YYYYMMDD'),
                           TO_DATE('20200320', 'YYYY-MM DD'),   -- -가 /로 바뀌어서 표시
                           --TO_DATE('20200332', 'YYYY-MM DD'),   날짜 범위를 벗어나서 오류
                           --TO_DATE('20200320', 'AM YYYYMMDD'),  
                           --TO_DATE('20200320', 'YYYY MONTH DD'),
                           TO_DATE('20200320')
                        FROM DUAL;
                        
    5) 집계함수
        - 주어진 자료를 특정 컬럼을 기준으로 그룹으로 나누고 그룹별로 자료에 대한 집계를 반환하는 함수
        - SUM, AVG, COUNT, MIN, MAX
            (사용형식)
            SELECT [컬럼]list],
                   SUM|AVG|MIN|MAX(expr)|COUNT(column|*),
                                :
                FROM 테이블명
                [WHERE 조건]
                [GROUP BY 컬럼명[,컬럼명,...]]
                [HAVING 조건]
                [ORDER BY 컬럼명|컬럼인덱스[ASC|DESC][,컬럼명|컬럼인덱스[ASC|DESC],...];
            
        (1) SUM(expr)
            - 'expr'로 표현되는 수식 또는 컬럼의 값에 대한 합계를 반환
                사용예) 사원테이블에서 모든 사원의 급여 총액을 구하시오.
                    SELECT SUM(SALARY)
                        FROM HR.EMPLOYEES;
                        
                사용예) 사원테이블에서 부서별 급여 합계를 구하시오. 
                    SELECT DEPARTMENT_ID AS 부서코드,
                           SUM(SALARY) AS 급여합계
                        FROM HR.EMPLOYEES
                        GROUP BY DEPARTMENT_ID
                        ORDER BY 1;
                        
                사용예) 사원테이블에서 부서별 급여 합계를 구하되 합계가 10000이상인 부서만 조회하시오.
                    SELECT DEPARTMENT_ID AS 부서코드,
                           SUM(SALARY) AS 급여합계
                        FROM HR.EMPLOYEES
                        GROUP BY DEPARTMENT_ID
                        HAVING SUM(SALARY) >= 10000
                        ORDER BY 1;
                        
                 사용예) 2005년 5월 회원별 구매현황(회원번호, 구매수량합계, 구매금액합계)을 조회하시오.  
                    SELECT A.CART_MEMBER AS 회원번호,
                           SUM(A.CART_QTY) AS 구매수량합계,
                           SUM(A.CART_QTY*B.PROD_PRICE) AS 구매금액합계
                        FROM CART A, PROD B
                        WHERE A.CART_PROD = B.PROD_ID
                            AND A.CART_NO LIKE '200505%'
                        GROUP BY A.CART_MEMBER;
                        
                 사용예) 2005년 월별 회원별 구매현황(월, 회원번호, 구매수량합계, 구매금액합계)을 조회하시오.
                    SELECT SUBSTR(A.CART_NO,5,2) AS 월,
                           A.CART_MEMBER AS 회원번호,
                           SUM(A.CART_QTY) AS 구매수량합계,
                           SUM(A.CART_QTY * B.PROD_PRICE) AS 구매금액합계
                        FROM CART A, PROD B
                        WHERE A.CART_PROD = B.PROD_ID
                            AND SUBSTR(CART_NO,1,4)='2005'
                        GROUP BY SUBSTR(A.CART_NO,5,2),A.CART_MEMBER
                        ORDER BY 1;
                        
                사용예) 회원테이블에서 직업별 마일리지 합계를 구하시오.
                    SELECT MEM_JOB AS 직업별,
                           SUM(MEM_MILEAGE) AS "마일리지 합계" 
                        FROM MEMBER
                        GROUP BY MEM_JOB
                        ORDER BY SUM(MEM_MILEAGE);
                        
                사용예) 사원테이블에서 근무국가별 급여합계를 구하시오     
                    SELECT D.COUNTRY_ID AS 근무국가코드,
                           D.COUNTRY_NAME AS 국가명,
                           TO_CHAR(SUM(A.SALARY), '999,990') AS 급여합계
                        FROM HR.EMPLOYEES A, HR.DEPARTMENTS B, HR.LOCATIONS C, HR.COUNTRIES D
                        WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
                          AND B.LOCATION_ID = C.LOCATION_ID
                          AND C.COUNTRY_ID = D.COUNTRY_ID
                        GROUP BY D.COUNTRY_ID, D.COUNTRY_NAME;
                        
                 사용예) 사원테이블에서 각 부서별 보너스 합계를 구하시오.
                    출력은 부서코드, 부서명, 보너스 합계이고, 보너스는 영업실적(COMMISSION_PCT)과 급여를 곱한결과의 30%를 지급한다.    
                    SELECT A.DEPARTMENT_ID AS 부서코드,
                           B.DEPARTMENT_NAME AS 부서명,
                           NVL(SUM(A.COMMISSION_PCT * A.SALARY) * 0.3,0) AS "보너스 합계"
                        FROM HR.EMPLOYEES A, HR.DEPARTMENTS B
                        WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
                        GROUP BY A.DEPARTMENT_ID, B.DEPARTMENT_NAME
                        ORDER BY 1;
                        
        (2) AVG(expr)
            - 'expr'로 정의된 컬럼이나 수식의 값에 대한 산술평균 값을 반환
   
                사용예) 모든 여성회원들의 평균 마일리지를 조회하시오.
                    SELECT ROUND(AVG(MEM_MILEAGE)) AS "평균 마일리지"
                        FROM MEMBER
                        WHERE SUBSTR(MEM_REGNO2,1,1) IN('2','4');
    
                사용예) 회원들의 성별 평균 마일리지를 조회하시오.
                    SELECT CASE WHEN SUBSTR(MEM_REGNO2,1,1) = '2'
                                  OR SUBSTR (MEM_REGNO2,1,1) = '4' THEN
                                     '여성회원'
                                ELSE '남성회원' END AS 구분,
                           ROUND(AVG(MEM_MILEAGE)) AS "평균 마일리지"
                        FROM MEMBER
                        GROUP BY CASE WHEN SUBSTR(MEM_REGNO2,1,1) = '2'
                                        OR SUBSTR (MEM_REGNO2,1,1) = '4' THEN
                                           '여성회원'
                                      ELSE '남성회원' END;
                        --SUBSTR(MEM_REGNO2,1,1) 만 쓰면 1, 2, 3, 4로 나눈걸로.
            
               사용예) 사원테이블에서 각 부서별 평균급여를 조회하시오.
                   SELECT B.DEPARTMENT_ID AS 부서코드,
                          B.DEPARTMENT_NAME AS 부서별,
                          ROUND(AVG(A.SALARY)) AS 평균급여
                       FROM HR.EMPLOYEES A, HR.DEPARTMENTS B
                       WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
                       GROUP BY B.DEPARTMENT_ID, B.DEPARTMENT_NAME
                       ORDER BY 1;
                       
               사용예) 2005년 1~6월 월별 평균 매입액을 조회하시오.
                   SELECT EXTRACT(MONTH FROM BUY_DATE)||'월' AS 월,
                          ROUND(AVG(BUY_QTY*BUY_COST)) AS "평균 매입액"
                       FROM BUYPROD
                       WHERE BUY_DATE BETWEEN TO_DATE('20050101') AND TO_DATE('20050630')
                       GROUP BY EXTRACT(MONTH FROM BUY_DATE)
                       ORDER BY 1;
               
               사용예) 2005년 1월~6월 월별 평균 매입액과 매입액합을 조회하되 매입액이 400만원이상인 월만 조회하시오.
                   SELECT EXTRACT(MONTH FROM BUY_DATE)||'월' AS 월,
                          COUNT(*) AS 매입건수,
                          ROUND(AVG(BUY_QTY*BUY_COST)) AS "평균 매입액",
                          SUM(BUY_QTY*BUY_COST) AS 매입액합
                       FROM BUYPROD
                       WHERE BUY_DATE BETWEEN TO_DATE('20050101') AND TO_DATE('20050630')
                       GROUP BY EXTRACT(MONTH FROM BUY_DATE)
                       HAVING AVG(BUY_QTY*BUY_COST) >= '4000000'
                       ORDER BY 1;        
                사용예) 2005년 분류별 평균구매금액을 조회하시오
                    SELECT B.LPROD_GU AS 분류코드,
                           B.LPROD_NM AS 분류명,
                           ROUND(AVG(A.CART_QTY*C.PROD_PRICE)) AS 평균구매금액
                        FROM CART A, LPROD B, PROD C
                        WHERE B.LPROD_GU = C.PROD_LGU
                          AND A.CART_PROD = C.PROD_ID
                          AND SUBSTR(A.CART_NO,1,4) = '2005'
                        GROUP BY B.LPROD_GU, B.LPROD_NM
                        ORDER BY 1;
            
                사용예) 2005년 회원의 연령대별 평균구매금액을 조회하시오.   
                    SELECT TRUNC((EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM A.MEM_BIR))/10)*10||'대' AS 회원연령대, 
                           ROUND(AVG(B.CART_QTY*C.PROD_PRICE)) AS 평균구매금액
                        FROM MEMBER A, CART B, PROD C
                        WHERE A.MEM_ID = B.CART_MEMBER
                          AND B.CART_PROD = C.PROD_ID
                          AND B.CART_NO LIKE '2005%'
                        GROUP BY TRUNC((EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM A.MEM_BIR))/10)*10
                        ORDER BY 1;
                           
        (3) COUNT(Column명|*)
            - 그룹내의 행의 수(자료의 갯수)를 반환
            - 외부조인연산에 사용되는 경우 '*'를 사용하면 부정확한 결과를 반환하기 때문에 해당 테이블의 컬럼명을 기술해야 함
            
                사용예) 사원테이블에서 각 부서별 사원수를 조회하시오.
                    SELECT DEPARTMENT_ID AS 부서코드
                           COUNT(*) AS 사원수1,
                           COUNT(LAST_NAME) AS 사원수2
                        FROM HR.EMPLOYEES
                        GROUP BY DEPARTMENT_ID
                        ORDER BY 1;
                
                사용예) 2005년 5월 분류별 판매건수를 조회하시오.
                    SELECT B.PROD_LGU AS 분류
                           COUNT(CART_QTY) AS 판매건수
                        FROM CART A, PROD B
                        WHERE A.CART_PROD = B.PROD_ID
                          AND A.CART_NO LIKE '200505%'
                        GROUP BY B.PROD_LGU
                        ORDER BY 1;
                        
                사용예) 2005년 5-6월 회원별 매입횟수를 조회하시오
                    Alias는 회원번호, 매입횟수
                    SELECT A.CID AS 회원번호,
                           COUNT(*) AS 매입횟수
                        FROM (SELECT DISTINCT CART_NO AS CNO,
                                     CART_MEMBER AS CID
                                  FROM CART
                        WHERE SUBSTR(CART_NO,1,6) IN ('200505','200506')
                        ORDER BY 2) A
                        GROUP BY A.CID
                        ORDER BY 1;
                        
        (4) MAX(Column명), MIN(Column명)
            - MAX : 주어진 컬럼명 중 최대 값을 반환
            - MIN : 주어진 컬럼명 중 최소 값을 반환
            - 집계함수는 다른 집계함수를 포함 할 수 없다.
                사용예) 2005년 월별 매입액 중 최대 매입제품과 최소 매입제품의 상품코드, 상품명, 최대매입액, 최소매입액
                    SELECT BUY_DATE AS 월,
                           MAX(BUY_QTY*BUY_COST) AS 최대매입액,
                           MIN(BUY_QTY*BUY_COST) AS 최소매입액
                        FROM BUYPROD
                
                사용예) 2005년 5월 최대구매 고객정보를 조회하시오.
                    Alias는 회원번호, 회원명, 구매금액
                    SELECT A.CART_MEMBER AS 회원번호,
                           C.MEM_NAME AS 회원명,
                           SUM(A.CART_QTY* B .PROD_PRICE) AS 구매금액 -- SUM 앞에 MAX가 올 수 없음.
                        FROM CART A, PROD B, MEMBER C
                        WHERE A.CART_MEMBER = C.MEM_ID
                          AND A.CART_PROD = B.PROD_ID
                          AND A.CART_NO LIKE '200505%'
                        GROUP BY A.CART_MEMBER, C.MEM_NAME
                        ORDER BY 3 DESC;
                
                (SUBQUERY)
                   SELECT D.MID AS 회원번호,
                          D.MNAME AS 회원명,
                          E.MEM_ADD1||' '||MEM_ADD2 AS 주소,
                          E.MEM_HP AS 연락처,
                          D.AMT AS 구매금액                        --  D.AMT 앞에는 max를 쓸 수 있긴한데 그룹 바이가 2번나와야하니 비효율적
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
                    
    6) NULL처리 함수
        - 오라클에서 각 컬럼의 기본 초기값은 모두 NULL임
        - NULL 자료에 대한 사칙연산 결과는 모두 NULL임
        - NULL 자료에 대한 연산자 및 함수로 IS NULL, IS NOT NULL, NVL, NVL2, NULLIF 등이 사용됨
        (1) IS NULL, IS NOT NULL
            - 특정 컬럼이나 계산된 값이 NULL인지 판별하기 위해 사용
            - '=' 연산자로 NULL값 여부를 판별하지 못함
            
                사용예) 사원테이블에서 영업실적코드(COMMISSION_PCT)가 NULL이아닌 사원의 사원번호, 사원명, 입사일, 부서코드, 급여를 조회하시오.
                    SELECT EMPLOYEE_ID AS 사원번호,
                           EMP_NAME AS 사원명,
                           HIRE_DATE AS 입사일,
                           DEPARTMENT_ID AS 부서코드,
                           SALARY AS 급여
                        FROM HR.EMPLOYEES
                        WHERE COMMISSION_PCT IS NOT NULL; -- != NULL, <> NULL 관계연산자로는 NULL을 확인할 수 없다.
        
        (2) NVL(c, val)
            - 'c'의 값을 판단하여 그 값이 NULL이면 'val' 값을 반환하고, NULL이아니면 'c'의 값을 반환
            - 'c'와 'val'의 자료형이 동일해야 함.
            
                사용예) 상품테이블에서 PROD_SIZE 값이 NULL이면 '상품크기정보 없음' 문자열을 출력하시오.
                   Alias는 상품코드, 상품명, 크기, 매입단가
                   SELECT PROD_ID AS 상품코드,
                          PROD_NAME AS 상품명,
                          NVL(PROD_SIZE,'상품크기정보 없음') AS 크기,
                          PROD_COST AS 매입단가
                       FROM PROD;
                
                사용예) 사원테이블에서 사원번호, 사원명, 부서코드, 직무코드를 출력하시오.
                       단, 부서코드가 NULL이면 'CEO'를 출력하시오.
                    SELECT EMPLOYEE_ID AS 사원번호,
                           EMP_NAME AS 사원명,
                           NVL(TO_CHAR(DEPARTMENT_ID),'CEO') AS 부서코드,
                           JOB_ID AS 직무코드
                        FROM HR.EMPLOYEES;
                   
                사용예) 2005년 7월 모든 상품에 대한 판매정보를 조회하시오  -- '모든' 이란 말이 들어가면 (+) 을 써줘야함.
                   Alias는 상품코드, 판매수량합계, 판매금액합계
                   SELECT B.PROD_ID AS 상품코드,
                          SUM(A.CART_QTY) AS 판매수량합계,
                          SUM(A.CART_QTY*B.PROD_PRICE) AS 판매금액합계
                       FROM CART A, PROD B
                       WHERE A.CART_PROD(+)= B.PROD_ID   -- 적은쪽에 !!! (+) !!!!
                         AND A.CART_NO LIKE '200507%'
                       GROUP BY B.PROD_ID
                       ORDER BY 1;   
                   --위의 경우, 외부조인이 있는데 내부조인도 있어서 정확한 결과를 못 내보냄. 
                   --ANSI 또는 서브쿼리로 써야한다.
                       
                   SELECT B.PROD_ID AS 상품코드,
                          NVL(SUM(A.CART_QTY),0) AS 판매수량합계,
                          NVL(SUM(A.CART_QTY*B.PROD_PRICE),0) AS 판매금액합계
                       FROM CART A
                       RIGHT OUTER JOIN PROD B ON (A.CART_PROD= B.PROD_ID   
                         AND A.CART_NO LIKE '200507%')
                       GROUP BY B.PROD_ID
                       ORDER BY 1;
                    -- 완벽.   

        (3) NVL2(c, val1, val2)
            - 'c'값을 판단하여 그 값이 NULL이면 'val2'를 반환하고 NULL이 아니면 'val1'값을 반환 함
            - 'val1'과 'val2'의 데이터 타입이 같아야 함
            
                사용예) 사원테이블에서 사원번호, 사원명, 부서코드, 직무코드를 출력하시오.
                       단, 부서코드가 NULL이면 'CEO'를 출력하시오.
                    
                    SELECT EMPLOYEE_ID AS 사원번호,
                           EMP_NAME AS 사원명,
                           NVL2(DEPARTMENT_ID,TO_CHAR(DEPARTMENT_ID),'CEO') AS 부서코드,
                           JOB_ID AS 직무코드
                        FROM HR.EMPLOYEES;
                        
                사용예) 상품테이블에서 상품의 색상정보(PROD_COLOR)의 값이 NULL이면 '색상정보 없는 상품'을 NULL이 아니면 '색상정보 보유 상품'을 출력하시오.
                    SELECT PROD_ID AS 상품번호,
                           PROD_NAME AS 상품명,
                            NVL2(PROD_COLOR,'색상정보 보유 상품','색상정보 없는 상품') AS 색상
                        FROM PROD;
                        
        (4) NULLIF(c1,c2)
            - 'c1'과 'c2'를 비교하여 같으면 NULL을 반환하고, 같지 않으면 c1을 반환함
            
                사용예) 상품테이블에서 판매가와 매입가를 비교하여 판매가가 매입가보다 같지않으면 '정상상품' 같으면 '단종상품'을 비고란에 출력하시오.
                    Alias는 상품코드, 상품명, 매입가, 판매가, 비고
                    SELECT PROD_ID AS 상품코드,
                           PROD_NAME AS 상품명,
                           PROD_COST AS 매입가,
                           PROD_PRICE AS 판매가,
                           NVL2(NULLIF(PROD_COST,PROD_PRICE),'정상상품','단종상품') AS 비고
                        FROM PROD;
                
                사용예) 상품테이블에서 판매가와 매입가를 비교하여 판매가와 매입가가 같지않으면 판매가를, 같으면 '단종상품'을 판매가란에 출력하시오.
                    SELECT PROD_ID AS 상품코드,
                           PROD_NAME AS 상품명,
                           PROD_COST AS 매입가,
                           NVL2(NULLIF(PROD_COST,PROD_PRICE),TO_CHAR(PROD_PRICE),'단종상품') AS 판매가
                         --NVL(LPAD(TO_CHAR(NULLIF(PROD_PRICE,PROD_COST)),10),LPAD('단종상품',11)) AS 판매가
                        FROM PROD;

        (5) 등수계산(RANK 함수)
            - 성적, 급여, 매출 등의 순위를 구할때 사용
            - ORDER BY절과 ROWNUM의 컬럼은 오라클의 WHERE절과 ORDER BY절의 실행순서때문에 정확한 결과 반환이 불가능 함
            - 이를 해결하기 위해 RANK와 DENSE_RANK, ROW_NUMBER 함수 제공
            - RANK와 DENSE_RANK 함수의 차이점
                - RANK : 중복 순위가 발생하면 중복 갯수 만큼 다음 순위값을 증가 (ex 1,1,1,4,5...)
                - DENSE_RANK : 중복 순위가 발생해도 다음 순위는 순차적인 값을 배정 (ex 1,1,1,2,3,4...)
                - ROW_NUMBER : 중복에 관계없이 순차 순위값 배정 (ex 1,2,3,4,5...)
            - SELECT 절에서 사용
            (사용형식)
            SELECT 컬럼list,
                    RANK() OVER(ORDER BY 기준컬럼명 DESC|ASC) AS  컬럼별칭,
                         :
              FROM 테이블명;
              
            사용예) 회원테이블에서 마일리지가 많은 회원부터 차례대로 순위(등수)를 부여하시오.
                회원번호, 회원명, 마일리지, 등수
                SELECT MEM_ID AS 회원번호,
                   MEM_NAME AS 회원명,
                   MEM_MILEAGE AS 마일리지,
                   RANK()OVER(ORDER BY MEM_MILEAGE DESC) AS 등수
              FROM MEMBER;
              
            사용예)회원테이블에서 마일리지가 많은 회원부터 차례대로 순위(등수)를 부여하고 상위 5명의 회원번호, 회원명, 마일리지, 등수를 출력하시오.
                SELECT MEM_ID AS 회원번호,
                       MEM_NAME AS 회원명,
                       MEM_MILEAGE AS 마일리지,
                       MRK AS 등수
                  FROM MEMBER B, (SELECT MEM_ID AS MID,
                                         RANK()OVER(ORDER BY MEM_MILEAGE DESC) AS MRK
                                    FROM MEMBER) A
                 WHERE A.MID=B.MEM_ID
                   AND A.MRK <= 5
                 ORDER BY 4; 
            
            사용예) 장바구니 테이블에서 2005년 5월 구매금액이 많은 회원부터 순위를 부여하여 회원번호, 회원명, 구매금액, 순위를 출력하시오.
                SELECT B.MEM_ID AS 회원번호,
                       B.MEM_NAME AS 회원명,
                       SUM(A.CART_QTY*C.PROD_PRICE) AS 구매금액, 
                       RANK()OVER(ORDER BY SUM(A.CART_QTY*C.PROD_PRICE) DESC) AS 순위
                  FROM CART A, MEMBER B, PROD C
                 WHERE A.CART_MEMBER = B.MEM_ID
                   AND A.CART_PROD = C.PROD_ID
                   AND A.CART_NO LIKE '200505%'
                 GROUP BY B.MEM_ID, B.MEM_NAME
--               ORDER BY 3 DESC; RANK에서 이미 순위대로 정렬 시켜놔서 안해줘도된다.
            
            
                 