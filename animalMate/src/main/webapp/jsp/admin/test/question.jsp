<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 50%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>
</head>
<body>

<div class="container">
  <form action="${pageContext.request.contextPath}/submitQuestion.do">
  <div class="row">
    <div class="col-25">
      <label for="fname">아이디</label>
    </div>
    <div class="col-75">
      <input type="text" id="id" name=id" placeholder="아이디">
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="lname">제목</label>
    </div>
    <div class="col-75">
      <input type="text" id="title" name="title" placeholder="제목">
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="category">공개 여부</label>
    </div>
    <div class="col-75">
      <select id="status" name="status">
        <option value="공개">공개</option>
        <option value="비공개">비공개</option>
      </select>
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="category">분류</label>
    </div>
    <div class="col-75">
      <select id="ttype" name="ttype">
        <option value="페이지">페이지문제</option>
        <option value="반려인">반려인문제</option>
        <option value="시터">시터</option>
      </select>
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="subject">내용</label>
    </div>
    <div class="col-75">
      <textarea id="comm" name="comm" placeholder="나문의내용.." style="height:200px"></textarea>
    </div>
  </div>
  <div class="row">
    <input type="submit" value="Submit">
  </div>
  </form>
</div>

</body>
</html>