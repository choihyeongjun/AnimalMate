<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의내역</title>
</head>
<body>
      <h1>후기</h1><br> 
   <div class = "row">
   		<div class="mypageTradeList">
   			<table class = "table">
   				<tr>
	               <th>거래번호</th>
	               <td>${comm.code}</td>
	            </tr>
	   			<tr>
	               <th>제목</th>
	               <td>${comm.title}</td>
	            </tr>
	            <tr>
	               <th>평점</th>
	               <c:if test="${comm.score eq '1'}">
	               <td>★☆☆☆☆
	               </td>
	               </c:if>
	                <c:if test="${comm.score eq '2'}">
	               <td>★★☆☆☆
	               </td>
	               </c:if>
	                <c:if test="${comm.score eq '3'}">
	               <td>★★★☆☆
	               </td>
	               </c:if>
	                <c:if test="${comm.score eq '4'}">
	               <td>★★★★☆
	               </td>
	               </c:if>
	                <c:if test="${comm.score eq '5'}">
	               <td>★★★★★
	               </td>
	               </c:if>
	            </tr>
	            <tr>
					<th>사진</th>
					<td height = 200px><img
						src="${pageContext.request.contextPath}/images/${comm.pic}"
						alt="사진을 넣어주세요" style = "width:240px; height:240px; border-radius: 100%;">
					</td>
				</tr>
	            <tr>
	               <th height = 200px>내용</th>
	               <td>
						${comm.comm}
	               </td>
	            </tr>
  			</table>
   		</div>
   </div>
</body>
</html>