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
		margin-bottom: 200px;
	}
</style>
</head>
<body>
	<div class="reportDiv" align="center">
		<table>
			<tr>
				<td class="reportTd" colspan="2">
					<span>거래번호: </span>
					<span>1</span> &nbsp;&nbsp;
					<span>시터:</span>
					<span>친절한 진구씨</span> &nbsp;&nbsp; 
					<span>거래제목:</span>
					<span>진구의 초호화 산책 서비스</span>
				</td>
			</tr>
			<tr>
				<td class="reportTd"><div class="reportTd">제목</div> </td>
				<td><input class="reportTitle" type="text"></td>
			</tr>
			<tr>
				<td><div>별점</div></td>
				<td>
					<select>
						<option>★★★★★
						<option>★★★★☆
						<option>★★★☆☆
						<option>★★☆☆☆
						<option>★☆☆☆☆
					</select>
				</td>
			</tr>
			<tr>
				<td class="reportTd"><div class="reportTd">사진</div> </td>
				<td><input type="file"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input class="reportCommentInput" type="text"></td>
			</tr>
		</table>
		<br>
		<div align="right">
			<button>제출하기</button>
			<button>취소</button>
		</div>
	</div>
</body>
</html>