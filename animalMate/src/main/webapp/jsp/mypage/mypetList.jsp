<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function () {
	$.ajax("${pageContext.request.contextPath}/ajax/memberList.do",{
		dataType:"json",
	}).done(function(datas) {//ajax/memberList.do 의 결과가 data<- 함수 매개변수로 들어옴
		for(i=0; i<datas.length;i++) {
			$("<div>").append($("<span>").text(datas[i].id))
						.append($("<span>").text(datas[i].name))
						.append($("<span>").text(datas[i].tel))
						.appendTo("#memList");
		}
	});

});
</script>
</head>
<body>
	<div><h1>마이 펫</h1></div>
	<div>
		<table class="table">
			<tr>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
				<th>분류</th>
				<th>세부분류</th>
				<th>중성화</th>
				<th>설명</th>
				<th>사진</th>
			</tr>
		 	<tr>
		 		<td>DBvalue</td>
		 		<td>DBvalue</td>
		 		<td>DBvalue</td>
		 		<td>DBvalue</td>
		 		<td>DBvalue</td>
		 		<td>DBvalue</td>
		 		<td>DBvalue</td>
		 		<td><img src="${pageContext.request.contextPath}/images/${member.imgs}"></td>
		 	</tr>
		</table>
		<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/mypetForm.do" role="button">펫 등록</a>
	</div>
</body>
</html>