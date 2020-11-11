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
	height : 150px;
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
		location.href="${pageContext.request.contextPath}/sitterFormSelect.do?code="+code;
	});
})
</script>
</head>

<body id="top">
	<br>
	<div>
		<h3>돌봐줄게요 게시판</h3>
	</div>
	<br>

	<form id="frm" name="frm" method="get"
		action="${pageContext.request.contextPath}/sitterListSearch.do">
		<div>
			<label>펫 수용수</label> <select id="maxp" name="maxp">
				<option>선택하세요</option>
				<option value="1">1마리</option>
				<option value="2">2마리</option>
				<option value="3">3마리</option>
				<option value="4">4마리</option>
				<option value="5">5마리</option>
			</select> 
			<label>시작시간</label> <input type="time" id="sTime" name="sTime">&nbsp;&nbsp;
			
			<label>끝 시간</label> <input type="time" id="eTime" name="eTime">&nbsp;&nbsp;
			<button type="submit">검색하기</button>&nbsp;&nbsp;
			<button type="button" onclick="window.location.href='${pageContext.request.contextPath}/sitterForm.do'">글등록</button>
		</div>
	</form>

	<div id="main">
		<div class="inner">

			<!-- Boxes -->
			<div class="thumbnails">
				<c:forEach var="v" items="${Superlist}">
					<div class="box">
						<input class="sitterListCode" type="hidden" value="${v[2].code}">
						<img class="image fit"
							src="${pageContext.request.contextPath}/images/members_pic/${v[0].pic}"
							alt="사진이 없습니다!" />
						<div>
							<dl>
								<dt>펫수용수</dt>
								<dd>${v[1].maxP}</dd>
							</dl>
							<dl>
								<dt>돌봄지역</dt>
								<dd>${v[2].location1}</dd>
							</dl>
							<dl>
								<dt>돌봄날짜</dt>
								<dd>${v[2].sdate}~${v[2].edate}</dd>
							</dl>
							<dl>
								<dt>돌봄시간</dt>
								<dd>${v[2].stime}~${v[2].etime}</dd>
							</dl>
							<dl>
								<dt>돌봄금액</dt>
								<dd>${v[2].price}</dd>
							</dl>
							<dl>
								<dt>거래상태</dt>
								<dd>${v[2].status}</dd>
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