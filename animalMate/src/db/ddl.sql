
/* Drop Tables */

DROP TABLE applytrade CASCADE CONSTRAINTS;
DROP TABLE black CASCADE CONSTRAINTS;
DROP TABLE comments CASCADE CONSTRAINTS;
DROP TABLE joblist CASCADE CONSTRAINTS;
DROP TABLE message CASCADE CONSTRAINTS;
DROP TABLE pet CASCADE CONSTRAINTS;
DROP TABLE picture CASCADE CONSTRAINTS;
DROP TABLE sitter CASCADE CONSTRAINTS;
DROP TABLE petcode CASCADE CONSTRAINTS;
DROP TABLE tradeBoard CASCADE CONSTRAINTS;
DROP TABLE members CASCADE CONSTRAINTS;
DROP TABLE notice CASCADE CONSTRAINTS;
DROP TABLE question CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE applytrade
(
	code number(10) NOT NULL,
	id varchar2(100) NOT NULL,
	tdate date DEFAULT sysdate,
	status varchar2(100)
);


CREATE TABLE black
(
	code number NOT NULL,
	toUser varchar2(100) NOT NULL,
	fromUser varchar2(100) NOT NULL,
	title varchar2(100),
	comm varchar2(4000),
	dtime date,
	PRIMARY KEY (code)
);


CREATE TABLE comments
(
	code number(10) NOT NULL,
	score number,
	comm varchar2(100),
	pic varchar2(100),
	title varchar2(100),
	PRIMARY KEY (code)
);


CREATE TABLE joblist
(
	code number(10) NOT NULL,
	comm varchar2(100) NOT NULL,
	pic varchar2(100),
	confirm varchar2(100) DEFAULT '인증대기',
	PRIMARY KEY (code, comm),
	CONSTRAINT joblist_key UNIQUE (code, comm)
);


CREATE TABLE members
(
	id varchar2(100) NOT NULL,
	pw varchar2(100),
	name varchar2(100),
	nname nvarchar2(100) UNIQUE,
	tel varchar2(100),
	eDate date,
	author varchar2(100),
	money number,
	point number,
	status varchar2(100),
	location1 varchar2(100),
	location2 varchar2(200),
	email varchar2(100),
	pic varchar2(100),
	zoomin1 number,
	zoomin2 number,
	PRIMARY KEY (id)
);


CREATE TABLE message
(
	code number NOT NULL,
	send varchar2(100),
	receive varchar2(100),
	title varchar2(100),
	comm varchar2(4000),
	status varchar2(100),
	ttime date,
	PRIMARY KEY (code)
);


CREATE TABLE notice
(
	code number(20) NOT NULL,
	day date DEFAULT sysdate,
	count number,
	title varchar2(100),
	comm varchar2(4000),
	type varchar2(100),
	PRIMARY KEY (code)
);


CREATE TABLE pet
(
	code number NOT NULL,
	name varchar2(100),
	age number(2,0),
	gender varchar2(100),
	type varchar2(100),
	detailType varchar2(100),
	cut varchar2(2),
	comm varchar2(4000),
	id varchar2(100) NOT NULL,
	pic varchar2(100),
	PRIMARY KEY (code)
);


CREATE TABLE petcode
(
	code number(10) NOT NULL,
	petcode number
);


CREATE TABLE picture
(
	code number NOT NULL,
	id varchar2(100) NOT NULL,
	pic varchar2(100),
	PRIMARY KEY (code)
);


CREATE TABLE question
(
	code number NOT NULL,
	send varchar2(100),
	title varchar2(100),
	ttype varchar2(100),
	comm varchar2(4000),
	status varchar2(100),
	ttime date,
	PRIMARY KEY (code)
);


CREATE TABLE sitter
(
	id varchar2(100) NOT NULL,
	maxP number,
	comm varchar2(4000),
	status varchar2(100),
	PRIMARY KEY (id)
);


CREATE TABLE tradeBoard
(
	code number(10) NOT NULL,
	buyer varchar2(100),
	seller varchar2(100),
	title varchar2(100),
	ttime date DEFAULT sysdate,
	price number(20),
	comm varchar2(200),
	status varchar2(100) DEFAULT '거래 미정',
	sdate date,
	edate date,
	stime varchar2(100),
	etime varchar2(100),
	ttype varchar2(100),
	location1 varchar2(200),
	location2 varchar2(200),
	PRIMARY KEY (code)
);



