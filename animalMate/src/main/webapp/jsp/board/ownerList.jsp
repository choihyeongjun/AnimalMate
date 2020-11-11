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
		var code = $(this).children().children(1).children(0).eq(1).text();
		location.href="${pageContext.request.contextPath}/ownerFormSelect.do?code="+code;
	});
})
</script>
</head>

<body id="top">
	<div>
		<h1>돌봐주세요 리스트</h1>
	</div>
	
	<form id="frm" name="frm" method="get" action="${pageContext.request.contextPath}/ownerListSearch.do">
	<div>
		<label>펫 종류</label> 
		<select id="petType" name="petType">
			<option>선택하세요</option>
			<option value="고양이">고양이</option>
			<option value="대형견">대형견</option>
			<option value="중형견">중형견</option>
			<option value="소형견">소형견</option>
		</select> 
		<label>시작시간</label> 
		<select id="sTime" name="sTime">
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
		</select>
		 <label>끝 시간</label> 
		 <select id="eTime" name="eTime">
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
		<button
			onclick="window.location.href='${pageContext.request.contextPath}/ownerForm.do'">글
			등록</button>
	</div>
	<div id="main">
		<div class="inner">

			<!-- Boxes -->
			<div class="thumbnails">
			
				<c:forEach var="v" items="${Superlist}">
					<div class="box">
					
						<img class="image fit" src="${pageContext.request.contextPath}/images/pet_pic/${v[0].pic}" alt="" />
						<div>
							<dl class="code_dl">
								<dt>거래번호</dt>
								<dd id="code" name="code">${v[1].code}</dd>
							</dl>
							
							<dl>
								<dt>펫 분 류</dt>
								<dd>${v[0].type}</dd>
							</dl>
							<dl>
								<dt>근무지역</dt>
								<dd>${v[1].location1}</dd>
							</dl>
							<dl>
								<dt>근무날짜</dt>
								<dd>${v[1].sdate} ~ ${v[1].edate}</dd>
							</dl>
							<dl>
								<dt>근무시간</dt>
								<dd>${v[1].stime} ~ ${v[1].etime}</dd>
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