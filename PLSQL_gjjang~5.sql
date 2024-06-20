/*
    * PL /SQL
    PROCEDURAL LANGUAGE EXTENSION TO SQL
    
    오라클 자체에 내장되어 있는 절차적 언어
    SQL 문장내에서 변수의 정의, 조건처리 (IF), 반복처리(LOOP, FOR, WHILE)등을 지원하여 SQL 의 단점을 보완함
    다수의 SQL문을 한번 실행 가능(BLOCK구조)
    
    * 구조
    - [선언부 ( DECLARE SECTION)] : DECLARE로 시작, 변수나 상수를 선언 및 초기화 하는 부분
    - 실행부 ( EXECUTABLE SECTION) : BEGIN로 시작 , SQL문 또는 제어문(조건문, 반복문) 등의 로직을 기술하는 부분
    - [예외처리부 ( EXCEPTION SECTION)] :  EXCEPTION 으로 시작, 예외 발생시 해결하기 위한 구문 미리 기술해 두는 부분
    
*/

SET SERVEROUTPUT ON;

BEGIN
--  SYSOUT
    DBMS_OUTPUT.PUT_LINE('HELLO ORACLE');
END;
/


/*
    1. DECLARE 선언부
        변수, 상수 선언하는 공간( 선언과 동시 초기화도 가능)
        일반타입변수, 레퍼런스타입의 변수, ROW 타입의 변수
        
        1.1 일반타입 변수 선언 및 초기화
            [표현식]
            변수명 자료형 [ := 값]
            
*/

-- 화면에 출력하기
-- 이거 안키면 출력안되고 껏다키면 다시 해줘야함


DECLARE 
    EID NUMBER;
    ENAME VARCHAR2(20);
    PI CONSTANT NUMBER := 3.1415;
BEGIN
    EID := 600;
    ENAME := '임수정';
    
    DBMS_OUTPUT.PUT_LINE('EID : ' || EID );
    DBMS_OUTPUT.PUT_LINE('ENAME  : ' || ENAME );
    DBMS_OUTPUT.PUT_LINE('PI : ' || PI );
END;
/


    
-- 사용자로부터 입력받아서 출력
DECLARE
    EID NUMBER;
    ENAME VARCHAR2(20);
    PI CONSTANT NUMBER := 3.14;
BEGIN 
    EID := &번호;
    ENAME := '&이름';
    
    DBMS_OUTPUT.PUT_LINE('EID : ' || EID);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || ENAME);
    DBMS_OUTPUT.PUT_LINE('PI : ' || PI);
END;
/
    
------------------------------------------------------------------------------------------------------------------------------    
 /*
    1.2 레퍼런스 타입 변수 선언 및 초기화
        :  어떤 테이블의 어떤 컬럼의 데이터 타입을 참조하여 그 타입으로 지정
        
        [표현식]
        변수명 테이블명.컬럼명%TYPE;
 
 
 */

DECLARE
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    SAL EMPLOYEE.SALARY%TYPE;
BEGIN
    EID := '300';
    ENAME := '유재석';
    SAL := 4000000;
    
    DBMS_OUTPUT.PUT_LINE('EID :' || EID);
    DBMS_OUTPUT.PUT_LINE('ENAME :' || ENAME);
    DBMS_OUTPUT.PUT_LINE('SAL :' || SAL);
END;
/
 
DECLARE
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    SAL EMPLOYEE.SALARY%TYPE;
BEGIN
    -- 사번이 200번인 사원의 사번, 이름, 급여 조회하여 각 변수에 대입
    SELECT EMP_ID, EMP_NAME, SALARY
        INTO EID , ENAME, SAL
        FROM EMPLOYEE
    WHERE EMP_ID = &사번;

    DBMS_OUTPUT.PUT_LINE('EID :' || EID);
    DBMS_OUTPUT.PUT_LINE('ENAME :' || ENAME);
    DBMS_OUTPUT.PUT_LINE('SAL :' || SAL);
END;
/

----------------------------------------------- 실습 문제-----------------------------------------------------
/*
    레퍼런스타입 변수로 EID, ENAME, JCODE , SAL , DTITLE 를 선언하고
    각 자료형 EMPLOYEE(EMP_ID , EMP_NAME, JOB_CODE, SALARY), DEPARTMENT (DEPT_TITLE)들을 참조하도록
    
    사용자가 입력한 사번의 사원의 사번, 사원명, 직급코드, 급여, 부서명 조회 한 후 각 변수에 담아 출력



*/
DECLARE
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    JCODE EMPLOYEE.JOB_CODE%TYPE;
    SAL EMPLOYEE.SALARY%TYPE;
    DTITLE DEPARTMENT.DEPT_TITLE%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME, SALARY, DEPT_TITLE,JOB_CODE
        INTO EID , ENAME, SAL, DTITLE, JCODE
        FROM EMPLOYEE, DEPARTMENT
    WHERE DEPT_CODE = DEPT_ID
    AND  EMP_ID = &사번;
        

    DBMS_OUTPUT.PUT_LINE('EID :' || EID);
    DBMS_OUTPUT.PUT_LINE('ENAME :' || ENAME);
    DBMS_OUTPUT.PUT_LINE('JCODE :' || JCODE);
     DBMS_OUTPUT.PUT_LINE('SAL :' || SAL);
      DBMS_OUTPUT.PUT_LINE('DTITLE :' || DTITLE);
END;
/
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    