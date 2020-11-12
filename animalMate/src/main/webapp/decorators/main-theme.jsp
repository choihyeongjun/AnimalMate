<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩 넣기 시작 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>


<style>
#_chatbox{
position: fixed;
	top:350px;
	right:4.5%;
	width:200px;
	hegiht:40px;
}
.chat{
		position: fixed;
		margin-top: 531px;
		right:5%;
		width:200px;
		hegiht:40px;
}

#textMessage {
width: 230px;
height: 100px;
border-radius: 0 0 10px 10px;
border: #ff7d21 4px solid;

}

#user{
    width: 230px;
    background-color: #ff7d21;
    border: none;
    border-radius: 10px 10px 0 0;
  padding-left: 10px;
    font-weight: bold;
}
	#bigcat {
		float: left;
		width: 150px;
		height: 150px;
	}
	
	#bigbigcat {
		width: 300px;
		height: 300px;
		display: inline;
		float: left;
	}
	
	#footerDiv {
		padding: 20px;
		margin: 200px;
	}
	
	.navbar a {
	color : black;
	}
	
	#footicon{
		float: left;
		width: 300px;
		height: 300px;
		margin-right: 90px; 
	}
	
	button {
	background-color: rgb(255,136,38);
	font-weight: bold;
	color : black;
    border : none;
	}
	
	.sendbtn {
	background-color: #ff7d21;
    border-radius: 10px;
    border: none;
    font-size: 18px;
    color : white;
    margin-top: 10px;
    margin-left: 188px;
}
	#messageTextArea {
    width: 230px;
    border-radius: 10px;
    border: #ff7d21 4px solid;
    text-align: left;
    font-weight: bold;	
    }


</style>

<script type="text/javascript">
	$(()=> {
		//로그인버튼
		$("#loginBtn").on({
			"click" : function() {
				location.href="${pageContext.request.contextPath}/goLoginPage.do";
			}
		})
		
		//로그아웃
		$("#logoutBtn").on({
			"click" : function() {
				location.href="${pageContext.request.contextPath}/logout.do";
			}
		})
		
		//쪽지버튼
		$("#messageListBtn").on({
			"click" : function() {
				location.href="${pageContext.request.contextPath}/goMessageListPage.do";
			}
		})
		
		//요청알림버튼
		$("#tradeListBtn").on({
			"click" : function() {
				location.href="${pageContext.request.contextPath}/gotradeListPage.do";
			}
		})
		
		//관리자버튼
		$("#adminBtn").on({
			"click" : function() {
				location.href="${pageContext.request.contextPath}/adminLogin.do";
			}
		})
	
		//1:1 문의내역버튼
		$("#QuestionbdBtn").on({
			"click" : function() {
				location.href="${pageContext.request.contextPath}/questionlist.do";
			}
		})
		
		
	})
		
		

</script>


