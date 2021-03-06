2021_0707_02) Query문
 -자료 검색(조회) 명령
 -SELECT 문
 -가장 많이 사용되는 SQL문
 (사용형식)
 SELECT  [DISTINCT]컬럼명 [AS]["][별칭]["][,]
                :
         컬럼명 [AS]["][별칭]
     FROM 테이블명 [별칭]
 [WHERE 조건]
 [GROUP BY 컬럼명[,컬럼명,....]]
[HAVING 조건]
 [ORDER BY 컬럼명|컬럼인덱스[ASC|DESC]
         [,컬럼명|컬럼인덱스[ASC|DESC],...]]
         
         
-- SELECT 절과 FROM 절은 절대 생략 될 수 없다.
-- TABLE을 선언 할 때 FROM
-- 조건을 걸 때 WHERE
-- ORDER BY 정렬! 크기순으로 나열하는것. 
-- 필터 없애기.
-- DISTINCT 중복된것을 빼라.
-- ["][별칭]["] 별칭에 특수문자, 명령어, 예약어 를 사용하는경우 쌍따옴표로 묶어줘야함. 
-- "구매수량"" ""구매합계" 이런식으로 공백 넣기도 가능.
--[AS] 될수있으면 써라. ["]도 특수한 경우만 써라. [별칭] 써라. 오류 많이나는 이유가 끝에 콤마 안찍어서임.
-- 테이블을 한개 사용할 때에는 별칭을 쓰지않는다.
-- WHERE GROUP HAVING 절에서 쓸 수 없다.
--FROM 1등 : 사용할 테이블 기술
--WHERE 2등 
--SELECT 3등
-- 위 순서대로 실행.
-- DUAL