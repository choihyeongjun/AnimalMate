<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
#wrapper {
    position: relative;
    height: 90%;
    border: 1px solid #e5e5e5;
    max-width: 600px;
    margin: 60px auto;
    padding: 40px 40px 70px;
    border-radius: 2px;
    box-sizing: border-box;
}
 .close {
    width: 200px;
    height :50px;
    border: 0;
    cursor: pointer;
    background-color: #eee;
    font-size: 18px;
    font-weight: bold;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
    float: left;
    margin-left: 170px;
    margin-bottom: 40px;
}
h3 {
    margin: 19px 0 8px;
    font-size: 22px;
    font-weight: 700;
    margin-right: 250px;
}
h4{
	margin: 19px 0 8px;
    font-size: 20px;
    font-weight: 500;
    margin-right: 100px;
    margin-bottom: 10px;
    line-height: 25px;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
</script>
</head>
<body>
	<div id="wrapper">
	  <div class="overlap_id_check-main">
	     <h3>${param.id}</h3>
	    	<br><h4>아이디는 사용가능한 아이디 입니다.</h4>
       		<button type="button" onclick="javascript:window.close()" class="close">창닫기</button>   			
            </div>
      </div>
</body>
</html>