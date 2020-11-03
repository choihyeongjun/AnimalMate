<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-4 col-md-4 mypagebox" id="profile">
			<h1>프로필</h1>
			<table class="table">
				<tr>
					<th>이름</th>
					<td>규르르</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>010-7777-9999</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>대구광역시 동구 신천동 동대구역 3번 출구 구석</td>
				</tr>
			</table>

			<a class="btn btn-outline-primary" href="#" role="button">수정</a>
		</div>

		<div class="col-lg-4 col-md-4 mypagebox">
			<h1>마이펫</h1>
			<table class="table">
				<tr>
					<td rowspan=2 width=30%><img src="https://pbs.twimg.com/media/CRSn98hUcAAryN7.jpg" width=70%
						height=30%></td>
					<td>뽀삐</td>
					<td>7살</td>
				</tr>
				<tr>
					<td colspan=2>대형견 시베리안 허스키</td>
				</tr>
				<tr>
					<td rowspan=2 width=30%><img
						src="https://pbs.twimg.com/media/CRSn98hUcAAryN7.jpg" width=70%
						height=30%></td>
					<td>뽀삐</td>
					<td>7살</td>
				</tr>
				<tr>
					<td colspan=2>대형견 시베리안 허스키</td>
				</tr>
			</table>


			<a class="btn btn-outline-primary" href="mypetForm.do" role="button">새 등록</a>&nbsp;&nbsp;
			<a class="btn btn-outline-primary" href="mypetList.do" role="button">목록</a>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-4 col-md-4 mypagebox">
			<h1>거래내역</h1>

			<table class="table">
				<tr>
					<th>남은 포인트</th>
					<td>9000</td>
				</tr>
				<tr>
					<th>진행중인 거래</th>
					<td><a class="btn btn-outline-primary" href="#" role="button"><p>5건</p></a></td>
				</tr>
				<tr>
					<th>거래내역</th>
					<td><a class="btn btn-outline-primary" href="#" role="button">더보기</td>
				</tr>
			</table>
		</div>

		<div class="col-lg-4 col-md-4 mypagebox">
			<h1>즐겨찾기</h1>
			<table class="table">
				<tr>
					<td>이름</td>
					<td>나이</td>
					<td>지역</td>
					<td><a class="btn btn-outline-primary" href="#" role="button">상세</a></td>
				</tr>

			</table>
			<a class="btn btn-outline-primary" href="#" role="button">더보기</a>
		</div>
	</div>
</body>
</html>