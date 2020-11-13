<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의내역</title>

<style type="text/css">
.col1_title, .col1_target, .col3_comm {
   width: 150px;
}

.col2_title, .col2_target, .col3_comm {
   width: 850px;
}

.col3_comm {
   height: 500px;
}
</style>
<script type="text/javascript">
   $(()=>{
      $("#gobackBtn").on({
         "click" : function() {
            location.href = "${pageContext.request.contextPath}/questionlist.do";
         }
      });
         
   });
</script>
</head>
<body>
   <div class="reportDiv" align="center">
   <h1>&lt;1:1문의 내용&gt;</h1><br> 
      <form id="frm" name="frm" method="post" action="${pageContext.request.contextPath}/.do">
         
            <table class="reportTd">
            <tr>
               <td class="col1_title">작성자</td>
               <td><input class="col2_target" type="text" id="buyer" name="buyer" value="${requestid}"></td>
            </tr>
            <tr>
               <td class="col1_title">제목</td>
               <td><input class="col2_target" type="text" id="title" name="title"  value="${title}"></td>
            </tr>
            <tr>
               <td class="col1_target">평점</td>
               <c:if test="${score eq '1'}">
               <td><input class="col2_target" type="text" id="type" name="type"  value="★☆☆☆☆">
               </td>
               </c:if>
                <c:if test="${score eq '2'}">
               <td><input class="col2_target" type="text" id="type" name="type"  value="★★☆☆☆">
               </td>
               </c:if>
                <c:if test="${score eq '3'}">
               <td><input class="col2_target" type="text" id="type" name="type"  value="★★★☆☆">
               </td>
               </c:if>
                <c:if test="${score eq '4'}">
               <td><input class="col2_target" type="text" id="type" name="type"  value="★★★★☆">
               </td>
               </c:if>
                <c:if test="${score eq '5'}">
               <td><input class="col2_target" type="text" id="type" name="type"  value="★★★★★">
               </td>
               </c:if>
            </tr>
            <tr>
               <td class="col2_target">내용</td>
               <td>
                  <textarea rows="15" cols="118" id="comm" name="comm" <c:if test="${sessionScope.id ne requestid }">readonly="readonly"</c:if>>${comm}</textarea>   
               </td>
            </tr>
         </table>
            <table>
               <tr>
               </tr>
            </table>
      
         <br>
         <div align="right">
         <button type="submit" id="rewrite" onclick="javascript: form.action='${pageContext.request.contextPath}/.do'">수정</button>&nbsp;
               <button type="button" id="gobackBtn">돌아가기</button>
         </div>
      </form>

   </div>
</body>
</html>