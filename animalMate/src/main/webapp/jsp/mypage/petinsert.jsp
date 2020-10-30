<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫 등록하기</title>
<style>

	
.row {
		justify-content: center;
		align-items: center;
	}

</style>
</head>
<body>
	<br/>
	<br/>
	<h1>펫 등록</h1>
	<div class="row">
		<form id = "frm" name = "frm" action="#.do" method="post" enctype="multipart/form-data">
			<table class= "table">
				<tr>
					<th>이름</th>
					<td><input type= "text" id = "petName" name="petName"></td>
					<th rowspan = 2>펫사진</th>
					<td rowspan = 2><input type= "file" id = "petImg" name="petImg"></td>
				</tr>
				<tr>
					<th>펫나이</th>
					<td><input type= "text" id = "petAge" name="petAge"></td>
				</tr>
				<tr>
					<th colspan=2>펫성별</th>
					<td colspan=2>
						<input type="radio" id="male" name="gender" value="male">
						<label for="male">Male</label><br>
						<input type="radio" id="female" name="gender" value="female">
						<label for="female">Female</label><br>
						<input type="radio" id="other" name="gender" value="other">
						<label for="other">Other</label><br><br>
					</td>
				</tr>
				<tr>
					<th colspan=2>중성화유무</th>
					<td colspan=2>
						<input type="radio" id="cutyes" name="cut" value="cutyes">
						<label for="cutyes">예</label><br>
						<input type="radio" id="cutno" name="cut" value="cutno">
						<label for="cutno">아니오</label><br>
					</td>
				</tr>
				<tr>
					<th colspan=2>상세설명</th>
					<td colspan=2><input type= "text" id = "pet" name="pet"></td>
				</tr>
				<tr>
					<td colspan =4 align=center>
						<input type="submit" value="펫 등록">&nbsp;&nbsp;
						<input type="reset" value="취	소">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>