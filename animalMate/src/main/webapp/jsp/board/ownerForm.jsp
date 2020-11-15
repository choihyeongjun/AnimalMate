
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>돌봐주세요(등록form)</title>
<!-- jquery -->
<script src="js/jquery-3.5.1.min.js"></script>

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
.boardimg {
	width: 1110px;
	height: 140px;
}

.titleinput {
	width: 900px;
}

.title {
	margin-top: 40px;
}

.container {
	max-width: 1140px;
	margin: 0px auto 0;
}

.cont_tit {
	display: inline;
}

.title {
   margin: 40px 0 10px 0;
    text-align: left;
}

.ownerFormChkbox{
	display : inline;
	width: 20px;
	max-width: 20px;
}


</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(function() {
		// 버튼 add function
		$(document).on("click", ".checkAddBtn", function() {
			var addDiv = $('<div/>', {
				'class' : 'checkList1 check_input_2ea'
			});
			var $input = $('<input/>', {
				type : 'text',
				placeholder : '업무 체크리스트를 입력해주세요.',
				name : 'joblistComm'
			});

			$(addDiv).append($input);
			$(addDiv).append($('<button/>').attr({
				'class' : 'checkDelBtn btn_xs c_red'
			}).text('삭제'));
			$("#sec03").append(addDiv);
		});

		// 버튼 minus function
		$(document).on("click", ".checkDelBtn", function() {
			$(this).parent().remove();
		});

		//펫 이름 선택했을 때
		$("#name").on({
			"change" : function() {
				var petName = $(this).val()
				$.ajax({
					url : '${pageContext.request.contextPath}/ajax/petInfo.do',
					data : {
						name : petName
					},
					dataType : 'json',
					error : function(xhr, status, msg) {
						alert("상태값 :" + status + " Http에러메시지 :" + msg);
					},
					success : function(pet) {
						$("#ageTD").text(pet.age);
						$("#genderTD").text(pet.gender);
						$("#typeTD").text(pet.type);
						$("#cutTD").text(pet.cut);
						$("#petCode").val(pet.code);
					}
				}) //end of ajax
			} //end of change function
		})//end of on
	});
	
	
</script>

</head>

