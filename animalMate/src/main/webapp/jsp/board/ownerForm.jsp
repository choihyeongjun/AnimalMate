  
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
		<!-- jquery -->
		<script src="js/jquery-3.5.1.min.js"></script>
		
        <!--파비콘 -->
        <!-- <link rel="shortcut icon" href="assets/images/favicon.ico" type="image/x-icon"> -->
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/layout.css" rel="stylesheet">

        <!-- css -->
        <style>
        </style>
            <script>
            $(function() {
            	
            	// 버튼 add function
            	$(document).on("click",".checkAddBtn",function(){
            		var addDiv = $('<div/>',{'class':'checkList'});
            		var $input = $('<input/>',{type:'text', placeholder:'업무 체크리스트를 입력해주세요.'});
            		
            		$(addDiv).append($input);
            		$(addDiv).append($('<button/>').attr('class','checkAddBtn').text('+'));
            		$(addDiv).append($('<button/>').attr('class','checkDelBtn').text('-'));
            		$(".sec04").append(addDiv);

            	});
            	
            	// 버튼 minus function
            	$(document).on("click",".checkDelBtn",function(){
            		//console.log($(this).parent());
            		$(this).parent().remove();
            		
            		
 

            	});
            });
        </script>
      
    </head>

    <body>
        <!-- s:container -->
        <div class="container">
            
            <!-- s:title -->
            <div class="title">
                <h1>돌봐주세요- (글등록 Form)</h1>
                <input placeholder="제목을 입력하세요">
                </input>
            </div>
            <!-- e:title -->

            <!-- s:contents -->
            <div class="contents">

                <div id="sec01" class="sitter_info">
                    <h2 class="cont_tit">펫 정보</h2>

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
                                        <th>펫 정보</th>
                                        <th>상세 내용</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <tr>
                                        <td>펫 이름</td>
                                        <td>
                                        	<select>
                                        		<option>내 펫 선택</option>
                                        		<option>DBVALUE</option>
                                        		<option>DBVALUE</option>
                                        		<option>DBVALUE</option>
                                        	</select>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td>나이</td>
                                        <td>DBVALUE</td>
                                    </tr>
                                    
                                    <tr>
                                        <td>성별</td>
                                        <td>DBVALUE</td>
                                    </tr>

                                    <tr>
                                        <td>종류</td>
                                        <td>DBVALUE</td>
                                    </tr>

                                    <tr>
                                        <td>중성화 유무</td>
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
                                <td>근무지역</td>
                              	<td><input type="text" placeholder="돌봄 지역을 입력하세요"></td>
                            </tr>
                            
                            <tr>
                                <td>근무날짜</td>
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
                                <td>근무시간</td>
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
                                <td><input type="text" name="" placeholder="서비스 비용을 입력하세요" class="txt-r" >원</td>
                            </tr>

                        </tbody>
                    </table>
                </div>

                

                    <div id="sec04" class="sec04">
                    <h2 class="cont_tit">체크리스트</h2>
                    <div class="checkList">
                        <input type="text" placeholder="업무 체크리스트를 입력해주세요">
                        <button class="checkAddBtn">+</button>
                        <button class="checkDelBtn">-</button>
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
                    <button type="submit" class="btn_blue">글등록</button>
                    <button type="reset" class="btn_gray">취소</button>
                </div>

            </div>
            <!-- e:contents -->
        </div>
        <!-- s:container -->
      
    </body>
</html>