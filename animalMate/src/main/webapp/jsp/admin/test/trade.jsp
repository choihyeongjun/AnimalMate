<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="mainMenu.jsp"/>
<div align="center">
	<div>
		<table border="1">
			<h1>거래 관리</h1>
			<select>
			<option>진행건 
			<option>완료건
			</select>
			<h2>상세 내역</h2>
			<tr>
				<th>거래번호</th>
				<th>거래일자</th>
				<th>시터아이디</th>
				<th>반려인아이디</th>
				<th>제목</th>
				<th>거래상태</th>
				<th>거래금액</th>
				<th width="43.5">변경</th>
			</tr>
			<tr>
				<td><input type="text" name="code" value="1400"></td>
				<td><input type="text" name="stime" value="2020/10/20"></td>
				<td><input type="text" name="buyer" value="sitter20"></td>
				<td><input type="text" name="seller" value="catmom"></td>
				<td><input type="text" name="title" value="우리아이"></td>	
				<td><input type="text" name="status" value="미정"></td>
				<td><input type="text" name="price" value="10000"></td>
				<td><button>수정</button></td>
			</tr>
		</table>
	</div>
	<div>
		<table	border="1">
			<h1>입금 관리</h1>
				<select>
					<option>입금 대기</option>
					<option>입금 완료</option>
				</select>
				<h2>상세 내역</h2>
					<tr>
						<th>거래번호</th>
						<th>거래일자</th>
						<th>시터아이디</th>
						<th>반려인아이디</th>
						<th>제목</th>
						<th>거래금액</th>
						<th width="43.5">변경</th>
					</tr>
				<tr>
					<td><input type="text" name="code" value="1400"></td>
					<td><input type="text" name="stime" value="2020/10/20"></td>
					<td><input type="text" name="buyer" value="sitter20"></td>
					<td><input type="text" name="seller" value="catmom"></td>
					<td><input type="text" name="title" value="우리아이"></td>	
					<td><input type="text" name="price" value="10000"></td>
					<td><button>수정</button></td>
				</tr>
		</table>
	</div>
	<div>
		<h1>사이트 수입 내역</h1>
		<table border="1">
			<h2>총 수입:</h2>
			<tr>
				월별 수입
			</tr>
		</table>
	</div>
</div>
</body>
</html>