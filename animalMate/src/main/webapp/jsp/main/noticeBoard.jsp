<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고게시판</title>
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

<%-- active안 된 거에 마우스 올리면 회색 --%>
.pagination a:hover:not(.active) {background-color: #ddd;}

.pagination a, li.active {
  border-radius: 5px;
  border-bottom-left-radius: 5px;
}
</style>
</head>
<body>
	<br>
	<h3>공지사항</h3>
	<hr/>
	<div align="right">
		분류: &nbsp;&nbsp;
		<select>
			<option selected="selected">분류
			<option>공지사항
			<option>이벤트
		</select>
	</div>
	<br>
	<div align="center">
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
				<c:forEach items="${members}" var="l">
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
		<script>
				function goPage(p) {
					location.href="goNoticeBoardPage.do?p="+p;
				}
			</script>
		<my:paging paging="${paging}" jsfunc="goPage" />
		<br>
	</div>
	<div align="right">
		<button>글쓰기</button>
	</div>
</body>
</html>