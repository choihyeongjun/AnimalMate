<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
.search{border:1px solid black;}
</style>
</head>

<body>
<jsp:include page="mainMenu.jsp"/>
<hr>
<div align="center">
	<div><h1>회원목록 정보</h1></div>
		<div>
		<table>
			<tr>
				<td><input class="search" type="text" value="홍길동"></td>
				<td><input class="search" type="text" value="hong"></td>
				<td><button id="btn">검색</button>
			</tr>
		</table>
	</div>
	<div>
		<table border="1">
			<tr>
				<th width="100">아이디</th>
				<th width="100">이  름</th>
				<th width="200">주  소</th>
				<th width="150">전화번호</th>
				<th width="150">가입일자</th>
				<th width="100">권 한 </th>
				<th width="42.5">변경</th>
			</tr>
			<%--<c:forEach var="member" items="${members}">--%>
				<tr>
					<td><input type="text" value="12"></td>
					<td><input type="text" value="홍길동">${member.name}</td>
					<td><input type="text" value="경상북도      ">${member.address}</td>
					<td><input type="text" value="010-00">${member.tel}</td>
					<td><input type="text" value="9월1일">${member.enterdate}</td>
					<td><input type="text" value="유저">${member.author}</td>
					<td><button>수정</button></td>
				</tr>
			<%--</c:forEach>--%>
		</table>
	</div>

		
</div>
</body>
</html>