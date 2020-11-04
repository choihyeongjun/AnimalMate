<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
function FindId(){
	window.open("findId.jsp", "아이디 찾기", "width=800, height=550"); 
}

function FindPw(){
	window.open("findPw.jsp", "비밀번호 찾기", "width=800, height=550"); 
}

function formCheck() {
	var id = document.querySelector('#id');
	var pw = document.querySelector('#pw');
	if(id.value == ""){
		alert("사용자 아이디를 입력하세요");
		id.focus();
		return false;
	}
	
	if(pw.value == ""){
		alert("사용자 패스워드를 입력하세요");
		pw.focus();
		return false;
	}
	
	return true;
}
</script>
</head>
<body>
<!-- 전체 로그인 메뉴 감싸는 div -->
<div class="login-wrapper" align="center">
<!-- 회원가입창 상단로고 //클릭하면 메인페이지로 이동 -->
	<header class="header">	
			<a href="#" target"_blank">
				<image src="#" id="logo" >
				</image>
			</a>
	</header>
	<!-- 로그인 입력창 -->
	<div class="login-main">
		<form class="login_form" action="${pageContext.request.contextPath}/login.do" method="post" onsubmit="return formCheck()">
		<!-- ID -->
				  <div>
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" id="id" class="int" maxlength="20" name="id" placeholder="아이디 입력">
                        <br>
                        <span class="error_msg" style="color:red;">${msg1}</span> 
                    </span>
                </div>
			 <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pw">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="text" id="pw" class="int" maxlength="20" name="pw" placeholder="비밀번호 입력">             
                   		<br>
                   	<span class="error_msg" style="color:red;">${msg2}</span> 
                    </span>
                </div>
			</div> <!-- 로그인 입력창 끝 -->
			<br/>
			<!-- 하단 메뉴 //아이디/비번찾기 (추가메뉴)-->
			<div class="login_content_util">
				<button onclick="FindId()" class="findid" style="border:0; outline:0; background-color:white; text-decoration: underline;">
				
					아이디 찾기
				
				</button>&nbsp;&nbsp;
				<button onclick="FindPw()" class="findpw" style="border:0; outline:0; background-color:white; text-decoration: underline;">
				
					비밀번호 찾기
				
				</button>
			</div><!-- 하단 메뉴 //아이디/비번찾기 (추가메뉴) 끝-->
			<br/>
			<!-- 로그인 / 회원가입 버튼-->
			<div class="login_join-button">
			<!-- 로그인 버튼 -->
				<button class="login_button-submit" type="submit">로그인</button>
				<hr> 
			<!-- 회원가입버튼 -->
				<button type="button" class="join_button-joinlink" 
				onclick="location.href='${pageContext.request.contextPath}/joinForm.do'">회원가입</button>
			</div>
		</form>
	</div>
</div>
</body>
</html>