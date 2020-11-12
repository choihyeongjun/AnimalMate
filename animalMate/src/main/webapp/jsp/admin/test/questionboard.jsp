<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의게시판</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainmenu.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.pagination, li.active, .pagination li {
	display: inline-block;
}

.pagination a, li.active {
	color: black;
	padding: 8px 16px;
	text-decoration: none;
	border: 1px solid #ddd;
}

.pagination li.active {
	background-color: #4CAF50;
	color: white;
	border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}

.pagination a, li.active {
	border-radius: 5px;
	border-bottom-left-radius: 5px;
}

a{
    color: red;
    font-weight: bold;
}
</style>
</head>
<body>
<c:if test="${sessionScope.id eq 'admin'}" >
<jsp:include page="mainMenu.jsp"/>
</c:if>

  <br><br>
	<h3>1:1문의내역</h3>
	<hr />
	<div align="right">
		<form id="filterFrm" name="filterFrm" action="goQuestionBoard.do"
			method="get">
			<select id="type" name="status">
				<option value="">분류
				<option value="공개">공개
				<option value="비공개">비공개
			</select> 
			<button id="filterBtn">검색</button>
		</form>
	</div>
	<br>

	<div align="center">

		<table class="table text-center">
		<thead>
				<tr>
					<th class="text-center">번호</th>
					<th class="text-center">제목</th>
					<th class="text-center">작성자</th>
					<th class="text-center">공개여부</th>
					<th class="text-center">게시날짜</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="l">
				<tr>
				<td>${l.code}</td>
				<c:if test="${sessionScope.id ne l.send && l.status eq '비공개'}">
				<td>${l.title}</td>
				</c:if>
				<c:if test="${l.status eq '공개'}">
				<td><a href="${pageContext.request.contextPath}/questionselect.do?code=${l.code}" style="color: #184cc1;font-weight: bold;">${l.title}</a></td>
				</c:if>
				<c:if test="${l.status eq '비공개' && sessionScope.id eq l.send}">
				<td><a href="${pageContext.request.contextPath}/questionselect.do?code=${l.code}" style="color: #184cc1;font-weight: bold;">${l.title}</a></td>
				</c:if>
				<c:if test="${sessionScope.id eq 'admin'}">
				<td><a href="${pageContext.request.contextPath}/questionselect.do?code=${l.code}">${l.title}</a></td>
				</c:if>
				<td>${l.send}</td>
				<td>${l.status}</td>
				<td>${l.ttime}</td>
				</tr>
			</c:forEach>
				</tbody>
		</table>
		
		
		<div align="right">
			<button>수정하기</button>
		</div>
	</div>
</body>
</html>