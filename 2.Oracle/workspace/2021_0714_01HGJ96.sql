2021_0713_)이어서.
-- DB = 출력이 아닌 보관
    4) RPAD(c1, n[, c2]), LPAD(c1, n[, c2])
       - RPAD : 지정된 길이 n에 c1을 저장하고 남는  오른쪽 공간에 c2를 삽입한다.
       - LPAD : 지정된 길이 n에 c1을 저장하고 남는  왼쪽 공간에 c2를 삽입한다.
       - c2가 생략되면 공백을 채움
       - 패딩 = 공간을(공백으로) 채워주는~

사용예) SELECT LPAD('12345', 7,'*') AS COL1,
              RPAD('9876', 6) AS COL2
              FROM DUAL;
 -- COL1 = '**12345'    COL2 = '9876  '
 
       SELECT TO_CHAR(PROD_COST) AS COL1,
              LPAD(PROD_NAME,30) AS COL3
              LPAD(TO_CHAR(PROD_COST),10) AS COL2,
              LPAD(TO_CHAR(PROD_COST),10,'#') AS "COST"
         FROM PROD;
-- COL1 = 210000  COL2 = '    210000'  COL3 = ####210000
-- COL1 = 1150000 COL2 = '   1150000'  COL3 = ###1150000 
-- LPAD를 잘 이용하면 우측으로 정렬시킬수있음. 근데 잘 안씀


    5) RTRIM(c1[, c2]), LTRIM(c1[, c2])   -- 쓰더라도 이게 더 잘 쓰임. 거의 공백제거에 쓰인다..
         - RTRIM : 주어진 문자열 C1 내부에 C2 문자열을 오른쪽에서 찾아 삭제
         - LTRIM : 주어진 문자열 C1 내부에 C2 문자열을 왼쪽에서 찾아 삭제
         - c2가 생략되면 공백을 제거(단어 내부 공백 제거는 불가능)
         -- 무효 공백만 지움. 단어 내부의 공백은 유효 공백
    
    6) TRIM(c1)
         - 단어 왼쪽 또는 오른쪽에 발생된 공백을 모두 제거
         - 단어 내부 공백 제거는 불가능
         
SELECT MEM_NAME, MEM_HP,MEM_JOB,MEM_MILEAGE
  FROM MEMBER
 WHERE MEM_NAME = TRIM('     이혜나      ');
-- 찾음. 앞뒤 공백을 다 자름.
SELECT MEM_NAME, MEM_HP,MEM_JOB,MEM_MILEAGE
  FROM MEMBER
 WHERE MEM_NAME = TRIM('     이 혜 나      ');
-- 못찾음. 문자 사이사이에 공백이 있음.
SELECT MEM_NAME, MEM_HP,MEM_JOB,MEM_MILEAGE
  FROM MEMBER
 WHERE MEM_NAME = '이혜나';
-- 찾음.
SELECT MEM_NAME, MEM_HP,MEM_JOB,MEM_MILEAGE
  FROM MEMBER
 WHERE MEM_NAME = '이혜나    '; 
--문법적 오류 x '' 내부 공백은 문자열. 하지만 안나옴. '이혜나' 랑 '이혜나     ' 는 다르기 때문에. 
         
         
c 문자 n 숫자
    7) SUBSTR(c,n1[,n2])
         - 주어진 문자열 c에서 n1번째 부터 n2 갯수 만큼 글자를 추출하여 부분 문자열을 반환
         - 결과도 문자열임
         - n1, n2는 1부터 시작됨
         - n2가 생략되거나 문자의 수보다 큰 n2를 사용하면 n1이후 모든 문자열을 추출함
         - n1이 음수이면 오른쪽을 기준으로 처리됨
         
사용예) SELECT SUBSTR('대전시 중구 대흥동', 2,5),
              SUBSTR('대전시 중구 대흥동', 2),
              SUBSTR('대전시 중구 대흥동', 2,20),
              SUBSTR('대전시 중구 대흥동', -2,5),
              SUBSTR('대전시 중구 대흥동', -7,5)
         FROM DUAL;
       
사용예) 오늘이 2005년 4월 1일인 경우 CART_NO를 자동 생성하시오. -- 어렵게
          SELECT TO_CHAR(SYSDATE,'YYYYMMDD')||TRIM(TO_CHAR(TO_NUMBER(SUBSTR(MAX(CART_NO),9)) + 1,'00000'))
            FROM CART
           WHERE CART_NO LIKE '20050401%';
         -- TO_CHAR(SYSDATE,'YYYYMMDD')||TO_CHAR(TO_NUMBER(SUBSTR(MAX(CART_NO),9)) + 1,'00000')
         -- 공백이 발생함. 이걸 잘라내야함. TRIM을 뒤에 붙혀준다. 뒤에 공백이 발생한거임
         
       SELECT MAX(CART_NO) +1 --쉽게
               --문자 + 숫자 하면서 숫자로 바뀜.
         FROM CART
        WHERE CART_NO LIKE '20050401%';
         --게시판 글 부여할때.
         
         
    8) REPLACE(c1,c2[,c3])
           - 주어진 문자열 c1에 포함된 c2를 찾아 c3로 치환 시킴
           - c3가 생략되면 찾은 c2를 삭제시킴
           - 단어 내부의 공백 제거에 사용될 수 있음

사용예) SELECT REPLACE('대전광역시 중구 대흥동','전광역시','전시'), --전광역시를 전시로 바꿈
              REPLACE('대전광역시 중구 대흥동','광역'),   -- 광역을 지움.
              REPLACE('대전광역시 중구 대흥동',' '), -- ''와 ' '차이
              REPLACE('대전광역시 중구 대흥동','대') --  일치하는 모든 것을 지움!
         FROM DUAL;
         
         
         
    9) INSTR(c1, c2[, m[, n]])
        - 주어진 문자열 c1에서 c2문자열이 처음 나온 위치값을 반환
        - m은 검색 시작위치를 직접 지정할 때 사용
        - n은 c2문자열의 반복 횟수를 정하여 검색하는 경우 사용
        
사용예) SELECT INSTR('APPLE PERSIMON PEAR BEAR','E'), -- 처음에서 나오는 E의 번째 = 5
              INSTR('APPLE PERSIMON PEAR BEAR','P',5), -- 5번째(E)부터 시작해서 첫번째 p 위치 = 7
              INSTR('APPLE PERSIMON PEAR BEAR','P',5,2), -- 5번째(E)부터 시작해서 두번째 p 위치 = 16
              INSTR('APPLE PERSIMON PEAR BEAR','P',5,3) -- 5번째(E)부터 시작해서 세번째 p 위치 = 0 // 3번째 P가 없음.
          FROM DUAL;
        
         
    10)
         
         