<decorator:head/>
</head>
<body class="container">
	<a class="logoImage" href="${pageContext.request.contextPath}/main.do">
		<img id="bigcat" alt="사진이없어용" src="${pageContext.request.contextPath}/jsp/main/images/newlogo.JPG">
	</a>
	<div align="right" style="margin-top: 50px">
	<c:if test="${sessionScope.id ne null}">
		<button id="QuestionbdBtn" class="">1:1문의내역</button>
	</c:if>
	
	<button id="tradeListBtn" class="">요청알림</button>
	<button id="messageListBtn" class="">쪽지</button>
	<c:if test="${sessionScope.id eq null}">
		<button id="loginBtn" class="">로그인</button>
	</c:if>
	
	<c:if test="${sessionScope.id ne null}">
		<button id="logoutBtn" class="">로그아웃</button>
	</c:if>
	<c:if test="${sessionScope.id eq 'admin'}">
		<button id="adminBtn" class="">관리자페이지</button>
	</c:if>
	</div>
	<br>
	<nav class="navbar">
  		<a class="navbar-brand" href="${pageContext.request.contextPath}/goNoticeBoardPage.do?p=1"><b>공지사항</b></a>
        <a class="navbar-brand" href="${pageContext.request.contextPath}/sitterList.do"><b>돌봐줄게요</b></a>
        <a class="navbar-brand" href="${pageContext.request.contextPath}/ownerList.do"><b>돌봐주세요</b></a>
        <c:if test="${sessionScope.sessionauthor eq 'users'}">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/jsp/main/wannabeSitter.jsp"><b>시터신청</b></a>
        </c:if>
        <a class="navbar-brand" href="${pageContext.request.contextPath}/goMypagePage.do"><b>마이페이지</b></a>
	</nav>
    <hr/>
    
    <div id="_chatbox" style="display: none">
    <textarea id="messageTextArea" rows="10" cols="30"></textarea>
    <br />
	<form id=box>
		<!-- 유저 명을 입력하는 텍스트 박스(기본 값은 anonymous(익명)) -->
		<input id="user" type="text" value="${id}" disabled>
		<!-- 송신 메시지를 작성하는 텍스트 박스 -->
		<input id="textMessage" type="text">
		<!-- 메세지를 송신하는 버튼 -->
		<input onclick="sendMessage()" value="전송" type="button" class="sendbtn">
		<!-- WebSocket 접속 종료하는 버튼 -->
		
	</form>
	

	</div>
	<img class="chat" src="${pageContext.request.contextPath}/images/img/문의하기.png" />
	<script type="text/javascript">
		// 콘솔 텍스트 에리어 오브젝트
		var messageTextArea = document.getElementById("messageTextArea");
		// 웹 소켓 접속 함수, url 뒤의 파라미터는 callback 함수를 받는다.
		function connectWebSocket(url, message, open1, close1, error1) {
			// WebSocket 오브젝트 생성 (자동으로 접속 시작한다. - onopen 함수 호출)
			let webSocket = new WebSocket(url);
			// 함수 체크하는 함수
			function call(cb, msg) {
				// cb가 함수 타입인지 확인
				if (cb !== undefined && typeof cb === "function") {
					// 함수 호출
					cb.call(null, msg);
				}
			}
			// WebSocket 서버와 접속이 되면 호출되는 함수
			webSocket.onopen = function() {
				// callback 호출
				call(open1);
			};
			// WebSocket 서버와 접속이 끊기면 호출되는 함수
			webSocket.onclose = function() {
				// callback 호출
				call(close1);
			};
			// WebSocket 서버와 통신 중에 에러가 발생하면 요청되는 함수
			webSocket.onerror = function() {
				// callback 호출
				call(error1);
			};
			// WebSocket 서버로 부터 메시지가 오면 호출되는 함수
			webSocket.onmessage = function(msg) {
				// callback 호출
				call(message, msg);
			};
			// 웹 소켓 리턴
			return webSocket;
		}
		// 연결 발생 때 사용할 callback 함수
		var open1 = function() {
			// 콘솔 텍스트에 메시지를 출력한다
			messageTextArea.value += "문의사항을 입력하세냥ʕ ᵔᴥᵔ ʔ\n";
		}
		// 종료 발생 때 사용할 callback 함수
		var close1 = function() {
			// 콘솔 텍스트에 메시지를 출력한다
			messageTextArea.value += "Server Disconnect...\n";
			// 재 접속을 시도한다.
			setTimeout(function() {
				// 재접속
				webSocket = connectWebSocket(
						"ws://localhost:80/animalMate/broadsocket", message,
						open1, close1, error1);
			});
		}
		// 에러 발생 때 사용할 callback 함수
		var error1 = function() {
			messageTextArea.value += "error...\n";
		}
		// 메세지를 받을 때 사용할 callback 함수
		var message = function(msg) {
			// 콘솔 텍스트에 메시지를 출력한다.
			messageTextArea.value += msg.data + "\n";
		};
		// 웹 소켓 생성
		var webSocket = connectWebSocket(
				"ws://localhost:80/animalMate/broadsocket", message, open1,
				close1, error1);
		// Send 버튼을 누르면 호출되는 함수
		function sendMessage() {
			// 유저명 텍스트 박스 오브젝트를 취득
			var user = document.getElementById("user");
			// 송신 메시지를 작성하는 텍스트 박스 오브젝트를 취득
			var message = document.getElementById("textMessage");
			// 콘솔 텍스트에 메시지를 출력한다.
			messageTextArea.value += user.value + "(me) => " + message.value
					+ "\n";
			// WebSocket 서버에 메시지를 전송(형식 「{{유저명}}메시지」)
			webSocket.send("{{" + user.value + "}}" + message.value);
			// 송신 메시지를 작성한 텍스트 박스를 초기화한다.
			message.value = "";
		}
		// Disconnect 버튼을 누르면 호출되는 함수
		function disconnect() {
			// WebSocket 접속 해제
			webSocket.close();
		}
	</script>
    
    
    
    <decorator:body />
    
    <script>
    $(".chat").on({
        "click" : function() {
        	console.log("안녕");
            if ($(this).attr("src") == "${pageContext.request.contextPath}/images/img/문의하기.png") {
                $(".chat").attr("src", "${pageContext.request.contextPath}/images/img/문의종료.png");
                $("#_chatbox").css("display","block");
            } else if ($(this).attr("src") == "${pageContext.request.contextPath}/images/img/문의종료.png") {
                $(".chat").attr("src", "${pageContext.request.contextPath}/images/img/문의하기.png");
                $("#_chatbox").css("display", "none");
            }
        }
    });
