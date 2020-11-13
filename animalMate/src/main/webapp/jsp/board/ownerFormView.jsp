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
#code {display: none;}
.col1_title, .col1_target, .col3_comm {width: 20px;}
.col2_title, .col2_target, .col3_comm {width: 300px;}	
.col3_comm {height: 300px;}
	

.btn_sumit{margin: 30px 350px;}
.btn_sumit .btn_send {margin-right:20px; background-color: #ff7d21; width: 100px;height: 50px;}
.btn_sumit .btn_result {margin-right: 20px;background-color: #ff7d21;width: 100px;height: 50px;}
.btn_sumit .btn_cancle {margin-right: 20px;background-color: #bbb;width: 100px;height: 50px;}
.sec06 li {margin-bottom: 15px;}
.proBtn {background-color: #d3cbc5;border-radius: 3px; width: 140px;}
</style>

<script type="text/javascript">
		$(()=>{
			$("#submitBtn").on({
				"click"  :function(){
					messageFrm.submit();
				}
			})
			
			$("#ownerFormApplyBtn").on({
				"click"  :function(){
					$.ajax({
						url:'${pageContext.request.contextPath}/ajax/ownerFormApply.do',
						data : {code : ${tradeBoardVO.code}},
						dataType:'json',
						error:function(xhr,status,msg){
	    					alert("상태값 :" + status + " Http에러메시지 :"+msg);
	    				},
	    				success:function(msg){
	    					alert("지원이 완료되었습니다.")
	    				}
					})
				}
			})
		})
		
		
</script>

</head>

<body>
	<!-- s:container -->
	<div class="container">

		<!-- s:title -->
		<div class="title">
			<h1>돌봐주세요 - (예약page)</h1>
			<p>${tradeBoardVO.title}</p>
			<p id="code">${tradeBoardVO.code}</p>
		</div>
		<!-- e:title -->

		<!-- s:contents -->
		<div class="contents">

			<div id="sec01" class="sitter_info">
				<h2 class="cont_tit">펫정보</h2>
				<c:forEach var="v" items="${petList}">
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
										<td>${v.name}</td>
									</tr>

									<tr>
										<td>펫 나이</td>
										<td>${v.age}</td>
									</tr>

									<tr>
										<td>펫 성별</td>
										<td>${v.gender}</td>
									</tr>

									<tr>
										<td>펫 종류</td>
										<td>${v.type}</td>
									</tr>

									<tr>
										<td>중성화 유무</td>
										<td>${v.cut}</td>
									</tr>
								</tbody>

							</table>
						</div>
					</div>
				</c:forEach>
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
							<th>돌봄지역</th>
							<td>${tradeBoardVO.location1}</td>
						</tr>
						<tr>
							<th>상세지역</th>
							<td>${tradeBoardVO.location2}</td>
						</tr>
						<tr>
							<th>돌봄날짜</th>
							<td>
								<div>
									<span class="datepickerview">${tradeBoardVO.sdate} <span>~</span>
										<span class="datepickerview">${tradeBoardVO.edate}
								</div>
							</td>
						</tr>

						<tr>
							<th>돌봄시간</th>
							<td>
								<div class="calendar">
									<span>${tradeBoardVO.stime}</span> <span>~</span> <span>${tradeBoardVO.etime}</span>
								</div>
							</td>
						</tr>

						<tr>
							<th>돌봄 요청 금액</th>
							<td>${tradeBoardVO.price}원</td>
						</tr>

						<tr>
							<th>반려인</th>
						<td>${tradeBoardVO.buyer}<button class="proBtn">프로필 상세보기</button></td>
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
				<textarea>${tradeBoardVO.comm}</textarea>
			</div>

			<br>
				<div id="sec06" class="sec06">
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
				<button class="btn_send" type="button" data-toggle="modal"
					data-target="#exampleModal1">쪽지보내기</button>
				<c:if test="${sessionauthor == 'usersitter'}">	
					<c:if test="${tradeBoardVO.status == '거래 완료'}">
						<button type="submit" class="btn_result" id="ownerFormApplyBtn">지원하기</button>
					</c:if>
				</c:if>
				<button type="reset" class="btn_cancle" onclick="window.location.href='${pageContext.request.contextPath}/ownerList.do'">취소</button>
			</div>

		</div>
		<!-- e:contents -->

	</div>
	<!-- s:container -->

	<!-- Modal1쪽지쓰기 -->
	<div class="modal fade" id="exampleModal1" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<p class="modal-title" id="exampleModalLabel">쪽지 보내기</p>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="reportDiv" align="center">
						<form id="messageFrm" name="messageFrm" method="post"
							action="${pageContext.request.contextPath}/submitMessage.do">
							<table class="reportTd">
								<tr>
									<td class="col1_title">제목</td>
									<td><input class="col2_title" type="text" id="title"
										name="title" value="RE: ${tradeBoardVO.title}"></td>
								</tr>
								<tr>
									<td class="col1_target">받을 사람</td>
									<td><input class="col2_target" type="text" id="receive"
										name="receive" value="${tradeBoardVO.buyer}"></td>
								</tr>
								<tr>
									<td class="col3_comm">내용</td>
									<td><textarea rows="20" cols="50" class="col3_comm"
											id="comm" name="comm"></textarea></td>
								</tr>
							</table>
							<br>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" id="submitBtn" class="btn btn-primary">보내기</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal1쪽지쓰기 -->
</body>
</html>