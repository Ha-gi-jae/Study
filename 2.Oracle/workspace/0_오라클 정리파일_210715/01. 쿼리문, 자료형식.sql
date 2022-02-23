2021-07-06
1) SQL 명령의 구분
    (1) Query
        질의 및 조회
        SELECT 문
    (2) DML(Data Manipulation Language : 데이터 조작어)
        INSERT, UPDATE, DELETE 문
    (3) DCL(Data Control Language : 데이터 제어어)
        COMMIT, ROLLBACK, SAVEPOINT, GRANT
    (4) DDL(Data Definition Language : 데이터 정의어)
        CREATE, DROP, ALTER

2) CREATE 명령어
    CREATE 객체타입 객체명;
    **객체타입: 생성하려 하는 객체의 종류로 USER, VIEW, INDEX, SYNONYM, TABLE...etc
    
    사용예) 테이블 생성
            CREATE TABLE EMPLOYEE(
                EMP_ID  CHAR(4) NOT NULL,
                EMP_NAME  VARCHAR2(30) NOT NULL,
                E_ADDR  VARCHAR2(80),
                E_TEL  VARCHAR2(20),
                E_POSITION  VARCHAR2(30),
                E_DEPT  VARCHAR2(50),
                CONSTRAINT PK_EMPLOYEE PRIMARY KEY(EMP_ID));

            CREATE TABLE SITE(
                SITE_ID CHAR(4),
                SITE_NAME VARCHAR2(30) NOT NULL,
                SITE_ADDR VARCHAR2(80),
                REMARKS VARCHAR2(255),
                CONSTRAINT pk_site PRIMARY KEY(SITE_ID));

            CREATE TABLE WORK(
                EMP_ID   CHAR(4) NOT NULL,
                SITE_ID   CHAR(4) NOT NULL,
                INPUT_DATE DATE,
                CONSTRAINT PK_WORK PRIMARY KEY(EMP_ID,SITE_ID),
                CONSTRAINT FK_WORK_EMP FOREIGN KEY (EMP_ID)
                    REFERENCES EMPLOYEE(EMP_ID),
                CONSTRAINT FK_WORK_SIT FOREIGN KEY (SITE_ID)
                    REFERENCES SITE(SITE_ID));

    사용예) 사용자 생성
            CREATE USER 계정명 IDENTIFIED BY 암호;
    
3) GRANT 명령어
    사용예) 권한부여
            GRANT CONNECT, RESOURCE, DBA TO 계정명;
    
    
4) INSERT 명령어
    INSERT INTO 테이블명[(컬럼명,...)]
        VALUES (데이터,...);
        
    사용예) 
            INSERT INTO SITE(SITE_ID,SITE_NAME,SITE_ADDR,REMARKS)
                VALUES ('S100','대흥초등학교보수공사','대전시 중구 대흥동',NULL);
5) DELETE 명령어
    DELETE 테이블명
        [WHERE 조건];
    **ROLLBACK의 대상
    **관계(부모 테이블)가 설정된 자료는 삭제할 수 없다.
    사용예) 사원테이블에서 'A101'사원정보를 삭제하시오.
            DELETE EMPLOYEE
                WHERE UPPER(EMP_ID)='A101';
                
                
6) SELECT 명령어
    - 가장 많이 사용되는 SQL 문
    - 자료 검색(조회)명령
    SELECT [DISTINCT(중복배제)] 컬럼명 [AS]["][별칭(명령문을 쓰면 " " 꼭 써야함)]["][,]
                      .
                      .
                컬럼명 [AS]["][별칭]["]
        FROM 테이블명 [별칭]
        [WHERE 조건]
        [GROUP BY 컬럼명[,컬럼명,...]]
        [HAVING 조건]
        [ORDER BY 컬럼명|컬럼인덱스 [ASC|DESC]
                    [,컬럼명|컬럼인덱스 [ASC|DESC],...]]
    사용예) 회원테이블 (MEMBER)의 주민번호(MEM_REGNO1)을 사용하여 회원의 나이를 조회하시오.
            Alias 회원번호, 회원명, 주민번호, 나이
    
            SELECT MEM_ID AS 회원번호,
                    MEM_NAME AS 회원명,
                    MEM_REGNO1||'-'||MEM_REGNO2 AS 주민번호,
                    EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(MEM_REGNO1,1,2))+1900) AS 나이
                FROM MEMBER
                
    사용예) 회원테이블에서 여성회원정보를 조회하시오.
            Alias 회원번호, 회원명, 생년원일, 마일리지,비고
            SELECT MEM_ID AS 회원번호, 
                MEM_NAME AS 회원명, 
                MEM_REGNO2 AS 생년원일,
                MEM_MILEAGE AS 마일리지,
                CASE WHEN SUBSTR(MEM_REGNO2,1,1)='2' OR 
                            SUBSTR(MEM_REGNO2,1,1)='4' THEN
                                '여성회원'
                    ELSE
                                '남성회원'
                    END AS 비고
                FROM MEMBER
                WHERE SUBSTR(MEM_REGNO2,1,1)=ANY('2','4');
        
            SELECT MEM_ID, MEM_REGNO1, MEM_REGNO2, MEM_BIR
                FROM MEMBER
                WHERE MEM_ID IN ('d001','v001','n001');
                
                
