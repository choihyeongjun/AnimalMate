<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/find.css">
<script>
function idfindCheck(){
	var name = document.querySelector('#name');
	var email = document.querySelector('#email');
	
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
<!-- 아이디 찾기  -->
	<div class="id_find_header" align="center">
		<h1>AnimaMate</h1>
	</div>
	
	<!-- 메인시작 -->
	<div id="wrapper">
	<div class="id_find-main" align="center">
	<form class="ld_find-form" action="${pageContext.request.contextPath}/id_find.do" method="GET"
	onsubmit="return idfindCheck()">
		<div id="subtitle">
			<h2>이름, 이메일로 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아이디를 찾습니다.</h2>
			<br>
		</div>
          <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="name" class="int" maxlength="20" name="name" placeholder="이름 입력">
                    </span>
                </div>
		 <!-- EMAIL -->
                <div>
                    <h3 class="join_title"><label for="email">이메일<span class="optional"></span></label></h3>
                    <span class="box int_email">
                        <input type="text" id="email" class="int" maxlength="100" name="email" placeholder="이메일 입력">
                    </span>
                </div>
                	 <span class="error_msg">${msg}</span> 
          <!-- 메인 끝 -->
	<div class="id_find-footer" align="center">
		<button class="btn_submit" type="submit">아이디 찾기</button>&nbsp;&nbsp;
		<!--  <a href="#" onclick="javascript:window.close()">창닫기</a>-->
	</div>
	</form>
	</div>
	</div>
</body>
</html>