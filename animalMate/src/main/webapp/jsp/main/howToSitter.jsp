<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫시터 설명 페이지</title>
<style type="text/css">
	.howToSitterTitleDiv {
		font-size: 40px
	}
	.howToSitterButtonDiv {
		margin: 20px 0px;
	}
</style>
</head>
<body>
	<div align="center">
		<div class="howToSitterTitleDiv">펫시터는 이런 일을 해요</div> <br>
		<img alt="이미지 없다!" src="${pageContext.request.contextPath}/images/펫시터 소개화면.png" height="600px" width="1200px"> <br>
		<div class="howToSitterButtonDiv">
			<button>신청하기</button>&nbsp;&nbsp;
			<button>취소</button>
		</div>
		
	</div>
</body>
</html>