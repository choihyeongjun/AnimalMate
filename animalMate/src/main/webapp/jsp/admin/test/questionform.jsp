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
				location.href = "${pageContext.request.contextPath}/questionlist.do";
			}
		});
			$("#rewrite").on({
			"click" : function() {
				location.href = "${pageContext.request.contextPath}/questionrewrite.do";
			}
		});
		$("#submitBtn").on({
			"click" : function() {
				location.href = "${pageContext.request.contextPath}/questionanswer.do";
			}
		});
	});
</script>
</head>
<body>
	<div class="reportDiv" align="center">
	<h1>&lt;1:1문의 내용&gt;</h1><br> 
		<form id="frm" name="frm" method="post" action="${pageContext.request.contextPath}/questionrewrite.do">
			
				<table class="reportTd">
				<tr>
					<td class="col1_title">작성자</td>
					<td><input class="col2_target" type="text" id="id" name="id" value="${id}"></td>
				</tr>
				<tr>
					<td class="col1_title">제목</td>
					<td><input class="col2_target" type="text" id="title" name="title"  value="${title}"></td>
				</tr>
				<tr>
					<td class="col1_target">분류</td>
					<td><input class="col2_target" type="text" id="type" name="type"  value="${ttype}">
					</td>
				</tr>
				<tr>
					<td class="col2_target">내용</td>
					<td>
						<textarea rows="15" cols="118" id="comm" name="comm" <c:if test="${sessionScope.id ne requestid }">readonly="readonly"</c:if>>${comm}</textarea>	
					</td>
				</tr>
			</table>
				<table>
					<tr>
					<c:if test="${id ne 'admin'}">
					<td class="col2_target">답글</td>
						<td><textarea rows="5" cols="118" id="answer" name="answer" readonly="readonly" placeholder="아직 답글이 달리지 않았습니다.."></textarea>
						</td>
					</c:if>
					<c:if test="${id eq 'admin'}">
					<td class="col2_target">답글</td>
						<td><textarea rows="5" cols="118" id="answer" name="answer"></textarea>
						</td>
					</c:if>
					</tr>
				</table>
		
			<br>
			<div align="right">
			<c:if test="${sessionScope.id eq requestid }">
			<button type="submit" id="rewrite">수정</button>&nbsp;
			</c:if>
			<c:if test="${id eq 'admin'}">
					<button type="submit" id="submitBtn">등록</button>&nbsp;
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