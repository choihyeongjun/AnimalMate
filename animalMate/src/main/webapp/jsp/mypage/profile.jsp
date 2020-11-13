<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 프로필 거래내역/후기</title>
<script type="text/javascript">
	$(()=>{
		$("#profileBtn").on({
			"click" : function() {
				var markIdVal = $("#markId").val();
				$.ajax({
					url:'${pageContext.request.contextPath}/ajax/bookmark.do',
					data : {markId : markIdVal},
					dataType:'json',
					error:function(xhr,status,msg){
						alert("상태값 :" + status + " Http에러메시지 :"+msg);
					},
					success:function(messageVO){
						alert(messageVO.markId + "님을 즐겨찾기 목록에 추가했습니다.")
					}
				})
			}
		})
	});
</script>
</head>
<body>
	<br>
	<div class = "row">
		<div>
			<h1>프로필</h1>
		</div>
		<div>
			<form>
				<c:if test="${user.id ne sid}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" id="profileBtn"}/bookmark.do">즐겨찾기</button>
					<input type="hidden" value="${user.id}" name="markId" id="markId">
				</c:if>
			</form>
		</div>
	</div>
	
	<div class="row">
		<div class="profileUser">
			<h3>유저 정보</h3>
			<table class="table">
				<tr>
					<td rowspan="5" width = 40%><img
						src="${pageContext.request.contextPath}/images/members_pic/${user.pic}"
						alt="사진을 넣어주세요" style = "width:240px; height:240px; border-radius: 100%;"></td>
					<th>이름</th>
					<td>${user.name}</td>
				</tr>
				<tr>
					<th>나이</th>
					<td>${age}</td>
					
				</tr>
				<tr>
					<th>성별</th>
					<td>${gender}</td>
				</tr>
				<tr>
					<th>평점</th>
					<td>${score}</td>
				</tr>
				<tr>
					<th>경력</th>
					<td>${career}회</td>
				</tr>
			</table>
		</div>
	</div>
	<br>
	<br>


	<div class="row">
		<h1>후기</h1>
		<div class = mypageTradeList>
			<c:if test="${comm.code ne null}">
				<table class="table">
				<tr>
					<th>거래번호</th>
					<th>제목</th>
					<th>위탁자</th>
					<th>시터</th>
					<th>별점</th>
					<th>상세내용</th>
				</tr>
					<c:forEach var="comm" items="${comms}">
						<tr>
							<td>${comm.code}</td>
							<td>${comm.title}</td>
							<td>${comm.buyer}</td>
							<td>${comm.seller}</td>
							<td>${comm.score}</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<c:if test="${comm.code eq null}">
					<br>
					<br>
					<h4>등록된 후기가 없습니다.</h4>
					<br>
					<br>
			</c:if>
		</div>
	</div>
</body>
</html>