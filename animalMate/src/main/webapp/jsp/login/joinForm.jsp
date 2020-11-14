<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/joinform.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
var chkyn = 0;
$(function(){
	$("#id").change(function(){
		chkyn = 0;
		$("#error_msg").text("");
		
	})
	
	$("#idchk").click(function(){
	var id = $("#id").val();
	
	$.ajax({
		async:true,
		url:'${pageContext.request.contextPath}/ajax/idoverlapcheck.do',
		type: 'get',
		data: {id: id},
		dataType:'json',
		error:function(error){
			alert("error :" + error);
		},
		success:function(data){
			chkyn = data;
			if(data == 0 ){
				$("#error_msg").text("사용중인 아이디입니다.");
				$("#error_msg").css("color","red");
				$("btn_submit").attr("disabled",true);
				$("#id").focus();
			}else{
				$("#error_msg").text("사용가능한 아이디입니다.");
				$("#error_msg").css("color","blue");
				$("btn_submit").attr("disabled",false);
				$("#id").focus();
				}
			}
		});
	});
});

function formCheck(){
	
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
	
	
	if(id.value == ""){
		alert("아이디를 입력하세요");
		id.focus();
		return false;
	}
	
	if(chkyn == 0){
		alert("아이디 중복체크를 해주세요.");
		return false;
	}
	if(id.value.search(/\s/) != -1){
		alert("비밀번호는 빈 칸을 포함 할 수 없습니다.");
		return false;
	}
	
	if(pw1.value == ""){
		alert("비밀번호를 입력하세요");
		pw1.focus();
		return false;
	}
	if(pw1.value.length<8){
		alert('비밀번호는 최소 8자리 이상 입력하세요');
		pw1.value ="";
		pw1.focus();
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

	if(name.value == "" || name.value == "null"){
		alert("이름을 입력하세요");
		return false;
	}
	
	if(nname.value == "" || nname.value == "null"){
		alert("닉네임을 입력하세요");
		return false;
	}	
	if(zoomin1.value == "" || zoomin1.value == "null"){
		alert("주민등록번호를 입력하세요");
		return false;
	}
	if(zoomin2.value == "" || zoomin2.value == "null"){
		alert("주민등록번호를 입력하세요");
		return false;
	}
	
	if(tel.value == "" || tel.value == "null"){
		alert("휴대폰 번호를 입력하세요");
		return false;
	}
	if(location1.value == "" || location1.value == "null"){
		alert("주소를 입력하세요");
		return false;
	}
	if(location2.value == "" || location2.value == "null"){
		alert("상세주소를 입력하세요");
		return false;
	}
	return false;
}
	
</script>
</head>
<body>
<!-- 회원가입창 상단로고 //클릭하면 메인페이지로 이동 -->
	<header class="header" align="center">	
			<a href="${pageContext.request.contextPath}/jsp/main/mainMenu.jsp" target="_blank">
				<image src="${pageContext.request.contextPath}/jsp/main/images/newlogo.JPG" id="logo" >
				</image>
			</a>
	</header>
<!-- 회원가입 입력창 -->

<form class="join_form" action="${pageContext.request.contextPath}/joinInsert.do" method="post" onsubmit="return formCheck();">

	 <!-- wrapper -->
        <div id="wrapper">
	 <!-- content-->
            	<div id="content">   
            	<h2>애니멀메이트 <br>가입 정보를 입력해주세요.</h2>     	
      <!-- ID -->
				  <div>
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" id="id" class="int" maxlength="20"  name="id" placeholder="아이디 입력">
                      	<div align="right">
                      	<div align="left" id="error_msg"></div>
                        <button type="button" id="idchk" class="id_input_check">중복확인</button>
                  		</div>
                    </span>
                </div>
		<!-- 비밀번호 입력창 -->
			 <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" id="pw1" class="int" maxlength="20" name="pw" placeholder="비밀번호 (8~20자리)">             
                    </span>
                </div>
                
		    <!-- PW2 -->
                <div>
                    <span class="box int_pass_check">
                        <input type="password" id="pw2" class="int" maxlength="20" name="pw2"placeholder="비밀번호 재입력" >
                    </span>
                </div>
                
                 <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="name" class="int" name="name"maxlength="20" placeholder="이름을 입력해주세요.">
                    </span>
                </div>
                  <!-- nick NAME -->
                <div>
                    <h3 class="join_title"><label for="name">닉네임</label></h3>
                    <span class="box int_nname">
                        <input type="text" id="nname" class="int" name="nName"maxlength="20" placeholder="닉네임을 입력해주세요.">
                    </span>
                </div>
            <!-- 주민등록번호 -->
		<div>
			 <h3 class="join_title"><label for="zoomin">주민등록번호 </label></h3>
				<span class="box int_zoomin">
					<input type="text" class="zoo" name="zoomin1" id="zoomin1" maxlength="6"> -
					<input type="password" class="zoo" name="zoomin2" id="zoomin2" maxlength="7">
				</span>
		</div> 	
                <!-- EMAIL -->
                <div>
                    <h3 class="join_title"><label for="email">이메일<span class="optional"></span></label></h3>
                    <span class="box int_email">
                        <input type="email" id="email" class="int" maxlength="20" name="email"placeholder="이메일 입력">
                    </span>
                </div>

                <!-- tel -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" id="mobile" class="int" maxlength="20" name="tel" placeholder="전화번호 입력">
                    </span>   
                </div>
		
		<div>
			<h3 class="join_title">
			 <label for="location">주소</label></h3>
				<span class="box int_location">
					<input type="text" id="location1" class="int" maxlength="100" name="location1" placeholder="주소 입력"><br>
				</span>
			 	<span class="box int_location">
					<input type="text" id="location2" class="int" maxlength="100"  name="location2" placeholder="상세주소를 입력해주세요">
				</span>
		</div>
		<br/>
		<br/>
	<!-- 가입&취소 버튼 -->
	<div class="btn_area" align="center">
		<button type="submit" id="btn_submit">가입하기</button><br>
		<button type="button" id="btn_cancel" onclick="window.location.href='${pageContext.request.contextPath}/main.do'">취소</button> <!-- 메인 페이지로이동 -->
	</div><!-- 가입&취소 버튼 끝 -->
	 		</div> 
           <!-- content-->         </div> 
        <!-- wrapper -->
	</form>
</body>
</html>
