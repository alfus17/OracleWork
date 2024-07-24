-- 테이블 컬럼 추가
alter table tb_student add student_pwd varchar2(30);
-- student pwd 코멘트 추가
COMMENT on COLUMN tb_student.student_pwd is '학생 패스워드';
-- java에서 실행할 쿼리문 테스트
select * from TB_STUDENT where STUDENT_NO = 'A013116' and STUDENT_PWD = '';
-- 생성한 student_pwd 컬럼에 주민번호 일괄 추가
update tb_student set student_pwd = substr(student_ssn,1,6) ;

select substr(student_ssn ,1,6) from tb_student;