<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/reset.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/layout.css"
	rel="stylesheet">
<style type="text/css">
	.btn_sumit{margin: 30px 350px;}
	.btn_sumit .btn_send {margin-right:20px; background-color: #ff7d21; width: 100px;height: 50px;}
	.btn_sumit .btn_result {margin-right: 20px;background-color: #ff7d21;width: 100px;height: 50px;}
	.btn_sumit .btn_cancle {margin-right: 20px;background-color: #bbb;width: 100px;height: 50px;}
	.ownerFormChkbox{
	display : inline;
	width: 20px;
	max-width: 20px;
	}
</style>
</head>
<body>
	<div id="sec01" class="sitter_info">
					<h2 class="cont_tit">펫 정보</h2>
					<form action="${pageContext.request.contextPath}/applySitterForm.do?code=${param.code}" method="post">
						<c:forEach items="${petList}" var="v">
							<div class="cont_area">
								<div class="info_img">
									<img class="info_img"
										src="${pageContext.request.contextPath}/images/pet_pic/${v.pic}"
										alt="펫 이미지" height="100px" width="100px">
								</div>
		
								<div class="info_table">
									<table class="tbl_write__list">
										<colgroup>
											<col width="40%">
											<col width="60%">
										</colgroup>
		
										<thead>
											<tr>
												<th>펫 정보</th>
												<th>상세 내용</th>
											</tr>
										</thead>
		
										<tbody>
											<tr>
												<td>펫 이름</td>
												<td>
													${v.name} 
													<input type="checkbox" class="ownerFormChkbox" value="${v.code}" name="petCode"> 
												 </td>
											</tr>
		
											<tr>
												<td>나이</td>
												<td id="ageTD">${v.age}</td>
											</tr>
		
											<tr>
												<td>성별</td>
												<td id="genderTD">${v.gender}</td>
											</tr>
		
											<tr>
												<td>종류</td>
												<td id="typeTD">${v.type}</td>
											</tr>
		
											<tr>
												<td>중성화 유무</td>
												<td id="cutTD">${v.cut}</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</c:forEach>
						<div class="btn_sumit">
							<button type="submit" class="btn_result" id="sitterFormApplyBtn">예약하기</button>
							<button type="reset" class="btn_cancle " onclick="window.location.href='${pageContext.request.contextPath}/sitterList.do'">취소</button>
						</div>		
					</form>
				</div>
</body>
</html>