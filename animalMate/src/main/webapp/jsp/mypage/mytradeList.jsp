<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

   <div>
      <h1>${user.name}님의 거래</h1>
   </div>
   
   <div class="row mypageTrade">
      <div>
         <dl>
            <dt>포인트</dt>
            <dd>${user.point}p</dd>
         </dl>
      </div>
      <div>
         <dl>
            <dt>예약한</dt>
            <dd>DBvalue 건</dd>
         </dl>

      </div>
      <div>
         <dl>
            <dt>예약된</dt>
            <dd>DBvalue 건</dd>
         </dl>
      </div>
      <div>
         <dl>
            <dt>쪽지</dt>
            <dd>DBvalue 건</dd>
         </dl>
      </div>
   </div>
   <div class="row mypageTradeList">
      <table class="table">
         <tr>
            <th>예약분류</th>
            <th>상대이름</th>
            <th>펫종류/펫이름</th>
            <th>거래금액</th>
            <th>거래상태</th>
         </tr>
         <tr>
            <td>돌보기</td>
            <td>김김믹</td>
            <td>소형견/코시웰</td>
            <td>10000포인트</td>
            <td>예약대기</td>
         </tr>
         <tr>
			<td>맡기기</td>
            <td>김머리</td>
            <td>소형견/닥터훈스</td>
            <td>12000포인트</td>
            <td>거래종료</td>
         </tr>
      </table>
   </div>
</body>
</html>