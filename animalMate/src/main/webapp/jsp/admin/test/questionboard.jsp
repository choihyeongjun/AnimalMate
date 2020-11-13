<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의게시판</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainmenu.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.pagination, li.active, .pagination li {display: inline-block;}
.pagination a, li.active { color: black; padding: 8px 16px;text-decoration: none;border: 1px solid #ddd;}
.pagination li.active {background-color: #4CAF50;color: white;border: 1px solid #4CAF50;}
.pagination a:hover:not(.active) { background-color: #ddd;}
.pagination a, li.active {border-radius: 5px;border-bottom-left-radius: 5px;}
a{color: red;font-weight: bold;}
.Btn{border-radius: 4px;width: 70px; height: 30px;background-color: #ff914b;color: white;}
.title{margin: 70px 0 20px 470px;font-weight: bold;}
.area1 { border-radius: 8px;padding: 30px 30px 40px 30px;
}
button {background-color: rgb(255,136,38); font-weight:bold; color : black;border : none;}
.tr1 {border-top: 3px solid #ff914b;}
.sel {border: 3px solid #ff914b;border-radius: 4px;height: 29px;}
.table {font-size:16px;font-weight: bold;}
.table td, table th {width : 10px;}
</style>

<script type="text/javascript">
$(()=>{
	$("#QuestionBtn").on({
		"click" : function() {
			location.href="${pageContext.request.contextPath}/jsp/admin/test/question.jsp";
		
		}
	});
});
</script>
</head>
<body>
<c:if test="${sessionScope.id eq 'admin'}" >
<jsp:include page="mainMenu.jsp"/>
</c:if>

  <br><br>
   <h3 class="title">1:1문의내역</h3>
   <hr />
   <div class="area1">
   <div align="right">
      <form id="filterFrm" name="filterFrm" action="goQuestionBoard.do"
         method="get">
         <select class="sel" id="type" name="status">
            <option value="">분류
            <option value="공개">공개
            <option value="비공개">비공개
         </select> 
         <button class="Btn" id="filterBtn">검색</button>
      </form>
   </div>
   <br>

   <div align="center">

      <table class="table text-center">
      <thead>
            <tr class="tr1">
               <th class="text-center">번호</th>
               <th class="text-center">제목</th>
               <th class="text-center">작성자</th>
               <th class="text-center">공개여부</th>
                <th class="text-center">답글여부</th>
               <th class="text-center">게시날짜</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="l">
            <tr>
            <td>${l.code}</td>
            <c:if test="${sessionScope.id ne l.send && l.status eq '비공개' && sessionScope.id ne 'admin'}">
            <td>${l.title}</td>
            </c:if>
            <c:if test="${l.status eq '공개'}">
            <td><a href="${pageContext.request.contextPath}/questionselect.do?code=${l.code}" style="color: #184cc1;font-weight: bold;">${l.title}</a></td>
            </c:if>
            <c:if test="${l.status eq '비공개' && (sessionScope.id eq l.send || sessionScope.id eq 'admin')}">
            <td><a href="${pageContext.request.contextPath}/questionselect.do?code=${l.code}" style="color: #184cc1;font-weight: bold;">${l.title}</a></td>
            </c:if>
            <td>${l.send}</td>
            <td>${l.status}</td>
            <c:if test="${empty l.answer}">
            <td>아니요</td>
            </c:if>
            <c:if test="${not empty l.answer }">
            <td>예</td>
            </c:if>
            <td>${l.ttime}</td>
            </tr>
         </c:forEach>
            </tbody>
      </table>
      
      
      <div align="right">
         <button id="QuestionBtn" class="Btn">1:1문의</button>
      </div>
   </div>
   </div>
</body>
</html>