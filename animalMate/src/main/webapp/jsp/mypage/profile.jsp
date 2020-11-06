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

	<div><h1>유저 프로필</h1></div>
	<div><button>즐겨찾기</button></div>
	<div class="row">
		<div class="profileUser">
			<h3>유저 정보</h3>
			<table class="table">
				<tr>
					<td rowspan="6"><img src="${pageContext.request.contextPath}/images/muncat.jpg"></td>
					<th>닉네임</th>
					<td>크로마뇽</td>
				</tr>
				<tr>
					<th>나이</th>
					<td>DBVALUE</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>DBVALUE</td>
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
	
	
	
	<div align="center">
		<div><h1>거래내역/후기</h1></div>
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
					<td>크로마뇽</td>
					<td>★☆☆☆☆</td>
				</tr>
				<tr>
					<th scope="row">2020-11-02</th>
					<td>아 거래 개떡같네</td>
					<td>김상민</td>
					<td>크로마뇽</td>
					<td>★☆☆☆☆</td>
				</tr>
				<tr>
					<th scope="row">2020-11-02</th>
					<td>아 거래 개떡같네</td>
					<td>김상민</td>
					<td>크로마뇽</td>
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