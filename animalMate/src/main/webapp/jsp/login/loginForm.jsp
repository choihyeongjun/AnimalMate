<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<!-- 전체 로그인 메뉴 감싸는 div -->
<div class="login-wrapper" align="center">
<!-- 로그인창 상단로고 //클릭하면 메인페이지로 이동 -->
	<header class="login-header">
		<h1 class="login-logo">
			<a href="#" class="login-logo-link">
				<image src="#" 
					 class="login-logo-img" alt="animalMate">
				</image>
			</a>
		</h1>
	</header>
	<!-- 로그인 입력창 -->
	<div class="login-main">
		<form class="login_form" action="login.do" method="post">
		<!-- 아이디 입력창 -->
			<div class="id_input-wrap">
				<!-- <span class="id_input-icon"></span>
				<!-- 아이콘 추가해야함 -->
				아이디 : 
				<span class="id_input-group">
					<input type="text" class="id_input" name="id_input" id="id_input" placeholder="아이디를 입력하세요"> 
				</span>
			</div>
			<br/>
			<!-- 비밀번호 입력창 -->
				<div class="pw_input-wrap">
				<!-- <span class="pw_input-icon"></span>
					<!-- 아이콘 추가해야함 -->
					비밀번호 : 
				<span class="pw_input-group">
					<input type="text" class="pw_input" name="pw_input" id="pw_input" placeholder="비밀번호를 입력하세요"> 
				</span>
			</div> <!-- 로그인 입력창 끝 -->
			<br/>
			<!-- 하단 메뉴 //아이디/비번찾기 (추가메뉴)-->
			<div class="login_content_util">
				<a href="#" class="id_find-link">
				
					아이디 찾기
				
				</a>&nbsp;&nbsp;
				<a href="#" class="pw_find-link">
				
					비밀번호 찾기
				
				</a>
			</div><!-- 하단 메뉴 //아이디/비번찾기 (추가메뉴) 끝-->
			<br/>
			<!-- 로그인 / 회원가입 버튼-->
			<div class="login_join-button">
			<!-- 로그인 버튼 -->
				<button class="login_button-submit" type="submit">로그인</button>
				<hr class="login_separater"> <!-- 줄바꿈 -->
			<!-- 회원가입버튼 -->
				<a ref="#" class="join_button-joinlink">회원가입</a>
			</div>
		</form>
	</div>
</div>
</body>
</html>