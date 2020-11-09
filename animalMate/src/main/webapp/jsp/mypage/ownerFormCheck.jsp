<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맡기기 상세화면</title>
</head>
<body>
<br>
	<h1>돌봐주세요 상세화면</h1>
<br>

	<div class="row">
		<div class="ownerFormCheckView">
			<h3>내 펫 정보</h3>
			<table class="table">
				<tr>
					<td rowspan="5" width =30%><img
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
		
		<div class="ownerFormCheckView">
			<h3>시터 정보</h3>
			<table class="table">
				<tr>
					<td rowspan="5" width =30%><img id="userpic" src="${pageContext.request.contextPath}/images/user.png"></td>
					<th>이름</th>
					<td>${tbs.seller}</td>
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
		<div class="ownerFormCheckView">
			<h3>세부조건</h3>
			<table class="table">
				<tr>
					<th width=30%>지역</th>
					<td>${tbs.location1}</td>
				</tr>
				<tr>
					<th>날짜</th>
					<td>DBValue</td>
				</tr>
				<tr>
					<th>근무시간</th>
					<td>DBValue</td>
				</tr>
				<tr>
					<th>거래금액</th>
					<td>DBValue</td>
				</tr>
				<tr>
					<th>요청내용</th>
					<td>DBValue</td>
				</tr>
			</table>
		</div>
		
		<div class="ownerFormCheckView">
			<h3>세부내용</h3>
			<div class="ownerFormCheckText">
				세부내용입력
			</div>
		</div>
	</div>
	
<br>

	<div class="ownerFormCheckButton">
		<button type="submit">거래 수락</button>
	</div>
<hr>
	
	<div class="row">
		<div class="checkDetail">
			<h3>체크리스트</h3>
			<table class="table">
				<tr>
					<th>체크리스트1</th>
					<td>멍뭉이 밥 123g만 주기</td>
					<td><img src="${pageContext.request.contextPath}/images/user.png"></td>
					<td><button>완료</button></td>
				</tr>
				<tr>
					<th>체크리스트2</th>
					<td>산책 1시간 시키기</td>
					<td><img src="${pageContext.request.contextPath}/images/user.png"></td>
					<td><button>완료</button></td>
				</tr>
			</table>
		</div>
	</div>

	<div class="ownerFormCheckButton">
		<button type="submit">거래완료</button>
	</div>
	
</body>
</html>