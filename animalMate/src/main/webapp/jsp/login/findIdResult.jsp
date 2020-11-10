<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AnimalMate</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/findresult.css">
<script>
function FindPw(){
	window.open("${pageContext.request.contextPath}/jsp/login/findPw.jsp", "비밀번호 찾기", "width=1000, height=900"); 
}
</script>
</head>
<body>
   <div id="wrapper">
   <div id="subtitle">
   		<h2>입력한 정보와 일치하는<br>애니멀메이트 계정을 확인해주세요</h2>
   		<h4>애니멀메이트에 로그인 할 수 있는 아이디가 표시됩니다.<br>
		오랫동안 로그인하지 않았다면, 비밀번호 찾기를 통해 <br>비밀번호를 재설정 후 로그인하는 것이 안전합니다. </h4>
		<hr>
   	</div>
      <div class="id_find_reuslt-main">
   <h3> ${param.id}</h3>
   <button type="button" onclick="FindPw()" class="findpw"><h6>비밀번호찾기</h6></button>
   <hr>
      </div>
      <div class="id_find_result-footer">
 	<button type="button" class="btn_submit" 
				onclick="location.href='${pageContext.request.contextPath}/jsp/login/loginForm.jsp'">로그인</button>
      </div>
   </div>
</body>
</html>