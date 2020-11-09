  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

        <title>돌봐주세요(등록form)</title>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
            <script>
            $(function() {
            	// 버튼 add function
            	$(document).on("click",".checkAddBtn",function(){
            		var addDiv = $('<div/>',{'class':'checkList1 check_input_2ea'});
            		var $input = $('<input/>',{type:'text', placeholder:'업무 체크리스트를 입력해주세요.', name:'joblistComm'});
            		
            		$(addDiv).append($input);
            		$(addDiv).append($('<button/>').attr({'class':'checkDelBtn btn_xs c_red'}).text('삭제'));
            		$("#sec03").append(addDiv);

            	});
            	
            	// 버튼 minus function
            	$(document).on("click",".checkDelBtn",function(){
            		$(this).parent().remove();
            	});
            	
            	//펫 이름 선택했을 때
            	$("#name").on({
            		"change":function(){
            			
            			var petName = $(this).val()
            			$.ajax({
            				url:'${pageContext.request.contextPath}/ajax/petInfo.do',
            				data : {name : petName},
            				dataType:'json',
            				error:function(xhr,status,msg){
            					alert("상태값 :" + status + " Http에러메시지 :"+msg);
            				},
            				success:function(pet){
            					$("#ageTD").text(pet.age);
            					$("#genderTD").text(pet.gender);
            					$("#typeTD").text(pet.type);
            					$("#cutTD").text(pet.cut);
            					$("#petCode").val(pet.code);
            				}
            			}) //end of ajax
            		} //end of change function
            	})//end of on
            });
        </script>
      
    </head>

    <body>
        <!-- s:container -->
        <div class="container">
           <form id="frm" name="frm" action="${pageContext.request.contextPath}/ownerInsert.do" method="post">
            <!-- s:title -->
            <div class="title">
                <h1>돌봐주세요- (글등록 Form)</h1>
                <input type="text" name="title" placeholder="제목을 입력하세요">
            </div>
            <br>
            <!-- e:title -->

            <!-- s:contents -->
            <div class="contents sitter">
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
                                        	<select id="name" name="name">
                                        		<c:forEach items="${petList}" var="v">
                                        			<option value="">펫을 선택해주세요</option>
                                        			<option value="${v.name}">${v.name}</option>
                                        		</c:forEach>
                                        	</select>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td>나이</td>
                                        <td id="ageTD">DBVALUE</td>
                                    </tr>
                                    
                                    <tr>
                                        <td>성별</td>
                                        <td id="genderTD">DBVALUE</td>
                                    </tr>

                                    <tr>
                                        <td>종류</td>
                                        <td id="typeTD">DBVALUE</td>
                                    </tr>

                                    <tr>
                                        <td>중성화 유무</td>
                                        <td id="cutTD">DBVALUE</td>
                                    </tr>
                                </tbody>
                            </table>
                            <input type="hidden" id="petCode" name="petCode" value="">
                        </div>
                    </div>
                </div>

                <div id="sec02" class="layout_2ea">
	                <div class="layout__cont">
	                    <h2 class="cont_tit">세부조건</h2>
	
	                    <table class="tbl_write__list">
	                        <colgroup>
	                            <col width="30%">
	                            <col width="70%">
	                        </colgroup>
	
	                        <thead>
	                            <tr>
	                                <th>조건</th>
	                                <th>내용</th>
	                            </tr>
	                        </thead>
	
	                        <tbody>
	                            <tr>
	                                <th>근무지역</th>
	                                <td><input type="text" name="location1" placeholder="돌봄 지역을 입력하세요"></td>
	                            </tr>
	                            <tr>
	                                <th>상세지역</th>	                            
	                            	<td><input type="text" name="location2" placeholder="돌봄 세부지역을 입력하세요"></td>
	                            </tr>
	                            <tr>
	                                <th>근무날짜</th>
	                                <td>
	                                    <!-- jQuery datepicker 연결하면 됨-->
	                                    <div class="calendar">
	                                        <input type="date" name="sdate" id="sdate" placeholder="시작일" >
	                                        <span>~</span>
	                                        <input type="date" name="edate" id="edate" placeholder="종료일" >
	                                    </div>
	                                </td>
	                            </tr>
	
	                            <tr>
	                                <th>근무시간</th>
	                                <td>
	                                    <div class="calendar">
	                                        <input type="time" name="stime" id="stime">
	                                        <span>~</span>
	                                        <input type="time" name="etime" id="etime">
	                                    </div>
	                                </td>
	                            </tr>
	                            
	                            <tr>
	                                <th>거래금액</th>
	                                <td class="amount"><input type="text" name="price" id="price" placeholder="서비스 비용을 입력하세요">원</td>
	                            </tr>
	                        </tbody>
	                    </table>
                    </div>

	                <div id="sec03" class="check_list layout__cont">
		                <div class="checkList_2ea">
		                    <h2 class="cont_tit">체크리스트(선택사항)</h2>
		                    <button class="checkAddBtn btn_xs c_gray_line" type="button">추가</button>
	                    </div>
	                    
	                    <div class="checkList1 check_input_2ea">
	                        <input type="text" id="joblistComm" name="joblistComm" placeholder="업무 체크리스트를 입력해주세요">
	                        <button class="checkDelBtn btn_xs c_red" type="button">삭제</button><!-- class명 바꿔야함 삭제로(checkAddBtn) -->
	                    </div>
	                </div>
                </div>

                <div id="sec05" class="">
                    <h2 class="cont_tit">세부내용</h2>

                    <textarea name="comm" id="comm" placeholder="세부내용을 입력해 주세요"></textarea>
                </div>

                <div id="sec06" class="sitter_caution">
                    <h2 class="cont_tit">유의사항</h2>

                    <ul>
                      	<li>○ 배드, 사료, 산책용품등은 의뢰자께서 준비해주세요.</li>
						<li>○ 특이사항(질병등)은 사전에 펫시터에게 공지해주세요.</li>
						<li>○ 펫시터 신분증, 주민등록등본등을 미리 확인해주세요.</li>
						<li>○ 의뢰시 간단하게 계약서나 약정서를 작성하세요.</li>
						<li>○ 표준계약서는 '이용안내'에서 내려받을수 있습니다.</li>
                    </ul>
                </div>
            </div>
            <!-- e:contents -->

            <div class="btn_group btn_submit btn_l">
                <button type="submit" class="c_orange">글등록</button>
                <button type="reset" class="c_gray" onclick="window.location.href='${pageContext.request.contextPath}/ownerList.do'">취소</button>
            </div>
            </form>
        </div>
        <!-- s:container -->
      
    </body>
</html>