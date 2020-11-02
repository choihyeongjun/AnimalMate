<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">

<title>Insert title here</title>
<style>
	#bigcat {
		width: 30px;
		height: 30px;
	}
	
	#bigbigcat {
		width: 100px;
		height: 100px;
		display: inline;
		float: left;
	}
	
	#footerDiv {
		padding: 20px;
		margin: 200px;
	}
	
	.navbar a {
	color : rgb(15,162,226);
	}
	
	#footicon{
		width: 100px;
		height: 100px;
	}
</style>

<!-- 부트스트랩 넣기 시작 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
	integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
	crossorigin="anonymous"></script>
<!-- 부트스트랩 넣기 끝 -->

<decorator:head/>
</head>
<body class="container">
	<div align="right" style="margin-top: 50px">
	<button>요청알림</button>
	<button>쪽지</button>
	<button>로그인</button>
	</div>
	<br>
	<nav class="navbar">
		<img id="bigcat" alt="사진이없어용" src="${pageContext.request.contextPath}/images/큰소리.png">
  		<a class="navbar-brand" href="#" >공지사항</a>
        <a class="navbar-brand" href="#">돌봐줄께요</a>
        <a class="navbar-brand" href="#">돌봐주세요</a>
        <a class="navbar-brand" href="#">마이페이지</a>
	</nav>
    <hr />
    
    
    <decorator:body />
    
    
    <hr />
   <footer id="footer">
	<div class="footWrap_02">
		<div class="footWrap_02_in">
			<div class="a"><a href="http://epetsitter.co.kr"><img id ="footicon" src="${pageContext.request.contextPath}/images/큰소리.png"></a></div>
			<div class="b">
				<h6><span>이웃집펫시터</span>는 반려인과 이웃집의 펫시터를 연결하는 공유 플랫폼 서비스입니다.</h6>
				<div class="tyu_up">
				<ul class="tyu">
					<li><a href="http://epetsitter.co.kr/04_description/des_06.php">이용약관</a></li>
					<li><a href="http://epetsitter.co.kr/04_description/des_06_03.php">개인정보처리방침</a></li>
					<li><a href="http://epetsitter.co.kr/04_description/des_03.php">안전보상프로그램</a></li>
					<li><a href="http://www.facebook.com/epetsitter/" target="_blank"><img src="/img/common/fa_01.png"></a></li>
					<li><a href="http://www.instagram.com/epetsitter/" target="_blank"><img src="/img/common/fa_03.png"></a></li>
				</ul>
				</div>
				<address>상호 : 주식회사 애니멀메이트    주소 : 부산광역시 남구 수영로 312 21센츄리시티 오피스텔 1526호 (대연동) 사업자등록번호 : 310-88-01170 <a href="https://teht.hometax.go.kr/websquare/websquare.html?w2xPath=/ui/ab/a/a/UTEABAAA13.xml" target="_blank"><img src="/img/common/f_info.gif" alt="사업자정보확인"></a> <br>
				대표자 : 김태호   전화 : 051-610-1526    팩스 : 051-610-1527    이메일 : <a href="mailto:epetsitter@epetsitter.co.kr">epetsitter@epetsitter.co.kr</a> 통신판매업신고번호 : 2018-부산남구-0429<br><span class="pcx"><br>
				당 사이트에서 전자결제된 금액에 대한 책임은 (주)태호컴퍼니에게 있습니다. 환불 등 필요한 조치가 있을 시 아래로 연락해주시길 바랍니다.<br>
				담당자: 김태호 / 연락처: 051-610-1526</span>
				</address>
				<small>Copyright(c)2018 by <span>epetsitter.co.kr</span>. All Rights Reserved.</small>
			</div>
		</div>
	</div>
</footer>
    
</body>
</html>