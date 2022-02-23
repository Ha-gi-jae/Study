2021_0712_01)데이터 타입
    - 오라클에서 사용되는 데이터타입은 문자열, 숫자, 날짜, 2진자료형(기타)이 제공

    1. 문자열 자료
        - 오라클의 문자열은 ' '로 묶어 표현 -- 단어는 구분되지 않지만 문자열 만큼은 대소문자 구분되어진다.
        - 고정길이(CHAR)와 가변길이(VARCHAR, VARCHAR2, LONG, NVARCHAR2, CLOB) 타입으로 구분 -- JAVA의 LONG과 헷갈리지말아라. 오라클의 LONG은 문자열.
                                                        -- N(UTF-8, UTF-16으로 저장할때 사용) -- LARGE OBJECT -- VARCHAR2 = 4000 까지 가능.
                                                        -- 왜 크게 하지 않고 작게 하느냐? 4000으로 할경우 4번 입력해야하는데 80은 2번만 입력하면된다.
        - 영문과 숫자, 특수문자는 1BYTE로 한글 한글자는 3BYTE로 표현
     1)CHAR
         - 정의된 크기의 기억공간에 자료를 저장하고 남는 공간은 공백으로 채움
         - 데이터는 MSB(왼쪽)에서 LSB(오른쪽)쪽으로 저장
         -- MSB 부호 // 가장 의미있는 비트이다. 
      (사용형식)
      컬럼명 CHAR(크기 [BYTE|CHAR]);
        - 최대 2000BYTE 까지 저장가능 --영문자일때 BYTE = CHAR 한글일때도 2000BYTE 초과할 수 없음. 666 글자 가능.
        -- 고정된 자료에 사용해야함. 수정 가능성이 있는 자료는 수정될 때 마다 BYTE를 바꿔줘야 할 수 있기 때문에.
        - 'BYTE|CHAR' : 생략하면 BYTE로 취급되며, 'CHAR'이 사용되면 '크기'는 글자수를 나타냄. 다만, CHAR을 사용해도 2000BYTE를 초과할 수 없음
        - 길이가 고정된 컬럼이나 기본키 컬럼의 데이터 타입으로 주로 사용
사용예)
      CREATE TABLE T_CHAR(
        COL1 CHAR(20),
        COL2 CHAR(20 CHAR),
        COL3 CHAR(20 BYTE));
        
      INSERT INTO T_CHAR(COL1,COL2,COL3)
        VALUES('무궁화 꽃이 피었습니다','무궁화 꽃이 피었습니다','무궁화 꽃이 피었습니다');
        -- ORA-12899: value too large for column "HGJ96"."T_CHAR"."COL1" (actual: 32, maximum: 20)
        -- 현재 COL1,2,3의 최대 크기는 20인데 너가 32BYTE를 사용했다. 값이 저장 범위보다 크니 값을 줄이거나, 크기를 늘려라.
      INSERT INTO T_CHAR(COL1,COL2,COL3)
        VALUES('무궁화 꽃이 피','무궁화 꽃이 피','무궁화');  
        
      SELECT * FROM T_CHAR;  -- 확인
      
      SELECT LENGTHB(COL1),LENGTHB(COL2),LENGTHB(COL3)
        FROM T_CHAR;
      -- B 는 BYTE 약자 LENGTH 글자수 B니까 바이트 수를 확인.
      -- 고정바이트니까 20 이 나와야하는데 COL2 의 경우 32가 나옴. 왜? 
      -- 무 1 궁 2 화 3 꽃 4 이 5 피 6 띄어쓰기 7 띄어쓰기 8 => 12CHAR 이 남음. => 12BYTE + 20 임.
      -- 총 글자 수(20) - 실제 사용된 글자 수(8) = 남은 글자 수(12CHAR) = 12BYTE
      
      INSERT INTO T_CHAR(COL1,COL2,COL3)
        VALUES('무궁화 꽃이 피','무궁화 꽃이 피었습니다','무궁화');  
      -- 20 32 20
      -- 20 40 20 이 저장. 무궁화꽃이피었습니다= [3 * 10 + 띄어쓰기 2] + [20 -무궁화 꽃이 피었습니다(12)] => (32 + 8)

     2)VARCHAR2
        - 가변길이 자료저장에 사용
    (사용형식)
    컬럼명 VARCHAR2(크기[BYTE|CHAR])
    - 최대 4000BYTE까지 저장 가능
    - 사용자가 정의한 데이터 만큼 사용하고 남는 공간은 SYSTEM에 반환
    
