<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style>
button{width: 50px;
}
</style>
<script>
	$(function(){
		blackUpdate();
		blackList();
		blackSelect();
	});
	function blackList(){
		
		$.ajax({
			url:'${pageContext.request.contextPath}/ajax/blacklist.do',
			type:'GET',
				dataType:'json',
				error:function(xhr,status,msg){
						alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				
				success:blackListResult
			
		});
		
	}//blacklist 조회
	function blackListResult(data){
		$("#search").empty();
		$.each(data,function(idx,item){
			$('<tr>')
			.append($('<td>').html(item.id))
			.append($('<td>').html(item.name))
			.append($('<td>').html(item.location1))
			.append($('<td>').html(item.tel))
			.append($('<td>').html(item.edate))
			.append($('<td>').html('<select id=\'author\'> '+
			'<option selected value='+item.author+'>'+item.author+'</option>'+
			'<option >sitter</option>'+
			'<option >sittersait</option>'+
			'<option >users</option>'+
			'<option >admin</option>'+
			'<option >black</option></select>'
			))
			.append($('<td>').html('<button id=\'btnSelect\'>조회</button>'))
			.append($('<td>').html('<button id=\'btnUpdate\'>수정</button>'))
			.append($('<input type=\'hidden\' id=\'hidden_userId\'>').val(item.id))
			.appendTo('#members');
		});//each
	}//userListResult
	function blackSelect() {
		//조회 버튼 클릭
		$('body').on('click','#btnSelect',function(){
			var userId = $(this).closest('tr').find('#hidden_userId').val();
		
			//특정 사용자 조회
			$.ajax({
				url:'${pageContext.request.contextPath}/ajax/blackSearch.do',
				data : {id : userId},
				dataType:'json',
				error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				success:userSelectResult
			});
		}); //조회 버튼 클릭
	}//userSelect
	function userSelectResult(data) {
		$("#search").empty();
		$.each(data,function(idx,item){
			$('<tr>')
			.append($('<td>').html(item.id))
			.append($('<td>').html(item.name))
			.append($('<td>').html(item.location1))
			.append($('<td>').html(item.tel))
			.append($('<td>').html(item.edate))
			.append($('<td>').html('<select id=\'author\'> '+
			'<option selected value='+item.author+'>'+item.author+'</option>'+
			'<option >sitter</option>'+
			'<option >sittersait</option>'+
			'<option >users</option>'+
			'<option >admin</option>'+
			'<option >black</option></select>'
			))
			.append($('<td>').html('<button id=\'btnSelect\'>조회</button>'))
			.append($('<td>').html('<button id=\'btnUpdate\'>수정</button>'))
			.append($('<input type=\'hidden\' id=\'hidden_userId\'>').val(item.id))
			.appendTo("#search");
		});
		
	}//userSelectResult
	
	function blackUpdate() {
		//업데이트 버튼 클릭
		$('body').on('click','#btnUpdate',function(){
			var blackuserId = $(this).closest('tr').find('#hidden_userId').val();
			var blackuserAuthor = $(this).closest('tr').find('#author').val();
			var result = confirm(blackuserId +" 사용자를 업데이트 하시겠습니까?");
			if(result) {
				$.ajax({
					url:'${pageContext.request.contextPath}/ajax/updateblack.do',
					data : {id : blackuserId,
						author: blackuserAuthor},
					dataType:'json',
					error:function(xhr,status,msg){
						//console.log("상태값 :" + status + " Http에러메시지 :"+msg);
						console.log("dddd");
					}, success:function(xhr) {
						blackList();
					}
				});      }//if
		}); //update 버튼 클릭
	}//blackupdate
	
		
	
</script>
</head>
<body>
<jsp:include page="mainMenu.jsp"/>
<hr>
<div align="center">
	<div><h1>블랙리스트 목록 정보</h1></div>
	<div>
		<form>
		<table>
			<tr>
				<th>아이디:</th><td><input id="hidden_userId" type="text" value=""></td>
				<td><button type="button" id="btnSelect">검색</button>
			</tr>
		</table>
		</form>
	</div>
	<div>
		<div class="container">
		<table  class="table text-center">
				<tr>
					<th class="text-center">아이디</th>
					<th class="text-center">이  름</th>
					<th class="text-center">주  소</th>
					<th class="text-center">전화번호</th>
					<th class="text-center">가입일자</th>
					<th class="text-center">권 한 </th>
					<th class="text-center">변경</th>
				<tbody id="search">
				</tbody>
				</tr>
		</table>
		</div>
	</div>
	<div class="container">
	<h2>블랙리스트 목록</h2>
		<table class="table text-center">
		<thead>
			<tr>
				<th class="text-center">아이디</th>
				<th class="text-center">이  름</th>
				<th class="text-center">주  소</th>
				<th class="text-center">전화번호</th>
				<th class="text-center">가입일자</th>
				<th class="text-center">권 한 </th>
				<th class="text-center">변경</th>
			</tr>
		</thead>
		<tbody id="members">
		</tbody>
		</table>
	</div>
	
</div>
</body>
</html>