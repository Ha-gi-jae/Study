 과제) 사원들 중 자기가 속한 부서의 평균 급여보다 적은 급여를 받는 직원정보를 조회하시오
            Alias는 사원번호, 사원명, 부서번호, 부서명, 급여, 부서평균급여
            
            SELECT A.EMPLOYEE_ID AS 사원번호,
                   A.EMP_NAME AS 사원명,
                   A.DEPARTMENT_ID AS 부서번호,
                   B.DND AS 부서명,
                   A.SALARY AS 급여,
                   B.ASAL AS 부서평균급여
              FROM HR.EMPLOYEES A,
                   (SELECT C.DEPARTMENT_ID AS DID,
                           C.DEPARTMENT_NAME AS DND,
                           ROUND(AVG(A.SALARY)) AS ASAL
                      FROM HR.EMPLOYEES A, HR.DEPARTMENTS C
                     WHERE A.DEPARTMENT_ID = C.DEPARTMENT_ID
                     GROUP BY C.DEPARTMENT_ID, C.DEPARTMENT_NAME) B
             WHERE A.DEPARTMENT_ID = B.DID
               AND SALARY < B.ASAL
             ORDER BY 6 DESC;