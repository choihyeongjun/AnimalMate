<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>돌보기 상세화면</title>
<style>
</style>
</head>
<body>
	<div>
		<h1>돌보기 상세화면</h1>
	</div>
	<br>

	<div class="row">
		<div class="checkPet">
			<h3>펫 정보</h3>
			<table class="table">
				<tr>
					<td rowspan="5"><img
						src="${pageContext.request.contextPath}/images/muncat.jpg"></td>
					<th>펫 이름</th>
					<td>형준몬</td>
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
		
		<div style="width: 15%;"></div>
		
		<div class="checkSitter">
			<h3>내 정보</h3>
			<table class="table">
				<tr>
					<td rowspan="5"><img id="userpic"
						src="${pageContext.request.contextPath}/images/user.png"></td>
					<th>이름</th>
					<td>DBVALUE</td>
				</tr>
				<tr>
					<th>나이</th>
					<td>DBVALUE</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>DBVALUE</td>
				</tr>
				<tr>
					<th>평점</th>
					<td>DBVALUE</td>
				</tr>
				<tr>
					<th>경력</th>
					<td>DBVALUE</td>
				</tr>
			</table>
		</div>
	</div>

	<div class="row">
		<div class="checkDetail">
			<p>
				<b>세부조건</b>
			</p>
			<table class="table">
				<tr>
					<th>지역</th>
					<td><p>DBValue</p></td>
				</tr>
				<tr>
					<th>날짜</th>
					<td><p>DBValue</p></td>
				</tr>
				<tr>
					<th>근무시간</th>
					<td><p>DBValue</p></td>
				</tr>
				<tr>
					<th>거래금액</th>
					<td><p>DBValue</p></td>
				</tr>
				<tr>
					<th>요청내용</th>
					<td><p>DBValue</p></td>
				</tr>
			</table>
		</div>
	</div>

	<div class="row">
		<button type="submit">거래 수락</button>
		&nbsp;&nbsp;&nbsp;
	</div>
	
	<div class="row">
		<div class="checkDetail">
			<h3>체크리스트</h3>
			<table class="table">
				<tr>
					<th rowspan=2>체크리스트1</th>
					<td rowspan=2>멍뭉이 밥 123g만 주기</td>
					<td><img src="${pageContext.request.contextPath}/images/user.png"></td>
				</tr>
				<tr>
					<td><input type= "file" id = "#" name="#"></td>
				</tr>
				
				<tr>
					<th rowspan=2>체크리스트2</th>
					<td rowspan=2>산책 1시간 시키기</td>
					<td><img src="${pageContext.request.contextPath}/images/user.png"></td>
				</tr>
				<tr>
					<td><input type= "file" id = "#" name="#"></td>
				</tr>
				
				
			</table>
		</div>
	</div>

	<div class="row">
		<button type="submit">업무저장하기</button>
		&nbsp;&nbsp;&nbsp;
	</div>
</body>
</html>