<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div><h1>회원목록 정보</h1></div>
	<div>
		<table class="table">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
				<th>분류</th>
				<th>세부분류</th>
				<th>중성화</th>
				<th>설명</th>
				<th>사진</th>
			</tr>
		 	<tr>
		 		<td>DBvalue</td>
		 		<td>DBvalue</td>
		 		<td>DBvalue</td>
		 		<td>DBvalue</td>
		 		<td>DBvalue</td>
		 		<td>DBvalue</td>
		 		<td>DBvalue</td>
		 		<td>DBvalue</td>
		 		<td><img src="${pageContext.request.contextPath}/images/${member.imgs}"></td>
		 	</tr>
		</table>
	</div>
</body>
</html>