7) 연산자
    사용예) HR계정의 사원테이블에서 보너스를 계산하여 급여의 지금액을 조회하시오.
            SELECT SALARY + (SALARY*COMMISSION_PCT*0.35)
                FROM EMPLOYEES;
    
    사용예) 회원테이블에서 마일리지가 4000이상인 회원의 회원번호, 회원명, 직업, 마일리지를 조회하시오
            마일리지가 많은 회원부터 조회
            
            SELECT MEM_ID AS 회원번호,
                    MEM_NAME AS 회원명,
                    MEM_JOB AS 직업
        --            MEM_MILEAGE AS 마일리지
                FROM MEMBER
                WHERE MEM_MILEAGE >=4000
                ORDER BY MEM_ID,MEM_MILEAGE DESC;
        
                     
8) UPDATE 문
            
    사용예) 회원테이블 정보 변경
            1) d001회원의 주민번호 460409-2000000, 생년월일 1946/04/09 
                     ==> 주민번호 010409-4234765, 생년월일 2001/04/09
                UPDATE MEMBER 
                    SET MEM_REGNO1 = "010409",
                        MEM_REGNO2 = "4234765",
                        MEM_BIR = TO_DATE('20010409')
                    WHERE MEM_ID='d001';
                    
            2) n001회원의 주민번호 750323-1011014, 생년월일 1975/03/23 
                     ==> 주민번호 000323-3011014, 생년월일 2000/03/23
                UPDATE MEMBER 
                    SET MEM_REGNO1 = "000323",
                        MEM_REGNO2 = "3011014",
                        MEM_BIR = TO_DATE('000323')
                    WHERE MEM_ID='n001';              
                    
            3) v001회원의 주민번호 520131-2402712, 생년월일 1952/01/31 
                     ==> 주민번호 020131-4402712, 생년월일 2002/01/31 
                UPDATE MEMBER 
                    SET MEM_REGNO1 = "020131",
                        MEM_REGNO2 = "4402712",
                        MEM_BIR = TO_DATE('020131')
                    WHERE MEM_ID='v001';
                 
                    
9) 논리 연산자
      ----------------------------
      입력       출력       
      A   B    (OR) (AND) (EX-OR)
      0   0     0     0     0
      0   1     1     0     1 
      1   0     1     0     1 
      1   1     1     1     0 
      ----------------------------
    MEM_MILEAGE>=2000 OR EXTRACT(YEAR FROM MEM_BIR) <=2000

    사용예) 사원테이블에서 평균급여 이상 급여를 받는 사원을 조회하시오
            Alias 사원번호, 사원명, 급여, 부서번호
            SELECT EMPLOYEE_ID AS 사원번호,
                    FIRST_NAME AS 사원명,
                    SALARY AS 급여,
                    DEPARTMENT_ID AS 부서번호,
                    ROUND((SELECT AVG(SALARY)
                            FROM HR.EMPLOYEES),0) AS 평균급여
                FROM HR.EMPLOYEES
                WHERE SALARY >= (SELECT AVG(SALARY)
                                        FROM HR.EMPLOYEES)
                ORDER BY 4;


