<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인</title>
<style>

 .btn_submit {
    width: 60%;
    height :50px;
    border: 0;
    cursor: pointer;
    background-color: #ff6a2e;
    font-size: 18px;
    font-weight: bold;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
    margin-top:41px;
    margin-left:20px;
    
}
::placeholder {
  color: #ccc;
   font-weight: 500;
}
.int{
	width: 70%;
    height: 40px;
    line-height: 47px;
    font-size: 18px;
    font-weight: bold;
    font-family: NotoSans-Regular,AppleSDGothicNeo-Regular,"맑은 고딕",Malgun Gothic,"돋움",dotum,sans-serif;
    border: none;
    border-bottom: 2px solid;
    border-bottom-color: #ccc;
    margin-bottom: 20px
    
}
h3 {
    margin: 19px 0 8px;
    font-size: 15px;
    font-weight: 700;
    margin-right: 300px;
    margin-bottom: 20px;
}
</style>
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
	<h2>AnimalMate</h2>
		<form method="GET" action ="${pageContext.request.contextPath}/idoverlapcheck.do" onsubmit="return overlap_id_check()">
		<!-- ID -->
				  <div>
                    <h3>아이디 중복 확인</h3>
                    <span class="box int_id">
                        <input type="text" id="id" class="int" maxlength="20" name="id" placeholder="아이디 입력" autofocus>
                        <imput type="hidden" class="overlapIdCheckResult" name="overlapIdCheckResult" id="overlapIdCheckResult" value="0"/><br>
                        <button type="submit" class="btn_submit">중복확인</button>
                    </span>
                </div>
           </form>
	</div>
</body>
</html>