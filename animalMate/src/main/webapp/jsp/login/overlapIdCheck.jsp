<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
function overlap_id_check(){
	var id = document.querySelector('#id');
	
	if(id.value == ""){
		alert("아이디를 입력하세요");
		return false;
	}
	if(id.value.length<8){
		alert('아이디는 최소 8자리 이상 입력해주시길 바랍니다.');
		return false;
	}
	if(id.value <"0" || id.value>"9" && id.value<"A" || id.value>"Z" && id.value <"a" || id.value >"z"){
		alert("영문 및 숫자만 사용 가능합니다.");
		return false;
	}
	if(id.value.search(/\s/) != -1){
		alert("아이디는 빈 칸을 포함 할 수 없습니다.");
		return false;
	}
	if(form.overlapIdCheckResult.value =="0")	{
		alert("아이디 중복확인을 반드시 해주세요.");
		return false;
	}else{
		form.overlapIdCheckResult.value = "1";		
	}
	alert("사용가능한 아이디입니다.");
		return true;
	}
</script>
</head>
<body>

	<div class="overlap_id_check-wrapper" align="center">
	<h3>아이디 중복 확인</h3>
		<form method="GET" action ="${pageContext.request.contextPath}/idoverlapcheck.do" onsubmit="return overlap_id_check()">
		<!-- ID -->
				  <div>
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" id="id" class="int" maxlength="20" name="id" placeholder="아이디 입력" autofocus>
                        <imput type="hidden" class="overlapIdCheckResult" name="overlapIdCheckResult" id="overlapIdCheckResult" value="0"/>
                        <button type="submit">중복확인</button>
                    </span>
                </div>
           </form>
	</div>
</body>
</html>