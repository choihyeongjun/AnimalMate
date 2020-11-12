<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<div>
		<h1>프로필</h1>
	</div>
	<div>
	<form>
		<button type="button" id="profileBtn"}/bookmark.do">즐겨찾기</button>
		<input type="hidden" value="${user.id}" name="markId" id="markId">
	</form>
	</div>
	<div class="row">
		<div class="profileUser">
			<h3>유저 정보</h3>
			<table class="table">
				<tr>
					<td rowspan="6"><img
						src="${pageContext.request.contextPath}/images/muncat.jpg"></td>
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
				<tr>
					<th>신고횟수</th>
					<td>DBVALUE</td>
				</tr>
			</table>
		</div>
	</div>



	<div class="row">
		<div>
			<h1>거래내역/후기</h1>
		</div>
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
					<td>${comm[0].code}</td>
					<td>${comm[0].title}</td>
					<td>${comm[1].buyer}</td>
					<td>${comm[1].seller}</td>
					<td>${comm[0].score}</td>
				</tr>
			</c:forEach>
		</table>
	</div>


</body>
</html>