<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		margin:0 auto;
	}

		.thumbnails .box {
			margin: 0 1em 2em 1em;
			width: 20%;	   
		}

/* Box */

	.box {
		border-radius: 10px;
		background: rgb(15,162,226);
		text-align: center;
		font-size: 10px;

	}
	
	.box dt,dd {
	color : white;
	float:left;
 	width:50%;
 	
	}


		.Image.fit {
			border-radius: 4px 4px 0 0;
			
		}


/* Image */

		.image.fit {
			display: block;
			margin: 0 0 2em 0;
			width: 100%;
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
	<select>
		<option></option>
		<option></option>
		<option></option>
		<option></option>
	</select>
	
	<label>시작시간</label>
	<select>
		<option></option>
		<option></option>
		<option></option>
		<option></option>
	</select>
	
	<label>끝 시간</label>
	<select>
		<option></option>
		<option></option>
		<option></option>
		<option></option>
	</select>
</div>

<div id="main">
					<div class="inner">

					<!-- Boxes -->
						<div class="thumbnails">

							<div class="box">
								<img class="image fit" src="${pageContext.request.contextPath}/images/muncat.jpg" alt="" />
								<div>
									<dl>
										<dt>펫 분 류</dt>
										<dd>DBVALUE</dd>
									</dl>
									<dl>
										<dt>근무지역</dt>
										<dd>DBVALUE</dd>
									</dl>
									<dl>
										<dt>근무시간</dt>
										<dd>DBVALUE</dd>
									</dl>
									<dl>
										<dt>돌봄금액</dt>
										<dd>DBVALUE</dd>
									</dl>
								</div>
							</div>
							
							
							<div class="box">
								<img  class="image fit" src="${pageContext.request.contextPath}/images/muncat.jpg" alt="" />
								<div>
									<dl>
										<dt>펫 분 류</dt>
										<dd>DBVALUE</dd>
									</dl>
									<dl>
										<dt>근무지역</dt>
										<dd>DBVALUE</dd>
									</dl>
									<dl>
										<dt>근무시간</dt>
										<dd>DBVALUE</dd>
									</dl>
									<dl>
										<dt>돌봄금액</dt>
										<dd>DBVALUE</dd>
									</dl>
								</div>
							</div>
							
							
							<div class="box">
								<img  class="image fit" src="${pageContext.request.contextPath}/images/muncat.jpg" alt="" />
								<div>
									<dl>
										<dt>펫 분 류</dt>
										<dd>DBVALUE</dd>
									</dl>
									<dl>
										<dt>근무지역</dt>
										<dd>DBVALUE</dd>
									</dl>
									<dl>
										<dt>근무시간</dt>
										<dd>DBVALUE</dd>
									</dl>
									<dl>
										<dt>돌봄금액</dt>
										<dd>DBVALUE</dd>
									</dl>
								</div>
							</div>
							
							
							<div class="box">
								<img  class="image fit" src="${pageContext.request.contextPath}/images/muncat.jpg" alt="" />
								<div>
									<dl>
										<dt>펫 분 류</dt>
										<dd>DBVALUE</dd>
									</dl>
									<dl>
										<dt>근무지역</dt>
										<dd>DBVALUE</dd>
									</dl>
									<dl>
										<dt>근무시간</dt>
										<dd>DBVALUE</dd>
									</dl>
									<dl>
										<dt>돌봄금액</dt>
										<dd>DBVALUE</dd>
									</dl>
								</div>
							</div>
							
							
							<div class="box">
								<img  class="image fit" src="${pageContext.request.contextPath}/images/muncat.jpg" alt="" />
								<div>
									<dl>
										<dt>펫 분 류</dt>
										<dd>DBVALUE</dd>
									</dl>
									<dl>
										<dt>근무지역</dt>
										<dd>DBVALUE</dd>
									</dl>
									<dl>
										<dt>근무시간</dt>
										<dd>DBVALUE</dd>
									</dl>
									<dl>
										<dt>돌봄금액</dt>
										<dd>DBVALUE</dd>
									</dl>
								</div>
							</div>
							
							
							<div class="box">
								<img  class="image fit" src="${pageContext.request.contextPath}/images/muncat.jpg" alt="" />
								<div>
									<dl>
										<dt>펫 분 류</dt>
										<dd>DBVALUE</dd>
									</dl>
									<dl>
										<dt>근무지역</dt>
										<dd>DBVALUE</dd>
									</dl>
									<dl>
										<dt>근무시간</dt>
										<dd>DBVALUE</dd>
									</dl>
									<dl>
										<dt>돌봄금액</dt>
										<dd>DBVALUE</dd>
									</dl>
								</div>
							</div>
							
							
							<div class="box">
								<img  class="image fit" src="${pageContext.request.contextPath}/images/muncat.jpg" alt="" />
								<div>
									<dl>
										<dt>펫 분 류</dt>
										<dd>DBVALUE</dd>
									</dl>
									<dl>
										<dt>근무지역</dt>
										<dd>DBVALUE</dd>
									</dl>
									<dl>
										<dt>근무시간</dt>
										<dd>DBVALUE</dd>
									</dl>
									<dl>
										<dt>돌봄금액</dt>
										<dd>DBVALUE</dd>
									</dl>
								</div>
							</div>
							
							
							<div class="box">
								<img  class="image fit" src="${pageContext.request.contextPath}/images/muncat.jpg" alt="" />
								<div>
									<dl>
										<dt>펫 분 류</dt>
										<dd>DBVALUE</dd>
									</dl>
									<dl>
										<dt>근무지역</dt>
										<dd>DBVALUE</dd>
									</dl>
									<dl>
										<dt>근무시간</dt>
										<dd>DBVALUE</dd>
									</dl>
									<dl>
										<dt>돌봄금액</dt>
										<dd>DBVALUE</dd>
									</dl>
								</div>
							</div>
							

						</div>

					</div>
				</div>
</body>
</html>