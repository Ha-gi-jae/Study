2021_0708_01)
1)SELECT 절 구성
  SELECT [DISTINCT] 컬럼명|수식|데이터 [AS]["][별칭]["] 가 올 수 있음.
        'DISTINCT' : 중복된 값을 배제 ,예약어, 쓰지 않아도된다.
        [AS]["][별칭]["] : 컬럼에 부여된 또 다른 이름으로 특수문자 사용시 " " 로 묶어 사용해야한다.
        - 출력시 컬럼의 제목으로 사용된다. 
        - 긴 수식을 만들면 그게 컬럼의 제목이 된다. 그걸 줄이려면 저거 쓰면 된다.
        
사용예) 회원테이블(MEMBER)의 주민번호(MEM_REGNO1)를 사용하여 사용하여 회원의 나이를 조회하시오.
--              테이블                컬럼

        Alias는 회원번호, 회원명, 주민번호, 나이
--             [위의 컬럼이 어디 테이블인지 알아야함.]

        SELECT MEM_ID AS 회원번호,   -- 회원번호가 아닌 FROM 같은 예약어를 별칭으로 쓰려면 " "를 써준다.
               MEM_NAME AS 회원명,
               MEM_REGNO1||'-'||MEM_REGNO2 AS "주민 번호",
               EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(MEM_REGNO1,1,2))+1900) AS 나이
            FROM MEMBER;
            
            
--현재 조건이 없으므로 WHERE 절 생략.
-- 2000년생이 없으므로 1900을 더해줌.
-- 만 나이 임. year - year 이니까.
-- 지금 EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(MEM_REGNO1,1,2))+1900) 가 이름으로 되어있음.
-- EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(MEM_REGNO1,1,2))+1900) AS 나이
-- 위 처럼 바꾸면 별칭이 나이로 바뀌면서 깔끔하게 바뀜. 현재 별칭을 컬럼의 제목으로 씀.
-- 자바는 0부터 오라클은 1부터 카운팅.
-- 별칭에 띄어쓰기를하면 FROM 키가 없다고 나옴. 띄어쓰기 한 곳에 , 이 없어서 명령이 끝난걸로 인식함.
-- "주민 번호" 이렇게 쌍따옴표로 묶어줘야 출력이 된다.

    (1) 연산자(OPERATER)
        - 산술 연산자
            +, -, /, *
    사용예)HR계정의 사원 테이블(EMPLOYEES)에서 보너스를 계산하여 급여의 지급액을 조회하시오.
            보너스 = 급여* 영업실적코드(COMMISSION_PCT)의 35%
            지급액 = 급여 + 보너스
            출력: 사원번호, 사원명, 급여, 보너스, 지급액
            
            SELECT EMPLOYEE_ID AS 사원번호,
            FIRST_NAME||' '||LAST_NAME AS 사원명,
            SALARY AS 급여,
            NVL(SALARY * COMMISSION_PCT * 0.35,0) AS 보너스,
            SALARY + NVL(SALARY * COMMISSION_PCT * 0.35,0) AS 지급액
             FROM HR.EMPLOYEES;
-- NVL 을 쓴 후 뒤에 0 을 써주면 NULL값에 0을 넣어줘라임.
--FROM 먼저 쓰면 자동으로 몇개 적으면 뜸!            
--FROM에서 HR.EMPLOYEES를 해주면 SELECT에서 HR. 을 하지 않고 바로 EMPLOYEES 테이블을 사용할 수 있다.
-- 나머지를 제공하지 않는다. MOD라는 함수로 제공.  
-- JAVA => "75" + 20 JAVA식으로 계산. 1. 데이터 타입을 일치 시킴
--      2. "75" + "20" 으로 변환.
--      3. "7520" 으로 결과가 나옴.
-- 문자가 최우선순위.
-- ORACLE => 숫자가 우선. "75" + 20 이 75 + 20으로 변환 되고 95 로 결과가 나옴.
-- JAVA/ "AB" + 20 = "AB20"
-- ORACLE/ "AB" + 20 = ERROR "AB"를 숫자로 바꿀 수 없음.

        - 관계 연산자 : 대소비교, TRUE/FALSE를 결과로 반환
            >, <, >=, <=, =, !=(<>)
    사용예)회원테이블에서 마일리지가 4000이상인 회원의 회원번호, 회원명, 직업, 마일리지를 조회하시오.
          (마일리지가 많은 회원부터 조회)
          
    SELECT MEM_ID AS 회원번호,
           MEM_NAME AS 회원명,
           MEM_JOB AS 직업,
           MEM_MILEAGE AS 마일리지
           FROM MEMBER 
         WHERE MEM_MILEAGE >= 4000
          ORDER BY MEM_MILEAGE DESC;
        
**회원테이블 정보 변경 --회원 테이블에 나이가 많음.
1) d001회원의 주민번호460409-2000000, 생년월일이 1946/04/09 = > 주민번호 010409-4234765, 생년월일이 2001/04/09
2) n001회원의 주민번호750323-1011014, 생년월일이 1975/03/23 = > 주민번호 000323-3011014, 생년월일이 2000/03/23
3) v001회원의 주민번호520131-2402712, 생년월일이 1952/01/31 = > 주민번호 020131-4402712, 생년월일이 2002/01/31     
    
