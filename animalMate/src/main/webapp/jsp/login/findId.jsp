<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
<!-- 아이디 찾기  -->
<div class="id_find-wrap">
	<div class="id_find_header" align="center">
		<h1>아이디 찾기</h1>

	</div>
	<!-- 메인시작 -->
	<div class="id_find-main" align="center">
	<form class="ld_find-form" action="${pageContext.request.contextPath}/id_find.do" method="post">
	      <!-- ID -->
				  <div>
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" id="id" class="int" maxlength="20"  placeholder="아이디 입력" check_result="fail">
                    </span>
                </div>
                 <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="name" class="int" maxlength="20" placeholder="이름 입력">
                    </span>
                </div>
		 <!-- EMAIL -->
                <div>
                    <h3 class="join_title"><label for="email">이메일<span class="optional"></span></label></h3>
                    <span class="box int_email">
                        <input type="text" id="email" class="int" maxlength="100" placeholder="이메일 입력">
                    </span>
                </div>
          <!-- 메인 끝 -->
	<div class="id_find-footer" align="center">
	<hr style="border-color: white;" align="left" noshade="noshade" size="1" />
		<button class="id_find-submit" type="submit">아이디 찾기</button>&nbsp;&nbsp;
		<a href="#" onclick="javascript:window.close()">창닫기</a>
	</div>
	</form>
</div>  <!-- 전체 감싸는 div 끝 -->
</body>
</html>