<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은쪽지함</title>
<style>
.pagination, li.active, .pagination li {
	display: inline-block;
}

.pagination a, li.active {
	color: black;
	padding: 8px 16px;
	text-decoration: none;
	border: 1px solid #ddd;
}

.pagination li.active {
	background-color: #4CAF50;
	color: white;
	border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}

.pagination a, li.active {
	border-radius: 5px;
	border-bottom-left-radius: 5px;
}

.sendMessageBtn {
	display: inline;
	float: right;
}
</style>
<script type="text/javascript">
	$(()=>{
		//보낸 메세지 버튼
		$("#sendMessageBtn").on({
			"click" : function(){
				location.href = "${pageContext.request.contextPath}/goSendMessageListPage.do"
			} 
		})
		
		//tr을 클릭했을 때
		$(".messageListTR").on({
			"click" : function(){
				console.log("r");
				window.open("${pageContext.request.contextPath}/jsp/login/findId.jsp", "아이디 찾기", "width=1000, height=750");
				console.log("a");
				//window.open("${pageContext.request.contextPath}/jsp/login/findId.jsp","a","width=300, height=300, left=50, top=10");
			}
		})
	})
</script>
</head>
<body>
	<br>
	<h3 style="display: inline;">받은 쪽지함 </h3> &nbsp;&nbsp;
	<button class="sendMessageBtn" id="sendMessageBtn" type="button">보낸 쪽지함</button>
	<br>
	<br>
	<div align="center">	
		<table class="table">
			<thead>
				<tr>
					<th scope="col">메세지번호</th>
					<th scope="col">제목</th>
					<th scope="col">보낸사람</th>
					<th scope="col">발송일자</th>
					<th scope="col">확인여부</th>
				</tr>	
			</thead>
			<tbody>
				<c:forEach items="${messageList}" var="v">
					<tr class="messageListTR">
						<td scope="row">${v.code}</td>
						<td scope="row">${v.title}</td>
						<td scope="row">${v.send}</td>
						<td scope="row">${v.ttime}</td>
						<td scope="row">${v.status}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<script>
			function goPage(p) {
				location.href="goMessageListPage.do?p="+p;
			}
		</script>
		<my:paging paging="${paging}" jsfunc="goPage" />
		<br>
	</div>
</body>
</html>