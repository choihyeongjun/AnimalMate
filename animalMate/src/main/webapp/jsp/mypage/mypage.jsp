<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
	.row {
		justify-content: center;
		align-items: center;
	}
	
	.mypagebox {
		padding: 40px;
		border: 2px solid rgb(15, 162, 226);
		margin: 50px;
		box-shadow: 3px 3px 3px 3px rgb(15, 162, 226);
		text-align: center;
	}
	
	.mypagebox h1 {
		color: rgb(15, 162, 226);
	}
	
	.mypagebox dt {
		width: 40%;
	}
	
	.mypagebox dd {
		width: 60%;
	}
	
	
	.petlsit {
		width: 20%
	}
</style>
</head>
<body>
	<div class="row">
		<div class="col-lg-4 col-md-4 mypagebox" id="profile">
			<dl class="row">
				<dt><h1>프로필</h1></dt>
				<dd><img src="https://pbs.twimg.com/media/CRSn98hUcAAryN7.jpg" width=50% height=50%></dd>
			</dl>
			<hr>
			<dl class="row">
				<dt>닉네임</dt>
				<dd>규르르</dd>

				<dt>전화번호</dt>
				<dd>010-7777-9999</dd>

				<dt>주소</dt>
				<dd>대구광역시 동구 신천동 동대구역 3번 출구 구석</dd>
			</dl>

			<a class="btn btn-outline-primary" href="#" role="button">수정</a>
		</div>

		<div class="col-lg-4 col-md-4 mypagebox">
			<h1>마이펫</h1>
			<table class = "table">
					<tr>
						<td rowspan=2 width=30%><img src="https://pbs.twimg.com/media/CRSn98hUcAAryN7.jpg" width=70% height=30%></td>
						<td>뽀삐</td> 
						<td>7살</td>
					</tr>
					<tr>
						<td colspan=2>대형견 시베리안 허스키</td>
					</tr>
					<tr>
						<td rowspan=2 width=30%><img src="https://pbs.twimg.com/media/CRSn98hUcAAryN7.jpg" width=70% height=30%></td>
						<td>뽀삐</td> 
						<td>7살</td>
					</tr>
					<tr>
						<td colspan=2>대형견 시베리안 허스키</td>
					</tr>
			</table>
			
			
			<a class="btn btn-outline-primary" href="#" role="button">새 등록</a>&nbsp;&nbsp;
			<a class="btn btn-outline-primary" href="#" role="button">목록</a>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-4 col-md-4 mypagebox">
			<h1>거래내역</h1>
			
			<table class = "table">
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
			<table class = "table">
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