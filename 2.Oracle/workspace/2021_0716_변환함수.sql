4. 변환함수
    - 특정시점에서 다른 타입으로 일시적 형변환
    - TO_CHAR, TO_DATE, TO_NUMBER, CAST
    1)CAST(expr As 타입)
        - 'expr'로 정의된 자료를 '타입' 형태로 일시적 형 변환
        
사용예)
    SELECT MEM_NAME AS 회원명,
            CAST(SUBSTR(MEM_REGNO1,1,2) AS NUMBER)+1900 AS 출생년도,
            EXTRACT(YEAR FROM SYSDATE) - (CAST(SUBSTR(MEM_REGNO1,1,2) AS NUMBER)+1900) AS 나이
        FROM MEMBER
        WHERE NOT MEM_REGNO1 LIKE '0%';
        -- NOT. 0으로 시작하는 사람은 제외해라 
        
        
    --  함수와 프로시저 차이 
    --  반드시 함수는 반환값이 있다. SELECT WHERE 혼자서 불러서 쓸수있다.
    --  프로시저는 반환값이 없다. SELECT, FROM, WHERE 불가능. 
     
    2) TO_CHAR(expr[,[fmt]) --형식 '' 묶어줘야함. 반드시 함수는 반환값이 있다. SELECT WHERE 혼자서 불러서 쓸수있다.
        - 주어진 자료 expr을 형식지정 문자열 fmt에 맞추어 문자열로 변형하여 반환
        - expr은 숫자, 날짜, 문자열(CHAR, CLOB=>VARCHAR2로) 타입의 자료
---------------------------------------------------------------------------------------------------
         형식지정문자열      의미          사용예
---------------------------------------------------------------------------------------------------
         CC                세기          SELECT TO_CHAR(SYSDATE,'CC') FROM DUAL;
         AD, BC            서기          SELECT TO_CHAR(SYSDATE,'CC BC YYYY "년"') FROM DUAL;
         YYYY,YYY,YY,Y     년도          SELECT TO_CHAR(SYSDATE,'CC BC YY"년"') FROM DUAL;
         Q                 분기          SELECT TO_CHAR(SYSDATE,'CC BC YYYY"년" Q"분기"') FROM DUAL;
         MONTH, MON        월            SELECT TO_CHAR(SYSDATE,'YYYY MON MONTH') FROM DUAL;
         MM, RM(로마)      월            SELECT TO_CHAR(SYSDATE,'YYYY MM RM') FROM DUAL;
         W, WW, WWW        주차          SELECT TO_CHAR(SYSDATE,'W WW WWW') FROM DUAL;
         DD, DDD, J        일            SELECT TO_CHAR(SYSDATE,'DD DDD J') FROM DUAL;
         DAY, DY, D        요일          SELECT TO_CHAR(SYSDATE,'YYYY DAY DY D') FROM DUAL;
         AM, PM, A.M. P.M. 오전/오후      SELECT TO_CHAR(SYSDATE,'AM PM A.M. P.M.') FROM DUAL; -- '시간에 따져서' 오전 오후라는 말을 출력한다는것임.
         MI                분            SELECT TO_CHAR(SYSDATE,'MI') FROM DUAL;
         SS, SSSSS          초            SELECT TO_CHAR(SYSDATE,'SS SSSSS') FROM DUAL; -- SSSSS 오늘 00시00분00초부터 경과한 초
         "문자열"           직접정의한 사용자 변환 문자열
---------------------------------------------------------------------------------------------------

숫자형식지정 문자열
---------------------------------------------------------------------------------------------------
형식지정문자열     의미                                  사용예
---------------------------------------------------------------------------------------------------
9           숫자와 대응되어 유효숫자는 유효숫자를        SELECT TO_CHAR(2345,'99,999') + 10 FROM DUAL; --2345 앞에 2칸의 공백이 존재. 자리점(.)도 공백처리
            출력하고 무효의 0은 공백처리                -- 캐릭터로 변환된것과 10을 더했음. -- ,(문자)가 사용되어서. 문자 + 숫자 이기때문에 불가능. , 를 빼면 가능. 
0           숫자와 대응되어 유효숫자는 유효숫자를       SELECT TO_CHAR(2345,'00,000') FROM DUAL;
            출력하고 무효의 0은 0을 출력
$,L         화폐기호 출력                            SELECT TO_CHAR(12345,'L99,999') FROM DUAL;
PR          음수를 '< >'로 묶어 출력                 SELECT TO_CHAR(-12345,'99,999PR') FROM DUAL;
,(COMMA)    자리점
.(DOT)      소숫점
X           16진수로 변환 출력                      SELECT TO_CHAR(255,'XXXX') FROM DUAL;
-- SELECT TO_CHAR(255,'문자+숫자') + 숫자 FROM DUAL;  = 처리 못함.



3) TO_NUMBER(expr[,fmt])
- 주어진 자료 'expr'의 값을 'fmt' 형식에 맞추어 숫자로 변환
- 'expr'은 문자열 타입의 자료
- 'fmt'는 모두 적용되지않음(숫자로 형변환 가능한 형식만 적용 가능)

사용예)
    SELECT TO_NUMBER('12345', '9999900'),
                           --TO_NUMBER('12345', '99,999')  ,가 들어가서 오류
                           --TO_NUMBER('-12345', '99999PR') -가 들어가서 오류
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
                           TO_DATE('20200320', 'YYYY-MM DD'),    -- - 가 / 로 바뀌어서 표시
                           --TO_DATE('20200332', 'YYYY-MM DD'),    날짜범위를 벗어나서 오류
                           --TO_DATE('20200320', 'AM YYYYMMDD'),
                           --TO_DATE('20200320', 'YYYY MONTH DD'),
                           TO_DATE('20200320')
                        FROM DUAL;