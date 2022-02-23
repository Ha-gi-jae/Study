2021_0809
    (4) PACKAGE
        - 논리적 연관성이 있는 PL/SQL의 변수, 상수커서, 서브프로그램(함수, 프로시저) 들의 항목을 묶어 놓은 객체
        - 다른 객체에서 패키지 항목들을 공유, 실행
        - 모듈화 기능 제공
        - 프로그램 설계의 용이성 제공
        - 캡슐화 기능 제공
        - 선언부와 본문부로 구성
        1) 패키지 선언부 -- 헤더만 작성 한다.
            - 패키지에서 사용할 변수, 상수, 함수 등의 선언 영역(명세)
            (사용형식)
            
            CREATE [OR REPLACE] PACKAGE 패키지명 IS
              변수, 상수, 커서 선언;
              FUNCTION 함수명[(매개변수 list)] -- 함수, 프로시져 기술 순서 상관 없다.
                RETURN 반환타입;
                          :
              PROCEDURE 프로시져명(매개변수 list);
                           :
            END 패키지명;
            
        2)패키지 본문부
            - 선언부에서 선언된 PL/SQL 객체들의 구현내용 기술
            (사용형식)
            CREATE [OR REPLACE] PACKAGE BODY 패키지명 IS
              변수명 타입;
              상수명 CONSTANT 타입;
              커서 정의;
              
              FUNCTION 함수명[(매개변수list)]
                RETURN 타입
              IS
                선언부;
              BEGIN
                실행부;
                RETURN expr;
              END 함수명;
                            :
              PROCEDURE 프로시져명[(매개변수list)]
              IS
                선언부;
              BEGIN
                실행부;
              END 프로시져명;
            END 패키지명;

** 사원테이블에 퇴직일자컬럼을 추가하시오.
    컬럼명         타입             NULL여부
    RETIRE_DATE DATE 
    
    ALTER TABLE EMPLOYEES
      ADD RETIRE_DATE DATE;
      
사용예) 사원관리에 필요한 함수 등을 관리
            - 패키지명 : PKG_EMP
            - FN_GET_NAME : 사원번호를 입력 받아 이름을 반환하는 함수
            - PROC_NEW_EMP : 신규사원정보 입력 프로시져(사원번호, LAST_NAME, 이메일, 입사일, JOB_ID)
            - PROC_RETIRE_EMP : 퇴직자처리 프로시져(사원번호 입력)
                (패키지 선언부)
                CREATE OR REPLACE PACKAGE PKG_EMP
                IS
                  --변서, 상수, 커서 뭐 들어올지모름.
                  --이름 반환 함수
                  FUNCTION FN_GET_NAME(
                  P_EID IN EMPLOYEES.EMPLOYEE_ID%TYPE) --입력용 매개변수니까 IN
                  RETURN VARCHAR2;
                
                  --신규사원정보 입력 프로시져
                  PROCEDURE PROC_NEW_EMP( -- 입사일은 SYSDATE 로 오늘 날짜 집어넣을거라서 안씀.
                  P_EID IN EMPLOYEES.EMPLOYEE_ID%TYPE,
                  P_LNAME IN EMPLOYEES.LAST_NAME%TYPE,
                  P_EMAIL IN EMPLOYEES.EMAIL%TYPE,
                  P_JOB_ID IN JOBS.JOB_ID%TYPE);
                  
                  --퇴직자 처리
                  PROCEDURE PROC_RETIRE_EMP(
                  P_EID IN EMPLOYEES.EMPLOYEE_ID%TYPE);
                END PKG_EMP;
            --본문부없이 선언부 만으로도 컴파일 가능하다.
                
                
                (패키지 본문부)
                CREATE OR REPLACE PACKAGE BODY PKG_EMP
                IS                
                   FUNCTION FN_GET_NAME(
                     P_EID IN EMPLOYEES.EMPLOYEE_ID%TYPE)
                     RETURN VARCHAR2
                   IS
                     V_ENAME EMPLOYEES.EMP_NAME%TYPE;
                   BEGIN
                     SELECT EMP_NAME INTO V_ENAME
                       FROM EMPLOYEES
                      WHERE EMPLOYEE_ID = P_EID;
                      
                     RETURN V_ENAME; 
                   END FN_GET_NAME;
                   
                   PROCEDURE PROC_NEW_EMP(
                     P_EID IN EMPLOYEES.EMPLOYEE_ID%TYPE,
                     P_LNAME IN EMPLOYEES.LAST_NAME%TYPE,
                     P_EMAIL IN EMPLOYEES.EMAIL%TYPE,
                     P_JOB_ID IN JOBS.JOB_ID%TYPE)
                   IS
                   BEGIN
                     INSERT INTO EMPLOYEES(EMPLOYEE_ID, LAST_NAME, EMAIL, JOB_ID, HIRE_DATE, EMP_NAME)
                       VALUES(P_EID, P_LNAME, P_EMAIL, P_JOB_ID, SYSDATE-1, P_LNAME||'길동');
                       COMMIT; --트리거 커밋 X 프로시져 함수는 가능하니 저장시켜주기.
                   END PROC_NEW_EMP;
                   
                   PROCEDURE PROC_RETIRE_EMP(
                     P_EID IN EMPLOYEES.EMPLOYEE_ID%TYPE)
                   IS
                   BEGIN
                     UPDATE EMPLOYEES
                        SET RETIRE_DATE = SYSDATE
                      WHERE EMPLOYEE_ID = P_EID;
                     COMMIT;
                   END PROC_RETIRE_EMP;  
                END PKG_EMP;
                
                (실행)
                   SELECT EMPLOYEE_ID, PKG_EMP.FN_GET_NAME(EMPLOYEE_ID)
                     FROM EMPLOYEES
                    WHERE DEPARTMENT_ID = 60; 
                    
                   EXECUTE PKG_EMP.PROC_NEW_EMP(250, '홍', 'gdhong22@gmail.com', 'FI_ACCOUNT');
                   
                   EXEC PKG_EMP.PROC_RETIRE_EMP(150);