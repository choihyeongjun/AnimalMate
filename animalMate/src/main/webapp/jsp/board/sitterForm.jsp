<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
 <head>
        <meta name="description" content="OOO 홈페이지 입니다.">
        <meta property="og:type" content="website">
        <meta property="og:title" content="OOO">
        <meta property="og:description" content="OOO 홈페이지 입니다.">
        <meta property="og:image" content="">
        <meta property="og:url" content="">
        <!-- <meta http-equiv="imagetoolbar" content="no"> -->
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>돌봐줄게요(글등록form)</title>

        <!--파비콘 -->
        <!-- <link rel="shortcut icon" href="assets/images/favicon.ico" type="image/x-icon"> -->
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/layout.css" rel="stylesheet">

        <!-- css -->
        <style>
			.sitterEnvironment {
				width: 200px;
				height: 200px;
			}
        </style>
        
    </head>

    <body>
        <!-- s:container -->
        <div class="container">
            <form action="${pageContext.request.contextPath}/sitterInsert.do" method="post">
            <!-- s:title -->
            <div class="title">
                <h1>돌봐줄께요- (글등록 Form)</h1>
                <input type="text" name="title" placeholder="제목을 입력하세요" value="${tradeBoardVO.title}"></input>
            </div>
            <!-- e:title -->

            <!-- s:contents -->
            <div class="contents">

                <div id="sec01" class="sitter_info">
                    <h2 class="cont_tit">시터정보</h2>

                    <div class="cont_area">
                        <div class="info_img">
                            <img class="info_img" src="${pageContext.request.contextPath}/images/members_pic/${members.pic}" alt="시터 이미지" height="100px" width="100px">
                        </div>

                        <div class="info_table">
                            <table class="tbl_write__list">
                                <colgroup>
                                    <col width="40%">
                                    <col width="60%">
                                </colgroup>

                                <thead>
                                    <tr>
                                        <th>펫 시터 정보</th>
                                        <th>상세</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <tr>
                                        <td>시터 아이디</td>
                                        <td>${members.id}</td>
                                    </tr>
                                    
                                    <tr>
                                        <td>시터 나이</td>
                                        <td>${age}</td>
                                    </tr>
                                    
                                    <tr>
                                        <td>시터 성별</td>
                                        <td>${gender}</td>
                                    </tr>

                                    <tr>
                                        <td>시터 평점</td>
                                        <td>${score}</td>
                                    </tr>

                                    <tr>
                                        <td>시터 경력(돌봄횟수)</td>
                                        <td>${career}</td>
                                    </tr>
                                    <tr>
                                        <td>최대 돌봄 수</td>
                                        <td>${sitter.maxP}마리</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div id="sec02" class="">
                    <h2 class="cont_tit">세부조건</h2>
				
				
                    <table class="tbl_write__list">
                        <colgroup>
                            <col width="40%">
                            <col width="60%">
                        </colgroup>

                        <thead>
                            <tr>
                                <th>조건</th>
                                <th>내용</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td>돌봄지역</td>
                                <td>
                                	<select name="location1">
										<option >선택하세요</option>
										<option value="서울" <c:if test="${tradeBoardVO.location1 == '서울'}">selected="selected"</c:if>>서울</option>
										<option value="경기" <c:if test="${tradeBoardVO.location1 == '경기'}">selected="selected"</c:if>>경기</option>
										<option value="인천" <c:if test="${tradeBoardVO.location1 == '인천'}">selected="selected"</c:if>>인천</option>
										<option value="대전" <c:if test="${tradeBoardVO.location1 == '대전'}">selected="selected"</c:if>>대전</option>
										<option value="대구" <c:if test="${tradeBoardVO.location1 == '대구'}">selected="selected"</c:if>>대구</option>
										<option value="부산" <c:if test="${tradeBoardVO.location1 == '부산'}">selected="selected"</c:if>>부산</option>
										<option value="울산" <c:if test="${tradeBoardVO.location1 == '울산'}">selected="selected"</c:if>>울산</option>
										<option value="광주" <c:if test="${tradeBoardVO.location1 == '광주'}">selected="selected"</c:if>>광주</option>
										<option value="강원" <c:if test="${tradeBoardVO.location1 == '강원'}">selected="selected"</c:if>>강원</option>
										<option value="세종" <c:if test="${tradeBoardVO.location1 == '세종'}">selected="selected"</c:if>>세종</option>
										<option value="충북" <c:if test="${tradeBoardVO.location1 == '충북'}">selected="selected"</c:if>>충북</option>
										<option value="충남" <c:if test="${tradeBoardVO.location1 == '충남'}">selected="selected"</c:if>>충남</option>
										<option value="경북" <c:if test="${tradeBoardVO.location1 == '경북'}">selected="selected"</c:if>>경북</option>
										<option value="경남" <c:if test="${tradeBoardVO.location1 == '경남'}">selected="selected"</c:if>>경남</option>
										<option value="전북" <c:if test="${tradeBoardVO.location1 == '전북'}">selected="selected"</c:if>>전북</option>
										<option value="경남" <c:if test="${tradeBoardVO.location1 == '경남'}">selected="selected"</c:if>>경남</option>
										<option value="전남" <c:if test="${tradeBoardVO.location1 == '전남'}">selected="selected"</c:if>>전남</option>
										<option value="제주" <c:if test="${tradeBoardVO.location1 == '제주'}">selected="selected"</c:if>>제주</option>
									</select> 
                               </td>
                            </tr>
                            <tr>
                                <td>상세지역</td>
                                <td><input type="text" name="location2" placeholder="돌봐주실 세부지역을 입력하세요" value="${tradeBoardVO.location2}"></td>
                            </tr>
                            
                            <tr>
                                <td>돌봄날짜</td>
                                <td>
                                    <!-- jQuery datepicker 연결하면 됨-->
                                    <div class="calendar">
                                        <input type="date" class="datepicker" name="sdate" value="${tradeBoardVO.sdate}" placeholder="시작일">
                                        <span>~</span>
                                        <input type="date" class="datepicker" name="edate" value="${tradeBoardVO.edate}" placeholder="종료일">
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>돌봄시간</td>
                                <td>
                                    <div class="calendar">
                                        <input type="time" name="stime" id="stime" value="${tradeBoardVO.stime}">
                                        <span>~</span>
                                        <input type="time" name="etime" id="etime" value="${tradeBoardVO.etime}">
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>거래금액</td>
                                <td><input type="text" name="price" placeholder="돌봄서비스 금액을 입력하세요" class="txt-r" value="${tradeBoardVO.price}">원</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div id="sec03" class="addpic">
                    <h2 class="cont_tit">돌봄환경</h2>

                    <ul>
                        <li>
                            <div>
                            	<c:if test="${fn:length(pictureList) eq 0}">
									<img class="sitterEnvironment" alt="이미지가 없습니다." src="${pageContext.request.contextPath}/images/picture/noImage.png">
								</c:if>
                                <c:forEach items="${pictureList}" var="v">
                                	<img class="sitterEnvironment" alt="이미지없다!" src="${pageContext.request.contextPath}/images/picture/${v.pic}">
                                </c:forEach>
                            </div>
                        </li>
                    </ul>
                </div>
                
                <div id="sec05" class="">
                    <h2 class="cont_tit">세부내용</h2>

                    <textarea name="comm" placeholder="세부내용을 입력해 주세요">
                    	${tradeBoardVO.comm}
                    </textarea>
                </div>

                <div id="sec06" class="">
                    <h2 class="cont_tit">유의사항</h2>

                    <ul>
                      	<li>○ 배드, 사료, 산책용품등은 의뢰자께서 준비해주세요.</li>
						<li>○ 특이사항(질병등)은 사전에 펫시터에게 공지해주세요.</li>
						<li>○ 펫시터 신분증, 주민등록등본등을 미리 확인해주세요.</li>
						<li>○ 의뢰시 간단하게 계약서나 약정서를 작성하세요.</li>
						<li>○ 표준계약서는 '이용안내'에서 내려받을수 있습니다.</li>
                    </ul>
                </div>

                <div class="btn_group btn_submit btn_l">
                	<c:if test="${param.code == null}">
                    	<button type="submit" class="c_orange">글등록</button>
                    </c:if>
                    <c:if test="${tradeBoardVO.seller == id && tradeBoard.buyer == null}">
                    	<button type="submit" class="c_orange" formaction="${pageContext.request.contextPath}/sitterUpdate.do?code=${param.code}">수정하기</button>
                    </c:if>
                    <button type="reset" class="c_gray" onclick="window.location.href='${pageContext.request.contextPath}/sitterList.do?">취소</button>        
                </div>

            </div>
            <!-- e:contents -->
            </form>
        </div>
        <!-- s:container -->
    </body>
</html>