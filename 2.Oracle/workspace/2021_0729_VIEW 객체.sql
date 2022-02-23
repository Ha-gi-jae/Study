2021_0729
1. VIEW 객체
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
         
        **생성된 뷰 'VIEW_MEM_MILEAGE'에서 회원번호 'e001'회원의 마일리지를 500으로 조정하시오.
            UPDATE VIEW_MEM_MILEAGE
               SET 마일리지 = 500        --컬럼명이 '마일리지' 임.
             WHERE 회원번호 = 'e001';
            -- 뷰 테이블 조건이 마일리지 3000이상인데 'e001' 회원의 마일리지를 500으로 변경했기 때문에 뷰에서 제외된다. + 테이블에서도 500으로 변경된다.
            
            SELECT MEM_ID,MEM_NAME,MEM_MILEAGE
              FROM MEMBER
             WHERE MEM_ID = 'e001';
             
        **회원테이블에서 회원번호 'g001'회원의 마일리지를 800에서 15000으로 변경하시오.
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
         
        WITH CHECK OPTION;
        
        SELECT * FROM VIEW_MEM_MILEAGE;
        
    ** 뷰(VIEW_MEM_MILEAGE)에서 이혜나 회원('e001')의 마일리지를 1500로 변경
        UPDATE VIEW_MEM_MILEAGE
           SET 마일리지 = 1500
         WHERE 회원번호 = 'e001';
         -- 변경 하려는 값이 조건에 위배되기때문에 실행 불가.
    
    ** 회원테이블(MEMBER)에서 이혜나 회원('e001')의 마일리지를 1500로 변경
        UPDATE MEMBER
           SET MEM_MILEAGE = 1500
         WHERE MEM_ID = 'e001';
         --원본 테이블은 제약이 없다. 그러므로 가능하다.
         