<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");
	
	String sale_no = request.getParameter("saleNo");
	String saleDate = request.getParameter("saleDate");
	String prodCode = request.getParameter("prodCode");
	int saleQty = Integer.parseInt(request.getParameter("saleqty"));
	String buyerName = request.getParameter("buyer_name");
	
/* 	String sql="INSET INTO TBL_sale VALUES";
	    sql+= "('"+sale_no+"','"+saleDate+"','"+saleQty+"','"+buyerName+"')";
	    
	    out.print(sql); */
	try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/HRD_20261027","root","admin");
	
	String sql2= "INSERT INTO TBL_sale VALUES(?,?,?,?,?);";
	
	PreparedStatement pstmt = conn.prepareStatement(sql2);	
	
	pstmt.setString(1,sale_no);
	pstmt.setString(2,saleDate);
	pstmt.setString(3, prodCode);
	pstmt.setInt(4, saleQty);
	pstmt.setString(5, buyerName);
	
	int rs= pstmt.executeUpdate();
	
	if(rs>0){
		
	}
	}catch(Exception e){
		
	}
%>

</body>
</html>