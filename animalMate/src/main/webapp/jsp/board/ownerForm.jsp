  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>돌봐줄게요 - 등록</title>
<style>

body {
	
}
.area {
	margin : 20px 0 20px 0;
}

h2 {
	text-align: center;
}
#title {
	width: 760px;
	margin : 20px 0px 20px 0px;
}

#petInfoTable img {
	width: 200px;
	heigth: 250px;
	border : 1px solid black;
	margin: 20px 10px 20px 10px;
	border-radius: 50%;
}

#petInfoTable th {
	width: 130px;
	text-align: right;
	padding-right: 10px;
}

#petInfoTable td {
	width: 200px;
	padding-left: 10px;
}


#timetable {
width: 500px;
height: 200px;
border : 1px solid black;	
}


#check {
display: block;
}



</style>
</head>
<body>
	<h2>돌봐주세요 - 게시글 등록form</h2>
	<form>
	<div class="area">
		<input id="title" type="text" placeholder="제목을 입력하세요">
	</div>
	
	
	<div>
		<p><b>펫 정보</b></p>
		<table id="petInfoTable">
			<tr>
				<td rowspan="5"><img src="${pageContext.request.contextPath}/images/muncat.jpg"></td>
				<th>펫 이름</th>
				<td>
					<select>
						<option>형준몬</option>
						<option>알생몬</option>
						<option>차노몬</option>
						<option>짠규몬</option>
					</select>
				</td>
				<td rowspan="5" align="center">
				<button>+</button>
				</td>
			</tr>
			<tr>
				<th>펫 나이</th>
				<td>DBVALUE</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>DBVALUE</td>
			</tr>
			<tr>
				<th>종류</th>
				<td>DBVALUE</td>
			</tr>
			<tr>
				<th>중성화 유무</th>
				<td>DBVALUE</td>	
			</tr>
		</table>
	</div>

	
	

		

	<div class="area">
	<p><b>세부조건</b></p>
		<table>
			<tr>
				<th>근무지역</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th>근무날짜</th>
				<td><input type="date"></td>
			</tr>
			<tr>
				<th>근무시간</th>
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
		</table>
	</div>
	
	
	
	<div class="area">
		<p><b>요청내용</b></p>
		<textarea>dd</textarea>
	</div>
	

		<div class="area" id="check">
				<p><b>체크리스트</b></p>
			<input placeholder="요청사항을 입력하세요">
			<button>+</button>
			<button>-</button>
		</div>	
	</form>

	<div class="area">
		<p><b>반려인 참고사항</b></p>
		<p>○ 배드, 사료, 산책용품등은 반려인이 준비해주세요.</p>
		<p>○ 특이사항(질병등)은 사전에 펫시터에게 공지해주세요.</p>
		<p>○ 의뢰시 간단하게 계약서나 약정서를 작성하세요.</p>
		<p>○ 표준계약서는 '이용안내'에서 내려받을수 있습니다.</p>
	</div>
	
	<input type="checkbox"> 상기 본인은 참고 사항에 동의 합니다. 
	
	<div>
		<button type="submit">글 등록</button>
		<button action="ownerList.do">취소</button>
	</div>
	

</body>
</html>