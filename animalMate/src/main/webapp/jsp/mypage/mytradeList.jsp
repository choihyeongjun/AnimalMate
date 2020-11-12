<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	<h1>${user.name}님의거래</h1>
	<div class="row">
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
					<th width = 8%>거래코드</th>
					<th>게시판분류</th>
					<th>맡김이</th>
					<th>돌봄이</th>
					<th>펫종류</th>
					<th>거래금액</th>
					<th>예약시간</th>
					<th>거래상태</th>
				</tr>
				<c:forEach items="${tbs}" var="tb">
					<c:choose>
						<c:when test="${tb.ttype eq '돌봐줄게요'}">
							<c:if test="${tb.seller eq sid and tb.buyer eq null}">
								<tr onclick="location.href='${pageContext.request.contextPath}/sitterTradeCheck.do?code=${tb.code}';"
									style='cursor: pointer;'>
									<td>${tb.code}</td>
									<td>${tb.ttype}</td>
									<td>${tb.buyer}</td>
									<td>${tb.seller}</td>
									<td>${tb.type} ${tb.detailType}</td>
									<td>${tb.price}p</td>
									<td>${tb.sdate} ${tb.stime} ~ ${tb.edate} ${tb.etime}</td>
									<td>${tb.status}</td>
								</tr>
							</c:if>
							<c:if test="${tb.seller eq sid and tb.buyer ne null}">
								<tr onclick="location.href='${pageContext.request.contextPath}/sitterFormCheck.do?code=${tb.code}';"
									style='cursor: pointer;'>
									<td>${tb.code}</td>
									<td>${tb.ttype}</td>
									<td>${tb.buyer}</td>
									<td>${tb.seller}</td>
									<td>${tb.type} ${tb.detailType}</td>
									<td>${tb.price}p</td>
									<td>${tb.sdate} ${tb.stime} ~ ${tb.edate} ${tb.etime}</td>
									<td>${tb.status}</td>
								</tr>
							</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${tb.buyer eq sid and tb.seller eq null}">
								<tr onclick="location.href='${pageContext.request.contextPath}/ownerTradeCheck.do?code=${tb.code}';"
									style='cursor: pointer;'>
									<td>${tb.code}</td>
									<td>${tb.ttype}</td>
									<td>${tb.buyer}</td>
									<td>${tb.seller}</td>
									<td>${tb.type} ${tb.detailType}</td>
									<td>${tb.price}p</td>
									<td>${tb.sdate} ${tb.stime} ~ ${tb.edate} ${tb.etime}</td>
									<td>${tb.status}</td>
								</tr>
							</c:if>

							<c:if test="${tb.buyer eq sid and tb.seller ne null}">
								<tr onclick="location.href='${pageContext.request.contextPath}/ownerFormCheck.do?code=${tb.code}';"
									style='cursor: pointer;'>
									<td>${tb.code}</td>
									<td>${tb.ttype}</td>
									<td>${tb.buyer}</td>
									<td>${tb.seller}</td>
									<td>${tb.type} ${tb.detailType}</td>
									<td>${tb.price}p</td>
									<td>${tb.sdate} ${tb.stime} ~ ${tb.edate} ${tb.etime}</td>
									<td>${tb.status}</td>
								</tr>
							</c:if>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>