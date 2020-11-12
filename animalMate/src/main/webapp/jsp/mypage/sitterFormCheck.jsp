<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>돌봐줄게요  게시판 거래</title>
</head>
<body>
<br>
	<div>
		<h1>돌봐줄게요  게시판 거래</h1>
	</div>
<br>
	
	<h3>${tbs.title}</h3>
	<p>${tbs.ttime}</p>
	<div class="row">
		<div class="ownerFormCheckView">
			<h3>펫 정보</h3>
			<table class="table">
				<tr>
					<td rowspan="5" width =30%><img
						src="${pageContext.request.contextPath}/images/pet_pic/${tbs.pic}"></td>
					<th width =25%>펫 이름</th>
					<td>${tbs.name}</td>
				</tr>
				<tr>
					<th>펫 나이</th>
					<td>${tbs.age}</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>${tbs.gender}</td>
				</tr>
				<tr>
					<th>종류</th>
					<td>${tbs.type} ${tbs.detailType}</td>
				</tr>
				<tr>
					<th>중성화 유무</th>
					<td>${tbs.cut}</td>
				</tr>
			</table>
		</div>
		
		
		<div class="ownerFormCheckView">
			
			<div class = "row">
				<div>
					<h3>상대 정보</h3>		
				</div>
				<div>
					<button style = "margin:5px; background-color:rgb(255, 164, 89);"onclick="window.location.href='${pageContext.request.contextPath}/profile.do?id=${user.id}'">더보기</button><br>
				</div>
			</div>
			<table class="table">
				<tr>
					<td rowspan="5" width =30%><img id="userpic" src="${pageContext.request.contextPath}/images/members_pic/${user.pic}"></td>
					<th width =25%>이름</th>
					<td>${user.name}</td>
				</tr>
				<tr>
					<th>나이</th>
					<td>${age}</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>${gender}</td>
				</tr>
				<tr>
					<th>평점</th>
					<td>DBVALUE</td>
				</tr>
				<tr>
					<th>경력</th>
					<td>DBVALUE</td>
				</tr>
			</table>
		</div>
	</div>

	<div class="row">
		<div class="ownerFormCheckView">
		<h3>세부조건</h3>
			<table class="table">
				<tr>
					<th width =30%>근무지역</th>
					<td>${tbs.location1}</td>
				</tr>
				<tr>
					<th>상세지역</th>
					<td>${tbs.location2}</td>
				</tr>
				<tr>
					<th>근무날짜</th>
					<td>${tbs.sdate} ~ ${tbs.edate}</td>
				</tr>
				<tr>
					<th>근무시간</th>
					<td>${tbs.stime} ~ ${tbs.etime}</td>
				</tr>
				<tr>
					<th>거래금액</th>
					<td>${tbs.price}p</td>
				</tr>
			</table>
		</div>
		
		<div class="ownerFormCheckView">
			<h3>세부내용</h3>
			<div class="ownerFormCheckText">
				${tbs.comm}
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="checkDetail">
			<h3>체크리스트</h3>
			<table class="table">
				<tr>
					<th rowspan=2>체크리스트1</th>
					<td rowspan=2>멍뭉이 밥 123g만 주기</td>
					<td><img src="${pageContext.request.contextPath}/images/user.png"></td>
				</tr>
				<tr>
					<td><input type= "file" id = "#" name="#"></td>
				</tr>
				
				<tr>
					<th rowspan=2>체크리스트2</th>
					<td rowspan=2>산책 1시간 시키기</td>
					<td><img src="${pageContext.request.contextPath}/images/user.png"></td>
				</tr>
				<tr>
					<td><input type= "file" id = "#" name="#"></td>
				</tr>
				
				
			</table>
		</div>
	</div>
	
	<div class="ownerFormCheckButton">
		<button type="submit">업무저장하기</button>
	</div>
</body>
</html>