**정보변경 : UPDATE문
    UPDATE 테이블명
       SET 컬럼명 = 값[,
           컬럼명 = 값,
               :     ]
     [WHERE 조건];
    
    UPDATE MEMBER
        SET MEM_REGNO1 = '010409',
            MEM_REGNO2 = '4234765',
            MEM_BIR = TO_DATE('20010409')
        WHERE MEM_ID = 'd001';
        
    SELECT MEM_ID,MEM_REGNO1,MEM_REGNO2,MEM_BIR
        FROM MEMBER
      WHERE MEM_ID = 'd001';
    
    
    UPDATE MEMBER
        SET MEM_REGNO1 = '000323',
            MEM_REGNO2 = '3011014',
            MEM_BIR = TO_DATE('20000323')
      WHERE MEM_ID = 'n001';
      
      UPDATE MEMBER
        SET MEM_REGNO1 = '020131',
            MEM_REGNO2 = '4402712',
            MEM_BIR = TO_DATE('20020131')
      WHERE MEM_ID = 'v001';
    
    SELECT MEM_ID,MEM_REGNO1,MEM_REGNO2,MEM_BIR
        FROM MEMBER
      WHERE MEM_ID IN('d001', 'v001', 'n001');

--    WHERE MEM_ID = 'd001', 'v001', 'n001' 이럴때는 기타연산자를 써줘야함.  
-- IN은 OR 연산된거랑 같다. 
-- 주민등록번호는 문자열로 되어있음. 
    
사용예) 회원테이블에서 여성회원정보를 조회하시오.
        Alias 회원번호, 회원명, 생년월일, 마일리지,비고
          
        SELECT MEM_ID AS 회원번호,
               MEM_NAME AS 회원명,
               MEM_BIR AS 생년월일,
               MEM_MILEAGE AS 마일리지,
               CASE WHEN SUBSTR(MEM_REGNO2,1,1) = '2' OR
                         SUBSTR(MEM_REGNO2,1,1) = '4' THEN
         -- SUBSTR(MEM_REGNO2,1,1) = ANY('2','4'); 로 써도 된다. 
                            '여성회원'
                    ELSE
                            '남성회원'
                END AS 비고   
        FROM MEMBER
        WHERE SUBSTR(MEM_REGNO2,1,1) = '2'
            OR
            SUBSTR(MEM_REGNO2,1,1) = '4';
        
        
-- MEMBER 테이블에서 데이터를 가져옴. 마일리지가 4000보다 큰지 확인. 크면 SELECT문 실행 작으면 SLECT문 건너띔.  
-- ORDER BY 옆에 MEM_MILEAGE 가 아닌 4로 써도됨. 수식이 길어지거나 함수 쓰여질 때, 컬럼명을 쓰지 않고 컬럼 INDEX를 쓴다.
-- SELECT 순서가 컬럼 INDEX 순서.
-- ORDER가 마지막임.
-- ORDER BY MEM_ID,MEM_HP 이면 MEM_ID로 정렬한 후, 중복되는것만 MEM_HP로 재 정렬한다. 즉 새롭게 정렬하는게 아님.
-- WHERE, ORDER BY 는 SELECT에서 참조하는게아니라 MEMBER 테이블에서 참조하는 것.
-- ASC 오름차순 DESC 내림차순. 생략시 오름차순이 기본이 된다. 
-- 주로 조건문(WHERE 절) 구성에 사용된다. ! = NOT.  <> 크거나 작다 => 같지않다.

        - 논리 연산자
            NOT, AND(직렬), OR(병렬)
            NOT: 논리부정
            ---------------------------------------
             입력      출력
            A    B    (OR)         (AND)     (EX-OR)
            ---------------------------------------
            0    0     0             0         0
            0    1     1             0         1
            1    0     1             0         1
            1    1     1             1         0
            ---------------------------------------
            MEM_MILEAGE >=2000 OR EXTRACT(YEAR FROM MEM_BIR) <= 2000
                  A                       B

사용예)사원테이블에서 평균급여 이상 급여를 받는 사원을 조회하시오.
      Alias는 사원번호, 사원명, 급여, 부서번호
      SELECT EMPLOYEE_ID AS 사원번호,
             FIRST_NAME AS사원명,
             SALARY AS 급여,
             DEPARTMENT_ID AS 부서번호,
             ROUND((SELECT AVG(SALARY)
                             FROM HR.EMPLOYEES),0) AS 평균급여
        FROM HR.EMPLOYEES
       WHERE NOT SALARY < (SELECT AVG(SALARY)
                             FROM HR.EMPLOYEES);
        ORDER BY 4;
        
        
-- 우선 순위 NOT - AND - OR 순. 연결되어있을 때.

        - 기타 연산자
            IN, ANY, SOME, ALL, EXISTS, BETWEEN, LIKE 등 제공.
--  IN부터 EXISTS 데이터가 하나 이상 존재할때. BETWEEN 범위.
        
        
        
        
        
        
        
        
        
        SELECT * FROM HR.JOBS;
-- 테이블과 뷰가 보이지 않아요~.
-- JOBS는 HR 계정에 있으니까, JOBS 앞에 HR. 을 써줘야함.
        