사용예)
      CREATE TABLE T_VARCHAR2(
         COL1 VARCHAR2(500),
         COL2 VARCHAR2(50 CHAR),
         COL3 VARCHAR2(50 BYTE));
        
      INSERT INTO T_VARCHAR2
         VALUES('IL POSTONO','필립 느와레','마시모 트로이시');
      SELECT * FROM T_VARCHAR2;
      SELECT LENGTHB(COL1),LENGTHB(COL2),LENGTHB(COL3)
         FROM T_VARCHAR2;

-- 10 16 22      
      
      INSERT INTO T_VARCHAR2
         VALUES('PERSIMON BANNA APPLE','PERSIMON BANNA','PERSIMO시');
      SELECT * FROM T_VARCHAR2;
      SELECT LENGTHB(COL1),LENGTHB(COL2),LENGTHB(COL3)
         FROM T_VARCHAR2;
      
-- 20 14 10 



    3)VARCHAR, NVARCHAR, NVARCHAR2
        기본적으로 NVARCHAR2와 저장 방법은 동일 함
        NVARCHAR, NVARCHAR는 UTF-8(가변길이), UTF-16(고정길이)방식의 코드로 변환하여 자료 저장(국제표준코드 적용)
   
    4)LONG
       가변길이 자료를 저장
    (사용형식)
    컬럼명 LONG --[길이]를 지정하지 않음.
    - 최대 2GB까지 저장 가능 -- 2^31 byte [LENGTHB, 치환, SUBSTR 같은게 상당히 제한 되어 있음]
    - 한 테이블에 하나의 컬럼만 사용가능(제약사항)
    - CLOB로 대체됨
사용예)
        CREATE TABLE T_LONG(
            COL1 VARCHAR2(100),
            COL2 LONG,
            COL3 CHAR(100));

        INSERT INTO T_LONG
           VALUES('PERSIMON BANNA APPLE','PERSIMON BANNA','PERSIMO');

        SELECT COL1,COL2,TRIM(COL3) FROM T_LONG;
        
        SELECT LENGTHB(COL1), LENGTHB(TRIM(COL2,1,3)), LENGTHB(COL3) -- LENGTHB, SUBSTR 실행이 
            FROM T_LONG;  
        -- LENGTHB를 쓰려면 CLOB
        
        
    5)CLOB(Char Large OBject)
       가변길이 자료를 저장
    (사용형식)
    컬럼명 CLOB
       - 최대 4GB까지 저장 가능
       - 여러 컬럼을 하나의 테이블에 선언 가능
       - 일부 기능은 DBMS_LOB API의 지원을 받아야 사용 가능(LENGTH, SUBSTR 등)
       
사용예)
        CREATE TABLE T_CLOB(
            COL1 CLOB,
            COL2 CLOB,
            COL3 VARCHAR2(4000),
            COL4 LONG);
            
        INSERT INTO T_CLOB(COL1,COL2,COL4)
            VALUES('대전시 중구 대흥동 영민빌딩','대전시 중구 대흥동 영민빌딩','대전시 중구 대흥동 영민빌딩');
         
         SELECT * FROM T_CLOB; 

-- 길이 구하는 법
          
         SELECT DBMS_LOB.GETLENGTH(COL1),
                SUBSTR(COL1,5,6),
                DBMS_LOB.SUBSTR(COL1,5,6)
            FROM T_CLOB;
--오류나옴.  DBMS_LOB.GETLENGTHB(COL2) LENGTH는 지원이 되지만 LENGTHB는 X           
-- 오라클 이랑 자바 SUBSTR 헷갈리니 차이점 잘 알고있을 것.
--기존에는 SUBSTR을 쓰면 컬럼명,시작위치,글자수 지만, LOB.SUBSTR을 쓰면 컬럼명,글자수,시작위치 임

