<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고게시판</title>
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
	<div align="center"><br>
	<hr/>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">게시글번호</th>
					<th scope="col">작성일자</th>
					<th scope="col">제목</th>
					<th scope="col">분류</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items ="${list}" var="l">
					<tr>
						<td>${l.code}</td>
						<td scope="row">${l.day}</td>
						<td>${l.title}</td>
						<td>${l.type}</td>
						<td>${l.count}</td>
					</tr>
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
	</div>
	<div align="right">
		<button>글쓰기</button>
	</div>
</body>
</html>