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
</style>
<script type="text/javascript">
	$(()=> {
		
	})
</script>
</head>
<body>
	<br>
	<h3>공지사항</h3>
	<hr />
	<div align="right">
		<form id="filterFrm" name="filterFrm" action="goNoticeBoardPage.do" method="get">
			<select id="type" name="type">
				<option value="">분류
				<option value="공지사항" <c:if test="${param.type == '공지사항'}">selected</c:if>> 공지사항
				<option value="이벤트" <c:if test="${param.type == '이벤트'}">selected</c:if>>이벤트
			</select>
			<input type="hidden" name="p" value="1">
			<button id="filterBtn">검색</button>
		</form>
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
				<c:forEach items="${list}" var="l">
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
				filterFrm.p.value = p;
				$("#filterFrm").submit();
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