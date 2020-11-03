<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시터승인페이지</title>
</head>
<body>
	<h3>시터 정보</h3>
	<div class="row">
		<div class="col">
			<div id="memlist"></div>
		</div>
		<div class="col">
			<form id="frm" name="frm" method="post" enctype="multipart/form-data">
				<table border="1">
					<tr>
						<th width="150">아이디 :</th>
						<td width="500"><input type="text" id="id" name="id"></td>
					</tr>
					<tr>
						<th width="150">이름 :</th>
						<td><input type="text" id="name" name="name"></td>
					</tr>
					<tr>
						<th width="150">비밀번호 :</th>
						<td><input type="password" id="password" name="password"></td>
					</tr>
					<tr>
						<th width="150">주소 :</th>
						<td><input type="text" id="address" name="address" size="20"></td>
					</tr>
					<tr>
						<th width="150">전화번호 :</th>
						<td><input type="text" id="tel" name="tel"></td>
					</tr>
					<tr>
						<th width="150">가입일자 :</th>
						<td><input type="date" id="enterdate" name="enterdate"></td>
					</tr>
					<tr>
						<th width="150">사진 :</th>
						<td><input type="file" id="img" name="img"></td>
					</tr>

					<tr>
						<td colspan="2" align="center"><input type="button"
							id="btnSave" value="가입하기">&nbsp;&nbsp; <input
							type="reset" value="취소"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>