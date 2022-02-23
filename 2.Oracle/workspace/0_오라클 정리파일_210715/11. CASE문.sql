1. CASE문
    - 표준 SQL의 SELECT 절에 사용되는 CASE표현식과 동일
    - 다중 분기 기능 제공
        (사용형식 - 1)
        CASE 변수|수식 WHEN 값1 THEN -- 변수|수식 다 쓸 수 있 음~
                           명령1;   -- break 없어도 알아서 빠져나감.
                      WHEN 값2 THEN
                           명령2;
                             :
                      ELSE 명령n;
        END CASE;
             
         (사용형식 - 2)
         CASE WHEN 조건1 THEN -- WHEN절에 조건이 맞지 않으면 ELSE 실행~
                   명령1;
              WHEN 조건2 THEN
                   명령2;
                     :
              ELSE 명령n;
         END CASE;
             
         (사용예) 10~110 사이의 난수를 발생시켜 발생된 난수에 해당하는 부서에 속한 사원 중 첫번째 사원의 급여를 조회하여 5000이하이면 '저임금 사원',
                 10000이하이면 '평균임금 사원', 그 이상이면 '고임금 사원'을 각 사원번호, 사원명, 부서명과 함께 출력하시오.
                 --★★★ PL/SQL에서 메인 쿼리의 SELECT절 구성 INTO FROM WHERE //INTO 안 들어가면 오류. 
                 DECLARE
                   V_EID HR.EMPLOYEES.EMPLOYEE_ID%TYPE; -- 사원 번호 
                   V_ENAME HR.EMPLOYEES.EMP_NAME%TYPE; -- 사원 이름
                   V_DNAME HR.DEPARTMENTS.DEPARTMENT_NAME%TYPE; -- 부서 이름
                   V_SAL HR.EMPLOYEES.SALARY%TYPE; -- 급여 참조형 변수타입
                   V_MESSAGE VARCHAR2(20); -- 비고란(저임금,평균임금,고임금 저장)
                   V_DID HR.EMPLOYEES.DEPARTMENT_ID%TYPE; -- 부서 코드(난수 발생)
                 BEGIN
                   V_DID:= TRUNC(SYS.DBMS_RANDOM.VALUE(10,110),-1); -- 일의 자리 절삭.
                   SELECT A.EMPLOYEE_ID, A.EMP_NAME, B.DEPARTMENT_NAME, A.SALARY
                     INTO V_EID, V_ENAME, V_DNAME, V_SAL
                     FROM HR.EMPLOYEES A, HR.DEPARTMENTS B
                    WHERE A.DEPARTMENT_ID = V_DID
                      AND A.DEPARTMENT_ID = B.DEPARTMENT_ID
                      AND ROWNUM = 1;
                          
                   CASE WHEN V_SAL < 5000 THEN
                             V_MESSAGE:= '저임금 사원';
                        WHEN V_SAL < 10000 THEN
                             V_MESSAGE:= '평균임금 사원';
                        ELSE 
                             V_MESSAGE:= '고임금 사원';
                   END CASE;
                       
                   DBMS_OUTPUT.PUT_LINE('부서명 : '||V_DNAME);
                   DBMS_OUTPUT.PUT_LINE('사원번호 : '||V_EID);
                   DBMS_OUTPUT.PUT_LINE('사원명 : '||V_ENAME);
                   DBMS_OUTPUT.PUT_LINE('비고 : '||V_MESSAGE);
                 END;