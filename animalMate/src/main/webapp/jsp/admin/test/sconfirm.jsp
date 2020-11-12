<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시터승인페이지</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
   integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
   crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
button{width:50px;
}
.row{
margin-right:100px;
}

.container {
    width: 810px;
}
</style>
<script>

$(function(){
    
   userList();
   userSelect();
   userUpdate();
 
 });
   
function userUpdate() {
   //업데이트 버튼 클릭
   $('body').on('click','#btnSave',function(){
      var userId = $(this).parent().parent().prev().prev().prev().prev().prev().prev().prev().children().find('#id').val();
      var userAuthor = $(this).parent().parent().prev().prev().prev().find('#author').val();
      console.log(userAuthor);
      var result = confirm(userId +" 사용자를 업데이트 하시겠습니까?"+
            userAuthor+"권한업데이트할래?");
      if(result) {
         $.ajax({
            url:'${pageContext.request.contextPath}/ajax/updatemember.do',
            data : {id : userId,
               author: userAuthor},
            dataType:'json',
            error:function(xhr,status,msg){
               //console.log("상태값 :" + status + " Http에러메시지 :"+msg);
               console.log("dddd");
            }, success:function(xhr) {
               userList();
            }
         });      }//if
   }); //업데이트 버튼 클릭
}//userupdate
   function userSelect() {
      //조회 버튼 클릭
      $('body').on('click','#btnSelect',function(){
         var userId = $(this).closest('tr').find('#hidden_userId').val();
         //특정 사용자 조회
         $.ajax({
            url:'${pageContext.request.contextPath}/ajax/sitterSearch.do',
            data : {id : userId},
            dataType:'json',
            error:function(xhr,status,msg){
               alert("상태값 :" + status + " Http에러메시지 :"+msg);
            },
            success:userSelectResult
            
         });
      }); //조회 버튼 클릭
   }//userSelect
   //사용자 조회 응답
   function userSelectResult(user) {
      $('input:text[name="id"]').val(user[0].id);
      $('input:text[name="name"]').val(user[0].name);
      $('input:text[name="location"]').val(user[0].location1);
      $('input:text[name="tel"]').val(user[0].tel);
      $('input:text[name="author"]').val(user[0].author);
      $('input:text[name="edate"]').val(user[0].edate);
      $('#sconfirmImg').attr("src", "${pageContext.request.contextPath}/images/members_pic/"+user[0].pic);
      $('input:text[name="maxp"]').val(user[1].maxP);
      $('input:text[name="comm"]').val(user[1].comm);
      
      
      
   }//userSelectResult
   function userList(){
       $.ajax({
          url:"${pageContext.request.contextPath}/ajax/sitterlist.do",
             type:'GET',
             dataType:'json',
             error:function(xhr,status,msg){
                   alert("상태값 :" + status + " Http에러메시지 :"+msg);
             },
             success:userListResult
       });
    }//userList
    function userListResult(data){
      
      $.each(data,function(idx,item){
         $('<tr>')
         .append($('<td width=100>').html(item.id))
         .append($('<td>').html(item.name))
         .append($('<td>').html(item.location1))
         .append($('<td width=100>').html(item.tel))
         .append($('<td>').html(item.edate))
         .append($('<td>').html(item.author))
         .append($('<td>').html('<button id=\'btnSelect\'>조회</button>'))
         .append($('<input type=\'hidden\' id=\'hidden_userId\'>').val(item.id))
         .appendTo('#memlist');
      });//each
   }//userListResult
   

</script>


</head>
<body>

<jsp:include page="mainMenu.jsp"/>
<br/>
<br/>
<br/>

<br/><h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시터승인 관리</h3>
   <div  class="row" >
      <div class="col">
      <div>
         <table id="search" class="table text-center">
            <thead>
               <tr>
                  <th width="100" class="text-center">아이디</th>
                  <th class="text-center">이  름</th>
                  <th class="text-center">주  소</th>
                  <th class="text-center">전화번호</th>
                  <th class="text-center">가입일자</th>
                  <th class="text-center">권 한 </th>
                  <th class="text-center">변경</th>
               </tr>
            </thead>
            <tbody id="memlist">
         </tbody>
      </table>
      </div>
      </div>
      <div class="container">
         <form id="frm" name="frm" method="post" >
            <table border="1">
               <tr>
                  <th width="150">아이디 :</th>
                  <td width="500"><input type="text" id="id" name="id" disabled></td>
               </tr>
               <tr>
                  <th width="150">이름 :</th>
                  <td><input type="text" id="name" name="name" disabled></td>
               </tr>
               <tr>
                  <th width="150">주소 :</th>
                  <td><input type="text" id="location" name="location" disabled></td>
               </tr>
               <tr>
                  <th width="150">전화번호 :</th>
                  <td><input type="text" id="tel" name="tel" size="20" disabled></td>
               </tr>
               <tr>
                  <th width="150">권한 :</th>
                  <td>
                  <select id="author">
                  <option>선택하기</option>
                  <option>users</option>
                  <option>usersitter</option>
                  <option>black</option>
                  <option>sitterwait</option>
                  <option>black</option>
                  
                  </select>
                  </td>
               </tr>
               <tr>
                  <th width="150">가입일자 :</th>
                  <td><input type="text" id="edate" name="edate" disabled></td>
               </tr>
               <tr>
                  <th width="150">사진 :</th>
                  <td><img id="sconfirmImg" alt="이미지 없다" src="#"></td>
               </tr>
               <tr>
                  <th width="150">최대펫수용수 :</th>
                  <td><input type="text" id="maxp" name="maxp" readyonly="readonly"></td>
               </tr>
               <tr>
                  <th width="150">신청내용 :</th>
                  <td><input type="text" id="comm" name="comm" readyonly="readonly"></td>
               </tr>
               <tr>
                  <td colspan="2" align="center"><input type="button"
                     id="btnSave" value="승인">&nbsp;&nbsp; <input
                     type="reset" value="취소"></td>
               </tr>
               
            </table>
         </form>
      </div>
   </div>

</body>
</html>