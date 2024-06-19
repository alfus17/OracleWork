/*
    BASIC SELECT

*/

-- 1. 춘 기술 대학교의 학과 이름과 계열을 표시하시오.  출력헤더는 "학과 명", "계열" 로 표시

SELECT DEPARTMENT_NAME AS "학과 명" , CATEGORY AS "계열"
FROM TB_DEPARTMENT;

-- 2.  학과별 정원

SELECT DEPARTMENT_NAME || ' 의 정원은 ' || CAPACITY || '명 입니다' AS "학과별 정원"
FROM TB_DEPARTMENT;

-- 4. 입학정원이 20명 이상 30명 이하인 학과들의 학과 이름과 계열을 출력하시오.

SELECT DEPARTMENT_NAME , CATEGORY
FROM  TB_DEPARTMENT
WHERE CAPACITY  BETWEEN 20 AND 30;


-- 5. 춘 기술대학교는 총장을 제외하고 모든 교수들이 소속 학과를 가지고 있다.

SELECT PROFESSOR_NAME
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;

-- 6. 혹시 전산상의 착오로 학과가 지정되어 있지 않은 학생이 있는지 확인하고자 한다.

SELECT COUNT(STUDENT_NAME) AS "학과명이 비어있는 학생수"
FROM TB_STUDENT
WHERE DEPARTMENT_NO IS NULL;

-- 7. 수강신청을 하려고 한다. 선수과목 여부를 확인해야 하는데, 선수과목이 존재하는 과목들은 어떤 과목인지 과목번호 조회

SELECT CLASS_NO
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL;

-- 8. 춘 대학에는 어떤 계열( CATEGORY )들이 있는지 조회해보시오.

SELECT CATEGORY
FROM TB_DEPARTMENT
GROUP BY CATEGORY;

-- 9. 02 학번 전주 거주자들의 모임을 만들려고 한다. 휴학한 사람들은 제외한 재학중인 학생들의 학번, 이름, 주민번호 출력구문

SELECT STUDENT_NO AS "학번", STUDENT_NAME AS "이름", STUDENT_SSN AS "주민번호",ABSENCE_YN
FROM TB_STUDENT
WHERE NVL(ABSENCE_YN, 'Y') != 'Y';









