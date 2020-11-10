--시퀀스 생성
CREATE SEQUENCE PET_CODE;
CREATE SEQUENCE BLACK_CODE;
CREATE SEQUENCE QUESTION_SEQ;
CREATE SEQUENCE NOTICE_CODE;
CREATE SEQUENCE PICTURE_CODE;

--notice테이블 더미
insert into notice values(notice_code.nextval, sysdate, 0, '실험1', '실험용입니다.', '공지');
insert into notice values(notice_code.nextval, sysdate, 0, '실험2', '실험용입니다.', '이벤트');
insert into notice values(notice_code.nextval, sysdate, 0, '실험3', '실험용입니다.', '공지');
insert into notice values(notice_code.nextval, sysdate, 0, '실험4', '실험용입니다.', '이벤트');
insert into notice values(notice_code.nextval, sysdate, 0, '실험5', '실험용입니다.', '공지');
insert into notice values(notice_code.nextval, sysdate, 0, '실험6', '실험용입니다.', '이벤트');
insert into notice values(notice_code.nextval, sysdate, 0, '실험7', '실험용입니다.', '공지');
insert into notice values(notice_code.nextval, sysdate, 0, '실험8', '실험용입니다.', '이벤트');

--comments테이블 더미
insert into comments(code, score, comm, pic, title) values (11, 5, '좋아유', null, '좋은 제목');
insert into comments(code, score, comm, pic, title) values (2, 4, '좋아유', null, '좋은 제목');
insert into comments(code, score, comm, pic, title) values (3, 5, '좋아유', null, '좋은 제목');
insert into comments(code, score, comm, pic, title) values (4, 4, '좋아유', null, '좋은 제목');

--picture테이블 더미
insert into picture values(picture_code.nextval, 'id1', 'picture1.jpg');
insert into picture values(picture_code.nextval, 'id1', 'picture2.jpg');
insert into picture values(picture_code.nextval, 'id1', 'picture3.jpg');
insert into picture values(picture_code.nextval, 'id1', 'picture4.jpg');
insert into picture values(picture_code.nextval, 'id1', 'picture5.jpg');