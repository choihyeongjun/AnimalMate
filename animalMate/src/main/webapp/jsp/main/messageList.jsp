<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고게시판</title>
<script type="text/javascript">
	$(() => {
		$("#testBtn").on({
			"click": function() {
				window.open("${pageContext.request.contextPath}/goLoginPage.do","aaa","width=350, height=400");
			}
		})
	});
</script>
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

.pagination a:hover:not(.active) {
	background-color: #ddd;
}
</style>
</head>
<body>
	<div align="center">
		<div align="left">받은 쪽지</div>
		<br>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">메세지번호</th>
					<th scope="col">제목</th>
					<th scope="col">발송인</th>
					<th scope="col">발송일자</th>
					<th scope="col">확인여부</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td scope="row">1</td>
					<td scope="row">야~ 프로젝트하기 싫다~</td>
					<td scope="row">알파카1호</td>
					<td scope="row">2020-11-02 10:30</td>
					<td scope="row">확인</td>
				</tr>
				<tr>
					<td>2</td>
					<td>야~ 프로젝트하기 싫다~</td>
					<td>알파카1호</td>
					<td scope="row">2020-11-02 10:30</td>
					<td></td>
				</tr>
				<tr>
					<td>3</td>
					<td>야~ 프로젝트하기 싫다~</td>
					<td>알파카1호</td>
					<td scope="row">2020-11-02 10:30</td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<div class="pagination">
			<a href="#">&laquo;</a> <a href="#">1</a> <a class="active" href="#">2</a>
			<a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a>
			<a href="#">&raquo;</a>
		</div>
	</div>
	<div align="center">
		<div align="left">보낸 쪽지</div>
		<br>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">메세지번호</th>
					<th scope="col">제목</th>
					<th scope="col">수신인</th>
					<th scope="col">발송일자</th>
					<th scope="col">확인여부</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td scope="row">1</td>
					<td scope="row">야~ 프로젝트하기 싫다~</td>
					<td scope="row">알파카1호</td>
					<td scope="row">2020-11-02 10:30</td>
					<td scope="row"><a href="${pageContext.request.contextPath}/main.do">답장보기</a></td>
				</tr>
				<tr>
					<td>2</td>
					<td>야~ 프로젝트하기 싫다~</td>
					<td>알파카1호</td>
					<td scope="row">2020-11-02 10:30</td>
					<td scope="row"></td>
				</tr>
				<tr>
					<td>3</td>
					<td>야~ 프로젝트하기 싫다~</td>
					<td>알파카1호</td>
					<td scope="row">2020-11-02 10:30</td>
					<td scope="row"></td>
				</tr>
			</tbody>
		</table>
		<div class="pagination">
			<a href="#">&laquo;</a> <a href="#">1</a> <a class="active" href="#">2</a>
			<a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a>
			<a href="#">&raquo;</a>
		</div>
		<button id="testBtn">테스트</button>
	</div>
</body>
</html>