<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/layout.css" rel="stylesheet">
<style>
.btn_sumit{margin: 30px 350px;}
.btn_sumit .btn_send {margin-right:20px; background-color: #ff7d21; width: 100px;height: 50px;}
.btn_sumit .btn_result {margin-right: 20px;background-color: #ff7d21;width: 100px;height: 50px;}
.btn_sumit .btn_cancle {margin-right: 20px;background-color: #bbb;width: 100px;height: 50px;}

.sitterEnvironment {
	width: 200px;
	height: 200px;
}
</style>
</head>
<body>
<br><br>
	<div id="sec03" class="addpic">
		<h2 class="cont_tit">돌봄환경</h2>
		<ul>
			<li>
				<form action="${pageContext.request.contextPath}/insertEnvironmentImg.do" method="post" enctype="multipart/form-data">
				<div>
					<c:if test="${fn:length(pictureList) eq 0}">
						<img class="sitterEnvironment" alt="이미지가 없습니다."
							src="${pageContext.request.contextPath}/images/picture/noImage.png">
					</c:if>
					<table>
						<tr>
							<c:forEach items="${pictureList}" var="v">
								<td width="auto">
									<img class="sitterEnvironment" alt="이미지없다!"
										src="${pageContext.request.contextPath}/images/picture/${v.pic}">
								</td>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach items="${pictureList}" var="v">
								<td align="center" width="auto">
									<input name="chkPic" id="chkPic" type="checkbox" value="${v.pic}" size="30" style="width: 50px">
								</td>
							</c:forEach>
						</tr>
					</table>
				</div>
				<br>
					<div>
						<input type="file" name="pic" id="pic">
					</div>
				<div class="btn_group btn_submit btn_l">
                   	<button type="submit" class="c_orange">등록하기</button>	
                   	<button type="submit" class="c_orange" formaction="${pageContext.request.contextPath}/environmentImgDelete.do">삭제하기</button>
                   	<button type="button" class="c_gray" onclick="window.location.href='${pageContext.request.contextPath}/goMypagePage.do'">취소</button>
                </div>
                </form>
			</li>
		</ul>
	</div>
</body>
</html>