/* Create Foreign Keys */

ALTER TABLE applytrade
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


ALTER TABLE black
	ADD FOREIGN KEY (toUser)
	REFERENCES members (id)
;


ALTER TABLE black
	ADD FOREIGN KEY (fromUser)
	REFERENCES members (id)
;


ALTER TABLE message
	ADD FOREIGN KEY (send)
	REFERENCES members (id)
;


ALTER TABLE message
	ADD FOREIGN KEY (receive)
	REFERENCES members (id)
;


ALTER TABLE pet
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
	ON DELETE CASCADE
;


ALTER TABLE sitter
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


ALTER TABLE tradeBoard
	ADD FOREIGN KEY (seller)
	REFERENCES members (id)
;


ALTER TABLE tradeBoard
	ADD FOREIGN KEY (buyer)
	REFERENCES members (id)
;


ALTER TABLE picture
	ADD FOREIGN KEY (id)
	REFERENCES sitter (id)
;


ALTER TABLE applytrade
	ADD FOREIGN KEY (code)
	REFERENCES tradeBoard (code)
;


ALTER TABLE comments
	ADD FOREIGN KEY (code)
	REFERENCES tradeBoard (code)
;


ALTER TABLE joblist
	ADD FOREIGN KEY (code)
	REFERENCES tradeBoard (code)
;


ALTER TABLE petcode
	ADD FOREIGN KEY (code)
	REFERENCES tradeBoard (code)
;



/* Comments */

