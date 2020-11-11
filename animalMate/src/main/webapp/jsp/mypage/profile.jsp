<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 프로필 거래내역/후기</title>
</head>
<body>
	<br>
	<div>
		<h1>프로필</h1>
	</div>
	<div>
		<button>즐겨찾기</button>
	</div>
	<div class="row">
		<div class="profileUser">
			<h3>유저 정보</h3>
			<table class="table">
				<tr>
					<td rowspan="6"><img
						src="${pageContext.request.contextPath}/images/muncat.jpg"></td>
					<th>이름</th>
					<td>${user.name}</td>
				</tr>
				<tr>
					<th>나이</th>
					<td>${age}</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>${gender}</td>
				</tr>
				<tr>
					<th>평점</th>
					<td>★☆☆☆☆</td>
				</tr>
				<tr>
					<th>경력</th>
					<td>DBVALUE</td>
				</tr>
				<tr>
					<th>신고횟수</th>
					<td>DBVALUE</td>
				</tr>
			</table>
		</div>
	</div>



	<div class="row">
		<div>
			<h1>거래내역/후기</h1>
		</div>
		<table class="table">
			<tr>
				<th>거래번호</th>
				<th>제목</th>
				<th>위탁자</th>
				<th>시터</th>
				<th>별점</th>
			</tr>
			<c:forEach var="comm" items="${comms}">
				<tr>
					<td>${comm.code}</td>
					<td>${comm.title}</td>
					<td>DBVALUE</td>
					<td>DBVALUE</td>
					<td>DBVALUE</td>
				</tr>
			</c:forEach>
		</table>
	</div>


</body>
</html>