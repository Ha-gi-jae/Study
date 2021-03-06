사원테이블에서 사원번호 125번(Julia Nayer)사원의 직무가 'ST_CLERK'에서 'ST_MAN'으로 승진되었다.
이 정보를 사원테이블에 반영하고 난 후 직무 변동 테이블을 갱신하시오.
    CREATE OR REPLACE TRIGGER TG_JOB_CHANGE
    AFTER UPDATE ON EMPLOYEES
    FOR EACH ROW -- NEW, OLD 를 쓸꺼임.
    DECLARE
      V_EID EMPLOYEES.EMPLOYEE_ID%TYPE:= :OLD.EMPLOYEE_ID; --125를 직접 넣어줘도된다.
      V_CNT NUMBER := 0; 
      V_SDATE DATE; --직무 시작
      V_EDATE DATE; --직무 종료
    BEGIN
      SELECT COUNT(*) INTO V_CNT
        FROM JOB_HISTORY
       WHERE EMPLOYEE_ID = 125; 
       
       IF V_CNT = 0 THEN
          V_SDATE := :OLD.HIRE_DATE+1;
          V_EDATE := SYSDATE-1;
       ELSE 
          SELECT A.END_DATE INTO V_SDATE
            FROM (SELECT START_DATE, END_DATE
                    FROM JOB_HISTORY
                   WHERE EMPLOYEE_ID = 125
                   ORDER BY 2 DESC)A
           WHERE ROWNUM = 1;
          V_SDATE:= V_SDATE + 1;
          V_EDATE:= SYSDATE - 1;
        END IF;
         INSERT INTO JOB_HISTORY
           VALUES(V_EID, V_SDATE, V_EDATE, :OLD.JOB_ID, :OLD.DEPARTMENT_ID);
    END;
    
    (실행)
    DECLARE
    BEGIN
      UPDATE EMPLOYEES
         SET (SALARY, JOB_ID) = (SELECT A.MIN_SALARY, 'ST_MAN'
                                 FROM (SELECT MIN_SALARY
                                         FROM JOBS
                                        WHERE JOB_ID = 'ST_MAN') A)
       WHERE EMPLOYEE_ID = 125;
    END;