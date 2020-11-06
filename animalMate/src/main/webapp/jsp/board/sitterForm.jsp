  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        </style>
    </head>

    <body>
        <!-- s:container -->
        <div class="container">
            
            <!-- s:title -->
            <div class="title">
                <h1>돌봐줄께요- (글등록 Form)</h1>
                <input placeholder="제목을 입력하세요">
                </input>
            </div>
            <!-- e:title -->

            <!-- s:contents -->
            <div class="contents">

                <div id="sec01" class="sitter_info">
                    <h2 class="cont_tit">시터정보</h2>

                    <div class="cont_area">
                        <div class="info_img">
                            <img class="info_img" src="${pageContext.request.contextPath}/images/muncat.jpg" alt="시터 이미지" height="100px" width="100px">
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
                                        <td>시터 이름</td>
                                        <td>DBVALUE</td>
                                    </tr>
                                    
                                    <tr>
                                        <td>시터 나이</td>
                                        <td>DBVALUE</td>
                                    </tr>
                                    
                                    <tr>
                                        <td>시터 성별</td>
                                        <td>DBVALUE</td>
                                    </tr>

                                    <tr>
                                        <td>시터 평점</td>
                                        <td>DBVALUE</td>
                                    </tr>

                                    <tr>
                                        <td>시터 경력(돌봄횟수)</td>
                                        <td>DBVALUE</td>
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
                                <td><input type="text" placeholder="돌봐주실 지역을 입력하세요"></td>
                            </tr>
                            
                            <tr>
                                <td>돌봄날짜</td>
                                <td>
                                    <!-- jQuery datepicker 연결하면 됨-->
                                    <div class="calendar">
                                        <input type="date" class="datepicker" name="" value="" placeholder="시작일" onchange="">
                                        <span>~</span>
                                        <input type="date" class="datepicker" name="" value="" placeholder="종료일" onchange="">
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>돌봄시간</td>
                                <td>
                                    <div class="calendar">
                                        <select>
                                            <option>12:00</option>
                                            <option>13:00</option>
                                        </select>
                                        <span>~</span>
                                        <select>
                                            <option>12:00</option>
                                            <option>13:00</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>거래금액</td>
                                <td><input type="text" name="" placeholder="돌봄서비스 금액을 입력하세요" class="txt-r" >원</td>
                            </tr>

                            <tr>
                                <td>최대돌봄수</td>
                                <td><input type="text" name="" placeholder="최대 수용가능한 펫 수를 입력하세요" class="txt-r" >마리</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div id="sec03" class="addpic">
                    <h2 class="cont_tit">돌봄환경</h2>

                    <ul>
                        <li>
                            <div>
                                <button type="button">사진추가</button>
                            </div>
                        </li>
                        <li></li>
                    </ul>
                </div>

                <div id="sec04" class="">
                    <h2 class="cont_tit">스케쥴선택</h2>

                    <div>
                        
                    </div>
                </div>

                <div id="sec05" class="">
                    <h2 class="cont_tit">세부내용</h2>

                    <textarea>
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


                <div class="btn_sumit">
                    <button type="submit" class="btn_blue">지원하기</button>
                    <button type="reset" class="btn_gray" onclick="window.location.href='${pageContext.request.contextPath}/sitterList.do'">취소</button>
                </div>

            </div>
            <!-- e:contents -->
        </div>
        <!-- s:container -->
    </body>
</html>