10) ALTER 명령어
    (1) 컬럼을 추가
        (사용형식)
        ALTER TABLE 테이블명
            ADD (컬럼명 데이터타입[(크기)] [DEFAULT 초기값]);     
        
    (2) 컬럼이름 변경
        (사용형식)
        ALTER TABLE 테이블명 
            RENAME COLUMN 원래컬럼명 TO 새로운컬럼명;
        
    (3) 컬럼타입 변경
        (사용형식)
        ALTER TABLE 테이블명
            MODIFY (컬럼명 데이터타입[(크기)] [DEFAULT 초기값]);
    
    (4) 컬럼 삭제
        (사용형식)
        ALTER TABLE 테이블명
            DROP COLUMN 컬럼명;
    
    (5) 사용예
    ** 사원테이블에서 FIRST_NAME과 LAST_NAME을 합쳐서 EMP_NAME VARCHAR(80) 이라는 컬럼으로 바꿀거.
        (EMP_NAME을 씀)
        ALTER TABLE HR.EMPLOYEES 
            ADD(EMP_NAME VARCHAR(80));
        COMMIT;
        
        (FIRST_NAME과 LAST_NAME의 값을 EMP_NAME에 저장)
        UPDATE HR.EMPLOYEES
            SET EMP_NAME=FIRST_NAME||' '||LAST_NAME;

