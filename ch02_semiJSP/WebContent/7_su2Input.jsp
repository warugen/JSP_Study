<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>p {text-align: center; margin:20px;}</style>
<script>
window.onload = function(){
	var frm = document.getElementById('frm');
	frm.onsubmit = function(){
		var su1 = document.getElementById('su1');
		var su2 = document.getElementById('su2');
		var su1num = Number(su1.value);
		var su2num = Number(su2.value);
		if(isNaN(su1num) || su1.value==''){
			alert('첫번째 숫자를 입력하세요');
			su1.value = '';
			su1.focus();
			return false;
		}
		if(isNaN(su2num) || su2.value==''){
			alert('두번째 숫자를 입력하세요');
			su2.value = '';
			su2.focus();
			return false;
		}
		if(su1num>su2num){
			alert('첫번째 숫자에 작거나 같은 수를 넣으세요');
			su1.focus();
			return false;
		}			
	};
};
</script>
</head>
<body>
	<form action="7_su2gugudanOut.jsp" id="frm" method="get">
		<p>단수 <input type="text" name="su1" id="su1"> <b>~</b> 
			<input type="text" name="su2" id="su2">
		</p>
		<p>
			<input type="submit" value="원하는 구구단 출력">
		</p>
	</form>
</body>
</html>