<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
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
</script>
</head>
<body>
<!-- 비번 재설정 -->
	<div class="pw_reset-header" align="center">
		<h1>비밀번호 재설정</h1>
		<br/><br/>
	</div>
	<!-- 메인시작 -->
	<div class="pw_reset-main" align="center">
		 <form class="join_form" action="${pageContext.request.contextPath}/resetPw.do" method="post" 
		 onsubmit="return pwCheck()">
		  <!-- PW1 -->
			 <div>
                    <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="text" id="pw1" class="int" name="pw" maxlength="20"  placeholder="비밀번호 입력">             
                    </span>
                </div> 
		    <!-- PW2 -->
                <div>
                    <h3 class="join_title"><label for="pw2">비밀번호 확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="text" id="pswd2" class="int" maxlength="20"  placeholder="비밀번호 확인">
                    </span>
                </div>
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