10) 기타 연산자
    (1) IN
        - 주어진 값 중 어느 하나와 일치하면 TRUE를 반환
        - OR 연산자로 치환 가능
        - NOT IN 은 없을 때
        (사용형식)
            expr(컬럼명 또는 식) IN(값1,[,값2,...])
    
        사용예) 사원테이블에서 10,30,40,60번 부서에 속한 사원들의 사원번호, 사원명, 부서코드,
                입사일을 조회하시오.
                (IN 연산자 사용)
                SELECT EMPLOYEE_ID AS 사원번호,
                        EMP_NAME AS 사원명,
                        DEPARTMENT_ID AS 부서코드,
                        HIRE_DATE AS 입사일
                    FROM HR.EMPLOYEES
                    WHERE DEPARTMENT_ID NOT IN (10,30,40,60)
                    ORDER BY 3;
                
                (ANY(SOME) 연산자 사용)
                SELECT EMPLOYEE_ID AS 사원번호,
                        EMP_NAME AS 사원명,
                        DEPARTMENT_ID AS 부서코드,
                        HIRE_DATE AS 입사일
                    FROM HR.EMPLOYEES
                    WHERE DEPARTMENT_ID =ANY(10,30,40,60)
                    WHERE DEPARTMENT_ID =SOME(10,30,40,60)
                    ORDER BY 3;
                    
    (2) ALL (Multi Value)
        - ( )안에 주어진 값들을 모두 만족해야 결과가 참(TRUE)이 됨.
        - AND로 치환 가능
        
        (사용형식)
            컬럼명 관계연산자ALL (값1[,값2,...])
            
        사용예) 사원테이블에서 20,40,70번 부서에 속한 사원들의 급여보다 많은 사원의 
                사원번호, 사원명, 급여, 부서번호를 조회하시오
                SELECT EMPLOYEE_ID AS 사원번호,
                        EMP_NAME AS 사원명,
                        SALARY AS 급여,
                        DEPARTMENT_ID AS 부서번호
                FROM HR.EMPLOYEES
                WHERE SALARY> ALL(SELECT MAX(SALARY)
                                    FROM EMPLOYEES
                                    WHERE DEPARTMENT_ID IN (20,40,70));
                --쉽게 하려면 MAX연산자를 쓰면 되는데 그게 어려운 경우에 이렇게 씀
    
    (3) BETWEEN A AND B (날짜)
        - 범위를 지정하여 값을 조회하는 조건문 구성에 사용
        - 논리 연산자 'AND'로 치환 가능
        
        사용예) 매입정보테이블(BUYPROD)에서 2005년 3월 매입현황을 출력하시오
                Alias는 날짜, 제품코드, 매입수량, 매입금액이다.
                (AND 연산자 사용)
                SELECT BUY_DATE AS 날짜,
                        BUY_PROD AS 제품코드,
                        BUY_QTY AS 매입수량,
                        BUY_QTY*BUY_COST AS 매입금액
                FROM BUYPROD 
                WHERE BUY_DATE>=TO_DATE('20050301') 
                 AND BUY_DATE<=LAST_DAY(TO_DATE('20050301'));    
    
                (BETWEEN 연산자 사용)
                SELECT BUY_DATE AS 날짜,
                        BUY_PROD AS 제품코드,
                        BUY_QTY AS 매입수량,
                        BUY_QTY*BUY_COST AS 매입금액
                FROM HR.BUYPROD 
                WHERE BUY_DATE BETWEEN TO_DATE('20050301') AND LAST_DAY(TO_DATE('20050301'));
        
        사용예) 회원테이블에서 40대 회원의 회원번호, 회원명, 마일리지를 조회하시오
                SELECT MEM_ID AS 회원번호,
                        MEM_NAME AS 회원명,
                        MEM_MILEAGE AS 마일리지
                FROM LYW96.MEMBER
                WHERE EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(MEM_BIR,1,4))) BETWEEN 40 AND 49;
            --  WHERE EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM MEM_BIR) 
                ** EXTRACT 함수
                ** 회원의 생년월일 컬럼에서 월을 추출하시오.
                    SELECT EXTRACT(MONTH FROM MEM_BIR),
                            TO_MEMBER(SUBSTR(MEM_BIR,5,2))
                        FROM MEMBER;
                ** 회원테이블에서 이번달에 생일이 있는 회원번호, 회원명을 조회
                    SELECT MEM_ID,MEM_NAME
                        FROM MEMBER
                        WHERE EXTRACT(MONTH FROM SYSDATE)=SUBSTR(MEM_BIR,6,2)
                        
        사용예) 분류코드가 P2로 시작하는 상품에 대하여 2005년 5월 매출실적을 조회하시오
                Alias 상품코드, 상품명, 판매수량, 금액
                SELECT CART_PROD AS 상품코드, 
                        PROD_NAME AS 상품명, 
                        SUM(CART_QTY) AS 판매수량,
                        SUM(CART_QTY*PROD_PRICE) AS 금액
                    FROM CART, PROD
                    WHERE CART_PROD=PROD_ID
                    AND CART_NO LIKE '200505%'
                    AND PROD_LGU BETWEEN 'P200' AND 'P299'
                    GROUP BY CART_PROD,PROD_NAME
                    ORDER BY 1;
                    
                    
                    
        사용예) 분류코드가 P2로 시작하는 상품에 대하여 2005년 5월 매출실적을 조회하시오
                Alias 상품코드, 상품명, /*분류코드*/, /*분류명*/, 판매수량, 금액       
                    
                SELECT A.PID AS 상품코드,
                        A.PNAME AS 상품명,
                        LPROD_GU AS 분류코드,
                        LPROD_NM AS 분류명,
                        A.QAMT AS 판매수량,
                        A.MAMT AS 금액 
                FROM LPROD,(SELECT CART_PROD AS PID, 
                                    PROD_NAME AS PNAME, 
                                    SUM(CART_QTY) AS QAMT,
                                    SUM(CART_QTY*PROD_PRICE) AS MAMT
                                FROM CART, PROD
                                WHERE CART_PROD=PROD_ID
                                    AND CART_NO LIKE '200505%'
                                    AND PROD_LGU BETWEEN 'P200' AND 'P299'
                                GROUP BY CART_PROD,PROD_NAME) A,
                    PROD
                WHERE PPROD_ID = A.PID
                AND PROD_LGU=LPROD_GU
                ORDER BY 1;
                
    (4) LIKE 연산자(문자열만 비교할 때 사용함.)
        - 패턴을 비교할 때 사용
        - 와일드카드로 '%'와 '_'가 사용되어 패턴 문자열을 구성
        - '%' : '%'이 사용된 위치 이후의 모든 문자열과 대응
            ex) '대전%' : '대전'으로 시작하는 모든 단어와 대응됨
                '대%시' : 첫 글자가 '대'이고 마지막 글자가 '시'인 모든 단어와 대응됨
                '%다'   : 끝글자가 '다'인 모든 단어와 대응됨
                
        사용예) 회원테이블에서 대전에 거주하는 회원들을 조회하시오
                Alias 회원번호, 회원명, 주소, 직업, 마일리지
                SELECT MEM_ID AS 회원번호, 
                        MEM_NAME AS 회원명,
                        MEM_ADD1||' '||MEM_ADD2 AS 주소,
                        MEM_JOB AS 직업,
                        MEM_MILEAGE AS 마일리지
                    FROM MEMBER
                    WHERE MEM_ADD1 LIKE '대전%';
        
        문제) 장바구니테이블에서 2005년 7월 판매현황을 조회하시오
                Alias 일자, 상품코드, 판매수량
                SELECT TO_DATE(SUBSTR(CART_NO,1,8)) AS 일자, 
                                CART_NO AS 상품코드, 
                                CART_QTY AS 판매수량
                FROM CART
                WHERE TO_DATE(SUBSTR(CART_NO,1,8)) BETWEEN TO_DATE('20050701') AND TO_DATE('20050731');

    
    
