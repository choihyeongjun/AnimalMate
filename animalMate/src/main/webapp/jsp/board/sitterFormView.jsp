
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

<title>돌봐줄게요(신청page)</title>

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
.epic {
	width: 150px;
	height: 150px;
	display: inline;
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
			<h1>돌봐줄게요 (예약page)</h1>
			<p>${sitters[0].title}</p>
		</div>
		<!-- e:title -->

		<!-- s:contents -->
		<div class="contents">
		
				<div id="sec01" class="sitter_info">
					<h2 class="cont_tit">시터정보</h2>

					<div class="cont_area">
						<div class="info_img">
							<img class="info_img"
								src="${pageContext.request.contextPath}/images/members_pic/${sitters[0].mpic}"
								alt="시터 이미지" height="100px" width="100px">
						</div>

						<div class="info_table">
							<table class="tbl_write__list">
								<colgroup>
									<col width="40%">
									<col width="60%">
								</colgroup>

								<thead>
									<tr>
										<th>펫 시터 정보</th>
										<th>상세</th>
									</tr>
								</thead>

								<tbody>
									<tr>
										<td>시터 이름</td>
										<td>${sitters[0].name}</td>
									</tr>

									<tr>
										<td>시터 나이</td>
										<td>${sitters[0].zoomin1}</td>
									</tr>

									<tr>
										<td>시터 성별</td>
										<td>${sitters[0].zoomin2}</td>
									</tr>

									<tr>
										<td>시터 평점</td>
										<td>${sitters[0].score}</td>
									</tr>

									<tr>
										<td>시터 경력(돌봄횟수)</td>
										<td>모르겟다</td>
									</tr>
									<tr>
										<td>거래상태</td>
										<td>${sitters[0].status}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

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
								<td>돌봄지역</td>
								<td>${sitters[0].location1}</td>
							</tr>

							<tr>
								<td>돌봄날짜</td>
								<td>
									<!-- jQuery datepicker 연결하면 됨-->
									<div class="calendar">
										<span class="datepickerview">${sitters[0].sdate}</span> <span>~</span>
										<span class="datepickerview">${sitters[0].edate}</span>
									</div>
								</td>
							</tr>

							<tr>
								<td>돌봄시간</td>
								<td>
									<div class="calendar">
										<span>${sitters[0].stime}</span> <span>~</span> <span>${sitters[0].etime}</span>
									</div>
								</td>
							</tr>

							<tr>
								<td>거래금액</td>
								<td>${sitters[0].price}원</td>
							</tr>

							<tr>
								<td>최대돌봄수</td>
								<td>${sitters[0].maxp}마리</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div id="sec03" class="addpic">
					<h2 class="cont_tit">돌봄환경</h2>

					<ul>
						<li>
							<div>
							<c:forEach var="sitter" items="${sitters}">
								<img class="epic"
									src="${pageContext.request.contextPath}/images/picture/${sitter.epic}"></img>
							</c:forEach>
							</div>
							
						</li>
						<li></li>
					</ul>
				</div>

				<div id="sec04" class="">
					<h2 class="cont_tit">스케쥴선택</h2>

					<div></div>
				</div>

				<div id="sec05" class="">
					<h2 class="cont_tit">세부내용</h2>
					<textarea>${sitters[0].comm}</textarea>
				</div>
		
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


			<div class="btn_sumit">
				<button type="submit" class="btn_blue">쪽지보내기</button>
				<button type="submit" class="btn_blue">예약하기</button>
				<button type="reset" class="btn_gray"
					onclick="window.location.href='${pageContext.request.contextPath}/sitterList.do'">취소</button>
			</div>

		</div>
		<!-- e:contents -->
			
	</div>
	<!-- s:container -->

</body>
</html>