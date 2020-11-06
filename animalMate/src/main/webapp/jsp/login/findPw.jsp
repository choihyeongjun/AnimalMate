<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script>
function pwfindCheck(){
	var id = document.querySelector('#id');
	var name = document.querySelector('#name');
	var email = document.querySelector('#email');
	
	if(id.value == ""){
		alert("아이디를 입력하세요");
		return false;
	}
	if(name.value == ""){
		alert("이름을 입력하세요");
		return false;
	}
	if(email.value == ""){
		alert("이메일을 입력하세요");
		return false;
	}
	
}
</script>
</head>
<body>
<!-- 비밀번호 찾기  -->
	<div class="pw_find-header" align="center">
		<h1>비밀번호 찾기</h1>
	</div>
	
	<!-- 메인시작 -->
	<div class="pw_find-wrapper" align="center"> 
	<form class="pw_find-form" action="${pageContext.request.contextPath}/findpw.do" method="GET"
	onsubmit="return pwfindCheck()">
		
		 <!-- ID -->
                <div>
                    <h3 class="join_title"><label for="name">아이디</label></h3>
                    <span class="box int_name">
                        <input type="text" id="id" class="int" maxlength="20" name="id" placeholder="아이디입력">
                      <br>
       				 <span class="error_msg" style="color:red;">${msg1}</span> 
                    </span>
                </div>
		 <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="name" class="int" maxlength="20" name="name" placeholder="이름 입력">
                     <br>
       				 <span class="error_msg" style="color:red;">${msg2}</span> 
                    </span>
                </div>
		 <!-- EMAIL -->
                <div>
                    <h3 class="join_title"><label for="email">이메일<span class="optional"></span></label></h3>
                    <span class="box int_email">
                        <input type="text" id="email" class="int" maxlength="100" name="email" placeholder="이메일 입력">
                    <br>
       				 <span class="error_msg" style="color:red;">${msg3}</span> 
                    </span>
                </div>      
	<div class="pw_find-footer" align="center">
	<hr style="border-color: white;" align="left" noshade="noshade" size="1" />
		<button class="pw_find-submit" type="submit">비밀번호 찾기</button>&nbsp;&nbsp;
		<a href="#" onclick="javascript:window.close()">창닫기</a>
	</div>
	</form>
</div> <!-- 끝 -->
</body>
</html>