11) 데이터 타입
    - 오라클에서 사용되는 데이터타입은 문자열, 숫자, 날짜, 2진자료형이 제공
    (1) 문자열 자료
        - 오라클의 문자열은 ' '로 묶어 표현
        - 고정길이(CHAR)와 가변길이(VARCHAR, VARCHAR2, NVARCHAR2(UTF-8이나 UTF-16으로 변환된 데이터를 저장), CLOB)타입으로 구분
        - 영문과 숫자, 특수문자는 1BYTE로 한글은 3BYTE로 표현
        a. CHAR(기본키에서 사용)
           - 길이가 고정된 컬럼이나 기본키 컬럼의 데이터 타입으로 주로 사용
           - 정의된 크기의 기억공간에 자료를 저장하고 남는 공간은 공백으로 채움
           - 데이터는 MSB에서 LSB쪽으로 저장
            (사용형식)
                컬럼명 CHAR(크기 [BYTE|CHAR]);
                - 최대 2000BYTE 까지 저장가능
                - 'BYTE|CHAR' : 생략하면 BYTE로 취급되며 'CHAR'이 사용되면 '크기'는 글자수를 나타냄.
                                다만, CHAR을 사용해도 최대 2000BYTE를 초과할 수 없음.
            사용예) 
                CREATE TABLE T_CHAR(
                    COL1 CHAR(20),
                    COL2 CHAR(20 CHAR),
                    COL3 CHAR(20 BYTE));
                    
                INSERT INTO T_CHAR(COL1, COL2, COL3)
                    VALUES('무궁화 꽃이 피','무궁화 꽃이 피었습니다요','무궁화');
                SELECT * FROM T_CHAR;
                SELECT LENGTHB(COL1),LENGTHB(COL2),LENGTHB(COL3)
                    FROM T_CHAR;
                    
        b. varchar2
            - 가변길이 자료저장에 사용
                (사용형식)
                    컬럼명 VARCHAR2(크기 [BYTE|CHAR])
                    - 최대 4000BYTE까지 저장 가능
                    - 사용자가 정의한 데이터만큼 사용하고 남는 공간은 SYSTEM에 반환
                사용예) 
                    CREATE TABLE T_VARCHAR2(
                        COL1 VARCHAR(500),
                        COL2 VARCHAR(50 CHAR),
                        COL3 VARCHAR(50 BYTE));
                    
                    INSERT INTO T_VARCHAR2
                        VALUES('IL POSTONO','필립 느외레','마시모 트로이시');
                    INSERT INTO T_VARCHAR2
                        VALUES('PERSIOMON BANNA APLLE','PERSIOMON BANNA','PERSIOMON ');
                    SELECT * FROM T_VARCHAR2;
                    SELECT LENGTHB(COL1),LENGTHB(COL2),LENGTHB(COL3)
                        FROM T_VARCHAR2;
                    
        c. VARCHAR, NVARCHAR, NVARCHAR2
            - 기본적으로 NVARCHAR2와 저장 방법은 동일
            - NVARCHAR, NVARCHAR2는 UTF-8(가변길이), UTF-16(고정길이)방식의 코드로 
                변환하여 자료 저장(국제표준코드 적용)
            
         d. LONG
            - 가변길이 자료를 저장
            - 최대 2GB까지 저장 가능
            - 한 테이블에 하나의 컬럼만 사용가능(제약사항)
            - CLOB로 대체 가능
            - 문자열 함수(LENGTH, LENGTHB, SUBSTR 등) 사용이 제한됨
                (사용형식)
                    컬럼명 LONG
                사용예)
                    CREATE TABLE T_LONG(
                        COL1 VARCHAR2(100),
                        COL2 LONG,
                        COL3 CHAR(100));
                    
                    INSERT INTO T_LONG
                        VALUES('PERSIMON BANNA APLLE','PERSIMON BANNA','PERSIMON ');
                    SELECT * FROM T_LONG;
                    SELECT COL1,COL2,TRIM(COL3) FROM T_LONG;
                    SELECT LENGTHB(COL1),LENGTHB(COL3)
                        FROM T_LONG;
                    
         e. CLOB(Char Large OBject)
            - 가변길이 자료를 저장
            - 최대 4GB까지 저장 자능
            - 여러 컬럼을 하나의 테이블에 선언 가능
            - 일부 기능은 DBMS_LOB API의 지원을 받아야 사용 가능(LENGTH, SUBSTR 등)
                (사용형식)
                    컬럼명 CLOB
                사용예 
                    CREATE TABLE T_CLOB(
                        COL1 CLOB,
                        COL2 CLOB,
                        COL3 VARCHAR2(4000),
                        COL4 LONG);
                    INSERT INTO T_CLOB(COL1,COL2,COL4)
                        VALUES('대전시 중구 대흥동 영민빌딩',
                        '대전시 중구 대흥동 영민빌딩','대전시 중구 대흥동 영민빌딩');
                    SELECT * FROM T_CLOB;
                    SELECT DBMS_LOB.GETLENGTH(COL1),
