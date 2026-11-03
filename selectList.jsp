<%@page import="java.text.SimpleDateFormat"%>
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
<h2>차량조회</h2>
<table class="tableBox">
<tbody>
<tr>
<th>차량번호</th>
<th>모델</th>
<th>제조사</th>
<th>구매일</th>
</tr>

<%

 Connection conn= null;
 Statement stmt= null;
 ResultSet rs= null;
try{
	request.setCharacterEncoding("utf-8");
		String sql= "SELECT * FROM TBL_CAR";
		
		
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/car","root","admin");
		//preparedStatement pstmt= conn.prepareStatement(sql);
		// pstmt.setString(1,"car_date");
	stmt = conn.createStatement();
	
		rs= stmt.executeQuery(sql);
		
		/* 	while 문 밖으로 보내기.
		
			SimpleDateFormat old_sdf= new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat new_sdf2= new SimpleDateFormat("yyyy년MM월dd일"); 
			
		 while(rs.next()){
		 					out.print("<tr>");
						 	out.print("<td>"+rs.getString(1)+"</td>");
						 	out.print("<td>"+rs.getString(2)+"</td>");
						 	out.print("<td>"+rs.getString(3)+"</td>");
						 	out.print("<td>"+new_sdf.format(old_sdf.parse(rs.getString(4)))+"</td>");
		 					out.print("</tr>");
		 				  } 
		 
				}catch(Exception e){
					
								e.printStackTrace(); }*/
		SimpleDateFormat sdf1= new SimpleDateFormat("yyyyMMdd");//기존모양
		SimpleDateFormat sdf2= new SimpleDateFormat("yyyy년MM월dd일");//바꿀모양
			
		while(rs.next()){
			
			// new_sdf.format(old_sdf.format(old+sdf.parse(rs.getString(4))) + "</td>");
			String carDate = rs.getString("car_date");
			String date = sdf2.format(sdf1.parse(carDate));
	%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=date %></td>
</tr>
<%
	}

}catch(Exception e){
	e.printStackTrace();
}finally{
	
	if (rs != null )  { rs.close();}
	if (stmt != null){stmt.close();}
	if (conn != null){conn.close();}
}


%>


</tbody>
</table>
</section>
<footer>
HRDKOREA Copyright&copy;2020 All right Human Reserved Service of Korea
</footer>
</body>
</html>