</script>
    
    
   <footer id="footer">
	<div class="footWrap_02">
		<div class="footWrap_02_in">
			<img id ="footicon" src="${pageContext.request.contextPath}/jsp/main/images/newlogo.JPG">
			<div class="b">
				<h6><span>애니멀메이트</span>는 반려인과 이웃집의 펫시터를 연결하는 공유 플랫폼 서비스입니다.</h6>
				<div class="tyu_up">
				<ul class="tyu">
					<li><a href="http://epetsitter.co.kr/04_description/des_06.php">이용약관</a></li>
					<li><a href="http://epetsitter.co.kr/04_description/des_06_03.php">개인정보처리방침</a></li>
					<li><a href="http://epetsitter.co.kr/04_description/des_03.php">안전보상프로그램</a></li>
					<li><a href="http://www.facebook.com/epetsitter/" target="_blank"><img src="${pageContext.request.contextPath}/jsp/main/images/facebookIcon.png" height="20px" width="20px"></a></li>
					<li><a href="http://www.instagram.com/epetsitter/" target="_blank"><img src="${pageContext.request.contextPath}/jsp/main/images/instargramIcon.png" height="20px" width="20px"></a></li>
				</ul>
				</div>
				<address>상호 : 주식회사 애니멀메이트    주소 : 대구광역시 중구 국채보상로 537 (수동) 사업자등록번호 : 310-88-01171 <br>
				대표자 : 김상민   전화 : 053-666-6666    팩스 : 053-666-6667    이메일 : <a href="mailto:epetsitter@epetsitter.co.kr">sangmin@animalmate.co.kr</a> 통신판매업신고번호 : 2020-대구중구-1109<br><span class="pcx"><br>
				당 사이트에서 전자결제된 금액에 대한 책임은 (주)애니멀메이트에게 있습니다. 환불 등 필요한 조치가 있을 시 아래로 연락해주시길 바랍니다.<br>
				담당자: 김상민 / 연락처: 053-666-6666</span>
				</address>
				<small>Copyright(c)2020 by <span>animalmate.co.kr</span>. All Rights Reserved.</small>
			</div>
		</div>
	</div>
</footer>
    
</body>
</html>