--                            DBMS_LOB.GETLENGTH(COL2),
                            SUBSTR(COL1,5,6),--5번째 글자부터 6개
                            DBMS_LOB.SUBSTR(COL1,5,6)--6번째 글자부터 5개
                        FROM T_CLOB;
                        
                        
    (2) 숫자 자료
        - NUMBER 타입이 제공
        - 저장범위 : 1.0 x 10^-130 ~ 0.999...9 x 10^125
        - 정밀도 : 전체자리수(1~30)
        - 스케일(양수) : 소수점 이하의 자리수
          스케일(음수) : 정수부분의 자리수
          스케일 값은 84 ~ 127
        - 20 BYTE로 표현
            (사용형식)
                컬럼명 NUMBER[(정밀도|*[,스케일])]
            사용 예)
                NUMBER, NUMBER(10), NUMBER(10,2), NUMBER(*,2)...
                -------------------------------------------------
                입력값          선언                  기억되는 값
                -------------------------------------------------
                123456.6789     NUMBER              123456.6789
                123456.6789     NUMBER(10)=(10,0)   1234567        (소수 첫번째 자리에서 반올림)
                123456.6789     NUMBER(7,2)         오류           (정수부분이 최소 6개는 필요한데 소수 2자리, 정수 5(7-2)자리라서)
                123456.6789     NUMBER(*,2)         123456.68      (소수 2째자리까지 표시하겠다.)
                123456.6789     NUMBER(10,-2)       123500         (정수 2째자리(10의 자리)에서 반올림)
                --------------------------------------------------
                
                CREATE TABLE T_NUMBER(
                    COL1 NUMBER,
                    COL2 NUMBER(10),
                    COL3 NUMBER(7,2),
                    COL4 NUMBER(*,2),
                    COL5 NUMBER(10,-2));
                
                INSERT INTO T_NUMBER
                    VALUES(123456.6789,123456.6789,123456.6789,123456.6789,123456.6789);
                
                INSERT INTO T_NUMBER(COL5)
                    VALUES(123456.6789);
                SELECT * FROM T_NUMBER;
            **스케일>정밀도
                - 스케일 : 소수점 이하의 데이터 수
                - 스케일 - 정밀도: 소수점 이하에 존재해야 할 0의 개수
                - 정밀도 : 소숫점이하에 0이 아닌 자료수
                -------------------------------------------------
                입력값          선언                  기억되는 값
                -------------------------------------------------
                1.234           NUMBER(4,5)          오류         (정수부분에 0이 아닌 값이 들어옴) 
                0.23            NUMBER(3,5)          오류         (0.00으로 시작해야함)
                0.0023          NUMBER(3,5)          오류         (유효숫자가 부족)
                0.0023          NUMBER(2,4)          0.0023
                0.012345        NUMBER(3,4)          0.0123
                --------------------------------------------------
                
        
    (3) 날짜 자료   
        - data, timestamp 타입제공
        - 덧셈과 뺄셈의 대상
        a. date
            - 기본 날짜형
            - 년월일시분초 정보를 저장관리
            - 날짜형 자료의 뺄셈 : 두 날짜사이의 일수 반환
            - 날짜형 + 정수 : '날짜'에서 '정수'만큼 경과된 후의 날짜 반환
            - 날짜형 - 정수 : '날짜'에서 '정수'만큼 과거의 날짜 반환
            (사용형식)
                컬럼명 DATE;
                
        b.TIMESTAMP
            - 시간대 정보와 정교한 시간(10억분의 1초) 제공
            (사용형식)
                컬럼명 TIMESTAMP; --시간대 정보 없는 날짜 정보
                컬럼명 TIMESTAMP WITH TIME ZONE; --시간대 정보(도시면/대륙명)와 날짜 정보
                컬럼명 TIMESTAMP WITH LOCAL TIME ZONE; --서버가 설치된 지역의 시간대 정보(도시면/대륙명)와 날짜 정보
            사용예)
                CREATE TABLE T_DATE(
                            COL1 DATE,
                            COL2 DATE,
                            COL3 TIMESTAMP,
                            COL4 TIMESTAMP WITH TIME ZONE,
                            COL5 TIMESTAMP WITH LOCAL TIME ZONE);
                INSERT INTO T_DATE 
                    VALUES(SYSDATE,TO_DATE('20210907'),TO_DATE('20210907'),SYSDATE,SYSDATE);
                SELECT COL2-COL1 FROM T_DATE;        
                SELECT TO_CHAR(COL1,'YYYY-MM-DD AM HH24:MI:SS'),
                        TRUNC(COL2-COL1) --TRUNC():절삭 함수
                    FROM T_DATE;
        
        
    (3) 기타 자료
        - 2진 자료를 저장(16진수 사용할 때도 사용)
        - RAW, LONG RAW, BLOB, BFILE
        a. BFILE
            - 2진 자료 저장
            - 원본자료를 데이터베이스 외부에 저장하고 데이터베이스에는 경로정보만 보관
            - 4GB 까지 저장
            - 오라클에서는 원본자료(2진자료)에 대하여 해석하거나 변환하지 않음
            - 2진자료 저장을 위해 DIRECTORY 객체가 필요
            (사용형식)
                컬럼명 BFILE;
            사용예)
                CREATE TABLE T_BFILE(
                            COL1 BFILE);
                가. 디렉토리 객체 생성
                GRANT  CONNECT, RESOURCE, DBA TO HR;
                    (사용형식)
                        CREATE DIRECTORY 디렉토리별칭 AS 절대경로명
                    사용예)
                        CREATE DIRECTORY TEMP_DIR AS 'D:\A_TeachingMaterial\2.Oracle\workspace';
