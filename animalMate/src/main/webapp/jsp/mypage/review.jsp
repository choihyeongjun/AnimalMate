<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
input{
width:99%;

}
.cc{
width:100px;
}

</style>

</head>
<body>
   <div  class="row" >
   
		<div class="container">
         <form id="frm" name="frm" action="${pageContext.request.contextPath}/reviewinsert.do" method="post" enctype="multipart/form-data">
            <table class="table" >
               <tr>
                  <th width="150">거래번호 :</th>
                  <td><input type="text" id="code" name="code" readonly="readonly" value="${param.code}"></td>
               </tr>
               <tr>
                  <th width="150">제목 :</th>
                  <td><input type="text" id="title" name="title"></td>
               </tr>
               <tr>
                  <th width="150">위탁자 :</th>
                  <td><input type="text" id="buyer" name="buyer" disabled value="${param.buyer}"></td>
               </tr>
               <tr>
                  <th width="150">시터 :</th>
                  <td><input type="text" id="seller" name="seller" size="20" disabled value="${param.seller}"></td>
               </tr>
               <tr>
                  <th width="150">별점 :</th>
                  <td>
                  <select id="score" name="score">
                  <option value="0">선택하기</option>
                  <option value="1">★☆☆☆☆</option>
                  <option value="2">★★☆☆☆</option>
                  <option value="3">★★★☆☆</option>
                  <option value="4">★★★★☆</option>
                  <option value="5">★★★★★</option>
                  </select>
                  </td>
               </tr>
               <tr>
                  <th width="150">사진 :</th>
                  <td><input type="file" id="pic" name="pic"></td>
               </tr>
         		<tr>
         		 <th width="150">내용 :</th>
         		<td><textarea rows="10" cols="100%" id="comm" name="comm"></textarea></td>
         		</tr>
               <tr>
                  <td colspan="2" align="center"><input class="cc" type="submit"
                     id="btnSave" value="등록">&nbsp;&nbsp; <input class="cc"
                     type="reset" value="취소"></td>
               </tr>
               
            </table>
         </form>
    
   </div>
</div>
</body>
</html>