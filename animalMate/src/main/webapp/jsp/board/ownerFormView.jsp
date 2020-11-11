<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="OOO 홈페이지 입니다.">
<meta property="og:type" content="website">
<meta property="og:title" content="OOO">
<meta property="og:description" content="OOO 홈페이지 입니다.">
<meta property="og:image" content="">
<meta property="og:url" content="">
<!-- <meta http-equiv="imagetoolbar" content="no"> -->
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>돌봐줄게요(등록form)</title>

<!--파비콘 -->
<!-- <link rel="shortcut icon" href="assets/images/favicon.ico" type="image/x-icon"> -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/reset.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/layout.css"
	rel="stylesheet">

<!-- css -->
<style>
#code {
	display: none;
}

.calendar span {
	display: inline;
}
</style>
</head>

<body>
	<!-- s:container -->
	<div class="container">

		<!-- s:title -->
		<div class="title">
			<h1>돌봐주세요 - (예약page)</h1>
			<p>${borders[0].title}</p>
			<p id="code">${borders[0].code}</p>
		</div>
		<!-- e:title -->

		<!-- s:contents -->
		<div class="contents">

			<div id="sec01" class="sitter_info">
				<h2 class="cont_tit">펫정보</h2>
	<c:forEach var="border" items="${borders}">
				<div class="cont_area">
					<div class="info_img">
						<img class="info_img"
							src="${pageContext.request.contextPath}/images/pet_pic/${border.pic}"
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
										<td>${border.name}</td>
									</tr>

									<tr>
										<td>펫 나이</td>
										<td>${border.age}</td>
									</tr>

									<tr>
										<td>펫 성별</td>
										<td>${border.gender}</td>
									</tr>

									<tr>
										<td>펫 종류</td>
										<td>${border.type}</td>
									</tr>

									<tr>
										<td>중성화 유무</td>
										<td>${border.cut}</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
			
			<br>
			<div id="sec02" class="">
				<h2 class="cont_tit">돌봄 세부조건</h2>

				<table class="tbl_write__list">
					<colgroup>
						<col width="40%">
						<col width="60%">
					</colgroup>

					<thead>
						<tr>
							<th>조건</th>
							<th>내용</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<th>근무지역</th>
							<td>${borders[0].location1}</td>
						</tr>
						<tr>
							<th>상세지역</th>
							<td>${borders[0].location2}</td>
						</tr>
						<tr>
							<th>근무날짜</th>
							<td>
								<!-- jQuery datepicker 연결하면 됨-->
								<div class="calendar">
									<span class="datepickerview">${borders[0].sdate} <span>~</span>
										<span class="datepickerview">${borders[0].edate}
								</div>
							</td>
						</tr>

						<tr>
							<th>근무시간</th>
							<td>
								<div class="calendar">
									<span>${borders[0].stime}</span> <span>~</span> <span>${borders[0].etime}</span>
								</div>
							</td>
						</tr>

						<tr>
							<th>돌봄 요청 금액</th>
							<td>${borders[0].price}원</td>
						</tr>

						<tr>
							<th>반려인</th>
							<td>${borders[0].buyer}<button>프로필 상세보기</button></td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<br>
			<div id="sec04" class="">
				<h2 class="cont_tit">체크리스트</h2>
				<div>
					<ul>
						<c:forEach items="${joblist}" var="v">
							<li>○ ${v.comm}</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			
			<br>
			<div id="sec05" class="">
				<h2 class="cont_tit">세부사항</h2>
				<textarea>${borders[0].comm}</textarea>
			</div>
			
			<br>
			<div id="sec06" class="">
				<h2 class="cont_tit">유의사항</h2>
				<ul>
					<li>○ 배드, 사료, 산책용품등은 의뢰자께서 준비해주세요.</li>
					<li>○ 특이사항(질병등)은 사전에 펫시터에게 공지해주세요.</li>
					<li>○ 펫시터 신분증, 주민등록등본등을 미리 확인해주세요.</li>
					<li>○ 의뢰시 간단하게 계약서나 약정서를 작성하세요.</li>
					<li>○ 표준계약서는 '이용안내'에서 내려받을수 있습니다.</li>
				</ul>
			</div>

			<br>
			<div class="btn_sumit">
				<button type="submit">쪽지보내기</button>&nbsp;&nbsp;
				<button type="submit" onclick="window.open('${pageContext.request.contextPath}/boardTradePet.do'">신청하기</button>&nbsp;&nbsp;
				<button type="reset" onclick="window.location.href='${pageContext.request.contextPath}/ownerList.do'">취소</button>&nbsp;&nbsp;
			</div>

		</div>
		<!-- e:contents -->

	</div>
	<!-- s:container -->
</body>
</html>