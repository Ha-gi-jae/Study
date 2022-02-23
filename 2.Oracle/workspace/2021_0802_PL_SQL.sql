2021_0802
1. PL/SQL (Procedual Language SQL)
    - 표준 SQL의 기능을 확장한 SQL
    - 서버에 실행가능한 형태의 모듈화 된 서브프로그램
    - block 구조로 구성
    - 모듈화, 캡슐화
    - Anonymous Block, User Defined Function(Function), Stored Procedure(Procedure), Package, Trigger 등이 제공됨
                            --반환값이 있으면 Function, 없으면 Procedure
    (1) 익명블록(Anonymous Block) --이름이 없어 다시 불러 쓸 수 없다.
        - PL/SQL의 기본구조
        - 단순 스크립트에서 실행되는 블록
            (기술형식)
            DECLARE
              선언부(변수,상수,커서 선언); -- 일반변수 [V_..] 매개변수 [P_..]
            BEGIN
              실행부(비즈니스 로직 처리를 위한 sql문)
              [EXCEPTION
                  예외처리부
              ]
            END;
            
            사용예) 키보드로 10-110사이의 부서번호를 입력받아 해당부서직워중 가장 입사일이 빠른 사원 정보를 출력하시오.
                Alias는 사원번호, 사원명, 입사일, 직책코드이다.
                
                ACCEPT P_DID PROMPT '부서코드(10~110)'
                DECLARE
                  V_EID HR.EMPLOYEES.EMPLOYEE_ID%TYPE; --테이블명.컬럼명.TYPE 해당 테이블의 컬럼과 같은 타입을 선언해줌.(참조)
                  V_NAME HR.EMPLOYEES.EMP_NAME%TYPE;
                  V_HIRE HR.EMPLOYEES.HIRE_DATE%TYPE;
                  V_JOBID HR.EMPLOYEES.JOB_ID%TYPE;
                BEGIN
                  SELECT A.EMPLOYEE_ID, A.EMP_NAME, A.HIRE_DATE, A.JOB_ID -- SELECT - INTO - FROM - WHERE ... 이렇게 된다 PL/SQL에서는
                    INTO V_EID, V_NAME, V_HIRE, V_JOBID -- 가장 밖에 있는 SELECT문은 INTO를 써야하며, 자동으로 각 순서대로 할당 시킴.
                    FROM (SELECT EMPLOYEE_ID, EMP_NAME, HIRE_DATE, JOB_ID
                            FROM HR.EMPLOYEES
                          WHERE DEPARTMENT_ID = TO_NUMBER('&P_DID')
                          ORDER BY 3) A
                   WHERE ROWNUM = 1;
                
                   DBMS_OUTPUT.PUT_LINE('사원번호 : '||V_EID); --DBMS에서 제공하는 OUTPUT.PUT_LINE(콘솔출력).(줄바꿈) 을 쓰겠다.
                   DBMS_OUTPUT.PUT_LINE('사원명 : '||V_NAME);
                   DBMS_OUTPUT.PUT_LINE('입사일 : '||V_HIRE);
                   DBMS_OUTPUT.PUT_LINE('직책코드 : '||V_JOBID);
                   
                   EXCEPTION WHEN OTHERS THEN
                     DBMS_OUTPUT.PUT_LINE('예외발생 : ')||SQLERRM); --SQLERRM : SQL 에러 메세지
                END;
                
            1) 변수와 상수
                - 실행부에서 사용할 변수와 상수
                - SCLAR 변수 : 하나의 데이터를 저장하는 변수
                    - REFERENCE 변수 : 임의의 테이블에 존재하는 컬럼의 타입과 크기를 참조하는 변수
                    - COMPOSITE 변수 : PL/SQL에서 사용하는 배열 변수(RECORD TYPE, TABLE TYPE)
                    - BIND 변수 : 파라미터로 넘겨지는 IN, OUT에서 사용되는 변수, 리턴값을 전달하기 위해 사용되는 변수
                    --매겨변수로 값이 넘겨지는 타입 IN(밖에서 안으로 넘겨받음), OUT(안에서 바깥으로 내보냄), INOUT(밖에서 안으로 넘겨받아 결과값을 밖으로 내보냄. 쓰지않는 것을 권고.)
                (사용형식)
                변수명[CONSTANT] 데이터타입[(크기)]|테이블명.컬럼명%TYPE|테이블명%ROWTYPE[:=초기값]; -- 콜론하고 띄우지않음. 숫자인 경우 0으로 초기화해야함. 그렇지 않으면 런타임오류 발생
                    - 'CONSTANT' : 상수 선언
                    - '테이블명.컬럼명%TYPE|테이블명%ROWTYPE' : 참조타입
                    - 숫자형 변수인 경우 반드시 초기화 해야함
                    - 데이터타입 : SQL에서 사용하는 데이터 타입
                        - BINARY_INTEGER, PLS_INTEHER : -2147483648 ~ 2147483647 사이의 정수 취급
                        - BOOLEAN : true, false, null을 취급하는 논리형 변수
                        
            2) 분기명령
                - 프로그램의 실행 순서를 변경하는 명령
                - IF, CASE WHEN 등이 제공 

                (1) IF 문
                    - 개발언어의 IF문과 동일한 기능 제공
                    (사용형식 - 1)
                    IF 조건 THEN --조건이 괄호로 안 묶여 있어도 된다.
                       명령1;
                    [ELSE
                       명령2;]
                    END IF;
                    
                    (사용형식 - 2) -- 병렬 IF
                    IF 조건 THEN
                       명령1;
                    ELSIF 조건 THEN --ELSIF ELSE에 E 가 없어야해!.
                       명령2;
                         :
                    ELSE 명령n;
                    END IF;
                    
                    (사용형식 - 3)
                    IF 조건 THEN
                       명령1;
                       IF 조건 THEN
                          명령2;
                       ELSE
                          명령3;
                       END IF;  -- 마감 쳐야해! 끝을 내야 해!
                    ELSE
                       명령n;
                    END IF; --들여쓰기 내쓰기 안하면 큰일나...^_^!!
                    
                사용예) 임의의 수를 입력 받아 짝수인지 홀수인지 판별하시오
                    ACCEPT P_NUM PROMPT '수 입력 : '
                    DECLARE
                      V_NUM NUMBER := TO_NUMBER('&P_NUM');
                      V_RES VARCHAR2(100);
                    BEGIN
                      IF MOD(V_NUM,2)=0 THEN
                        V_RES:=TO_CHAR(V_NUM)||'은 짝수 입니다.';
                      ELSE
                        V_RES:=TO_CHAR(V_NUM)||'은 홀수 입니다.';
                      END IF;
                    
                      DBMS_OUTPUT.PUT_LINE(V_RES);
                    END;
                
                사용예) 회원테이블에서 회원들의 마일리지를 조회하여 그 값이 5000 이상이면 비고란에 'VIP 회원',
                       3000 이상이면 '정회원', 그 이하이면 '준회원'을 회원번호, 회원명, 마일리지와 함께 출력하시오.
                       
                       DECLARE
                         V_MID MEMBER.MEM_ID%TYPE;
                         V_NAME MEMBER.MEM_NAME%TYPE;
                         V_MILE MEMBER.MEM_MILEAGE%TYPE;
                         V_RES VARCHAR2(100);
                         
                         CURSOR CUR_MEM01 IS
                           SELECT MEM_ID, MEM_NAME, MEM_MILEAGE
                             FROM MEMBER;
                       BEGIN
                         OPEN CUR_MEM01;
                         LOOP
                           FETCH CUR_MEM01 INTO V_MID, V_NAME, V_MILE;
                           EXIT WHEN CUR_MEM01%NOTFOUND;
                           IF V_MILE >= 5000 THEN
                             V_RES:= V_MID||', '||V_NAME||', '||V_MILE||', '||'VIP 회원';
                           ELSIF V_MILE >= 3000 THEN
                             V_RES:= V_MID||', '||V_NAME||', '||V_MILE||', '||'정회원';
                           ELSE
                             V_RES:= V_MID||', '||V_NAME||', '||V_MILE||', '||'준회원';
                           END IF;
                           --DBMS_OUTPUT.PUT_LINE('회원수 : '||CUR_MEM01%ROWCOUNT||'명');
                           DBMS_OUTPUT.PUT_LINE(V_RES);
                           DBMS_OUTPUT.PUT_LINE('------------------------');
                         END LOOP;
                         CLOSE CUR_MEM01;
                       END;
                
                사용예) 사용자로부터 수도 사용량(톤 단위)을 입력 받아 수도요금을 계산하여 출력하시오.
                    사용량(톤)      수도단가
                      1~10           275
                     11~20           305
                     21~30           350
                     31~40           415
                    41톤 이상         500원
                    
                    하수도 사용요금 : 사용량 * 120원
                    
                    ex) 27톤을 사용한 경우
                    처음 10톤  : 275 * 10 = 2,750
                    11-20     : 305 * 10 = 3,050
                    나머지 7톤 : 350 * 7  = 2,450
                    ---------------------------------
                    하수도 사용요금 : 120 * 27 = 3,240
                    ---------------------------------
                                               11,490
                    ACCEPT P_NUM PROMPT '수도 사용량 입력 : '
                    DECLARE
                      V_NUM NUMBER := TO_NUMBER('&P_NUM');
                      V_RES VARCHAR2(100);
                    BEGIN
                      IF (V_NUM <= 10) THEN
                        V_RES:= V_NUM * 275 + (V_NUM * 120);
                      ELSIF (V_NUM <= 20) THEN
                        V_RES:= (275 * 10) + (V_NUM - 10) * 305 + (V_NUM * 120);
                      ELSIF (V_NUM <= 30) THEN
                        V_RES:= (275 * 10) + (305 * 10) + (V_NUM - 20) * 350 + (V_NUM * 120);
                      ELSIF (V_NUM <= 40) THEN
                        V_RES:= (275 * 10) + (305 * 10) + (350 * 10) + (V_NUM - 30) * 415 + (V_NUM * 120);
                      ELSIF (V_NUM >= 41) THEN
                        V_RES:= (275 * 10) + (305 * 10) + (350 * 10) + (415 * 10) + (V_NUM - 40) * 500 + (V_NUM * 120);
                      END IF;
                      DBMS_OUTPUT.PUT_LINE('사용량 : '||V_NUM||'톤');
                    DBMS_OUTPUT.PUT_LINE('수도요금 : '||TO_CHAR(V_RES,'99,999'));
                    END;
                      
                사용예) 사원테이블에서 사원들의 평균급여보다 더 많은 급여를 받는 사원의 사원번호, 사원명, 급여, 부서명을 출력하시오.
                    