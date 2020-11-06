<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
function id_input_check(){
	window.open("overlapIdCheck.jsp", "아이디 중복 확인", "width=400, height=250"); 
}

	var id = document.querySelector('#id');
	var pw1 = document.querySelector('#pw1');
	var pw2= document.querySelector('#pw2');
	var name = document.querySelector('#name');
	var nname = document.querySelector('#nname');
	var zoomin1 = document.querySelector('#zoomin1');
	var zoomin2 = document.querySelector('#zoomin2');
	var email = document.querySelector('#email');
	var tel = document.querySelector('#tel');
	var location1 = document.querySelector('#location1');
	var location2 = document.querySelector('#location2');
	
function formCheck(){
	pwCheck();
	nameCheck();
	emailCheck();
	zoominCheck();
	telCheck();
	
	return true;
}
	
function pwCheck(){
	if(pw1.value == "" || pw1.value == "null"){
		alert("비밀번호를 입력하세요");
		return false;
	}
	if(pw1.value.length<6){
		alert('비밀번호는 최소 8자리 이상 입력하세요');
		return false;
	}
	if(pw1.value <"0" || id.value>"9" && id.value<"A" || id.value>"Z" && id.value <"a" || id.value >"z"){
		alert("영문 및 숫자만 사용 가능합니다.");
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

function nameCheck(){

	if(name.value == "" || name.value == "null"){
		alert("이름을 입력하세요");
		return false;
	}
	if(name.value <"가" || id.value>"힣" && id.value<"A" || id.value>"Z" && id.value <"a" || id.value >"z"){
		alert("한글 및 영문 대,소문자를 사용하세요")
		return false;
	}
}

function emailCheck(){
	var emailPattern = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/;
	
	if(email.value != emailPattern){
		alert("올바른 형식의 이메일이 아닙니다.")
		return false;
	}
}

function zoominCheck(){
	if(zoomin1.value == "" || zoomin1.value == "null"){
		alert("주민등록번호를 입력하세요");
		return false;
	}
	if(zoomin2.value == "" || zoomin2.value == "null"){
		alert("주민등록번호를 입력하세요");
		return false;
	}
	if(zoomin1.value <"0" || zoomin1.value >"9"){
		alert("올바른 주민등록번호 양식이 아닙니다.");
		return false;
	}
	if(zoomin2.value <"0" || zoomin2.value >"9"){
		alert("올바른 주민등록번호 양식이 아닙니다.");
		return false;
	}
}
function telCheck(){
	var isPhoneNum = /([01]{2})([01679]{1})([0-9]{3,4})([0-9]{4})/;
	
	if(tel.value == "" || tel.value == "null"){
		alert("휴대폰 번호를 입력하세요");
		return false;
	}
	if(tel.value != isPhoneNum){
		alert("올바른 휴대폰 번호 양식이 아닙니다.");
		return false;
	}
}

</script>
</head>
<body>
<!-- 회원가입창 상단로고 //클릭하면 메인페이지로 이동 -->
	<header class="header">	
			<a href="#" target ="_blank">
				<image src="#" id="logo" >
				</image>
			</a>
	</header>
<!-- 회원가입 입력창 -->

<form class="join_form" action="${pageContext.request.contextPath}/joinInsert.do" method="post" onsubmit="return formCheck()">

	 <!-- wrapper -->
        <div id="wrapper">
	 <!-- content-->
            	<div id="content">        	
      <!-- ID -->
				  <div>
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" id="id" class="int" maxlength="20"  name="id" placeholder="아이디 입력">
                        <button type="button" class="id_input_check" onclick="id_input_check()">중복확인</button>
                    </span>
                </div>
		<!-- 비밀번호 입력창 -->
			 <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="text" id="pw1" class="int" maxlength="20" name="pw" placeholder="비밀번호 입력">             
                    </span>
                </div>
                
		    <!-- PW2 -->
                <div>
                    <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="text" id="pw2" class="int" maxlength="20" name="pw2"placeholder="비밀번호 확인" disable;>
                    </span>
                </div>
                
                 <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="name" class="int" name="name"maxlength="20">
                    </span>
                </div>
                  <!-- nick NAME -->
                <div>
                    <h3 class="join_title"><label for="name">닉네임</label></h3>
                    <span class="box int_nname">
                        <input type="text" id="nname" class="int" name="nName"maxlength="20">
                    </span>
                </div>
            <!-- 주민등록번호 -->
		<div>
			 <h3 class="join_title"><label for="zoomin">주민등록번호 </label></h3>
				<span class="box int_zoomin">
					<input type="text" class="int" name="zoomin1" id="zoomin1" maxlength="6"> -
					<input type="text" class="int" name="zoomin2" id="zoomin2" maxlength="7">
				</span>
			<a href="#" class="zoomin">실명인증</a>
		</div> 	
              
                <!-- EMAIL -->
                <div>
                    <h3 class="join_title"><label for="email">이메일<span class="optional"></span></label></h3>
                    <span class="box int_email">
                        <input type="text" id="email" class="int" maxlength="100" name="email"placeholder="이메일 입력">
                    </span>
                </div>

                <!-- tel -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" id="mobile" class="int" maxlength="16" name="tel" placeholder="전화번호 입력">
                    </span>   
                </div>
		
		<div>
			<h3 class="join_title">
			 <label for="location">주소</label></h3>
				<span class="box int_location">
					<input type="text" id="location1" class="int" maxlength="100" name="location1" placeholder="주소 입력"><br>
				</span>
			<h3><label for="location">상세주소</label></h3>
			 	<span class="box int_location">
					<input type="text" id="location2" class="int" maxlength="100"  name="location2" placeholder="상세주소를 입력해주세요">
				</span>
		</div>
		<br/>
		<br/>
	<!-- 가입&취소 버튼 -->
	<div class="btn_area">
		<button type="submit" id="btn">가입하기</button>&nbsp;&nbsp;&nbsp;
		<button type="button" id="btn" onclick="window.location.href='${pageContext.request.contextPath}/main.do'">취소</button> <!-- 메인 페이지로이동 -->
	</div><!-- 가입&취소 버튼 끝 -->
	 		</div> 
           <!-- content-->
         </div> 
        <!-- wrapper -->
	</form>
</body>
</html>