<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맡기기 상세화면</title>
</head>
<body>
	<div>
		<h1>맡기기 상세화면</h1>
	</div>

	<div class="row">
		<div class="checkPet">
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
		<div style="width: 15%;"></div>
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
		<div style="width: 15%;"></div>
		<button type="submit">거래 수락</button>
		&nbsp;&nbsp;&nbsp;
	</div>
	
	<div class="row">
		<div style="width: 15%;"></div>
		<div class="checkDetail">
			<h3>체크리스트</h3>
			<table class="table">
				<tr>
					<th>체크리스트1</th>
					<td>멍뭉이 밥 123g만 주기</td>
				</tr>
				<tr>
					<th>체크리스트2</th>
					<td>산책 1시간 시키기</td>
				</tr>
			</table>
		</div>
	</div>

	<div class="row">
		<div style="width: 15%;"></div>
		<button type="submit">거래완료</button>
		&nbsp;&nbsp;&nbsp;
	</div>
	
</body>
</html>