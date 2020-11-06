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

<%-- active된 거에 색깔넣기 --%>
.pagination li.active {
  background-color: #4CAF50;
  color: white;
  border: 1px solid #4CAF50;
}

<%-- active안 된 거에 마32우스 올리면 회색 --%>
.pagination a:hover:not(.active) {background-color: #ddd;}

.pagination a, li.active {
  border-radius: 5px;
  border-bottom-left-radius: 5px;
}
td{
width: 50px;
}
</style>
</head>
<body>
<jsp:include page="mainMenu.jsp"/>
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
				<td>${l.title}</td>
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