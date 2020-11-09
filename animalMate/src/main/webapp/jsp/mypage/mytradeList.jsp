<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br>

	<div class="row">
		<div>
			<h1>${user.name}님의 거래</h1>
		</div>
		<button onclick="window.location.href='${pageContext.request.contextPath}/ownerFormCheck.do'">맡기기보기</button>
		<button onclick="window.location.href='${pageContext.request.contextPath}/sitterFormCheck.do'">돌보기보기</button>
		
		<div class="mypageTrade">
			<div>
				<dl>
					<dt>내 포인트</dt>
					<dd>${user.point}p</dd>
				</dl>
			</div>
			<div>
				<dl>
					<dt>예약한</dt>
					<dd>DBvalue 건</dd>
				</dl>

			</div>
			<div>
				<dl>
					<dt>예약된</dt>
					<dd>DBvalue 건</dd>
				</dl>
			</div>
			<div>
				<dl>
					<dt>쪽지</dt>
					<dd>DBvalue 건</dd>
				</dl>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="mypageTradeList">
			<table class="table">
				<tr>
					<th>게시판분류</th>
					<th>거래코드</th>
					<th>상대이름</th>
					<th>펫종류</th>
					<th>거래금액</th>
					<th>예약시간</th>
					<th>거래상태</th>
				</tr>
				
		        <c:forEach items="${tbs}" var="tb">
					<tr>
						<td>${tb.ttype}</td>
						<td>${tb.code}</td>
						<td>${tb.seller}</td>
						<td>${tb.type} ${tb.detailType}</td>
						<td>${tb.price}포인트</td>
						<td>${tb.sdate} ${tb.stime} ~ ${tb.edate} ${tb.etime}</td>
						<td>${tb.status}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>