<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>
<style type="text/css">
	.reportCommentInput, .reportDiv {
		width: 500px;
		height: 500px;
	}
	.reportTitle, .reportTarget {
		width: 500px;
	}
	.reportTd {
		width: 100px;
	}
	.reportDiv {
		margin-bottom: 150px;
	}
</style>
</head>
<body>
	<div class="reportDiv" align="center">
		<table>
			<tr>
				<td>받을 아이디</td>
				<td><input class="reportTarget" type="text"></td>
			</tr>
			<tr>
				<td class="reportTd"><div class="reportTd">제목</div> </td>
				<td><input class="reportTitle" type="text"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input class="reportCommentInput" type="text"></td>
			</tr>
		</table>
		<br>
		<div align="right">
			<button>보내기</button>
			<button>취소</button>
		</div>
	</div>
</body>
</html>