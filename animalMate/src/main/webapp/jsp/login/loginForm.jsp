<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginform.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
function FindId(){
	window.open("${pageContext.request.contextPath}/jsp/login/findId.jsp", "아이디 찾기", "width=1000, height=750"); 
}

function FindPw(){
	window.open("${pageContext.request.contextPath}/jsp/login/findPw.jsp", "비밀번호 찾기", "width=1000, height=900"); 
}

function formCheck() {
	var id = document.querySelector('#id');
	var pw = document.querySelector('#pw');
	if(id.value == ""){
		alert("아이디를 입력하세요");
		id.focus();
		return false;
	}
	
	if(pw.value == ""){
		alert("패스워드를 입력하세요");
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
			<a href="${pageContext.request.contextPath}/jsp/main/mainMenu.jsp" target="_blank">
				<image src="${pageContext.request.contextPath}/jsp/main/images/newlogo.JPG" id="logo" >
				</image>
			</a>
	</header>
	<!-- 로그인 입력창 -->
	<div class="login-main">
		<form class="login_form" action="${pageContext.request.contextPath}/login.do" method="post" onsubmit="return formCheck()">
		<!-- ID -->
				  <div>
                    <span class="box int_id">
                        <input type="text" id="id" class="int" maxlength="20" name="id" placeholder="아이디">
                        <br>
                        <span class="error_msg">${msg1}</span> 
                    </span>
                </div>
			 <!-- PW1 -->
                <div>
                    <span class="box int_pass">
                        <input type="password" id="pw" class="int" maxlength="20" name="pw" placeholder="비밀번호">          
                   		<br>
                   	<span class="error_msg">${msg2}</span> 
                    </span>
                </div>
			</div> <!-- 로그인 입력창 끝 -->
			<br/>
			<!-- 하단 버튼 -->
			<div class="login_content_util">
						<!-- 로그인 버튼 -->
				<button class="btn_submit" type="submit">로그인</button><br>
		    
		    <div class="login_join-button">
				<button type="button" class="btn_join" 
				onclick="location.href='${pageContext.request.contextPath}/jsp/login/joinCheck.jsp'">회원가입</button>
				<button type="button" onclick="FindId()" class="findid">아이디 찾기</button>
				<button type="button" onclick="FindPw()" class="findpw">비밀번호 찾기</button>
			</div>
			<!-- 로그인 / 회원가입 버튼-->
		</form>
	</div>
</body>
</html>