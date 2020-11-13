<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* Box */
	.thumbnails {display: flex;flex-wrap: wrap;margin: 0 auto;}
	.thumbnails .box {margin: 0 21px 2em 19px;width: 330px;height: 430px;}
	/* Box */
	.box {border-radius: 10px;background: #FF8826;text-align: center;font-size: 14px;}
	.box dt, dd {color: white;float: left;width: 50%;text-shadow: 1px 1px 1px #00000073;font-weight: bold;}
	/* Image */
	.image.fit {display: block;width: 100%;height: 240px;border-radius: 10px 10px 10px 10px;border: 3.2px solid #FF8826;}
	/* 검색창과 썸네일 간격  */
	#main {padding: 4em 0 2em 0;}
	.code_dl {display: none;}
	.boardtitle {margin: 40px 0 41px 460px;}
	.tsearch {width: 1000px;}
	.boardimg{width: 1110px;height: 140px;}
	.frm {margin: 50px 0 0 71px;}
	.datein {position:relative;float:left;}
	.minPrice {position:relative;float:left;width: 161px;}
	span{position:relative;float:left;}
	.tbtn {background-color: rgb(255,136,38);font-weight: bold;color: black;
	    border: none;width: 100px; border-radius: 4px; height: 30px; margin-left: 10px;}
	 .regiBtn {background-color: rgb(255,136,38);font-weight: bold;color: black;
	    border: none;width: 100px; border-radius: 4px; height: 30px; margin-left: 10px;}
	.tbtn1 {background-color: rgb(179 173 167); font-weight: bold;color: black;
	    border: none;width: 100px; border-radius: 4px; height: 30px;margin-left: 10px;}
	.ttitle {width: 80px;text-align: center;font-weight: bold;}
	.ttitle td {margin-bottom: 20px;}
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
		<!-- <h3 class="boardtitle">돌봐줄게요 게시판</h3> -->
		<img class="boardimg" src="${pageContext.request.contextPath}/images/img/boardimg.jpg">
	</div>
	
	<form class="frm" id="frm" name="frm" method="get" action="${pageContext.request.contextPath}/sitterList.do">
		<table class="tsearch">
		<tr>
			<td class="ttitle" colspan="2">펫수용수</td> 
			<td class="tbottom" colspan="4">
				<c:if test="${maxp == null}">
					<input type="number" max="5" min="1" value=1 name="maxp">마리 이상
				</c:if>
				<c:if test="${maxp != null}">
					<input type="number" max="5" min="1" value=${maxp} name="maxp">마리 이상
				</c:if>
			</td>
			<td class="ttitle" colspan="2">돌봄날짜</td>
		<td class="tbottom" colspan="10">
			<input class="datein" type="date" id="sDate" name="sDate" <c:if test="${param.sDate != null}">value="${param.sDate}"</c:if>>
			<span>~</span>
			<input class="datein" type="date" id="eDate" name="eDate" <c:if test="${param.eDate != null}">value="${param.eDate}"</c:if>>
		</td>
		<td class="ttitle" colspan="2">거래상태</td>
			<td class="tbottom" colspan="4">
				<select class="statusin" id="status" name="status">
					<option>선택하세요</option>
					<option value="거래 미정" <c:if test="${status == '거래 미정'}">selected="selected"</c:if>>거래 미정</option>
					<option value="거래 대상 확정" <c:if test="${status == '거래 대상 확정'}">selected="selected"</c:if>>거래 대상 확정</option>
					<option value="입금 후" <c:if test="${status == '입금 후'}">selected="selected"</c:if>>입금 완료</option>
					<option value="반려인 미확인" <c:if test="${status == '반려인 미확인'}">selected="selected"</c:if>>반려인 미확인</option>
					<option value="후기 미작성" <c:if test="${status == '후기 미작성'}">selected="selected"</c:if>>후기 미작성</option>
					<option value="거래 완료" <c:if test="${status == '거래 완료'}">selected="selected"</c:if>>거래 완료</option>
				</select>
			</td>
		</tr>
		<tr>
		
			<td class="ttitle" colspan="1">돌봄지역<td> 
			<td class="tbottom" colspan="4">
				<select id="location1" name="location1" class="loactionin">
					<option>선택하세요</option>
					<option value="서울" <c:if test="${location1 == '서울'}">selected="selected"</c:if>>서울</option>
					<option value="경기" <c:if test="${location1 == '경기'}">selected="selected"</c:if>>경기</option>
					<option value="인천" <c:if test="${location1 == '인천'}">selected="selected"</c:if>>인천</option>
					<option value="대전" <c:if test="${location1 == '대전'}">selected="selected"</c:if>>대전</option>
					<option value="대구" <c:if test="${location1 == '대구'}">selected="selected"</c:if>>대구</option>
					<option value="부산" <c:if test="${location1 == '부산'}">selected="selected"</c:if>>부산</option>
					<option value="울산" <c:if test="${location1 == '울산'}">selected="selected"</c:if>>울산</option>
					<option value="광주" <c:if test="${location1 == '광주'}">selected="selected"</c:if>>광주</option>
					<option value="강원" <c:if test="${location1 == '강원'}">selected="selected"</c:if>>강원</option>
					<option value="세종" <c:if test="${location1 == '세종'}">selected="selected"</c:if>>세종</option>
					<option value="충북" <c:if test="${location1 == '충북'}">selected="selected"</c:if>>충북</option>
					<option value="충남" <c:if test="${location1 == '충남'}">selected="selected"</c:if>>충남</option>
					<option value="경북" <c:if test="${location1 == '경북'}">selected="selected"</c:if>>경북</option>
					<option value="경남" <c:if test="${location1 == '경남'}">selected="selected"</c:if>>경남</option>
					<option value="전북" <c:if test="${location1 == '전북'}">selected="selected"</c:if>>전북</option>
					<option value="경남" <c:if test="${location1 == '경남'}">selected="selected"</c:if>>경남</option>
					<option value="전남" <c:if test="${location1 == '전남'}">selected="selected"</c:if>>전남</option>
					<option value="제주" <c:if test="${location1 == '제주'}">selected="selected"</c:if>>제주</option>
				</select>	
			</td>
		<td class="ttitle" colspan="1">돌봄금액</td>
		<td class="tbottom" colspan="11">
			<input class="minPrice" id="minPrice" name="minPrice" type="number" step="1000" placeholder="최소금액"<c:if test="${param.minPrice != null}">value="${param.minPrice}"</c:if>>
			<span>~</span>
			<input class="minPrice" id="maxPrice" name="maxPrice" type="number" step="1000" placeholder="최대금액"<c:if test="${param.maxPrice != null}">value="${param.maxPrice}"</c:if>>
		</td>
		<td colspan="4">
				<button class="tbtn" type="submit">검색</button>
				<button class="tbtn1" type="reset">검색취소</button>
			</td>
			<c:if test="${sessionauthor == 'usersitter'}">
				<td rowspan="2">
					<button class="regiBtn" type="button" onclick="window.location.href='${pageContext.request.contextPath}/ownerForm.do'">글등록</button>
				</td>
			</c:if>
		</tr>
		</table>
	</form>	

	<div id="main">
		<div class="inner">

			<!-- Boxes -->
			<div class="thumbnails">
				<c:forEach var="v" items="${Superlist}">
					<c:if test="${maxp <= v[1].maxP || maxp == 1 || maxp == null}">
					<c:if test="${status == v[2].status || status == '선택하세요' || status == null}">
					<c:if test="${location1 == v[2].location1 || location1 == '선택하세요' || location1 == null}">
					<c:if test="${v[2].price != '0'}">
					<c:if test="${v[2].sdate != '제외'}">
					<c:if test="${v[2].edate != '제외'}">
						<div class="box">
							<input class="sitterListCode" type="hidden" value="${v[2].code}">
							<img class="image fit"
								src="${pageContext.request.contextPath}/images/members_pic/${v[0].pic}"
								alt="사진이 없습니다!" />
							<div>
								<dl>
									<dt>펫수용수</dt>
									<dd>${v[1].maxP}마리</dd>
								</dl>
								<dl>
									<dt>돌봄지역</dt>
									<dd>${v[2].location1}</dd>
								</dl>
								<dl>
									<dt>돌봄날짜</dt>
									<dd>${fn:substring(v[2].sdate, 5, 10)}~ ${fn:substring(v[2].edate, 5, 10)}</dd>
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
					</c:if>
					</c:if>
					</c:if>
					</c:if>
					</c:if>
					</c:if>	
				</c:forEach>
			</div>
			<!-- Boxes -->
			
		</div>
	</div>
</body>
</html>