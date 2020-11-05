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
.pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}
</style>
</head>
<body>
	<div align="center">

		<table class="table">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">공개여부</th>
					<th scope="col">게시날짜</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="l">
				<td>${l.code }</td>
				<td>${l.title }</td>
				<td>${l.send }</td>
				<td>${l.status }</td>
				<td>${l.ttime }</td>
			</c:forEach>
			</tbody>
		</table>
		<div class="pagination">
			<a href="#">&laquo;</a>
			<a href="#">1</a>
			<a class="active" href="#">2</a>
			<a href="#">3</a>
			<a href="#">4</a>
			<a href="#">5</a>
			<a href="#">6</a>
			<a href="#">&raquo;</a>
		</div>
		<br><br>
		<div align="right">
			<button>신고하기</button>
		</div>
	</div>
</body>
</html>