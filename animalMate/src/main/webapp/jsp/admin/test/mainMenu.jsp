<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainmenu.css">
</head>
<body>
<div align="center">
	<div>
	<nav id="topMenu" >
		<ul>
			<c:if test="${author ne 'admin'}">
			<li><a class="menuLink" href="${pageContext.request.contextPath}/jsp/admin/test/trade.jsp">거래내역</a></li>
			<li>|</li>
			<li><a class="menuLink" href="#">공지사항 등록 및 수정</a></li>
			<li>|</li>
			<li><a class="menuLink" href="${pageContext.request.contextPath}/jsp/admin/test/question.jsp">1:1문의작성</a></li>
			<li>|</li>
			<li><a class="menuLink" href="${pageContext.request.contextPath}/Questionlist.do">1:1문의내역</a></li>
			<li>|</li>
			<li><a class="menuLink" href="${pageContext.request.contextPath}/jsp/admin/test/blacklist.jsp">블랙리스트</a></li>
			<li>|</li>
			<li><a class="menuLink" href="${pageContext.request.contextPath}/jsp/admin/test/memberlist.jsp">회원관리</a></li>
			<li>|</li>
			<li><a class="menuLink" href="${pageContext.request.contextPath}/jsp/admin/test/sconfirm.jsp">시터승인페이지</a></li>
			<li>|</li>
			<li><a class="menuLink" href="logout.do">로그아웃</a></li>
			</c:if>
		</ul>
	</nav>
	</div>
</div>
</body>
</html>