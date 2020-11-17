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

<style>
.sitterEnvironment {width: 200px;height: 200px;}
.c_orange {width: 110px;height: 50px;}
.c_gray {width: 110px;height: 50px; background-color: #c3b8b8;}
.cont_tit {margin: 0 0 60px 530px; font-weight: bold;}
.imgSel {margin: 40px 0 90px 10px; width: 260px;padding: 10px 10px 10px 10px;background-color: #ff8826; border-radius: 5px;}
.chkPic{width: 50px; height: 20px;margin-top: 20px;}

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
								<td class="etd" width="auto" style="width: 200px;">
									<img class="sitterEnvironment" alt="이미지없다!"
										src="${pageContext.request.contextPath}/images/picture/${v.pic}">
								</td>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach items="${pictureList}" var="v">
								<td align="center" width="auto">
									<input class="chkPic" name="chkPic" id="chkPic" type="checkbox" value="${v.pic}" size="30" style="width: 50px">
								</td>
							</c:forEach>
						</tr>
					</table>
				</div>
				<br>
					<div class="imgSel">
						<input type="file" name="pic" id="pic">
					</div>
				<div class="btn_group btn_submit btn_l" align="center" style="margin: 70px 0 90px 0;">
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