<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

/* Box */
.thumbnails {
	display: flex;
	flex-wrap: wrap;
	margin: 0 auto;
}

.thumbnails .box {
	margin: 0 1em 2em 1em;
	width: 20%;
}

/* Box */
.box {
	border-radius: 10px;
	background: rgb(15, 162, 226);
	text-align: center;
	font-size: 10px;
}

.box dt, dd {
	color: white;
	float: left;
	width: 50%;
}

.Image.fit {
	border-radius: 4px 4px 0 0;
}

/* Image */
.image.fit {
	display: block;
	margin: 0 0 2em 0;
	width: 100%;
	height: 150px;
}

/* 검색창과 썸네일 간격  */
#main {
	padding: 4em 0 2em 0;
}

.code_dl {
	display: none;
}
</style>

<script>
$(()=>{
	$(".box").on("click",function() {
		var code = $(this).children().eq(0).val();
		location.href="${pageContext.request.contextPath}/ownerFormSelect.do?code="+code;
	});
})
</script>
</head>

<body id="top">
	<br>
	<div>
		<h3>돌봐주세요 게시판</h3>
	</div>
	<br>
	
	<div>
		<form id="frm" name="frm" method="get" action="${pageContext.request.contextPath}/ownerListSearch.do">
			<label for="type">분류</label> 
			<select id="type" name="type">
				<option>선택하세요</option>
				<option value="고양이">고양이</option>
				<option value="대형견">대형견</option>
				<option value="중형견">중형견</option>
				<option value="소형견">소형견</option>
			</select> &nbsp;&nbsp;
			거래 상태
			<select id="status" name="status">
				<option>선택하세요</option>
				<option value="거래 미정">거래 미정</option>
				<option value="거래 대상 확정">거래 대상 확정</option>
				<option value="입금 후">입금 완료</option>
				<option value="반려인 미확인">반려인 미확인</option>
				<option value="거래 완료">거래 완료</option>
			</select> &nbsp;&nbsp;
			<label for="location1">돌봄지역</label> <input placeholder="돌봄지역을 입력하세요" type="text" id="location1" name="location1">&nbsp;&nbsp;
			<br>
			돌봄금액
			<input id="minPrice" name="minPrice" type="number" step="1000" placeholder="최소금액">~
			<input id="maxPrice" name="maxPrice" type="number" step="1000" placeholder="최대금액">
			<br>
			돌봄날짜<input type="date" id="sDate" name="sDate">~<input type="date" id="eDate" name="eDate">&nbsp;&nbsp;
			<br>
			돌봄시간<input type="time" id="sTime" name="sTime">~<input type="time" id="eTime" name="eTime">&nbsp;&nbsp;
			<br><br>
			<button type="submit">검색하기</button>&nbsp;&nbsp;
			<button type="button" onclick="window.location.href='${pageContext.request.contextPath}/ownerForm.do'">글등록</button>
		</form>
	</div>

	<div id="main" align="center">
		<div class="inner" align="center">

			<!-- Boxes -->
			<div class="thumbnails" align="center">

				<c:forEach var="v" items="${Superlist}">
						<div class="box">
							<input class="sitterListCode" type="hidden" value="${v[1].code}">
							<img class="image fit"
								src="${pageContext.request.contextPath}/images/pet_pic/${v[0].pic}"
								alt="" />
							<div>
								<dl>
									<dt>분&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;류</dt>
									<dd>${v[0].type}</dd>
								</dl>
								<dl>
									<dt>돌봄지역</dt>
									<dd>${v[1].location1}</dd>
								</dl>
								<dl>
									<dt>돌봄날짜</dt>
									<dd>${v[1].sdate}~ ${v[1].edate}</dd>
								</dl>
								<dl>
									<dt>돌봄시간</dt>
									<dd>${v[1].stime}~ ${v[1].etime}</dd>
								</dl>
								<dl>
									<dt>돌봄금액</dt>
									<dd>${v[1].price}</dd>
								</dl>
								<dl>
									<dt>거래상태</dt>
									<dd>${v[1].status}</dd>
								</dl>
							</div>
						</div>
				</c:forEach>

			</div>
			<!-- Boxes -->

		</div>
	</div>
</body>
</html>