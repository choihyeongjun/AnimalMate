<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫 등록하기</title>
<script>
	
</script>
</head>
<body>
	<br/>
	<br/>
	<h1>펫 등록</h1>
	<div class="row">
		<form id = "frm" name = "frm" action="${pageContext.request.contextPath}/mypetFormAction.do" method="post" enctype="multipart/form-data">
			<table class= "table">
				<tr>
					<th>이름</th>
					<td><input type= "text" id ="name" name="name"></td>
					<th rowspan = 2>펫사진</th>
					<td rowspan = 2><input type= "file" id = "pic" name="pic"></td>
				</tr>
				<tr>
					<th>펫나이</th>
					<td><input type= "text" id = "age" name="age"></td>
				</tr>
				<tr>
					<th colspan=2>펫성별</th>
					<td colspan=2>
						<input type="radio" id="male" name="gender" value="남">
						<label for="male">수컷</label><br>
						<input type="radio" id="female" name="gender" value="여">
						<label for="female">암컷</label><br>
						<input type="radio" id="other" name="gender" value="기타" checked>
						<label for="other">기타</label><br><br>
					</td>
				</tr>
				<tr>
					<th>펫 종 이름</th>
					<td><input type= "text" id = "type" name="type"></td>
					<th>펫 세부분류</th>
					<td><input type= "text" id = "detailType" name="detailType"></td>
				</tr>
				<tr>
					<th colspan=2>중성화유무</th>
					<td colspan=2>
						<input type="radio" id="do" name="cut" value="do">
						<label for="do">예</label><br>
						<input type="radio" id="no" name="cut" value="no" checked>
						<label for="no">아니오</label><br>
					</td>
				</tr>
				<tr>
					<th colspan=2>상세설명</th>
					<td colspan=2><textarea id="comm" name="comm" cols="40" rows="4"></textarea></td>
				</tr>
				<tr>
					<td colspan =4 align=center>
						<input type="submit" value="펫 등록">&nbsp;&nbsp;
						<input type="reset" onclick="window.location.href='${pageContext.request.contextPath}/mypetList.do'" value="취	소">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>