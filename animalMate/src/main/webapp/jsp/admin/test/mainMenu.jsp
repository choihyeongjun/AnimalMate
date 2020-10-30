<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/BBS/css/mainmenu.css">
</head>
<body>
<div align="center">
	<div>
	<nav id="topMenu" >
		<ul>
			<c:if test="${id eq null }">
			<li><a class="menuLink" href="loginForm.do">거래내역</a></li>
			</c:if>
			<li>|</li>
			<li><a class="menuLink" href="#">공지사항 등록 및 수정</a></li>
			<li>|</li>
			<li><a class="menuLink" href="#">1:1문의내역</a></li>
			<c:if test="${id eq null }">
			<li>|</li>
			<li><a class="menuLink" href="memberForm.do">블랙리스트</a></li>
			</c:if>
			<c:if test="${author eq 'admin'}">
			<li>|</li>
			<li><a class="menuLink" href="memberList.do">회원관리</a></li>
			</c:if>
			<c:if test="${id ne null }">
			<li>|</li>
			<li><a class="menuLink" href="logout.do">로그아웃</a></li>
			</c:if>
		</ul>
	</nav>
	</div>
</div>
</body>
</html>