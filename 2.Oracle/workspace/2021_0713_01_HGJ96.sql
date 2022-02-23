2021_0713_01)
    3. 날짜 자료
        - date, timestamp 타입제공
        - 덧셈과 뺄셈의 대상
      1)date
          기본 날짜형
      (사용형식)
        컬럼명 DATE
        - 년 월 일 시 분 초 정보를 저장관리
        - 날짜형 자료의 뺄셈 : 두날짜사이의 일수 반환
        - 날짜형 + 정수 : '날짜'에서 '정수'만큼 경과된 후의 날짜 반환
        - 날짜형 - 정수 : '날짜'에서 '정수'만큼 과거의 날짜 반환
        
      1)timestamp
          시간대 정보와 정교한 시간(10억분의 1초) 제공
      (사용형식)
        컬럼명 timestamp; -- 시간대 정보 없는 날짜 정보
        컬럼명 timestamp with time zone; -- 시간대 정보(도시명/대륙명)와 날짜 정보
        컬럼명 timestamp with local time zone; -- 서버가 설치된 지역의 시간대 정보(도시명/대륙명)와 날짜 정보
        -- timestamp도 계산 가능 ex)시차.
        
        
사용예) CREATE TABLE T_DATE(
            COL1 DATE,
            COL2 DATE,
            COL3 TIMESTAMP,
            COL4 TIMESTAMP WITH TIME ZONE,
            COL5 TIMESTAMP WITH LOCAL TIME ZONE);
            
            INSERT INTO T_DATE VALUES(SYSDATE, TO_DATE('20201015')+30,SYSDATE,SYSDATE,SYSDATE);
            
                SELECT * FROM T_DATE;
                
            SELECT TO_CHAR(COL1,'YYYY-MM-DD PM HH24:MI:SS'),
                   TRUNC(COL1-COL2)
               FROM T_DATE;
    
    
    4.기타 자료
       - 2진 자료를 저장
       - RAW, LONG RAW, BLOB, BFILE
                -- 4기가 안에 // 밖에
 
      1)BFILE
          2진 자료 저장
          원본자료를 데이터베이스 외부에 저장하고 데이터베이스에는 경로정보만 보관
          4GB 까지 저장
      (사용형식)
         컬럼명 BFILE;
            - 오라클에서는 원본자료(2진자료)에 대하여 해석하거나 변환하지 않음
            - 2진자료 저장을 위해 DIRECTORY 객체가 필요 
            -- 파일명이 한글이면 DIRECTORY가 못읽음
            
사용예)
        CREATE TABLE T_BFILE(
            COL1 BFILE);
        
        
      1. 디렉토리 객체 생성
         CREATE DIRECTORY 디렉토리별칭 AS '절대경로명';
         
         CREATE DIRECTORY TEMP_DIR AS 'D:\A_TeachingMaterial\2.Oracle';
            
      2. 이미지 자료 저장
         INSERT INTO 테이블명
              VALUES(BFILENAME('디렉토리 별칭', '파일명'));
              
         INSERT INTO T_BFILE
              VALUES(BFILENAME('TEMP_DIR', 'SAMPLE.JPG'));
            
            
         SELECT * FROM T_BFILE;   
            
      2) BLOB
           2진 자료저장
           4GB 까지 저장 가능
           원본자료를 데이터베이스 내부에 저장
      (사용형식)
         컬럼명 BLOB;
           
           
       ** BLOB 사용순서
            (1)테이블 생성
            (2)디렉토리객체 생성
            (3)익명블록 생성
            
사용예) 
       a)테이블 생성
        CREATE TABLE T_BLOB(
            COL1 BLOB);
       
       b)디렉토리 생성
        TEMP_DIR 사용
        
       C)익명블록 생성
       
        DECLARE
            L_DIR VARCHAR2(20) := 'TEMP_DIR'; --디렉토리명은 20byte 파일명은 30byte 까지. 시스템에서 제공해주는 길이.
            L_FILE VARCHAR2(30) := 'SAMPLE.JPG';
            L_BFILE BFILE;
            L_BLOB BLOB;
         BEGIN
            INSERT INTO T_BLOB(COL1) VALUES(EMPTY_BLOB())
                RETURN COL1 INTO L_BLOB;
            L_BFILE:=BFILENAME(L_DIR, L_FILE);
            DBMS_LOB.FILEOPEN(L_BFILE, DBMS_LOB.FILE_READONLY);
            DBMS_LOB.LOADFROMFILE(L_BLOB, L_BFILE, DBMS_LOB.GETLENGTH(L_BFILE));
            DBMS_LOB.FILECLOSE(L_BFILE);
            
            COMMIT;
         END;   
            
         SELECT * FROM T_BLOB;
         
            
            
            
          
               
               