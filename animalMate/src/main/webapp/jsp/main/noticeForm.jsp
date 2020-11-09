<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

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
				location.href = "${pageContext.request.contextPath}/goNoticeBoardPage.do"
			}
		})
	})
</script>
</head>
<body>
	<div class="reportDiv" align="center">
	<h1>&lt;공지사항/이벤트&gt;</h1><br> 
		<form id="frm" name="frm" method="post" action="${pageContext.request.contextPath}/submitNotice.do">
			<table class="reportTd">
				<tr>
					<td class="col1_title">제목</td>
					<td>
						<c:if test="${title ne null}">
							<c:if test="${id ne 'admin'}">
								<input class="col2_title" type="text" id="title" name="title" readonly="readonly" value="${title}">
							</c:if>
							<c:if test="${id eq 'admin'}">
								<input class="col2_title" type="text" id="title" name="title" value="${title}">
							</c:if>
							
						</c:if>
						<c:if test="${title eq null}">				
							<input class="col2_title" type="text" id="title" name="title">
						</c:if>
					</td>
				</tr>
				<tr>
					<td class="col1_target">분류</td>
					<td>
						<c:if test="${type ne null}">
							<c:if test="${id ne 'admin'}">
								<input class="col2_target" type="text" id="type" name="type" readonly="readonly" value="${type}">
							</c:if>
							<c:if test="${id eq 'admin'}">
								<select class="col2_target" id="type" name="type">
									<option <c:if test="${type == '공지사항'}">selected</c:if>>공지사항</option>
									<option <c:if test="${type == '이벤트'}">selected</c:if>>이벤트</option>
								</select>
							</c:if>
						</c:if>
						<c:if test="${type eq null}">
							<select class="col2_target" id="type" name="type">
								<option>공지사항</option>
								<option>이벤트</option>
							</select>
						</c:if>
					</td>
				</tr>
				<tr>
					<td class="col3_comm">내용</td>
					<td>
						<c:if test="${comm ne null}">
							<c:if test="${id ne 'admin'}">
								<textarea rows="20" cols="118" class="col3_comm" id="comm" name="comm" readonly="readonly">${comm}</textarea>
							</c:if>
							<c:if test="${id eq 'admin'}">
								<textarea rows="20" cols="118" class="col3_comm" id="comm" name="comm">${comm}</textarea>
							</c:if>
						</c:if>					
						<c:if test="${comm eq null}">
								<textarea rows="20" cols="118" class="col3_comm" id="comm" name="comm"></textarea>
						</c:if>
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