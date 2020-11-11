<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/memberupdate.css">
<script>
$(document).ready(function(){
	$(".int").hide();
	
$(".modifynn").on("click",function(){
	$("#nName").show();
	$("#over_nname").hide();
	});
$(".modifylo1").on("click",function(){
	$("#location1").show();
	$("#over_loaction1").hide();
	});
$(".modifylo2").on("click",function(){
	$("#location2").show();
	$("#over_loaction2").hide();
	});
$(".modifyem").on("click",function(){
	$("#email").show();
	$("#over_email").hide();
	});
$(".modifytel").on("click",function(){
	$("#tel").show();
	$("#over_tel").hide();
	});

function changepw(){
	window.open("${pageContext.request.contextPath}/jsp/login/pwReset.jsp", "비밀번호 찾기", "width=1000, height=900"); 
}
});	

</script>
</head>
<body>
	<h1>회원정보 수정</h1>
	<br>
	<h2>회원님의 소중한 정보를 안전하게 관리하세요.</h2>
		<form id="memberForm"  method="post" enctype="multipart/form-data">
			<div id="wrapper">
				<div id="content" align="center">
					<table class="table">
						<tr>
							<th class="sub_title">프로필 사진</th>
							<td><img src="${pageContext.request.contextPath}/images/members_pic/${members.pic}" alt="사진을 넣어주세요" width="350px" height="250px" class="image_file_add"><br><br><input type="file" id="pic" name="pic"></td>
							<td></td>
						</tr>
						<tr>
							<th class="sub">아이디</th>
							<td><div class="over" id="over_id">${members.id}</div><div class="under"><input type="text"class="int" maxlength="20"  name="id" value="${members.id}"/></div></td>
							<td></td>
						</tr>
						<tr>
							<th class="sub">비밀번호&nbsp;&nbsp;&nbsp;<button type="button" onclick="changepw()" id="btn_change" class="changepw">변경</button></th>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th class="sub">이름</th>
							<td>${members.name}</td>
							<td></td>		
						</tr>
						<tr>
							<th class="sub">닉네임</th>
							<td><div class="over" id="over_nname">${members.nname}</div><div class="under"><input type="text" id="nName" class="int" maxlength="20"  name="nname" placeholder="${members.nname}" value="${members.nname}"/></div></td>
							<td><button type="button" id="btn_change" class="modifynn">수정</button></td>
						</tr>
						<tr>
							<th class="sub">연락처</th>
							<td><div class="over" id="over_tel">${members.tel}</div><div class="under"><input type="text" id="tel" class="int" maxlength="20"  name="tel" placeholder="${members.tel}" value="${members.tel}"/></div></td>
							<td><button type="button" id="btn_change" class="modifytel">수정</button></td>
						</tr>
						<tr>
							<th class="sub">가입일자</th>
							<td>${members.edate}</td>
							<td></td>	
						</tr>
						<tr>
							<th class="sub">잔여 포인트</th>
							<td>${members.point}</td>
							<td></td>
						</tr>
						<tr>
							<th class="sub">주소</th>
							<td><div class="over" id="over_loaction1">${members.location1}</div><div class="under"><input type="text" id="location1" class="int" maxlength="20"  name="location1" placeholder="${members.location1}" value="${members.location1}"/></div></td>
							<td><button type="button" id="btn_change"class="modifylo1" >수정</button></td>
						</tr>
						<tr>
							<th class="sub">상세주소</th>
							<td><div class="over" id="over_location2">${members.location2}</div><div class="under"><input type="text" id="location2" class="int" maxlength="20"  name="location2" placeholder="${members.location2}" value="${members.location2}"/></div></td>
							<td><button type="button" id="btn_change" class="modifylo2">수정</button></td>
						</tr>
						<tr>
							<th class="sub">이메일</th>
							<td><div class="over" id="over_eamil">${members.email}</div><div class="under"><input type="email" id="email" class="int" maxlength="20"  name="email" placeholder="${members.email}" value="${members.email}"/></div></td>
							<td><button type="button" id="btn_change" class="modifyem">수정</button></td>	
						</tr>		
					</table>
					<div class="btn_area">
						<button class="btn_cancel" type="button" formaction="${pageContext.request.contextPath}/goMypagePage.do">취소</button>
						<button class="btn_submit" type="submit" formaction="${pageContext.request.contextPath}/memberUpdate.do">수정</button>
					</div>
				</div>	
			</div>
		</form>
</body>
</html>