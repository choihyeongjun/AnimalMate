
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
.sitterEnvironment {
	width: 150px;
	height: 150px;
	display: inline;
}

.calendar span {
	display: inline;
}
.col1_title, .col1_target, .col3_comm {width: 20px;}
.col2_title, .col2_target, .col3_comm {width: 300px;}	
.col3_comm {height: 300px;}
.btn_sumit{margin: 30px 350px;}
.btn_sumit .btn_send {margin-right:20px; background-color: #ff7d21; width: 100px;height: 50px;}
.btn_sumit .btn_result {margin-right: 20px;background-color: #ff7d21;width: 100px;height: 50px;}
.btn_sumit .btn_cancle {margin-right: 20px;background-color: #bbb;width: 100px;height: 50px;}
.sec06 li {margin-bottom: 15px;}
</style>
<script type="text/javascript">
		$(()=>{
			//제출하기 버튼
			$("#submitBtn").on({
				"click"  :function(){
					messageFrm.submit();
				}
			})
			
			//지원하기 버튼
			$("#sitterFormApplyBtn").on({
				"click"  :function(){
					$.ajax({
						url:'${pageContext.request.contextPath}/ajax/ownerFormApply.do',
						data : {code : ${tradeBoard.code}},
						dataType:'json',
						error:function(xhr,status,msg){
	    					alert("상태값 :" + status + " Http에러메시지 :"+msg);
	    				},
	    				success:function(){
	    					alert("예약이 완료되었습니다.")
	    				}
					})
				}
			})
			
			//수정하기 버튼
			$("#updateBtn").on({
				"click"  :function(){
					location.href = "${pageContext.request.contextPath}/sitterForm.do?code="+${param.code};
				}
			})
			//삭제하기 버튼
			$("#deleteBtn").on({
				"click"  :function(){
					if(confirm("정말로 삭제하시겠습니까?")){
						location.href = "${pageContext.request.contextPath}/sitterDelete.do?code="+${param.code};	
					}
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
			<h1>돌봐줄게요 (예약page)</h1>
			<p>${tradeBoard.title}</p>
		</div>
		<!-- e:title -->

		<!-- s:contents -->
		<div class="contents">
		
				<div id="sec01" class="sitter_info">
					<h2 class="cont_tit">시터정보</h2>

					<div class="cont_area">
						<div class="info_img">
							<img class="info_img"
								src="${pageContext.request.contextPath}/images/members_pic/${members.pic}"
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
										<td>시터 닉네임</td>
										<td>${members.getNname()}</td>
									</tr>

									<tr>
										<td>시터 나이</td>
										<td>${age}</td>
									</tr>

									<tr>
										<td>시터 성별</td>
										<td>${gender}</td>
									</tr>

									<tr>
										<td>시터 평점</td>
										<td>${score}</td>
									</tr>

									<tr>
										<td>시터 경력(돌봄횟수)</td>
										<td>${career}</td>
									</tr>
									<tr>
										<td>거래상태</td>
										<td>${tradeBoard.status}</td>
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
								<td>${tradeBoard.location1}</td>
							</tr>
							<tr>
								<td>상세지역</td>
								<td>${tradeBoard.location2}</td>
							</tr>

							<tr>
								<td>돌봄날짜</td>
								<td>
									<!-- jQuery datepicker 연결하면 됨-->
									<div class="calendar">
										<span class="datepickerview">${tradeBoard.sdate}</span> <span>~</span>
										<span class="datepickerview">${tradeBoard.edate}</span>
									</div>
								</td>
							</tr>

							<tr>
								<td>돌봄시간</td>
								<td>
									<div class="calendar">
										<span>${tradeBoard.stime}</span> <span>~</span> <span>${tradeBoard.etime}</span>
									</div>
								</td>
							</tr>

							<tr>
								<td>돌봄금액</td>
								<td>${tradeBoard.price}원</td>
							</tr>

							<tr>
								<td>최대돌봄수</td>
								<td>${sitter.maxP}마리</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div id="sec03" class="addpic">
					<h2 class="cont_tit">돌봄환경</h2>

					<ul>
						<li>
							<div>
								<c:if test="${fn:length(pictureList) eq 0}">
									<img class="sitterEnvironment" alt="이미지가 없습니다." src="${pageContext.request.contextPath}/images/picture/noImage.png">
								</c:if>
								<c:forEach items="${pictureList}" var="v">
                                	<img class="sitterEnvironment" alt="이미지없다!" src="${pageContext.request.contextPath}/images/picture/${v.pic}">
                                </c:forEach>
							</div>
							
						</li>
						<li></li>
					</ul>
				</div>

				<div id="sec05" class="">
					<h2 class="cont_tit">세부사항</h2>
					<textarea readonly="readonly">${tradeBoard.comm}</textarea>
				</div>
		
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


			<div class="btn_sumit">
				<c:if test="${tradeBoard.seller == id && tradeBoard.buyer == null}">
					<button class="btn_send" type="button" id="updateBtn">수정하기</button>
					<button class="btn_send" type="button" id="deleteBtn">삭제하기</button>
				</c:if>
				<c:if test="${tradeBoard.seller != id}">
					<button class="btn_send" type="button" data-toggle="modal" data-target="#exampleModal1">쪽지보내기</button>
				<c:if test="${sessionauthor ne 'black'}">
					<c:if test="${tradeBoard.status == '거래 미정'}">	
						<button type="submit" class="btn_result" id="sitterFormApplyBtn">예약하기</button>
					</c:if>
				</c:if>
				</c:if>
				<button type="reset" class="btn_cancle "
					onclick="window.location.href='${pageContext.request.contextPath}/sitterList.do'">취소</button>
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
										name="title" value="RE: ${tradeBoard.title}"></td>
								</tr>
								<tr>
									<td class="col1_target">받을 사람</td>
									<td><input class="col2_target" type="text" id="receive"
										name="receive" value="${tradeBoard.seller}"></td>
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