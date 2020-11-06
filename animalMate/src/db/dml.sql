CREATE SEQUENCE PET_CODE;

CREATE SEQUENCE BLACK_CODE;

CREATE SEQUENCE QUESTION_SEQ;


insert into notice values(notice_code.nextval, sysdate, 0, '실험1', '실험용입니다.', '공지');
insert into notice values(notice_code.nextval, sysdate, 0, '실험2', '실험용입니다.', '이벤트');
insert into notice values(notice_code.nextval, sysdate, 0, '실험3', '실험용입니다.', '공지');
insert into notice values(notice_code.nextval, sysdate, 0, '실험4', '실험용입니다.', '공지');