--JAVJA ==> BYTE SHORT INT LONG FLOAT DOUBLE + CHAR  
-- CHAR = > 부호 없는 정수로 변환 'a' + 10 = 107
-- byte, short, char 를 수식을 쓸 때 자동으로 int로 바뀜 (오토캐스팅)
-- 수식 할 때 기본 4byte를 넘어야함. 
            
      2. 숫자 자료      
        - NUMBER 타입이 제공
 (사용형식)
    컬럼명 NUMBER[(정밀도|*|[, 스케일])] -- NUMBER만 써도 된다. 
        저장범위 : 1.0 x 10^-130 ~ 9.999...9 x 10^125
        정밀도 : 전체자리수(1 ~ 30)
        스케일(양수) : 소숫점 이하의 자리수
        스케일(음수) : 정수부분의 자리수
        20 BYTE로 표현
        
       EX)NUMBER, NUMBER(10), NUMBER(10,2), NUMBER(*,2)...
       -----------------------------------------------------------
        입력값          선언             기억되는 값
       -----------------------------------------------------------
       123456.6789    NUMBER            123456.6789               -- 사용자가 요구한 그대로 저장.
       123456.6789    NUMBER(10)        123457                    -- 10 하면 소숫점을 없애라. 소숫점 첫째자리 반올림해서 정수화.
       123456.6789    NUMBER(7,2)       오류                       --         (7,2) 7은 전체 자리수. 정수가 6자리니까 최소 6이여야함.    
       123456.6789    NUMBER(*,2)       123456.68                 -- 소숫점은 내가 지정하는데 * 값은 시스템 너가 알아서 해
       123456.6789    NUMBER(10,-2)     123500                    -- -2면 5에서 반올림.. 1의자리가아닌 10의자리에서 반올림.
       -----------------------------------------------------------
            
        --1234.50002
               5부터 1,2,3,4,5 5번이 INDEX 값 스케일 + 1번째에서 반올림         
        --1234.57632 
        NUMBER(7,2) 2번째 짜리까지 나타냄. 1234.57 => 3번째에서 반올림 해서 1234.58이 된다.
        --1234.54321
        -4 -3 -2 -1 /소숫점을 기준/  1 2 3 4 5
        NUMBER (7,-1) 이면 1230 
        
        
        CREATE TABLE T_NUMBER(
            COL1 NUMBER,
            COL2 NUMBER(10),
            COL3 NUMBER(7,2),
            COL4 NUMBER(*,2),
            COL5 NUMBER(10,-2));
            
         INSERT INTO T_NUMBER VALUES(123456.6789, 123456.6789, 123456.6789, 123456.6789, 123456.6789);
        -- 오류
        INSERT INTO T_NUMBER(COL1) VALUES(123456.6789);
        -- 123456.6789
        INSERT INTO T_NUMBER(COL2) VALUES(123456.6789);
        -- 소수 첫째자리에서 반올림이 일어남.
        -- 123457 이 나옴.
        INSERT INTO T_NUMBER(COL3) VALUES(12345.6789);
        -- 8이상이 되어야한다 (7,2) 정수부분이 5개 
        -- 12345.68 이 나옴. 정수부분을 하나 없앤거임. 전체 부분에서 정수가 5개면 된다.
        INSERT INTO T_NUMBER(COL4) VALUES(12345.6789);
        -- 12345.68
        INSERT INTO T_NUMBER(COL4) VALUES(1234567.6789);
        -- 1234567.68
        INSERT INTO T_NUMBER(COL5) VALUES(123456.6789);
        -- 123500.
        
          SELECT * FROM T_NUMBER;
          
    **스케일>정밀도 
        스케일 : 소숫점이하의 데이터 수
        스케일 - 정밀도 : 소숫점이하에 존재해야할 0의 갯수
        정밀도 : 소숫점이하에 0이아닌 자료수  (실제 유효한 수)
        
        
       -----------------------------------------------------------
        입력값          선언             기억되는 값
       -----------------------------------------------------------
       1.234         NUMBER(4,5)        오류(정수부분에 0이 아닌 값 존재) -- 정밀도 4 스케일 5 유효숫자에 0이 아닌 값이 들어옴.
       0.23          NUMBER(3,5)        오류(0.00으로 시작)             -- 0.다음 0이 2개 더 나와야함.
       0.0023        NUMBER(3,5)        오류(유효숫자가 부족)            --
       0.0023        NUMBER(2,4)        0.0023
       0.012345      NUMBER(3,4)        0.0123
       0.012356      NUMBER(3,4)        0.0124
       -----------------------------------------------------------
       
       