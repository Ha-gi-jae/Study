2021_0706_02) SQL 명령의 구분
1)Query
    질의 및 조회
    SELECT 문
2)DML(Data Manipulation Language : 데이터 조작어)
    INSERT, UPDATE, DELETE 문
3)DCL(Data Control Language : 데이터 제어어)
    COMMIT, ROLLBACK, SAVEPOINT, GRANT
4) DDL(Data Definition Language : 데이터 정의어)
    CREATE, DROP, ALTER

(1) CREATE
    오라클 객체를 생성
    (사용형식)
    CREATE 객체타입 객체명;
    객체타입 : 생성하려 하는 객체의 종류로 USER, VIEW, INDEX, SYNONYM, TABLE...etc
   
    **테이블 생성명령
    CREATE TABLE 테이블명(
    컬럼명 데이터타입[(크기)] [NOT NULL] [DEFAULT 값] [,]
                       :
    컬럼명 데이터타입[(크기)] [NOT NULL] [DEFAULT 값] [,]
    --테이블명은 될 수있으면 원본의 단어를 하는게 좋다 ex) a, b, c 로 하면 매우 헷갈림. tbl_ //
    -- 1개이상의 컬럼이 있어야함. 될 수있으면 대표 할수있는 걸로 이름. NOT NULL 쓰면 데이터를 반드시 저장해야함.
    -- DEFAULT 뒤에 값은? 
    -- [,] 를 해줘야 연속되는 조건을 인식함. 없으면 한 문장으로 인식.
    [CONSTRAINT 기본키설정명 PRIMARY KEY(컬럼명[,컬럼명,...])][,]
    -- 외래키 없으면 [,] 안쓰고 끝내면 됨.
    [CONSTRAINT 외래키설정명 FOREIGN KEY(컬럼명[,컬럼명,...])
      REFERENCES 테이블명(컬럼명)][,]
      -- 테이블명은 원본 테이블명 위에서 지정 한 거고 컬럼명은 위의 컬럼명 것을 참조한다는 의미.
                            :
    [CONSTRAINT 외래키설정명 FOREIGN KEY(컬럼명[,컬럼명,...])
     REFERENCES 테이블명(컬럼명)]);
    -- CONSTRAINT 제약조건
    -- pk_테이블명 fk_테이블명 중복되면 안됨. 중복되면 빨리찾기 힘들다.
    -- 기본키는 값이있어야함, NULL 안됨.
     '데이터타입' : CHAR, VARCHAR2, DATE, NUMBER, CLOB, BLOB 등 사용
     'DEFAULT 값' : 사용자가 데이터 입력시(INSERT문)데이터를 기술하지 않은 경우 저장되는 값
     '기본키설정명', '외래키설정명' : 기본키 및 외래키 설정을 구별하기위해 부여된 인덱스명으로 고유한 식별자 이어야 함.
     'REFERENCES 테이블명(컬럼명)' : 원본테이블명(부모테이블명)과 그곳에서 사용된 컬럼명
     
     
     
사용예) 공유폴더의 강의자료 97쪽 논리 ERD를 참조하여 사원, 사업장, 사업장자재, 근무 테이블을 생성하시오.
-- 관계를 생각하고 테이블 만들 순위를 정해라. 사업장이 존재해야 근무 ,사업장자재가 가능하고 사원번호가 있어야 근무가 가능.
[사원테이블]
1) 테이블명: EMPLOYEE
2) 컬럼
------------------------------
컬럼명  데이터타입(크기) n.n  pk/fk
------------------------------------
emp_id   CHAR(4)       n.n      pk
emp_name varchar2(30)  n.n
e_ADDR   varchar2(80)
e_TEL     VARCHAR2(20)
e_position varchar2(30)
e_dept    varchar2(50)          
----------------------------------------
--사원 번호, 이름, 주소, 번호, 직급, 부서

CREATE TABLE EMPLOYEE(
EMP_ID  CHAR(4) NOT NULL,
EMP_NAME  VARCHAR2(30) NOT NULL,
E_ADDR  VARCHAR2(80),
E_TEL  VARCHAR2(20),
E_POSITION  VARCHAR2(30),
E_DEPT  VARCHAR2(50),
CONSTRAINT PK_EMPLOYEE PRIMARY KEY(EMP_ID));

COMMIT;
--오라클은 모두 문자열로취급.
-- Constraint //제약사항
-- pk_ fk_
--constraint fk_aa fpreign key(컬럼명[컬럼명]) fk는 2개 동시에 쓰는 경우가 드물다. 보통 1개씩 써줌.
--

    [사업장 테이블]
    1)테이블명 : SITE
    2)컬럼
    ---------------------------------------
     컬럼명    데이터타입(크기)  N.N   PK/FK
    ---------------------------------------
    SITE_ID   CHAR(4)                PK
    SITE_NAME VARCHAR2(30)     N.N
    SITE_ADDR VARCHAR2(80)
    REMARKS   VARCHAR2(255)
    ---------------------------------------
    -- PK는 N.N 설정을 하지않아도 프로그램에서 알아서 N.N설정을 해준다.
    
    CREATE TABLE SITE(
    SITE_ID CHAR(4),
    SITE_NAME VARCHAR2(30) NOT NULL,
    SITE_ADDR VARCHAR2(80),
    REMARKS VARCHAR2(255),
    CONSTRAINT pk_site PRIMARY KEY(SITE_ID));
    -- REMARKS VARCHAR2(255) 에서 ,를 안찍으면 거기서 끝난줄알고 괄호 없다고 오류남.
    -- 다시 pk_site로 만들면 안만들어짐 이미 있어서.
    
    [근무 테이블]
    1)테이블명 : WORK
    2)컬럼
    ---------------------------------------
     컬럼명    데이터타입(크기)  N.N   PK/FK
    ---------------------------------------
    EMP_ID  CHAR(4)           N.N   PK & FK
    SITE_ID CHAR(4)           N.N   PK & FK
    INPUT_DATE DATE
    ---------------------------------------
    --근무 테이블의 경우 사원테이블 사업장테이블의 자식임.
    --근무 테이블에 사원번호(FK) , 사업장번호(FK) 두개가 들어오고 이게 PK임.

    CREATE TABLE WORK(
    EMP_ID   CHAR(4),
    SITE_ID   CHAR(4),
    INPUT_DATE DATE,
    CONSTRAINT PK_WORK PRIMARY KEY(EMP_ID,SITE_ID),
    CONSTRAINT FK_WORK_EMP FOREIGN KEY (EMP_ID)
     REFERENCES EMPLOYEE(EMP_ID),
    CONSTRAINT FK_WORK_SIT FOREIGN KEY (SITE_ID)
     REFERENCES SITE(SITE_ID));

    --외래키가 2개임 그래서 CONSTRAINT REFERENCES 를 2번쓴것.











