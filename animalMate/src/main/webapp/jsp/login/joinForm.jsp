<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- <link rel="stylesheet" href="../../css/join.css"> -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
function id_input_check(){
	$(".id_input_check").click(function(){
		$("#id").attr("check_result", "fail");
		})
	
		if($("#id").val() == ''){
			alert("아이디를 입력해주세요.")
			return;
		}
		if($("#id").val().length<8){
			alert('아이디는 최소 8자리 이상 입력해주시길 바랍니다.');
			return;
			}
		
		if ($('#id').attr("check_result") == "fail"){
			alert("아이디 중복확인을 해주시기 바랍니다.");
			return false;
		}
		var notko = /[a-zA-Z0-9]/;
		if($('#id').val() != notko){
			alert("한글 및 특수문자는 아이디로 사용할 수 없습니다.");
			return false;
		}
}
</script>
</head>
<body>
<!-- 회원가입창 상단로고 //클릭하면 메인페이지로 이동 -->
	<header class="header">	
			<a href="#" target"_blank">
				<image src="#" id="logo" >
				</image>
			</a>
	</header>
<!-- 회원가입 입력창 -->

<form class="join_form" action="${pageContext.request.contextPath}/joinInsert.do" method="post">

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
                        <input type="text" id="id" class="int" maxlength="20"  placeholder="아이디 입력" check_result="fail">
                        <button type="button" class="id_input_check" onclick="id_input_check()">중복확인</button>
                    </span>
                </div>
		<!-- 비밀번호 입력창 -->
			 <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="text" id="pw1" class="int" maxlength="20"  placeholder="비밀번호 입력">             
                    </span>
                </div>
                
		    <!-- PW2 -->
                <div>
                    <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="text" id="pw2" class="int" maxlength="20"  placeholder="비밀번호 확인">
                    </span>
                </div>
                
                 <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="name" class="int" maxlength="20">
                    </span>
                </div>
                  <!-- nick NAME -->
                <div>
                    <h3 class="join_title"><label for="name">닉네임</label></h3>
                    <span class="box int_nname">
                        <input type="text" id="nname" class="int" maxlength="20">
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
                        <input type="text" id="email" class="int" maxlength="100" placeholder="이메일 입력">
                    </span>
                </div>

                <!-- tel -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" id="mobile" class="int" maxlength="16" placeholder="전화번호 입력">
                    </span>   
                </div>
    			 <!-- 우편 번호  
		<div>
			<h3 class="join_title">
			 <label for="location">우편번호</label></h3>
				<span class="box int_zipcode">
					<input type="text" id="zipcode" class="int" maxlength="100" readonly>
					<input type="button" value="주소찾기" onclick="DaumPostcode()">
				</span>
		</div> 	-->
		<!-- 주소 입력창 -->
		<div>
			<h3 class="join_title">
			 <label for="location">주소</label></h3>
				<span class="box int_location">
					<input type="text" id="location1" class="int" maxlength="100" placeholder="주소 입력"><br>
				</span>
			<h3><label for="location">상세주소</label></h3>
			 	<span class="box int_location">
					<input type="text" id="location2" class="int" maxlength="100"  placeholder="상세주소를 입력해주세요">
				</span>
		</div>
		<!-- 주소 api 모르겠다 
		<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative"> 
		<img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" 
		style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼"> 
		</div> 
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 
		<script> 
		// 우편번호 찾기 화면을 넣을 element 
		var element_wrap = document.getElementById('wrap'); 
		function foldDaumPostcode() {
			element_wrap.style.display = 'none'; } 
		function DaumPostcode() {  
				var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop); 
			new daum.Postcode({ oncomplete: function(data) { 
				var fullAddr = data.address; 
				var extraAddr = ''; 
				if(data.addressType === 'R'){ 
					if(data.bname !== ''){ extraAddr += data.bname; } 
					if(data.buildingName !== ''){ extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName); }  
					fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : ''); } . 
					document.getElementById('zipcode').value = data.zonecode;
					document.getElementById('address1').value = fullAddr; 
					element_wrap.style.display = 'none';
					document.body.scrollTop = currentScroll; 
					$('#address2').focus(); }, 
					onresize : function(size) { element_wrap.style.height = size.height+'px'; }, width : '100%', height : '100%' }).embed(element_wrap);  
					element_wrap.style.display = 'block'; } 
</script> <!-- ----- DAUM 우편번호 API 종료----- --> 

		<br/>
		<br/>
	<!-- 가입&취소 버튼 -->
	<div class="btn_area">
		<button type="submit" id="btn">가입하기</button>&nbsp;&nbsp;&nbsp;
		<button type="button" id="btn" onclick="window.location.href='${pageContext.request.contextPath}/">취소</button> <!-- 메인페이지로 이동 -->
	</div><!-- 가입&취소 버튼 끝 -->

	 		</div> 
           <!-- content-->
         </div> 
        <!-- wrapper -->
	</form>

</body>
</html>