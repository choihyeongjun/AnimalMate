<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>포인트 충전</h1>
	<div class = "row">
		<form id="frm" name="frm" action="${pageContext.request.contextPath}/pointChargingAction.do" method="post">
			<div class = "pointCharging">
				<table class = "table">
					<th>충전 금액</th>
					<td>
						<input type = "text" id="point" name="point" size=30 maxlength=6 placeholder="충전할 포인트를 입력해 주세요">
					</td>
					<td>
						<button>충전</button>
					</td>
				</table>
			</div>
		</form>
	</div>
</body>
</html>