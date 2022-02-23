1.객체
    (1) VIEW 객체
        - 가상의 테이블
        - SELECT 문에 종속되지 않고 독립적 객체
        - 필요한 자료가 복수개의 테이블에 분산되어 있는 경우
        - 특정 테이블의 접근을 차단하고 필요한 정보를 제공해야하는 경우 사용
        (사용형식)
        CREATE [OR REPLACE] VIEW 뷰이름[(컬럼list)] -- VIEW_뷰이름 
        AS
          SELECT 문
          [WITH CHECK OPTION] -- 배타적이라 둘이 동시에 쓰일 수 없음. 얘는 DML명령을 쓰는거임.
          [WITH READ ONLY];   -- VIEW 데이터 고치면 원본 데이터도 고쳐짐. 이것을 쓰면 VIEW에 DML 명령을 못쓰게함.
            - 'OR REPLACE' : 같은 이름의 뷰가 존재하면 대치하고 없으면 새롭게 생성
            - '컬럼list' : 뷰에서 사용할 컬럼명, 생략하면 SELECT문에 사용된 컬럼별칭 또는 컬럼명이 뷰의 컬럼명으로 사용됨
            - 'WITH CHECK OPTION' : 뷰를 생성하는 SELECT문에 사용된 조건을 체크하며 이를 위배하는 DML명령을 뷰에서 사용하지 못하게 함
            - 'WITH READ ONLY' : 읽기전용 뷰 생성
            -- 뷰 컬럼명 설정 방법 1. 직접기술 2. SELECT 별칭 3. SELECT 컬럼명
        사용예) 회원테이블에서 마일리지가 3000이상인 회원의 회원번호, 회원명, 직업, 마일리지를 뷰로 생성하시오.
        
            CREATE OR REPLACE VIEW VIEW_MEM_MILEAGE(MID,MNAME,MJOB,MMILE) -- CREATE OR REPLACE 하나의 명령어처럼 외워서 쓰면 편하다. 
            AS                                      --위의 MID,MNAME,MJOB,MMILE이 뷰컬럼명이 된다.
            SELECT MEM_ID AS 회원번호,
                   MEM_NAME AS 회원명,
                   MEM_JOB AS 직업,
                   MEM_MILEAGE AS 마일리지
              FROM MEMBER
             WHERE MEM_MILEAGE >= 3000; 
            
            CREATE OR REPLACE VIEW VIEW_MEM_MILEAGE
            AS
            SELECT MEM_ID AS 회원번호,      -- 위에 뷰의 컬럼명을 적지 않으면 별칭이 뷰의 컬럼명이 된다.
                   MEM_NAME AS 회원명,
                   MEM_JOB AS 직업,
                   MEM_MILEAGE AS 마일리지
              FROM MEMBER
             WHERE MEM_MILEAGE >= 3000; 
    
            CREATE OR REPLACE VIEW VIEW_MEM_MILEAGE
            AS
            SELECT MEM_ID -- 테이블의 컬럼명이 뷰의 컬럼명이 된다.
                   MEM_NAME 
                   MEM_JOB
                   MEM_MILEAGE
              FROM MEMBER
             WHERE MEM_MILEAGE >= 3000;          
             
             SELECT * FROM VIEW_MEM_MILEAGE;
             
            ** 생성된 뷰 'VIEW_MEM_MILEAGE'에서 회원번호 'e001'회원의 마일리지를 500으로 조정하시오.
                UPDATE VIEW_MEM_MILEAGE
                   SET 마일리지 = 500        --컬럼명이 '마일리지' 임.
                 WHERE 회원번호 = 'e001';
                -- 뷰 테이블 조건이 마일리지 3000이상인데 'e001' 회원의 마일리지를 500으로 변경했기 때문에 뷰에서 제외된다. + 테이블에서도 500으로 변경된다.
                
                SELECT MEM_ID,MEM_NAME,MEM_MILEAGE
                  FROM MEMBER
                 WHERE MEM_ID = 'e001';
                 
            ** 회원테이블에서 회원번호 'g001'회원의 마일리지를 800에서 15000으로 변경하시오.
                UPDATE MEMBER
                   SET MEM_MILEAGE = 15000
                 WHERE MEM_ID = 'g001';
            
        ** VIEW 사용시 주의사항
            - WITH 절이 사용된 경우 ORDER BY절 사용 금지
            - 집계함수, DISTINCT가 사용된 VIEW를 대상으로 DML 명령 사용할 수 없음
            - 표현식(CASE WHEN-THEN, DECODE 등)이나 일반 함수를 적용하여 뷰가 생성된 경우 해당 컬럼을 대상으로 수정, 삭제 등 사용금지
            - CURRVAL, NEXTVAL 등 의사컬럼(Pseudo Column)사용 금지
            - ROWNUM, ROWID 등 사용시 별칭을 사용해야 함.
            
        사용예) 상품분류별 상품의 수를 출력하는 뷰 생성
            CREATE OR REPLACE VIEW VIEW_PROD_LGU
            AS
              SELECT PROD_LGU AS PLGU,
                     COUNT(*) AS CNT
                FROM PROD
               GROUP BY PROD_LGU;
               
            SELECT * FROM VIEW_PROD_LGU
            
        ** 뷰 VIEW_PROD_LGU에서 'P102'의 자료를 삭제하시오.
            DELETE VIEW_PROD_LGU
             WHERE PLGU = 'P102';
             -- 집계함수를 사용했기때문에 DML 명령 불가능 
             
        사용예) 회원테이블에서 마일리지가 3000이상인 회원들로 구성되고 제약조건(CHECK OPTION)을 사용한 뷰를 생성하시오.
            CREATE OR REPLACE VIEW VIEW_MEM_MILEAGE
            AS
            SELECT MEM_ID AS 회원번호,      
                   MEM_NAME AS 회원명,
                   MEM_JOB AS 직업,
                   MEM_MILEAGE AS 마일리지
              FROM MEMBER
             WHERE MEM_MILEAGE >= 3000
    --      WITH CHECK OPTION  < 이 두가지는 뷰만 해당 테이블에는 해당 ㄴㄴ ~~~~
            WITH READ ONLY; --읽기만 가능하므로 뷰를 대상으로 DML 못씀~ 원본 테이블로만 가능~
            
            SELECT * FROM VIEW_MEM_MILEAGE;
            
        ** 뷰(VIEW_MEM_MILEAGE)에서 이혜나 회원('e001')의 마일리지를 1500로 변경
            UPDATE VIEW_MEM_MILEAGE
               SET 마일리지 = 1500
             WHERE 회원번호 = 'e001';
             -- 변경 하려는 값이 조건에 위배되기때문에 실행 불가.
        
        ** 회원테이블(MEMBER)에서 이혜나 회원('e001')의 마일리지를 1500로 변경
            UPDATE MEMBER
               SET MEM_MILEAGE = 6500
             WHERE MEM_ID = 'e001';
             --원본 테이블은 제약이 없다. 그러므로 가능하다.
             
    (2)SEQUENCE 객체
        - 순차적으로 증강하는 값을 반환하는 객체.
        - 테이블과 독립적
        - 임의의 테이블에서 기본키로 설정할 마땅한 컬럼이 없는 경우, 자동으로 부여되는 순차적인 숫자 값이 필요한 경우 사용
        (사용형식)
            CREATE SEQUENCE 시퀀스명
               [START WITH n] -- 시작 값, 생략하면 최소값(MINVALUE)
               [INCREMENT BY n] -- 증감값, 생략하면 1
               [MAXVALUE n | NOMAXVALUE] -- 최대값, 기본은 NOMAXVALUE이며 10^27
               [MINVALUE n | NOMINVALUE] -- 최소값, 기본은 NOMINVALUE이고 값은 1
               [CYCLE | NOCYCLE] -- 최소[최대]값 도달 후 시퀀스값을 다시 생성할지 여부 기본은 NOCYCLE
               [CACHE n | NOCACHE] -- 시퀀스 값을 캐쉬에 미리 생성하고 사용할지 여부, 기본은 CACHE 20
               [ORDER | NOORDER] -- 제시한 조건대로 시퀀스 생성을 보증, 기본은 NOORDER
               
        ** 의사컬럼
            - 시퀀스명.CURRVAL : '시퀀스'가 가지고 있는 현재값 변환
            - 시퀀스명.NEXTVAL : '시퀀스'의 다음값 변환
            ** 시퀀스 객체가 생성된 후 맨 처음 명령은 반드시 '시퀀스명.NEXTVAL'이어야 함
            ** 스퀀스명.NEXTVAL을 사용하여 생성된 값은 다시 재생성할 수 없음
            
            사용예) 테이블 LPROD의 LPROD - ID(에 사용할 시퀀스를 생성하시오.
                SELECT MAX_(LPROD_ID) FROM LPROD;
                
                CREATE SEQUENCE SEQ_LPROD
                 START WITH 10;       
                
                INSERT INTO LPROD
                    VALUES(SEQ_LPROD.NEXTVAL, 'P501', '농산물');
                    
                SELECT * FROM LPROD;

            사용예) 오늘이 2005년 4월 18일이라고 가정하고 CART_NO를 생성하시오.
                SELECT TO_CHAR(TO_DATE('2005/04/18'),'YYYYMMDD')||TRIM(TO_CHAR(TO_NUMBER(SUBSTR(MAX(CART_NO),9))+1,'00000'))
                  FROM CART
                 WHERE CART_NO LIKE '20050418%'
                 
            ** 시퀀스의 사용이 제한되는 경우 --INSERT문에서만 서브쿼리를 쓸 수있다.
                - SELECT, DELETE, UPDATE문에 사용되는 서브쿼리
                - VIEW를 대상으로한 QUERY
                - DISTINCT가 사용되는 SELECT문
                - GROUP BY, ORDER BY절이 사용되는 SELECT문
                - 집합연산(UNION, UNION ALL, INTERSECT, MINUS)에 사용되는 SELECT문
                - WHERE절
                
    (3) SYNONYM 객체
        - 동의어(별칭)을 의미
        - 오라클에서 사용되는 객체에 별도의 이름을 부여하여 참조 기능 제공
        - 주로 긴이름의 객체명을 사용하기 쉬운 객체명으로 대체 할 때 사용
        (사용형식)
            CREATE [OR REPLACE] SYNONYM 시노늄명 FOR 객체명
                - '객체명'에 별도의 이름인 '시노늄명'을 부여
                - 컬럼의 별칭과 테이블의 별칭과의 차이점
                    - '시노늄명'은 해당 테이블 스페이스 전체에서 사용
                    - '컬럼의 별칭과 테이블의 별칭'은 해당 쿼리에서만 사용 가능

            사용예) HR의 테이블 EMPLOYEES, DEPARTMENTS, JOB_HISTORY에 EMP,DEPT,JOBH별칭을 부여하시오.
            CREATE OR REPLACE SYNONYM EMP FOR HR.EMPLOYEES;
            CREATE OR REPLACE SYNONYM DEPT FOR HR.DEPARTMENTS;
            CREATE OR REPLACE SYNONYM JOBH FOR HR.JOB_HISTORY;
        
            SELECT * FROM DEPT;
            SELECT * FROM JOBH;
            
    (4) INDEX 객체
        - 데이터의 검색 효율성을 개선하기 위한 객체
        - WHERE 조건절에 사용되는 컬럼, SORT나 GROUP의 기준컬럼 등의 컬럼을 기준으로 INDEX를 구성하면 DBMS의 부하를 줄여 전체 성능 향상
        - 별도의 공간이 소요(INDEX FILE), 인덱스 파일의 유지보수에 많은 시스템 자원 필요, 데이터 수정 등에 많은 시간이 소요
        - 인덱스 종류
            - Unique Index : 중복 값을 허용하지 않는 인덱스
            - Non-Unique : 중복 값을 허용하는 인덱스로 Null값을 허용하나 하나만 허용 -- 기본값
            - Single Index : 인덱스 구성에 하나의 컬럼이 사용
            - Composite Index : 인덱스 구성에 복수개의 컬럼이 사용되며, where절에 사용시 모든 항목(인덱스 구성항목)의 참여가 효율성을 증대시킴
            - Normal Index : 기본 인덱스(트리구조 사용-모든 노드의 평균 검색횟수가 동일)로 ROWID와 컬럼 값으로 주소 산출
            - Function-Based Normal Index : 인덱스 구성 컬럼에 함수가 사용된 경우로 where 조건절 사용시 동일 함수 적용시 효율이 가장 우수
            - Bitmap Index : ROWID와 컬럼 값의 이진(binary)값의 조합으로 주소 산출, Cardinality가 적은 경우 효율적이며, 추가, 변경, 삭제가 많은 경우 비효율적
        (사용형식)
            CREATE [UNIQUE|BITMAP] INDEX 인덱스명
                ON 테이블명(컬럼명1[, 컬럼명2,...][ASC|DESC]);
                
            사용예) 회원테이블에서 주민번호조합으로 인덱스를 생성하시오.
                CREATE INDEX IDX_MEM_REGNO
                    ON MEMBER(MEM_REGNO1,MEM_REGNO2);
                
                CREATE INDEX IDX_MEM_NAME
                    ON MEMBER(MEM_NAME);
                    
                SELECT * FROM MEMBER
                 WHERE MEM_ADD1 LIKE '대전%';
            
            사용예) 회원테이블의 MEM_REGNO2의 주민등록번호 중 2~5번째 글자로 구성된 인덱스를 생성하시오.
            
            CREATE INDEX IDX_MEM_REGNO_SUBSTR
                ON MEMBER(SUBSTR(MEM_REGNO2,2,4));
            
            SELECT * FROM MEMBER
             WHERE SUBSTR(MEM_REGNO2,2,4)='4489';
            
            ** 인덱스의 재구성
                - 해당 테이블의 자료가 많이 삭제된 경우
                - 인덱스를 다른 테이블스페이스로 이동 시킨 후
                ALTER INDEX 인덱스명 REBUILD