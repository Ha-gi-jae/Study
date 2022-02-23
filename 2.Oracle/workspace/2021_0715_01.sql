2021_0715_01)
3. 날짜함수
    1) SYSDATE
       - 시스템에서 제공하는 날짜정보(년, 월, 일, 시, 분, 초) 반환
       - '+', '-'연산의 대상
       - 날짜 - 날짜 : 두 날짜 사이의 날수(DAYS) 반환

사용예) SELECT SYSDATE-10, -- - 과거     + 미래
              TO_CHAR(SYSDATE,'YYYY MM DD HH24:MI:SS'),
              TRUNC(SYSDATE-TO_DATE('19960430'))
         FROM DUAL;
         
    2) ADD_MONTHS(d, n)
        - 날짜형식의 자료 d에 n만큼의 월을 더한 날짜 반환
      
      사용예)사원의 정식 입사일은 수습 3개월이 지난 날짜이다. 각 사원이 이 회사에 처음 수습으로 입사한
             날짜를 구하시오
                사원번호, 사원명, 입사일, 수습입사일, 소속부서명
            
            SELECT A.EMPLOYEE_ID AS 사원번호,
                   A.EMP_NAME AS 사원명,
                   A.HIRE_DATE AS 입사일,
                   ADD_MONTHS(A.HIRE_DATE,-3) AS 수습입사일,
                   B.DEPARTMENT_NAME AS 소속부서명
              FROM HR.EMPLOYEES A, HR.DEPARTMENTS B
            WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
            ORDER BY 5; 
              
              -- 사장이 지금 NULL 값을 가지고있어서 안나옴.
              
              --비 식별관계 . . . . .
      
    3) NEXT_DAY(d, expr)
         - 주어진 날짜 d 에서 다가올 가장 빠른 'expr'요일의 날짜 변환
         - expr : [월, 화,..., 일], [월요일, 화요일,...일요일]
         
사용예) SELECT NEXT_DAY(SYSDATE, '월'),      2021/07/19
              NEXT_DAY(SYSDATE, '목'),      2021/07/22
              NEXT_DAY(SYSDATE, '일요일')    2021/07/18
         FROM DUAL;
         
    4) LAST_DAY(d)
         - 날짜자료 d에 포함된 월의 마지막 일을 반환

사용예) 매입테이블(BUYPROD)에서 2월에 매입된 매입건수를 조회하시오
        SELECT COUNT(*) AS 매입건수
          FROM BUYPROD
        WHERE BUY_DATE BETWEEN TO_DATE('20050201') AND LAST_DAY(TO_DATE('20050201'));
        
    5) MONTHS_BETWEEN(d1,d2)
         - 두 날짜 자료 사이의 월수 반환

사용예) SELECT EMP_NAME,
              HIRE_DATE,
              TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)/12)||'년'||
              MOD(TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)),12)||'개월' AS 근속기간
         FROM HR.EMPLOYEES;
       
    
    6)EXTRACT(fmt FROM d)   --많이써요~~! SYSDATE 다음으로~~
         - 날짜자료 d 에서 'fmt'로 기술된 자료를 추출함
         - 반환값의 형식은 숫자형식임
         - 'fmt' : YEAR, MONTH, DAY, HOUR, MINUTE, SECOND
         
사용예) 이번 달에 생일이 있는 회원정보를 조회하시오
        Alias는 회원번호, 회원명,생년월일이다.
        SELECT MEM_ID AS 회원번호,
               MEM_NAME AS 회원명,
               MEM_BIR AS 생년월일
          FROM MEMBER
        WHERE EXTRACT (DAY FROM SYSDATE) = EXTRACT(DAY FROM MEM_BIR);
         -- SYSDATE 로는 시간이 추출 되지 않게 막아놨다?

        SELECT EXTRACT(HOUR FROM SYSTIMESTAMP) FROM DUAL;
        -- 시간정보를 추출하려면 SYSTIMESTAMP를 써라.
        SELECT EXTRACT(HOUR FROM SYSTIMESTAMP), 
               EXTRACT(MINUTE FROM SYSTIMESTAMP),
               EXTRACT(SECOND FROM SYSTIMESTAMP)
          FROM DUAL;
         
         --정신차려!