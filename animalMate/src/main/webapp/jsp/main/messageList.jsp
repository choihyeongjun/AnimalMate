<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은쪽지함</title>
<script type="text/javascript">
	$(() => {
		$("#testBtn").on({
			"click": function() {
				history.back();
			}
		})
	});
</script>
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

.pagination a:hover:not(.active) {
	background-color: #ddd;
}

.sendMessageBtn {
	display: inline;
	float: right;
}
</style>
<script type="text/javascript">
	$(()=>{
		$("#sendMessageBtn").on({
			"click" : function(){
				location.href = "${pageContext.request.contextPath}/goSendMessageListPage.do"
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
					<tr>
						<td scope="row">${v.code}</td>
						<td scope="row">${v.title}</td>
						<td scope="row">${v.send}</td>
						<td scope="row">${v.ttime}</td>
						<td scope="row">${v.status}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="pagination">
			<a href="#">&laquo;</a> <a href="#">1</a> <a class="active" href="#">2</a>
			<a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a>
			<a href="#">&raquo;</a>
		</div>
	</div>
</body>
</html>