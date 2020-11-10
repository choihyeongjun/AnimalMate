<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의내역</title>

<style type="text/css">
.col1_title, .col1_target, .col3_comm {
	width: 150px;
}

.col2_title, .col2_target, .col3_comm {
	width: 850px;
}

.col3_comm {
	height: 500px;
}
</style>
<script type="text/javascript">
	$(()=>{
		$("#gobackBtn").on({
			"click" : function() {
				location.href = "${pageContext.request.contextPath}/questionlist.do"
			}
		})
	})
</script>
</head>
<body>
	<div class="reportDiv" align="center">
	<h1>&lt;공지사항/이벤트&gt;</h1><br> 
		<form id="frm" name="frm" method="post" action="">
			
				<table class="reportTd">
				<tr>
					<td class="col1_title">제목</td>
					<td><input class="col2_target" type="text" id="title" name="title" readonly="readonly" value="${title}"></td>
				</tr>
				<tr>
					<td class="col1_target">분류</td>
					<td><input class="col2_target" type="text" id="type" name="type" readonly="readonly" value="${ttype}">
					</td>
				</tr>
				<tr>
					<td class="col2_target">내용</td>
					<td>
						<textarea rows="20" cols="118" class="col3_comm" id="comm" name="comm" readonly="readonly" value="${comm}"></textarea>	
					</td>
				</tr>
			</table>
		
			<br>
			<div align="right">
			<c:if test="${id eq 'admin'}">
					<button type="submit" id="submitBtn">제출하기</button>&nbsp;
					<c:if test="${code ne null}">
						<input type="hidden" value="${code}" name="code">
					</c:if>
			</c:if>
					<button type="button" id="gobackBtn">돌아가기</button>
			</div>
		</form>

	</div>
</body>
</html>