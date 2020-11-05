<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
	
	
</script>
</head>
<body>
	<h1>마이 펫</h1>
<button onclick="window.location.href='${pageContext.request.contextPath}/mypetForm.do'">펫 등록</button>
<form action="${pageContext.request.contextPath}/mypetUpdate.do" method="get">
	<button>수정</button>
	<div class="row">
		<table class="table">
			<tr>
				<th></th>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
				<th>분류</th>
				<th>세부분류</th>
				<th>중성화</th>
				<th>설명</th>
				<th>사진</th>
			</tr>
			<c:forEach var="pet" items="${pets}">
				<tr>
					<td><input type="radio" id="code" name="code" value="${pet.code}")></td>
					<td>${pet.name}</td>
					<td>${pet.age}</td>
					<td>${pet.gender}</td>
					<td>${pet.type}</td>
					<td>${pet.detailType}</td>
					<td>${pet.cut}</td>
					<td>${pet.comm}</td>
					<td><img
						src="${pageContext.request.contextPath}/images/${pet.pic}"
						alt="사진을 넣어주세요" width="100px" height="100px"></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</form>
</body>
</html>