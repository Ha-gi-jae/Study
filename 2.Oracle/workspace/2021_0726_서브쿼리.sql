2021_0726
1. 서브쿼리
    - SQL구문안에 또 다른 SQL구문이 포함된 형태
    - 밖의 쿼리를 메인쿼리, 안쪽 쿼리를 서브 쿼리라 함
    - 서브쿼리는 메인쿼리의 결과를 반환하기 위해 중간 결과로 사용
    - 서브쿼리는 ( )로 묶어 사용함(예외 INSERT문에 사용되는 서브쿼리는 '( )'를 사용하지 않음)
    - 서브쿼리는 사용되는 위치에 따라 일반서브쿼리(SELECT 절), 인라인서브쿼리(FROM 절), 중첩서브쿼리(WHERE 절)로 구분 -- 인라인서브쿼리의 특징: 독립실행되어야함
    - 반환하는 결과의 행/열의 갯수에따라 단일행/단일열, 단일행/다중열, 다중행/단일열, 다중행/다중열로 구분 -- WHERE 절에 사용되는 중첩서브쿼리는 반드시 관계연산자 오른편에 위치해야함
    - 메인쿼리와 서브쿼리에 사용되는 테이블 간의 조인 여부에 따라 관련성없는 서브쿼리/연관서브쿼리로 구분
    - 알려지지않은 조건에 근거하며 데이터를 검색하는 경우 유용
    
    1) 단일행 서브쿼리
        - 하나의 행안 결과로 반환
        - 단일행 연산자는 관계연산자(=, >, <, !=, >=, <=) 임
        
            사용예) 
                SELECT EMPLOYEE_ID, EMP_NAME
                  FROM HR.EMPLOYEES
                 WHERE (DEPARTMENT_ID, MANAGER_ID) = (SELECT DEPARTMENT_ID, MANAGER_ID -- 페어(관계연산좌 좌측)는 8행 // 오른쪽은 1행임. 50, 121 어떻게 오류 발생안하고 되느냐?
                                          FROM HR.DEPARTMENTS                          -- 8 : 1이라고해도 비교할땐 1:1로 비교함. 허나 오른쪽이 여러개면 문제가된다.
                                         WHERE MANAGER_ID=121);                        -- 서브쿼리는 한번에 실행된다. 메인쿼리는 실행될때마다 비교.
               --괄호로 묶어서 동시에 할 수 있음
               -- EMPLOYEES에서 DEPARTMENT_ID랑 MANAGER_ID를 꺼내와서 오른쪽 DEPARTMENTS의 DEPARTMENT_ID, MANAGER_ID를 비교.
               -- MANAGER 121번이 매니저인, 부서코드 50번에 속한 사람이 추출된다.  
               
    2)다중행 서브쿼리
        - 하나 이상의 행을 반환하는 서브쿼리
        - 복수행 연산자 : IN, ANY, SOME, ALL, EXISTS
        
            사용예) 사원테이블에서 직원의 수가 10명 이상이 되는 부서의 부서코드, 부서명을 출력 --메인은 부서, 서브는 사원
                메인쿼리: 부서코드, 부서명        서브쿼리:직원의 수가 10명 이상이 되는 부서의 부서코드        -- 최종적으로 우리가 출력할 부분이 메인쿼리.
                SELECT A.DEPARTMENT_ID AS 부서코드,
                       A.DEPARTMENT_NAME AS 부서명
                  FROM HR.DEPARTMENTS A
                 WHERE A.DEPARTMENT_ID = ( 서브쿼리 )
                 
                 SELECT DEPARTMENT_ID,
                        COUNT(*)
                   FROM HR.EMPLOYEES
                  GROUP BY DEPARTMENT_ID
                  HAVING COUNT(*) >= 10; --카운트는 WHERE 절이 아닌 HAVING 절!
                  -- 10명이상인 부서코드만 필요함. 근데 지금 서브쿼리는 부서코드랑 사원수가 같이나옴! 얘를 다시 서브쿼리 안으로 묶어야함.
                  (서브쿼리)
                  SELECT B.DID
                    FROM (SELECT DEPARTMENT_ID AS DID,
                                 COUNT(*)
                            FROM HR.EMPLOYEES
                            GROUP BY DEPARTMENT_ID
                            HAVING COUNT(*) >= 10) B;
                (결과)
                SELECT A.DEPARTMENT_ID AS 부서코드,
                       A.DEPARTMENT_NAME AS 부서명
                  FROM HR.DEPARTMENTS A
                 WHERE A.DEPARTMENT_ID = ANY(SELECT B.DID -- = 을 쓰려면 ANY OR SOME을 써야함.
                                               FROM (SELECT DEPARTMENT_ID AS DID,
                                                            COUNT(*)
                                                       FROM HR.EMPLOYEES
                                                      GROUP BY DEPARTMENT_ID
                                                     HAVING COUNT(*) >= 10) B);  
            
                (결합: EXISTS)
                    - EXISTS 연산자 왼쪽의 표현식(식 or 컬럼명) 이 없음 
                    - EXISTS 연산자 오른쪽은 반드시 서브쿼리가 와야한다.
                
                SELECT A.DEPARTMENT_ID AS 부서코드,
                       A.DEPARTMENT_NAME AS 부서명
                  FROM HR.DEPARTMENTS A
                 WHERE EXISTS (SELECT 1 
                                 FROM (SELECT B.DEPARTMENT_ID AS DID, --C테이블에있는 컬럼 DID와 A테이블의 컬럼 A.DEPARTMENT_ID를 조인한거임.
                                              COUNT(*) 
                                         FROM HR.EMPLOYEES B
                                        GROUP BY B.DEPARTMENT_ID
                                        HAVING COUNT(*) >=10) C
                                WHERE C.DID = A.DEPARTMENT_ID); -- 즉, 연관성 있는 서브쿼리.
                                --WHERE C.DID=50 OR C.DID=80으로 하면 숫자 1 이 출력된다. 서브쿼리에 행이 1개라도 존재하면 서브쿼리 전체는 참이된다.

    3)다중열 서브쿼리
        - 하나 이상의 열이 반환되는 서브쿼리
        - PAIRWISE(쌍비교) 서브쿼리 또는 Nonpairwise(비쌍비교)서브쿼리로 구현
        
            사용예) 80번 부서에서 급여가 평균이상인 사원을 조회하시오.
                Alias는 사원번호, 급여, 부서코드
                (페어절)
                SELECT A.EMPLOYEE_ID AS 사원번호,
                       A.SALARY AS 급여,
                       A.DEPARTMENT_ID AS 부서코드
                  FROM HR.EMPLOYEES A
                 WHERE (A.EMPLOYEE_ID, A.DEPARTMENT_ID) IN (SELECT B.EMPLOYEE_ID, B.DEPARTMENT_ID
                                                            FROM HR.EMPLOYEES B
                                                           WHERE B.SALARY > (SELECT AVG(C.SALARY)
                                                                               FROM HR.EMPLOYEES C
                                                                              WHERE C.DEPARTMENT_ID = B.DEPARTMENT_ID)
                                                             AND B.DEPARTMENT_ID=80)
                 ORDER BY 3, 2;   
                 (페어말거)
                 SELECT A.EMPLOYEE_ID AS 사원번호,
                       A.SALARY AS 급여,
                       A.DEPARTMENT_ID AS 부서코드
                  FROM HR.EMPLOYEES A
                 WHERE A.DEPARTMENT_ID = 80
                   AND A.SALARY >= (SELECT AVG(SALARY)
                                      FROM HR.EMPLOYEES
                                     WHERE DEPARTMENT_ID=80);