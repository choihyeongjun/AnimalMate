<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function formCheck(){
	var myup = document.myupAction;
	if ($(':radio[name="code"]:checked').length < 1) {
		 alert('동물을 선택해주세요!');                        
		return false;
	}
	return true;   
}
</script>
</head>
<body>
	<br>
	<h1>마이 펫</h1><br>
	<button class = "mypetListButton" onclick="window.location.href='${pageContext.request.contextPath}/mypetForm.do'">펫 등록</button>
	<div class="mypetListButton" style="background-color: white; width: 10px;">&nbsp;</div>
	<form id="myupAction" name= "myupAction" action="${pageContext.request.contextPath}/mypetUpdate.do" method="get" onsubmit="return formCheck()">	
		<button class = "mypetListButton">수정</button><br>
		
			<div class = "mypetListView">
				<table class="table">
					<tr>
						<th width = 3%></th>
						<th>이름</th>
						<th width = 6%>나이</th>
						<th>성별</th>
						<th>분류</th>
						<th>세부분류</th>
						<th width = 9%>중성화</th>
						<th width = 30%>설명</th>
						<th>사진</th>
					</tr>
					<c:forEach var="pet" items="${pets}">
						<tr>
							<td><input type="radio" id="code" name="code" value="${pet.code}"></td>
							<td>${pet.name}</td>
							<td>${pet.age}</td>
							<td>${pet.gender}</td>
							<td>${pet.type}</td>
							<td>${pet.detailType}</td>
							<td>${pet.cut}</td>
							<td>${pet.comm}</td>
							<td><img src="${pageContext.request.contextPath}/images/pet_pic/${pet.pic}" alt="사진을 넣어주세요" width="100px" height="100px"></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		
	</form>
</body>
</html>