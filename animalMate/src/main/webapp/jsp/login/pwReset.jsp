<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
</head>
<body>
<!-- 비번 재설정 -->
<div class="pw_reset-wrap">
	<div class="pw_reset-header" align="center">
		<h1>비밀번호 재설정</h1>
		<br/><br/>
	</div>
	<!-- 메인시작 -->
	<div class="pw_reset-main" align="center">
		<form class="pw_reset-form" action="pw_reset.do" method="post">
			비밀번호 : <input type="password" class="pw_input" name="pw_input" id="pw_input" placeholder="새 비밀번호를 입력하세요"> <br/><br/>
		비밀번호 확인 : <input type="password" class="pw_input_check" name="pw_input_check" id="pw_input_check" placeholder="비밀번호 확인">
			</div> <!-- 메인 끝 -->
			<!-- 버튼 시작 -->
			<div class="pw_reset-footer" align="center">
			<hr style="border-color: white;" align="left" noshade="noshade" size="1" />
			<button class="pw_reset-change" type="submit">비밀번호 변경</button>&nbsp;&nbsp;
			<a class="id_find-cancel" href="#">취소/닫기</a>
			</div>
		</form>
		</div> <!-- 전체 끝 -->
</body>
</html>