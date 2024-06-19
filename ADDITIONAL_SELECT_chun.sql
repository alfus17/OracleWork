/*
    ADDITIONAL SELECT - 함수 문제 풀이


*/

-- 1. 영어영문학과 ( 학과코드 002 ) 학생들의 학번과 이름, 입학 년도를 입학 년도가 빠른 순으로 표시하는 SQL문장을 작성하시오
SELECT STUDENT_NO 학번, STUDENT_NAME 이름, ENTRANCE_DATE 입학년도
FROM 
    TB_STUDENT S ,TB_DEPARTMENT D
JOIN  
    TB_DEPARTMENT  USING( DEPARTMENT_NO)
WHERE 
    S.DEPARTMENT_NO = '002'
ORDER BY ENTRANCE_DATE ASC;

-- 2. 춘 기술대학교의 교수 중 이름이 세 글자가 아닌 교수가 한 명 있다고 한다. 그 교수의 이름과 주민번호를 화면에 출력
-- SQL에도 LENGTH는 존재한다.
SELECT PROFESSOR_NAME ,PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE LENGTH(PROFESSOR_NAME)  != 3;

-- 3.  춘 기술대학교의 남자 교수들의 이름과 나이를 출력하는 SQL문을 작성
/*
    단 이때 나이가 적은 사람에서 많으 사람 수서로 출력
    단 , 교수 중 2000년 이후의 출생자는 없으며 출력 해더는 "교수이름",  "나이" 로 한다. 나이는  "만"으로 계산
*/








































    