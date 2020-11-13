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
					<option value="고양이">고양이</option>
					<option value="대형견">대형견</option>
					<option value="중형견">중형견</option>
					<option value="소형견">소형견</option>
				</select>
			</td>
			<td class="ttitle" colspan="2">거래상태</td>
			<td class="tbottom" colspan="4">
				<select class="statusin" id="status" name="status">
					<option>선택하세요</option>
					<option value="거래 미정">거래 미정</option>
					<option value="거래 대상 확정">거래 대상 확정</option>
					<option value="입금 후">입금 완료</option>
					<option value="반려인 미확인">반려인 미확인</option>
					<option value="거래 완료">거래 완료</option>
				</select>
			</td>
			<td class="ttitle" colspan="2">돌봄지역<td> 
			<td class="tbottom" colspan="7">
				<input placeholder="돌봄지역을 입력하세요" type="text" id="location1" name="location1">
			</td>
			<td rowspan="2">
				<button class="tbtn" type="submit">검색</button>
			</td>
			<c:if test="${sessionauthor == 'usersitter'}">
				<td rowspan="2">
					<button class="regiBtn" type="button" onclick="window.location.href='${pageContext.request.contextPath}/ownerForm.do'">글등록</button>
				</td>
			</c:if>
		</tr>
		<tr>
		<td class="ttitle" colspan="2">돌봄날짜</td>
		<td class="tbottom" colspan="10">
			<input class="datein" type="date" id="sDate" name="sDate">
			<span>~</span>
			<input class="datein" type="date" id="eDate" name="eDate">
		</td>
		<td class="ttitle" colspan="2">돌봄시간</td>
		<td class="tbottom" colspan="4">
			<input class="timein" type="time" id="sTime" name="sTime">
			<span>~</span>
			<input class="timein" type="time" id="eTime" name="eTime">
		</td>
		<td class="ttitle" colspan="2">돌봄금액</td>
		<td class="tbottom" colspan="10">
			<input class="minPrice" id="minPrice" name="minPrice" type="number" step="1000" placeholder="최소금액">
			<span>~</span>
			<input class="minPrice" id="maxPrice" name="maxPrice" type="number" step="1000" placeholder="최대금액">
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
									<dd>${v.sdate}~ ${v.edate}</dd>
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
				</c:forEach>

			</div>
			<!-- Boxes -->

		</div>
	</div>
</body>
</html>