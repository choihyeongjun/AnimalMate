<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../../css/join.css">
</head>
<body>
<!--전체 회원가입 메뉴 감싸는 div -->
<div class="join-wrap" align="center">
<!-- 회원가입창 상단로고 //클릭하면 메인페이지로 이동 -->
	<header class="join-header">
		<div class="join-warp">
		<h1 class="join-logo">
			<a href="#" class="join-logo-link">
				<image src="#" 
					 class="join-logo-img" alt="animalMate">
				</image>
			</a>
		</div>
		</h1>
	</header>
<!-- 회원가입 입력창 -->
<div class="join-main-wrap" align="center">
<form class="join_form" action="joinInsert.do" method="post">
<!-- 버튼을 제외한 입력메뉴창 -->
	<div class="join-content">
		<!-- 아이디 입력창 -->
		<div class="id_input-wrap">
				<h3><label for="id">아이디</label></h3>
				<span class="id_input-content">
					<input type="text" class="id_input" name="id_input" id="id_input" placeholder="아이디를 입력하세요" maxlength="20"> 
				</span>
				<span class="error_box"></span>
			<a class="id_input_check">중복확인</a>
		</div> 	<!-- 아이디 입력창 끝-->
		<!-- 비밀번호 입력창 -->
			<div class="pw_input-wrap">
				<div class="pw_input-area">
					<!-- <span class="pw_input-icon"></span>
						<!-- 아이콘 추가해야함 -->
						비밀번호 :
					<span class="pw_input-content">
						<input type="password" class="pw_input" name="pw_input" id="pw_input" placeholder="비밀번호를 입력하세요"> 
					</span>
				</div>
		<!-- 비밀번호 입력 가이드 -->
			<div class="pw_input-guide-wrap">
				<div class="pw_input-guide-area">
					<div class="pw_input-guide-first-wrap">
						<span class="pw_input-guide-first-icon"></span>
						<!-- 아이콘 추가해야함 -->
						<span>
							영문/숫자/특수문자 2가지 이상 조합해주세요.
						</span>
					</div>
					<div class="pw_input-guide-second-wrap">
						<span class="pw_input-guide-second-icon"></span>
						<!-- 아이콘 추가해야함 -->
						<span>
							3개 이상 연속되거나 동일한 문자/숫자 제외
						</span>
					</div>
					<div class="pw_input-guide-third-wrap">
						<span class="pw_input-guide-third-icon"></span>
						<!-- 아이콘 추가해야함 -->
						<span>
							아이디 제외
						</span>
					</div>
				</div>
			</div>	<!-- 비밀번호 입력 가이드 끝-->
		</div>	<!-- 비밀번호 입력창 끝 -->		 
		<!-- 비밀번호 입력 확인창 -->
		<div class="pw_input_check-wrap">
			<div class="pw_input-area">
				<!-- <span class="pw_input-icon"></span>
						<!-- 아이콘 추가해야함 -->
						비밀번호 확인 : 
					<span class="pw_input_check-group">
						<input type="password" class="pw_input_check" name="pw_input_check" id="pw_input_check" placeholder="비밀번호 확인"> 
					</span>
			</div>
		</div> 
		<!-- 비밀번호 입력 확인 가이드 -->
			<div class="pw_input_check-guide-wrap">
				<div class="pw_input_check-guide-area">
						<span class="pw_input-guide-first-icon"></span>
						<!-- 아이콘 추가해야함 -->
						<span>
							비밀번호 확인을 위해 비밀번호를 다시 입력하세요.
						</span>
				</div>
			</div>	<!-- 비밀번호 입력 확인 가이드 끝 -->
		<!-- 이름 입력창 -->
		<div class="name_input-wrap">
			<!-- <span class="name_input-icon"></span>
				<!-- 아이콘 추가해야함 --> 이름 : 
				<span class="name_input-group">
					<input type="text" class="name_input" name="name_input" id="name_input" placeholder="이름을 입력하세요"> 
				</span>
		</div> 	<!-- 이름 입력창 끝-->
		<!-- 주민등록번호 입력창 -->
		<div class="jumin_input-wrap">
		<!-- <span class="jumin_input-icon"></span>
				<!-- 아이콘 추가해야함 -->
				주민등록번호 : 
				<span class="jumin_input-group">
					<input type="text" class="jumin1_input" name="jumin1_input" id="jumin1_input"> -
					<input type="text" class="jumin2_input" name="jumin2_input" id="jumin2_input">
				</span>
			<a href="#" class="jumin_input_check">실명인증</a>
		</div> 	<!-- 주민등록번호 입력창 끝-->
		<!-- 연락처 입력창 -->
		<div class="tel_input-wrap">
			<!-- <span class="tel_input-icon"></span>
				<!-- 아이콘 추가해야함 -->
				연락처 : 
				<span class="tel_input-group">
				<select class="tel_input_first">
					<option value="010" selected>010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
				</select>
				- <input type="text" class="tel1_input" name="tel1_input" id="tel1_input"> -
				  <input type="text" class="tel2_input" name="tel2_input" id="tel2_input">
				</span>
			<a href="#" class="tel_input_check">휴대폰인증</a>
		</div> 	<!-- 연락처 입력창 끝-->
		<!-- 주소 입력창 -->
		<div class="adress_input-wrap">
			<!-- <span class="adress_input-icon"></span>
				<!-- 아이콘 추가해야함 -->
				주소 : 
				<span class="adress_input-group">
					<input type="text" class="address1_input" name="address1_input" id="address1_input">
					<a href="#" class="address_input_scan">검색</a><br/>
					상세주소 : 
					<input type="text" class="address2_input" name="address2_input" id="address2_input" placeholder="상세주소를 입력해주세요">
				</span>
		</div> 	<!-- 주소 입력창 끝-->
		<!-- 이메일 입력창 -->
		<div class="email_input-wrap">
			<!-- <span class="email_input-icon"></span>
				<!-- 아이콘 추가해야함 -->
				이메일 : 
				<span class="email_input-group">
					<input type="text" class="email_input" name="email_input" id="email_input">@
					<input type="text" list="email_input_second" placeholder="직접입력">
						<datalist id="email_input_second">
							<option value="gmail.com">지메일</option>
							<option value="naver.com">네이버</option>
							<option value="daum.net">다음</option>
							<option value="kakao.com">카카오</option>
						</datalist>
				</span>
		</div> 	<!-- 이메일 입력창 끝-->
	</div> <!-- 버튼을 제외한 입력메뉴창 끝-->
	<!-- 가입&취소 버튼 -->
	<div class="join_button">
		<button class="join_button-submit" type="submit">가입하기</button>&nbsp;&nbsp;&nbsp;
		<a class="join_button-cancel" href="../main/mainMenu">취소</a> <!-- 메인페이지로 이동 -->
	</div><!-- 가입&취소 버튼 끝 -->
	</form>
</div> <!-- 회원가입 입력창 끝-->
</div>
</body>
</html>