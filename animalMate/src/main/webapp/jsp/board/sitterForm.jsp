<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>돌봐줄게요 - 등록</title>
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

</style>
</head>
<body>
	<h5>돌봐줄게요 - 게시글 등록form</h5>
	
	<div>
		제목 :<input type="text" placeholder="제목을 입력하세요">
	</div>
	
	<div>
		<p><b>시터정보</b></p>
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
				<td><input type="text"></td>
			</tr>
			<tr>
				<th>돌봄날짜</th>
				<td><input type="date"></td>
			</tr>
			<tr>
				<th>돌봄시간</th>
				<td>
					<select>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
					</select>
				</td>
			</tr>
			<tr>
				<th>거래금액(마리)</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th>최대 돌봄수</th>
				<td><input type="text"></td>
			</tr>
		</table>
	</div>
	
	<div>
		<p><b>돌봄환경</b></p>
	</div>
	<div>
		<button id="epic" name="epic">첨부하기1</button>
		<button id="epic" name="epic">첨부하기2</button>
		<button id="epic" name="epic">첨부하기3</button>
		<button id="epic" name="epic">첨부하기4</button>
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
		<textarea>dd</textarea>
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
		<button type="submit">글 등록</button>
		<button type="reset">취소</button>
	</div>
	

</body>
</html>