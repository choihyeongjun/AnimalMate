<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-4 col-md-4 mypagebox" id="profile">
			<h1>프로필</h1>
			<table class="table">
				<tr>
					<th>이름</th>
					<td>${user.name}</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${user.tel}</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${user.location1} ${user.location2}</td>
				</tr>
			</table>
			<a class="btn btn-outline-primary"
				href="${pageContext.request.contextPath}/memberForm.do"
				role="button">수정</a>
		</div>

		<div class="col-lg-4 col-md-4 mypagebox">
			<h1>마이펫</h1>
			<table class="table">
				<c:forEach var="pet" items="${pets}">
					<tr>
						<td rowspan=2 width=30%>
						<img
							src="${pageContext.request.contextPath}/images/${pet.pic}"
							alt="사진을 넣어주세요" width=70% height=30%></td>
						<td>${pet.name}</td>
						<td>${pet.age}살</td>
					</tr>
					<tr>
						<td colspan=2>${pet.type} ${pet.detailType}</td>
					</tr>
				</c:forEach>
			</table>
			<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/mypetForm.do" role="button">새 등록</a>&nbsp;&nbsp; 
			<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/mypetList.do" role="button">목록</a>

		</div>
	</div>

	<div class="row">
		<div class="col-lg-4 col-md-4 mypagebox">
			<h1>거래내역</h1>

			<table class="table">
				<tr>
					<th>남은 포인트</th>
					<td>${user.point}p</td>
				</tr>
				<tr>
					<th>진행중인 거래</th>
					<td><p>5건</p>
						</a></td>
				</tr>
				<tr>
					<th>거래내역</th>
					<td><a class="btn btn-outline-primary"
						href="${pageContext.request.contextPath}/mytradeList.do"
						role="button">더보기</a></td>
				</tr>
			</table>
		</div>

		<div class="col-lg-4 col-md-4 mypagebox">
			<h1>즐겨찾기</h1>
			<table class="table">
				<tr>
					<td>이름</td>
					<td>나이</td>
					<td>지역</td>
					<td>상세정보</td>
				</tr>
				<tr>
					<td>김돌돌</td>
					<td>32살</td>
					<td>대구 동구 신천동</td>
					<td><a class="btn btn-outline-primary"
						href="${pageContext.request.contextPath}/profile.do" role="button">상세</a></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>