<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴</title>
</head>
<body>
	<%--  <img alt="" src="${pageContext.request.contextPath}/images/picture.jpg" width="200px" height="200px"> --%>
	<!-- 메뉴 row 시작 -->
	<div class="row">
		<div class="col-lg-6 col-md-12">
			<h1>파스타</h1>
			<p>크림파스타 $3.25</p>
			<p>토마토파스타 $3.35</p>
			<p>로제파스타 $2.00</p>
			<p>봉골레파스타 $3.50</p>
		</div>
		<div class="col-lg-6 col-md-12">
			<h1>Beverages</h1>
			<p>Cappucino $3.25</p>
			<p>Latte $3.35</p>
			<p>Espresso $2.00</p>
			<p>Mocha $3.50</p>
		</div>
	</div>
	<!-- 메뉴 row 끝 -->

	<!-- 테이블 시작 -->
	<div class="row">
		<div class="col">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>이름</th>
						<th>전화번호</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>김기자</td>
						<td>123</td>
					</tr>
					<tr>
						<td>김기자</td>
						<td>123</td>
					</tr>
					<tr>
						<td>김기자</td>
						<td>123</td>
					</tr>
					<tr>
						<td>김기자</td>
						<td>123</td>
					</tr>
				</tbody>

			</table>
		</div>
	</div>
	<!-- 테이블 끝 -->
	
	<span class="btn btn-outline-info">가나다라마바사</span>
	<a class="btn btn-outline-info" href="#" role="button">Link</a>
	<button class="btn btn-outline-info" type="submit">
		Button <span class="badge badge-light">4</span>
	</button>
	<input class="btn btn-outline-info" type="button" value="Input">
</body>
</html>