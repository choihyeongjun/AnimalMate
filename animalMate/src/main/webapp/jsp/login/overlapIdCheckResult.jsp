<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
</script>
</head>
<body>
	<div class="overlap_id_check-wrapper" align="center">
	<h3>아이디 중복 확인 결과</h3>
		<form method="post" action></form>
		<!-- ID -->
				  <div>
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" id="id" class="int" maxlength="20"  placeholder="아이디 입력">
                        <button type="button" class="overlap_id_check" onclick="overlapIdCheck()">중복확인</button>
                    </span>
                </div>
	</div>
</body>
</html>