<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>

<style type="text/css">
.col1_title, .col1_target, .col3_comm {
	width: 150px;
}

.col2_title, .col2_target, .col3_comm {
	width: 850px;
}

.col3_comm {
	height: 500px
}
</style>
</head>
<body>
	<div class="reportDiv" align="center">
		<form id="frm" name="frm" method="post"
			action="${pageContext.request.contextPath}/submitReport.do">
			<table class="reportTd">
				<tr>
					<td class="col1_title">제목</td>
					<td><input class="col2_title" type="text" id="title"
						name="title"></td>
				</tr>

				<tr>
					<td class="col1_target">신고대상</td>
					<td><input class="col2_target" type="text" id="toUser"
						name="toUser"></td>
				</tr>
				<tr>
					<td class="col3_comm">내용</td>
					<td><input class="col3_comm" type="text" id="comm" name="comm"></td>
				</tr>
			</table>
			<br>
			<div align="right">
				<button type="submit" id="submitBtn">제출하기</button>
				<button>취소</button>
			</div>
		</form>

	</div>
</body>
</html>