COMMENT ON TABLE applytrade IS '거래신청';
COMMENT ON COLUMN applytrade.code IS '거래번호';
COMMENT ON COLUMN applytrade.id IS '신청자id';
COMMENT ON COLUMN applytrade.tdate IS 'tdate';
COMMENT ON COLUMN applytrade.status IS '상태';
COMMENT ON TABLE black IS '신고';
COMMENT ON COLUMN black.code IS '신고게시글번호';
COMMENT ON COLUMN black.toUser IS '신고하는사람';
COMMENT ON COLUMN black.fromUser IS '신고당한사람';
COMMENT ON COLUMN black.title IS '제목';
COMMENT ON COLUMN black.comm IS '신고내용';
COMMENT ON COLUMN black.dtime IS '신고일자';
COMMENT ON TABLE comments IS '후기';
COMMENT ON COLUMN comments.code IS '거래번호';
COMMENT ON COLUMN comments.score IS '별점';
COMMENT ON COLUMN comments.comm IS '코멘트';
COMMENT ON COLUMN comments.pic IS '사진';
COMMENT ON COLUMN comments.title IS '제목';
COMMENT ON TABLE joblist IS '업무리스트';
COMMENT ON COLUMN joblist.code IS '거래번호';
COMMENT ON COLUMN joblist.comm IS '업무';
COMMENT ON COLUMN joblist.pic IS '사진';
COMMENT ON COLUMN joblist.confirm IS '인증';
COMMENT ON TABLE members IS '유저';
COMMENT ON COLUMN members.id IS '아이디';
COMMENT ON COLUMN members.pw IS '비밀번호';
COMMENT ON COLUMN members.name IS '이름';
COMMENT ON COLUMN members.nname IS '닉네임';
COMMENT ON COLUMN members.tel IS '전화번호';
COMMENT ON COLUMN members.eDate IS '가입일자';
COMMENT ON COLUMN members.author IS '권한';
COMMENT ON COLUMN members.money IS '돈';
COMMENT ON COLUMN members.point IS '포인트';
COMMENT ON COLUMN members.status IS '상태';
COMMENT ON COLUMN members.location1 IS '주소';
COMMENT ON COLUMN members.location2 IS '상세주소';
COMMENT ON COLUMN members.email IS '이메일';
COMMENT ON COLUMN members.pic IS '사진';
COMMENT ON COLUMN members.zoomin1 IS '주민번호 앞자리';
COMMENT ON COLUMN members.zoomin2 IS '주민번호 뒷자리';
COMMENT ON TABLE message IS '메시지';
COMMENT ON COLUMN message.code IS '메세지번호';
COMMENT ON COLUMN message.send IS '보내는아이디';
COMMENT ON COLUMN message.receive IS '받는아이디';
COMMENT ON COLUMN message.title IS '제목';
COMMENT ON COLUMN message.comm IS '내용';
COMMENT ON COLUMN message.status IS '상태';
COMMENT ON COLUMN message.ttime IS '발송시간';
COMMENT ON TABLE notice IS '공지테이블';
COMMENT ON COLUMN notice.code IS '게시글번호';
COMMENT ON COLUMN notice.day IS '작성일자';
COMMENT ON COLUMN notice.count IS '조회수';
COMMENT ON COLUMN notice.title IS '게시글제목';
COMMENT ON COLUMN notice.comm IS '게시글내용';
COMMENT ON COLUMN notice.type IS '분류';
COMMENT ON TABLE pet IS '펫';
COMMENT ON COLUMN pet.code IS '펫번호';
COMMENT ON COLUMN pet.name IS '펫이름';
COMMENT ON COLUMN pet.age IS '펫나이';
COMMENT ON COLUMN pet.gender IS '펫성별';
COMMENT ON COLUMN pet.type IS '펫종류';
COMMENT ON COLUMN pet.detailType IS '자세한펫종류';
COMMENT ON COLUMN pet.cut IS '중성화유무';
COMMENT ON COLUMN pet.comm IS '상세설명';
COMMENT ON COLUMN pet.id IS '아이디';
COMMENT ON COLUMN pet.pic IS '사진';
COMMENT ON TABLE petcode IS '거래테이블';
COMMENT ON COLUMN petcode.code IS '거래번호';
COMMENT ON COLUMN petcode.petcode IS '펫코드';
COMMENT ON TABLE picture IS '돌봄환경사진';
COMMENT ON COLUMN picture.code IS '순번';
COMMENT ON COLUMN picture.id IS '시터아이디';
COMMENT ON COLUMN picture.pic IS '돌봄환경사진';
COMMENT ON TABLE question IS '1:1문의';
COMMENT ON COLUMN question.code IS '메세지번호';
COMMENT ON COLUMN question.send IS '보내는아이디';
COMMENT ON COLUMN question.title IS '제목';
COMMENT ON COLUMN question.ttype IS '분류';
COMMENT ON COLUMN question.comm IS '내용';
COMMENT ON COLUMN question.status IS '상태';
COMMENT ON COLUMN question.ttime IS '발송시간';
COMMENT ON TABLE sitter IS '시터';
COMMENT ON COLUMN sitter.id IS '아이디';
COMMENT ON COLUMN sitter.maxP IS '펫 수용 수';
COMMENT ON COLUMN sitter.comm IS '지원내용';
COMMENT ON COLUMN sitter.status IS '상태';
COMMENT ON TABLE tradeBoard IS '거래게시판';
COMMENT ON COLUMN tradeBoard.code IS '거래번호';
COMMENT ON COLUMN tradeBoard.buyer IS '위탁자아이디';
COMMENT ON COLUMN tradeBoard.seller IS '시터아이디';
COMMENT ON COLUMN tradeBoard.title IS '제목';
COMMENT ON COLUMN tradeBoard.ttime IS '글 올린 시간';
COMMENT ON COLUMN tradeBoard.price IS '거래가격';
COMMENT ON COLUMN tradeBoard.comm IS '상세정보';
COMMENT ON COLUMN tradeBoard.status IS '거래상태';
COMMENT ON COLUMN tradeBoard.sdate IS '시작일자';
COMMENT ON COLUMN tradeBoard.edate IS '종료일자';
COMMENT ON COLUMN tradeBoard.stime IS '시작시간';
COMMENT ON COLUMN tradeBoard.etime IS '종료시간';
COMMENT ON COLUMN tradeBoard.ttype IS '돌봐줄께요/돌봐주세요';
COMMENT ON COLUMN tradeBoard.location1 IS '근무지역';
COMMENT ON COLUMN tradeBoard.location2 IS '상세근무지역';



