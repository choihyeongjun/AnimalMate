<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script>
</script>
</head>
<body>
   <div align="center" class="id_find_result">
      <div class="id_find_reuslt-main">
   <h6>회원가입 시 사용한 아이디는<Strong>${fn:substring{id,0,4}
      <c:forEach begin="1" end="${fn:length(id)-4}">
         *
      </c:forEach>
      </Strong>입니다</h6>
      </div>
      <div class="id_find_result-footer">
         <button type="button" class="id_find_result-cancel">확인/닫기</button>
      </div>
   </div>
</body>
</html>