--                        ALTER USER GRANT CONNECT, RESOURCE, DBA TO HR;
                나. 이미지 자료 저장
                    (사용형식)
                        INSERT INTO 테이블명
                            VALUES (BFILENAME(디렉토리별칭,'파일명');
                    사용예
                        INSERT INTO B_FILE
                            VALUES (BFILENAME('TEMP_DIR','SAMPLE.jpg'));
                    GRANT CONNECT TO HR;
                    
        b. BLOB
            - 2진 자료저장
            - 4GB까지 저장 가능
            - 원본자료를 데이터베이스 내부에 저장
            (사용형식)
                컬럼명 BLOB;
            사용예)
                가. 테이블 생성
                    CREATE TABLE B_BLOB(
                            COL1 BLOB);
                나. 디렉토리객체 생성
                    CREATE DIRECTORY 디렉토리명 AS '직접주소';
                다. 익명블록 생성
                    DECLARE
                        L_DIR VARCHAR2(20) :='TEMP_DIR';
                        L_FILE VARCHAR2(30) :='SAMPLE.jpg';
                        L_DFILE BFILE;
                        L_BLOB BLOB;
                    BEGIN
                        INSERT INTO T_BLOB(COL1) VALUES(EMPTY_BLOB())
                            RETURN COL1 INTO L_BLOB;
                        L_BFILE:=BFILENAME(L_DIR,L_FILE);
                        DBMS_LOB.FILEOPEN(L_BFILE,DBMS_LOB.FILE_READONLY);
                        DBMS_LOB.LOADFROMFILE(L_BLOB,L_FILE,DBMS_LOB.GETLENGTH(L_BFILE));
                        DBMS_LOB.FILECLOSE(L_BFILE);
                        
                        COMMIT;
                    END;
                
                
            
        
            
        
        
        
        
        
        
        