<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>돌봐줄게요 - 예약하기</title>
<style>

table {
border : 1px solid black;
}

#userpic {
width: 50px;
heigth: 50px;
}

#epic {
width: 200px;
height: 200px;
border : 1px solid black;
}

#timetable {
width: 500px;
height: 200px;
border : 1px solid black;	
}

#sitterTitle {
display: inline;
}



</style>
</head>
<body>
	<h5>돌봐줄게요 - 게시글 등록form</h5>
	
	<div>
		<p id="title">제목 : DBVALUE</p>
	</div>
	
	<div>
		<p id="sitterTitle"><b>시터정보</b></p>
		<button>프로필보기</button>
	</div>
	<div>
		<table>
			<tr>
				<td rowspan="5"><img id="userpic" src="${pageContext.request.contextPath}/images/user.png"></td>
				<th>이름</th>
				<td><p>DBVALUE</p></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><p>DBVALUE</p></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><p>DBVALUE</p></td>
			</tr>
			<tr>
				<th>평점</th>
				<td><p>DBVALUE</p></td>
			</tr>
			<tr>
				<th>경력</th>
				<td><p>DBVALUE</p></td>
			</tr>
		</table>
	</div>
	
	
	<div>
		<p><b>세부조건</b></p>
	</div>
	<div>
		<table>
			<tr>
				<th>돌봄지역</th>
				<td><p>DBVALUE</p></td>
			</tr>
			<tr>
				<th>돌봄날짜</th>
				<td><p>DBVALUE</p></td>
			</tr>
			<tr>
				<th>돌봄시간</th>
				<td><p>DBVALUE</p></td>
			</tr>
			<tr>
				<th>거래금액(마리)</th>
				<td><p>DBVALUE</p></td>
			</tr>
			<tr>
				<th>최대 돌봄수</th>
				<td><p>DBVALUE</p></td>
			</tr>
			<tr>
				<th>거래상태</th>
				<td><button>정보보기</button></td>
			</tr>
		</table>
	</div>
	
	<div>
		<p><b>돌봄환경</b></p>
	</div>
	<div>
		<button id="epic" name="epic">DBVALUE</button>
		<button id="epic" name="epic">DBVALUE</button>
		<button id="epic" name="epic">DBVALUE</button>
		<button id="epic" name="epic">DBVALUE</button>
	</div>
	
	<div>
		<p><b>스케줄 선택</b></p>
	</div>
	<div id="timetable">
		타임테이블 영역
	</div>
	
	<div>
		<p><b>세부내용</b></p>
	</div>
	<div>
		<textarea>DBVALUE</textarea>
	</div>
	
	<div>
		<p><b>유의사항</b></p>
	</div>
	<div>
		<p>○ 배드, 사료, 산책용품등은 의뢰자께서 준비해주세요.</p>
		<p>○ 특이사항(질병등)은 사전에 펫시터에게 공지해주세요.</p>
		<p>○ 펫시터 신분증, 주민등록등본등을 미리 확인해주세요.</p>
		<p>○ 의뢰시 간단하게 계약서나 약정서를 작성하세요.</p>
		<p>○ 표준계약서는 '이용안내'에서 내려받을수 있습니다.</p>
	</div>
	
	<div>
		<button>쪽지보내기</button>
		<button type="submit">지원하기</button>
		<button type="submit">취소</button>
	</div>
	

</body>
</html>