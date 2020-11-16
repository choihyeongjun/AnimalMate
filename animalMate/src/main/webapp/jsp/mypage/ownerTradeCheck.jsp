<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>돌봐주세요 게시판 거래</title>
<script>
function formCheck(){
	var myup = document.myupAction;
	var userp = ${userP};
	var price = ${tbs.price};
	
	if ($(':radio[name="id"]:checked').length < 1) {
		 alert('돌봄이을 선택해주세요!');                        
		return false;
	}else if(userp < price){
		alert('포인트 부족');  
		return false;
	}else{
		return true;   		
	}
}
</script>
</head>
<body>
	<br>
	<h2>돌봐주세요 게시판 돌봄이 수락하기</h2>
	<br>

	<h3>${tbs.title}</h3>
	<p>${tbs.ttime}</p>

	<div class="row">
		<h4>돌봄 동물 리스트</h4>
		<div class="mypetListView">
			<table class="table">
				<tr>
					<th>사진</th>
					<th>이름</th>
					<th width=6%>나이</th>
					<th>성별</th>
					<th>분류</th>
					<th>세부분류</th>
					<th width=9%>중성화</th>
					<th width=30%>설명</th>
				</tr>
				<c:forEach var="pet" items="${tpet}">
					<tr>
						<td><img
							src="${pageContext.request.contextPath}/images/pet_pic/${pet.pic}"
							alt="사진을 넣어주세요" width="100px" height="100px"></td>
						<td>${pet.name}</td>
						<td>${pet.age}</td>
						<td>${pet.gender}</td>
						<td>${pet.type}</td>
						<td>${pet.detailType}</td>
						<td>${pet.cut}</td>
						<td>${pet.comm}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

	<div class="row">
		<div class="ownerFormCheckView">
			<h3>돌봄 세부조건</h3>
			<table class="table">
				<tr>
					<th width=30%>근무지역</th>
					<td>${tbs.location1}</td>
				</tr>
				<tr>
					<th>상세지역</th>
					<td>${tbs.location2}</td>
				</tr>
				<tr>
					<th>근무날짜</th>
					<td>${tbs.sdate} ~ ${tbs.edate}</td>
				</tr>
				<tr>
					<th>근무시간</th>
					<td>${tbs.stime} ~ ${tbs.etime}</td>
				</tr>
				<tr>
					<th>거래금액</th>
					<td>${tbs.price}p</td>
				</tr>
			</table>
		</div>

		<div class="ownerFormCheckView">
			<h3>세부내용</h3>
			<div class="ownerFormCheckText">${tbs.comm}</div>
		</div>
	</div>
	<hr>

	<br>

	
	
	
	<div class="row">
		<h3>신청자 리스트</h3>
	</div>
	<div class="ownerFormCheckButton">
			  <form id="otcAction" name= "otcAction" action="${pageContext.request.contextPath}/ownerTradeCheckAction.do" method="get" onsubmit="return formCheck()">
			<div class = "row">
				<button class = "mypetListButton">거래 수락</button><br>
				<div style="visibility: hidden;">
					<input type="text" id="code" name="code" value="${tbs.code}">
				</div>
			</div>
			
			<div class = "mypetListView">
				<table class="table">
					<tr>
						<th width = 3%></th>
						<th width = 30%>사진</th>
						<th>이름</th>
						<th>나이</th>
						<th>성별</th>
						<th width = 15%>상세페이지</th>
					</tr>
					<c:forEach var="suser" items="${subUser}">
						<tr>
							<td><input type="radio" id="id" name="id" value="${suser.id}"></td>
							<td><img src="${pageContext.request.contextPath}/images/members_pic/${suser.pic}" alt="사진을 넣어주세요" width="100px" height="100px"></td>
							<td>${suser.name}</td>
							<td>${suser.age}</td>
							<td>${suser.gender}</td>
							<td>					
								<button style = "margin:5px; background-color:rgb(255, 164, 89);"onclick="window.location.href='${pageContext.request.contextPath}/profile.do?id=${suser.id}'">더보기</button><br>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		
	</form>
	</div>

</body>
</html>