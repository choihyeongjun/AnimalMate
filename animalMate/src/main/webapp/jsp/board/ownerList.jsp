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
}
</style>
</head>

<body id="top">
	<div>
		<h1>돌봐주세요 리스트</h1>
	</div>
	<div>
		<label>펫 종류</label> 
		<select id="petType" name="petType">
			<option>선택하세요</option>
			<option value="cat">고양이</option>
			<option value="big">대형견</option>
			<option value="middle">중형견</option>
			<option value="small">소형견</option>
		</select> 
		<label>시작시간</label> 
		<select id="sTime" name="sTime">
			<option>선택하세요</option>
			<option>07:00</option>
			<option>08:00</option>
			<option>09:00</option>
			<option>10:00</option>
			<option>11:00</option>
			<option>12:00</option>
			<option>13:00</option>
			<option>14:00</option>
			<option>15:00</option>
			<option>16:00</option>
			<option>17:00</option>
			<option>18:00</option>
			<option>19:00</option>
			<option>20:00</option>
			<option>21:00</option>
			<option>22:00</option>
		</select>
		 <label>끝 시간</label> 
		 <select id="eTime" name="eTime">
			<option>선택하세요</option>
			<option>07:00</option>
			<option>08:00</option>
			<option>09:00</option>
			<option>10:00</option>
			<option>11:00</option>
			<option>12:00</option>
			<option>13:00</option>
			<option>14:00</option>
			<option>15:00</option>
			<option>16:00</option>
			<option>17:00</option>
			<option>18:00</option>
			<option>19:00</option>
			<option>20:00</option>
			<option>21:00</option>
			<option>22:00</option>
		</select>
	</div>

	<div>
		<button
			onclick="window.location.href='${pageContext.request.contextPath}/ownerForm.do'">글
			등록</button>
	</div>
	<div id="main">
		<div class="inner">

			<!-- Boxes -->
			<div class="thumbnails">
			
				<c:forEach var="border" items="${borders}">
					<div class="box">
						<img class="image fit" src="${pageContext.request.contextPath}${border.pic}" alt="" />
						<div>
							
							<dl>
								<dt>펫 분 류</dt>
								<dd>${border.type}</dd>
							</dl>
							<dl>
								<dt>근무지역</dt>
								<dd>${border.location2}</dd>
							</dl>
							<dl>
								<dt>근무시간</dt>
								<dd>${border.wtime}</dd>
							</dl>
							<dl>
								<dt>돌봄금액</dt>
								<dd>${border.price}</dd>
							</dl>
							<dl>
							<dt>거래상태</dt>
							<dd>${border.status}</dd>
						</dl>
						</div>
					</div>
				</c:forEach>


			</div>

		</div>
	</div>
</body>
</html>