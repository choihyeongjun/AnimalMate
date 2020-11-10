<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
$(document).ready(function(){
	$(".int").css("display","block")
});

</script>
<body>
	<h1>내 정보 수정</h1>
		<form id="memberForm"  method="post" enctype="multipart/form-data">
			<div id="wrapper">
				<div id="content">
					<!-- PIC -->
						<div>
							<span class="box">
								<h6>사진</h6><img src="${pageContext.request.contextPath}/images/members_pic/${param.pic}" alt="사진을 넣어주세요" width="100px" height="100px">
								<input type="file" class="int" id="pic" name="pic">
								<button type="button" onclick="picmodify">수정</button>
							</span>
						</div>
					<!-- ID -->
						<div>
							<span class="box">
								<h6>아이디</h6><h5>${members.id}</h5>
							</span>
						</div>
					<!-- PW -->
						<div>
							<span class="box">
								<h6>비밀번호</h6>
								<button type="button" onclick="pwmodify">비밀번호 수정</button>
							</span>
						</div>
					<!-- name -->
						<div>
							<span class="box">
								<h6>이름</h6><h5>${members.name}</h5>
							</span>
						</div>
					<!-- nName -->
						<div>
							<span class="box">
								<h6>아이디</h6><h5>${members.nname}</h5>
								<input type="text" id="nName" class="int" maxlength="20"  name="nName" placeholder="${members.nname}">
								<button type="button" onclick="NNmodify">수정</button>
							</span>
						</div>
					<!-- 가입일자 -->
						<div>
							<span class="box">
								<h6>가입일자</h6><h5>${members.edate}</h5>
							</span>
						</div>
					<!-- point -->
						<div>
							<span class="box">
								<h6>잔여 포인트</h6><h5>${members.point}</h5>
							</span>
						</div>
					<!-- location1 -->
						<div>
							<span class="box">
								<h6>아이디</h6><h5>${members.location1}</h5>
								<input type="text" id="location1" class="int" maxlength="20"  name="location1" placeholder="${members.location1}" >
								<button type="button" onclick="lo1modify">수정</button>
							</span>
						</div>
						<!-- location2 -->
						<div>
							<span class="box">
								<h6>주소</h6><h5>${members.location2}</h5>
								<input type="text" id="location2" class="int" maxlength="20"  name="location2" placeholder="${members.location2}" >
								<button type="button" onclick="lo2modify">수정</button>
							</span>
						</div>
					<!-- EMAIL -->
						<div>
							<span class="box">
								<h6>상세주소</h6><h5>${members.email}</h5>
								<input type="email" id="email" class="int" maxlength="20"  name="email" placeholder="${members.email}">
								<button type="button" onclick="emailmodify">수정</button>
							</span>
						</div>
				</div>	
			</div>
		</form>
</body>
</html>