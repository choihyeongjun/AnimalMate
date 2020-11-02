<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<div align="center">

		<table class="table">
			<thead>
				<tr>
					<th scope="col">거래날짜</th>
					<th scope="col">제목</th>
					<th scope="col">위탁자</th>
					<th scope="col">시터</th>
					<th scope="col">별점</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">2020-11-02</th>
					<td>아 거래 개떡같네</td>
					<td>김상민</td>
					<td>노진구</td>
					<td>★☆☆☆☆</td>
				</tr>
				<tr>
					<th scope="row">2020-11-02</th>
					<td>아 거래 개떡같네</td>
					<td>김상민</td>
					<td>노진구</td>
					<td>★☆☆☆☆</td>
				</tr>
				<tr>
					<th scope="row">2020-11-02</th>
					<td>아 거래 개떡같네</td>
					<td>김상민</td>
					<td>노진구</td>
					<td>★☆☆☆☆</td>
				</tr>
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
</body>
</html>