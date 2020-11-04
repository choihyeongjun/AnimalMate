<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
button{width: 50px;
}
</style>
<script>
 $(function(){
 	userList();
 });
 
 	function userList(){
 		$.ajax({
 			url:"${pageContext.request.contextPath}/ajax/memberlist.do",
 				type:'GET',
 				dataType:'json',
 				error:function(xhr,status,msg){
 						alert("상태값 :" + status + " Http에러메시지 :"+msg);
 				},
 				success:function(){
 				userList();
 			}
 		})
 	}
 
</script>

</head>

<body>
<jsp:include page="mainMenu.jsp"/>
<hr>
<div align="center">
	<div><h1>회원목록 정보</h1></div>
		<div>
		<form action="memberSearch.do">
		<table>
			<tr>
				<td><input class="search" type="text" value="hong"></td>
				<td><input class="search" type="text" value="홍길동"></td>
				<td><button id="btn">검색</button>
			</tr>
		</table>
		</form>
	</div>
	<div class="container">
	<h2>사용자 목록</h2>
		<table class="table text-center">
			<tr>
				<th class="text-center">아이디</th>
				<th class="text-center">이  름</th>
				<th class="text-center">주  소</th>
				<th class="text-center">전화번호</th>
				<th class="text-center">가입일자</th>
				<th class="text-center">권 한 </th>
				<th class="text-center">변경</th>
			</tr>
		
				<tr>
					<td class="text-center"><input type="text"></td>
					<td class="text-center"><input type="text" value="안녕"></td>
					<td class="text-center"><input type="text">${member.address}</td>
					<td class="text-center"><input type="text">${member.tel}</td>
					<td class="text-center"><input type="text">${member.eDate}</td>
					<td class="text-center"><input type="text"></td>
					<td><button>수 정</button></td>
					<td><button>삭 제</button></td>
				</tr>
		
		</table>
	</div>
	
</div>
</body>
</html>