<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AnimaMate</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pwreset.css">
<script>
function pwCheck(){
	var pw1 = document.querySelector('#pw1');
	var pw2= document.querySelector('#pw2');
	
	if(pw1.value == "" || pw1.value == "null"){
		alert("비밀번호를 입력하세요");
		return false;
	}
	if(pw1.value.search(/\s/) != -1){
		alert("비밀번호는 빈 칸을 포함 할 수 없습니다.");
		return false;
	}
	if(pw2.value == "" || pw2.value =="null"){
		alert("비밀번호 확인칸을 입력 해주세요")
		return false;
	}
	if(pw1.value != pw2.value){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
}

function submit{
	$(".btn_submit").on("click",function(){
		window.close();
	});
}
</script>
</head>
<body>
${msg1}
${msg2}
${msg3}
<!-- 비번 재설정 -->
	<div id="wrapper">
		<h2>새로운 비밀번호를 입력해주세요.</h2>
	<br>
	<!-- 메인시작 -->
	<div class="pw_reset-main" align="center">
		 <form class="join_form" action="${pageContext.request.contextPath}/resetPw.do" method="post" 
		 onsubmit="return pwCheck()">
		  <!-- PW1 -->
			 <div>
                    <h3>비밀번호</h3>
                    <span class="box int_pass">
                        <input type="text" id="pw1" class="int" name="pw" maxlength="20"  placeholder="비밀번호(8~20자리)">             
                    </span>
                </div> 
		    <!-- PW2 -->
                <div>
                    <span class="box int_pass_check">
                        <input type="text" id="pswd2" class="int" maxlength="20"  placeholder="비밀번호 재입력">
                    </span>
                </div>
			<!-- 버튼 시작 -->
			<div class="pw_reset-footer" align="center">
			<hr style="border-color: white;" align="left" noshade="noshade" size="1" />
			<button class="btn_submit" type="submit">비밀번호 변경</button>
			</div>
		</form>
		</div>
		</div> <!-- 전체 끝 -->
</body>
</html>