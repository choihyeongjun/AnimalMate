<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>돌봐주세요  거래 상세정보 페이지</title>
</head>
<body>
<br>
	<h1>돌봐주세요 거래 게시판 상세정보</h1>
<br>
	
	<h3>${tbs.title}</h3>
	<p>${tbs.ttime}</p>

	<div class="row">
		<div class="ownerFormCheckView">
			<h3>펫 정보</h3>
			<table class="table">
				<tr>
					<td rowspan="5" width =30%><img
						src="${pageContext.request.contextPath}/images/pet_pic/${tbs.pic}"></td>
					<th width =25%>펫 이름</th>
					<td>${tbs.name}</td>
				</tr>
				<tr>
					<th>펫 나이</th>
					<td>${tbs.age}</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>${tbs.gender}</td>
				</tr>
				<tr>
					<th>종류</th>
					<td>${tbs.type} ${tbs.detailType}</td>
				</tr>
				<tr>
					<th>중성화 유무</th>
					<td>${tbs.cut}</td>
				</tr>
			</table>
		</div>
		
		<div class="ownerFormCheckView">
			<div class = "row">
				<div>
					<h3>상대 정보</h3>			
				</div>
				<div>
					<button style = "margin:5px; background-color:rgb(255, 164, 89);"onclick="window.location.href='${pageContext.request.contextPath}/profile.do?id=${user.id}'">더보기</button><br>
				</div>
			</div>
			<table class="table">
				<tr>
					<td rowspan="5" width =30%><img id="userpic" src="${pageContext.request.contextPath}/images/members_pic/${user.pic}"></td>
					<th width =25%>이름</th>
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
					<td>${career}</td>
				</tr>
				<tr>
					<th>경력</th>
					<td>${score}</td>
				</tr>
			</table>
		</div>
	</div>

	<div class="row">
		<div class="ownerFormCheckView">
			<h3>세부조건</h3>
			<table class="table">
				<tr>
					<th width =30%>근무지역</th>
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
			<div class="ownerFormCheckText">
				${tbs.comm}
			</div>
		</div>
	</div>
	
<br>

<hr>
	
	<form id="frm" name="frm" action="${pageContext.request.contextPath}/joblistUpdateAction.do" method="post" enctype="multipart/form-data">	
		<div class="row">
			<div class="checkDetail">
				<h3>체크리스트</h3>
				<div class="row">
					<c:forEach items="${jobs}" var="job" varStatus="i">
						<div class = "checkDetailBox">
							<table class="table" >
								<tr>
									<td>${job.comm}</td>
								</tr>
								<tr>
									<td>
										<img src="${pageContext.request.contextPath}/images/joblist_pic/${job.pic}" alt="이미지가 없습니다.">
										<c:if test="${tbs.buyer ne sid}">
											<br>
											<div class="ownerFormCheckButton">
												<input type="file" id="pic" name="pic${i.index}">
											</div>
										</c:if>
									</td>
								</tr>
							</table>
							<br>
							<div style="visibility: hidden;">
								<input type="text" id="comm" name="comm" value="${job.comm}">
								<input type="text" id="code" name="code" value="${job.code}">
							</div>
						</div>
					</c:forEach>
					
				</div>
			</div>
		</div>
	
		<c:if test="${tbs.buyer ne sid}">
			<div class="ownerFormCheckButton">
				<div style="visibility: hidden;">
					<input type="text" id="cc" name="cc" value="${tbs.code}">
				</div><br>
				<button type="submit">체크리스트 저장</button>
			</div>
		</c:if>
	</form>
	

	<c:if test="${tbs.buyer eq sid and tbs.status ne '거래 완료'}">
		<form id="frm" name="frm" action="${pageContext.request.contextPath}/mytradeFinishAction.do" method="post">	
			<div style="visibility: hidden;">
				<input type="text" id="code" name="code" value="${tbs.code}">
				<input type="text" id="id" name="id" value="${tbs.seller}">
			</div>
			<br>
			<div class="ownerFormCheckButton">
				<button type = "submit">거래완료</button>
			</div>
		</form>
	</c:if>

	<c:if test="${tbs.status eq '거래 완료'}">
		<div class="ownerFormCheckButton">
			<h3>거래가 종료되었습니다.</h3>
		</div>
	</c:if>
	
	
</body>
</html>