<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="sec01" class="sitter_info">
				<h2 class="cont_tit">펫정보</h2>
	<c:forEach var="border" items="${borders}">
				<div class="cont_area">
					<div class="info_img">
						<img class="info_img"
							src="${pageContext.request.contextPath}/images/pet_pic/{border.pic}"
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
										<td>{border.name}</td>
									</tr>

									<tr>
										<td>펫 나이</td>
										<td>{border.age}</td>
									</tr>

									<tr>
										<td>펫 성별</td>
										<td>{border.gender}</td>
									</tr>

									<tr>
										<td>펫 종류</td>
										<td>{border.type}</td>
									</tr>

									<tr>
										<td>중성화 유무</td>
										<td>{border.cut}</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>

</body>
</html>