<body>
	<!-- s:container -->
	<div class="container">
		<form id="frm" name="frm"
			action="${pageContext.request.contextPath}/ownerInsert.do"
			method="post">
			<!-- s:title -->
			<img class="boardimg"
				src="${pageContext.request.contextPath}/images/img/boardimg.jpg">
			<div class="title">
				<!-- <h1>돌봐주세요- (글등록 Form)</h1> -->
				<h2 class="cont_tit">제목</h2> <input class="titleinput" type="text" name="title"
					placeholder="제목을 입력하세요" value="${tradeBoardVO.title}">
			</div>
			<br>
			<!-- e:title -->

			<!-- s:contents -->
			<div class="contents sitter">
				<div id="sec01" class="sitter_info">
					<h2 class="cont_tit">펫 정보</h2>

					<c:forEach items="${petList}" var="v">
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
											<td>
												${v.name} 
												<input type="checkbox" class="ownerFormChkbox" value="${v.code}" name="petCode" 
													<c:forEach var="a" items="${petCodeList}">
														<c:if test="${v.code == a.petCode}">checked="checked"</c:if>
													</c:forEach>
												>
											 </td>
										</tr>
	
										<tr>
											<td>나이</td>
											<td id="ageTD">${v.age}</td>
										</tr>
	
										<tr>
											<td>성별</td>
											<td id="genderTD">${v.gender}</td>
										</tr>
	
										<tr>
											<td>종류</td>
											<td id="typeTD">${v.type}</td>
										</tr>
	
										<tr>
											<td>중성화 유무</td>
											<td id="cutTD">${v.cut}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</c:forEach>
					
				</div>

				<div id="sec02" class="layout_2ea">
					<div class="layout__cont">
						<h2 class="cont_tit">세부조건</h2>

						<table class="tbl_write__list">
							<colgroup>
								<col width="30%">
								<col width="70%">
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
									<td>
										<select name="location1">
											<option>선택하세요</option>
											<option value="서울" <c:if test="${tradeBoardVO.location1 == '서울'}">selected="selected"</c:if>>서울</option>
										<option value="경기" <c:if test="${tradeBoardVO.location1 == '경기'}">selected="selected"</c:if>>경기</option>
										<option value="인천" <c:if test="${tradeBoardVO.location1 == '인천'}">selected="selected"</c:if>>인천</option>
										<option value="대전" <c:if test="${tradeBoardVO.location1 == '대전'}">selected="selected"</c:if>>대전</option>
										<option value="대구" <c:if test="${tradeBoardVO.location1 == '대구'}">selected="selected"</c:if>>대구</option>
										<option value="부산" <c:if test="${tradeBoardVO.location1 == '부산'}">selected="selected"</c:if>>부산</option>
										<option value="울산" <c:if test="${tradeBoardVO.location1 == '울산'}">selected="selected"</c:if>>울산</option>
										<option value="광주" <c:if test="${tradeBoardVO.location1 == '광주'}">selected="selected"</c:if>>광주</option>
										<option value="강원" <c:if test="${tradeBoardVO.location1 == '강원'}">selected="selected"</c:if>>강원</option>
										<option value="세종" <c:if test="${tradeBoardVO.location1 == '세종'}">selected="selected"</c:if>>세종</option>
										<option value="충북" <c:if test="${tradeBoardVO.location1 == '충북'}">selected="selected"</c:if>>충북</option>
										<option value="충남" <c:if test="${tradeBoardVO.location1 == '충남'}">selected="selected"</c:if>>충남</option>
										<option value="경북" <c:if test="${tradeBoardVO.location1 == '경북'}">selected="selected"</c:if>>경북</option>
										<option value="경남" <c:if test="${tradeBoardVO.location1 == '경남'}">selected="selected"</c:if>>경남</option>
										<option value="전북" <c:if test="${tradeBoardVO.location1 == '전북'}">selected="selected"</c:if>>전북</option>
										<option value="경남" <c:if test="${tradeBoardVO.location1 == '경남'}">selected="selected"</c:if>>경남</option>
										<option value="전남" <c:if test="${tradeBoardVO.location1 == '전남'}">selected="selected"</c:if>>전남</option>
										<option value="제주" <c:if test="${tradeBoardVO.location1 == '제주'}">selected="selected"</c:if>>제주</option>
										</select> 
									</td>
								</tr>
								<tr>
									<th>상세지역</th>
									<td><input type="text" name="location2"
										placeholder="돌봄 세부지역을 입력하세요" value="${tradeBoardVO.location2}"></td>
								</tr>
								<tr>
									<th>돌봄날짜</th>
									<td>
										<!-- jQuery datepicker 연결하면 됨-->
										<div class="calendar">
											<input type="date" name="sdate" id="sdate" placeholder="시작일" value="${tradeBoardVO.sdate}">
											<span>~</span> 
											<input type="date" name="edate" id="edate" placeholder="종료일" value="${tradeBoardVO.edate}">
										</div>
									</td>
								</tr>

								<tr>
									<th>돌봄시간</th>
									<td>
										<div class="calendar">
											<input type="time" name="stime" id="stime" value="${tradeBoardVO.stime}"> <span>~</span>
											<input type="time" name="etime" id="etime" value="${tradeBoardVO.etime}">
										</div>
									</td>
								</tr>

								<tr>
									<th>거래금액</th>
									<td class="amount"><input type="text" name="price"
										id="price" placeholder="서비스 비용을 입력하세요" value="${tradeBoardVO.price}">원</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div id="sec03" class="check_list layout__cont">
						<div class="checkList_2ea">
							<h2 class="cont_tit">체크리스트(선택사항)</h2>
							<button class="checkAddBtn btn_xs c_gray_line" type="button">추가</button>
						</div>

						<c:forEach items="${joblistList}" var="v">
							<div class="checkList1 check_input_2ea">
								<input type="text" id="joblistComm" name="joblistComm"
									placeholder="업무 체크리스트를 입력해주세요" value="${v.comm}">
								<button class="checkDelBtn btn_xs c_red" type="button">삭제</button>
								<!-- class명 바꿔야함 삭제로(checkAddBtn) -->
							</div>
						</c:forEach>
					</div>
				</div>

				<div id="sec05" class="">
					<h2 class="cont_tit">세부내용</h2>

					<textarea name="comm" id="comm" placeholder="세부내용을 입력해 주세요">
						${tradeBoardVO.comm}
					</textarea>
				</div>

				<div id="sec06" class="sitter_caution">
					<h2 class="cont_tit">유의사항</h2>

					<ul>
						<li>○ 배드, 사료, 산책용품등은 의뢰자께서 준비해주세요.</li>
						<li>○ 특이사항(질병등)은 사전에 펫시터에게 공지해주세요.</li>
						<li>○ 펫시터 신분증, 주민등록등본등을 미리 확인해주세요.</li>
						<li>○ 의뢰시 간단하게 계약서나 약정서를 작성하세요.</li>
						<li>○ 표준계약서는 '이용안내'에서 내려받을수 있습니다.</li>
					</ul>
				</div>
			</div>
			<!-- e:contents -->

			<div class="btn_group btn_submit btn_l">
				<c:if test="${param.code == null}">
					<button type="submit" class="c_orange">글등록</button>
				</c:if>
				<c:if test="${tradeBoardVO.buyer == id && tradeBoardVO.seller == null}">
                    <button type="submit" class="c_orange" formaction="${pageContext.request.contextPath}/ownerUpdate.do?code=${param.code}">수정하기</button>
                 </c:if>
				<button type="reset" class="c_gray"
					onclick="window.location.href='${pageContext.request.contextPath}/ownerList.do'">취소</button>
			</div>
		</form>
	</div>
	<!-- s:container -->

</body>
</html>