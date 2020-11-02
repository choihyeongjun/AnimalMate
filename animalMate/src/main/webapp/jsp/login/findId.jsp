<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
<!-- 아이디 찾기  -->
<div class="id_find-wrap">
	<div class="id_find_header" align="center">
		<h1>아이디 찾기</h1>
		<br/><br/>
	</div>
	<!-- 메인시작 -->
	<div class="id_find-main" align="center">
	<form class="ld_find-form" action="id_find.do" method="post">
		이름 : <input type="text" class="id_find-name" placeholder="이름을 입력하세요"><br/>
		<br/>
		주민등록번호 : <input type="text" class="jumin1_input" name="jumin1_input" id="jumin1_input"> -
				   <input type="text" class="jumin2_input" name="jumin2_input" id="jumin2_input">
		</div> <!-- 메인 끝 -->
	<div class="id_find-footer" align="center">
	<hr style="border-color: white;" align="left" noshade="noshade" size="1" />
		<button class="id_find-submit" type="submit">아이디 찾기</button>&nbsp;&nbsp;
		<a class="id_find-cancel" href="#">취소/닫기</a>
	</div>
	</form>
</div>  <!-- 전체 감싸는 div 끝 -->
</body>
</html>