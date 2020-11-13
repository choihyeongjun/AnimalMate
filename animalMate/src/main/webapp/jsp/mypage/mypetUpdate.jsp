<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫 정보 수정</title>
<script type="text/javascript">
	$(document).ready(function() {
		$('input[name="gender"]').val([ '${pet.gender}' ]);
		$('input[name="cut"]').val([ '${pet.cut}' ]);
	});
</script>
</head>
<body>
	<br>
	<h1>펫 정보수정</h1>
	<div class="row">
		<div class="mypetUpdateView">
			<form id="frm" name="frm" method="post" enctype="multipart/form-data">
				<div style="visibility: hidden;">
					<input type="text" id="code" name="code" value="${pet.code}">
				</div>
				<table class="table">
					<tr>
						<th>이름</th>
						<td><input type="text" id="name" name="name" value="${pet.name}"></td>
						<th rowspan=2>펫사진</th>
						<td rowspan=2><input type="file" id="pic" name="pic"></td>
					</tr>
					<tr>
						<th>펫나이</th>
						<td><input type="text" id="age" name="age" value="${pet.age}"></td>
					</tr>
					<tr>
						<th colspan=2>펫성별</th>
						<td colspan=2>
							<input type="radio" id="수컷" name="gender" value="수컷"> 
							<label for="수컷">수컷</label><br> 
							<input type="radio" id="암컷" name="gender" value="암컷"> 
							<label for="암컷">암컷</label><br> 
							<input type="radio" id="기타" name="gender" value="기타"> 
							<label for="기타">기타</label>
						</td>
					</tr>
					<tr>
						<th>펫 종 이름</th>
							
						<td>
							<select id="type" name="type">
								<option value="${pet.type}">${pet.type}</option>
								<option value="고양이">고양이</option>
								<option value="대형견">대형견</option>
								<option value="중형견">중형견</option>
								<option value="소형견">소형견</option>
							</select>
						</td>
						<th>펫 세부분류</th>
						<td><input type="text" id="detailType" name="detailType" value="${pet.detailType}"></td>
					</tr>
					<tr>
						<th colspan=2>중성화유무</th>
						
						<td colspan=2>
							<input type="radio" id="do" name="cut" value="do"> 
							<label for="do">예</label><br> 
							<input type="radio" id="no" name="cut" value="no"> 
							<label for="no">아니오</label>
						</td>
					</tr>
					<tr>
						<th colspan=2>상세설명</th>
						<td colspan=2>
							<textarea id="comm" name="comm" cols="40" rows="4">${pet.comm}</textarea>
						</td>
					</tr>
					<tr>
						<td colspan=4 align=center>
							<input type="submit" value="수정하기" formaction="${pageContext.request.contextPath}/mypetUpdateAction.do">&nbsp;&nbsp;
							<input type="submit" value="삭	제" formaction="${pageContext.request.contextPath}/mypetDeleteAction.do">&nbsp;&nbsp;
							<input type="reset" onclick="window.location.href='${pageContext.request.contextPath}/mypetList.do'" value="취	소">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>