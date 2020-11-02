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

        <title>돌봐줄게요(등록form)</title>

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
                <h1>돌봐줄게요</h1>
                <p>
                    ♥ 믿고 맡기는 베테랑 진규 시터의 돌봄 서비스♥
                    <span>사랑으로 모십니다</span>
                </p>
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
                                        <th>정보</th>
                                        <th>내용</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <tr>
                                        <td>이름</td>
                                        <td><input type="text" name="" value="" title=""></td>
                                    </tr>
                                    
                                    <tr>
                                        <td>나이</td>
                                        <td><input type="text" name="" value="" title=""></td>
                                    </tr>
                                    
                                    <tr>
                                        <td>성별</td>
                                        <td><input type="text" name="" value="" title=""></td>
                                    </tr>

                                    <tr>
                                        <td>평점</td>
                                        <td><input type="text" name="" value="" title=""></td>
                                    </tr>

                                    <tr>
                                        <td>경력(돌봄횟수)</td>
                                        <td><input type="text" name="" value="" title=""></td>
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
                                    <select>
                                        <option>전체</option>
                                        <option>대구</option>
                                        <option>서울</option>
                                    </select>
                                </td>
                            </tr>
                            
                            <tr>
                                <td>돌봄날짜</td>
                                <td>
                                    <!-- jQuery datepicker 연결하면 됨-->
                                    <div class="calendar">
                                        <input type="text" class="datepicker" name="" value="" placeholder="시작일" onchange="">
                                        <span>~</span>
                                        <input type="text" class="datepicker" name="" value="" placeholder="종료일" onchange="">
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
                                <td><input type="text" name="" value="20,000" class="txt-r" placeholder="거래금액을 입력하세요">원</td>
                            </tr>

                            <tr>
                                <td>최대돌봄수</td>
                                <td><input type="text" name="" value="2" class="txt-r" placeholder="최대 수용가능한 펫 수를 입력하세요">마리</td>
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
                    <button type="submit" class="btn_l c_blue">지원하기</button>
                    <button type="reset" class="btn_l c_gray">취소</button>
                </div>

            </div>
            <!-- e:contents -->
        </div>
        <!-- s:container -->
    </body>
</html>