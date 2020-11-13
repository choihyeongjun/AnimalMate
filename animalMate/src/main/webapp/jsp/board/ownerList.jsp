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
	table span { position: relative;float: left;}
	.tsearch {margin: 0 0 20px 36px;}
	.ttitle {width: 80px;text-align: center;font-weight: bold;}
	.tbottom {text-align: center; width: 180px;height: 30px;} 
	.tbottom .minPrice {width:92px;position: relative;float: left;margin: 2px;height: 30px;}
	.tbottom .datein {width:80px;position: relative;float: left;margin: 1.75px;height: 30px;}
	.tbottom .timein {width: 80px; position: relative;float: left;height: 30px;}
	.tbottom .statusin {position: relative;float: left;width: 100%;height: 30px;}
	.tbottom .typein {position: relative;float: left;width: 100%;height: 30px;}
	.tbtn {height: 60px;margin-left: 30px;width:100px;border-radius: 10px;}
	.regiBtn {height: 60px; margin-left: 30px;width: 100px; border-radius: 10px;}
	.boardtitle {margin-left: 460px;margin-bottom: 41px;}
	.boardimg{width: 1110px;height: 140px;}
	.frm {margin-top: 50px;}
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
		
		<img class="boardimg" src="${pageContext.request.contextPath}/images/img/boardimg.jpg">
		<!-- <h3 class="boardtitle">돌봐주세요 게시판</h3> -->
	</div>
	<br>
	
	<div>
		<form class="frm" id="frm" name="frm" method="get" action="${pageContext.request.contextPath}/ownerList.do">
		<table class="tsearch">
		<tr>
			<td class="ttitle" colspan="2">분류</td> 
			<td class="tbottom" colspan="10">
				<select class="typein" id="ttype" name="ttype">
					<option>선택하세요</option>
					<option value="고양이" <c:if test="${ttype == '고양이'}">selected="selected"</c:if>>고양이</option>
					<option value="대형견" <c:if test="${ttype == '대형견'}">selected="selected"</c:if>>대형견</option>
					<option value="중형견" <c:if test="${ttype == '중형견'}">selected="selected"</c:if>>중형견</option>
					<option value="소형견" <c:if test="${ttype == '소형견'}">selected="selected"</c:if>>소형견</option>
				</select>
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
			<td class="ttitle" colspan="2">돌봄지역<td> 
			<td class="tbottom" colspan="7">
				<select id="location1" name="location1" class="typein">
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
			<td rowspan="2">
				<button class="tbtn" type="submit">검색</button>
			</td>
			<c:if test="${sessionauthor != null && sessionauthor != 'black'}">
				<td rowspan="2">
					<button class="regiBtn" type="button" onclick="window.location.href='${pageContext.request.contextPath}/ownerForm.do'">글등록</button>
				</td>
			</c:if>
		</tr>
		<tr>
		<td class="ttitle" colspan="2">돌봄날짜</td>
		<td class="tbottom" colspan="10">
			<input class="datein" type="date" id="sDate" name="sDate" <c:if test="${param.sDate != null}">value="${param.sDate}"</c:if>>
			<span>~</span>
			<input class="datein" type="date" id="eDate" name="eDate" <c:if test="${param.eDate != null}">value="${param.eDate}"</c:if>>
		</td>
		<td class="ttitle" colspan="2">돌봄시간</td>
		<td class="tbottom" colspan="4">
			<input class="timein" type="time" id="sTime" name="sTime" >
			<span>~</span>
			<input class="timein" type="time" id="eTime" name="eTime">
		</td>
		<td class="ttitle" colspan="2">돌봄금액</td>
		<td class="tbottom" colspan="10">
			<input class="minPrice" id="minPrice" name="minPrice" type="number" step="1000" placeholder="최소금액"<c:if test="${param.minPrice != null}">value="${param.minPrice}"</c:if>>
			<span>~</span>
			<input class="minPrice" id="maxPrice" name="maxPrice" type="number" step="1000" placeholder="최대금액"<c:if test="${param.maxPrice != null}">value="${param.maxPrice}"</c:if>>
		</td>
		
		</tr>
		</table>
		</form>
	</div>

	<div id="main" align="center">
		<div class="inner" align="center">
	
			<!-- Boxes -->
			<div class="thumbnails" align="center">
				<c:forEach var="v" items="${Superlist}" >
					<c:if test="${ttype == v.petVO.type || ttype == '선택하세요' || ttype == null}">
					<c:if test="${status == v.status || status == '선택하세요' || status == null}">
					<c:if test="${location1 == v.location1 || location1 == '선택하세요' || location1 == null}">
					<c:if test="${v.price != '0'}">
					<c:if test="${v.sdate != '제외'}">
					<c:if test="${v.edate != '제외'}">
						<div class="box">
							<input class="sitterListCode" type="hidden" value="${v.code}">
							<img class="image fit"
								src="${pageContext.request.contextPath}/images/pet_pic/${v.petVO.pic}"
								alt="" />
							<div>
								<dl>
									<dt>분&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;류</dt>
									<dd>${v.petVO.type}</dd>
								</dl>
								<dl>
									<dt>돌봄지역</dt>
									<dd>${v.location1}</dd>
								</dl>
								<dl>
									<dt>돌봄날짜</dt>
									<dd>${fn:substring(v.sdate, 5, 10)}~ ${fn:substring(v.edate, 5, 10)}</dd>
								</dl>
								<dl>
									<dt>돌봄시간</dt>
									<dd>${v.stime}~ ${v.etime}</dd>
								</dl>
								<dl>
									<dt>돌봄금액</dt>
									<dd>${v.price}</dd>
								</dl>
								<dl>
									<dt>거래상태</dt>
									<dd>${v.status}</dd>
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