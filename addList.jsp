<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<header>
(과정평가형 정보처리산업기사) 차량주행관리 프로그램
</header>
<nav>
<a href="selectList.jsp">차량조회</a>
<a href="addList.jsp">주행내역등록</a>
<a href="driveList.jsp">주행내역조회</a>
<a href="carAvg.jsp">부서별주행통계</a>
<a href="index.jsp">홈으로</a>
</nav>
<section class= "container">
<h2>주행내역등록</h2>
<form action="seccessProcess.jsp" method="post" onsubmit="return chceckForm()">
<table class= "tableBox">
<tr>
<th>주행일자</th>
<td class="inTd"><input type="text" name= "drvDate"><span>2023년01월01일 예)20230101</span></td>
</tr>
<tr>
<th>차량번호</th>
<td class="inTd"><input type="text" name= "carNo"><span>예)10가0001</span></td>
</tr>
<tr>
<th>출발Km</th>
<td class="inTd"><input type="text" name= "drvStart"><span>Km</span></td>
</tr>
<tr>
<th>도착Km</th>
<td class="inTd"><input type="text" name= "drvEnd"><span>Km</span></td>
</tr>
<tr>
<th>부서코드</th>
<td class="inTd" ><select name="deprCode">
<option value="">부서</option>
<option value="10">[10]영업부</option>
<option value="20">[20]총무부</option>
<option value="30">[30]구매부</option>
<option value="40">[40]개발부</option>
</select></td>
</tr>
<tr>
<th>주유금액</th>
<td class="inTd"><input type="text" name= "drvMoney"><span>원</span></td>
</tr>
<tr>
<td colspan="2">
<input type="submit" value="주행내역등록" class="addBtn">
<input type="reset" value="다시쓰기" class="resetBtn">
</td>
</tr>
</table>
</form>

</section>
<footer>
HRDKOREA Copyright&copy;2020 All right Human Reserved Service of Korea
</footer>
<script>
	function chceckForm(){
		
		/* alert("유효성검사시작");*/
					let drvDate = document.querySelector("[name='drvDate']").value;
					let carNo = document.querySelector("[name='carNo']").value;
					let drvStart = document.querySelector("[name='drvStart']").value;
					let drvEnd = document.querySelector("[name='drvEnd']").value;
					let deprCode = document.querySelector("[name='deprCode']").value;
					let drvMoney = document.querySelector("[name='drvMoney']").value;
					
					if (drvDate==""){alert("주행일자가 입력되지 않았습니다.");
								document.querySelector("[name='drvDate']").focus();
									return false;}
					if (carNo==""){alert("차량번호가 입력되지 않았습니다.");
									document.querySelector("[name='carNo']").focus();
											return false;}
					if (drvStart==""){alert("출발Km가 입력되지 않았습니다.");
										document.querySelector("[name='drvStart']").focus();
											return false;}
					if (drvEnd==""){alert("도착Km가 입력되지 않았습니다.");
									document.querySelector("[name='drvEnd']").focus();
											return false;}
					if (deprCode==""){alert("부서코드가 입력되지 않았습니다.");
									document.querySelector("[name='deprCode']").focus();
										return false;}
					if (drvMoney==""){alert("주유금액이 입력되지 않았습니다.");
									document.querySelector("[name='drvMoney']").focus();
											return false;}
							
							
							alert("주행내역이 저장되었습니다.");
							
							return true;
						}
		/* 	 function fncSubmit(){
		 
		 각 input에 id 값울 줘서 id값으로 불러오기
		 document.querySelector(#drvDate).value == '' ){(공백제거)
			 alert("주행일자가 입력되지 않았습니다.");
		 document.querySelector(#drvDate).focus();
		 return false;  (x6)
		 } 
		 alert("주행내역이 정상적으로 등록 되었습니다.");
		 document.querySelector("form").submit();
		}
		
		function sebmitBtn(){
			
		}
		 */
		 
	 

</script>
</body>
</html>