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
	<div>
		<h1>돌봐줄게요 리스트</h1>
	</div>

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
			</select> <label>시작시간</label> <select id="sTime" name="sTime">
				<option>선택하세요</option>
				<option value="07:00">07:00</option>
				<option value="08:00">08:00</option>
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
				<option value="19:00">19:00</option>
				<option value="20:00">20:00</option>
				<option value="21:00">21:00</option>
				<option value="22:00">22:00</option>
			</select> <label>끝 시간</label> <select id="eTime" name="eTime">
				<option value="07:00">07:00</option>
				<option value="08:00">08:00</option>
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
				<option value="19:00">19:00</option>
				<option value="20:00">20:00</option>
				<option value="21:00">21:00</option>
				<option value="22:00">22:00</option>
			</select>
			<button type="submit">검색</button>
		</div>
	</form>


	<div>
		<button	onclick="window.location.href='${pageContext.request.contextPath}/sitterForm.do'">글등록</button>
	</div>
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
								<dt>근무지역</dt>
								<dd>${v[2].location1}</dd>
							</dl>
							<dl>
								<dt>근무날짜</dt>
								<dd>${v[2].sdate}~${v[2].edate}</dd>
							</dl>
							<dl>
								<dt>근무시간</dt>
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