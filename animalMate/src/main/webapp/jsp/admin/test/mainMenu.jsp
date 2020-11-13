<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainmenu.css">
<div align="center">
	<div>
	<nav id="topMenu" >
		<ul>
			<c:if test="${author ne 'admin'}">
			<li><a class="menuLink" href="${pageContext.request.contextPath}/jsp/admin/test/admin.jsp"><img src="${pageContext.request.contextPath}/jsp/admin/test/logo.png" height="100px" width="100px"></a></li>
		
			<li><a class="menuLink" href="${pageContext.request.contextPath}/jsp/admin/test/trade.jsp">거래내역</a></li>
			<li>|</li>
			<li><a class="menuLink" href="${pageContext.request.contextPath}/goNoticeBoardPage.do">공지사항 등록 및 수정</a></li>
			<li>|</li>
			<li><a class="menuLink" href="${pageContext.request.contextPath}/questionlist.do">1:1문의내역</a></li>
			<li>|</li>
			<li><a class="menuLink" href="${pageContext.request.contextPath}/jsp/admin/test/blacklist.jsp">블랙리스트</a></li>
			<li>|</li>
			<li><a class="menuLink" href="${pageContext.request.contextPath}/jsp/admin/test/memberlist.jsp">회원관리</a></li>
			<li>|</li>
			<li><a class="menuLink" href="${pageContext.request.contextPath}/jsp/admin/test/sconfirm.jsp">시터승인페이지</a></li>
			<li>|</li>
			<li><a class="menuLink" href="${pageContext.request.contextPath}/jsp/admin/test/adminchat.jsp" target="_blank">실시간문의</a></li>
			<li>|</li>
			<li><a class="menuLink" href="${pageContext.request.contextPath}/logout.do">로그아웃</a></li>
			<br/><br/>
			</c:if>
			<br/>
		</ul>
	</nav>
	</div>
</div>
