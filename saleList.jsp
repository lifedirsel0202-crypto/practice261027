<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.security.interfaces.RSAKey"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
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
<link rel ="stylesheet" href="./main.css">
</head>
<body>
<header>
	(과정평가형 연습)상품관리 프로그램
</header>
<nav>
<a href = "./productList.jsp">상품조회</a>|
<a href = "./saleForm.jsp">판매등록</a>|
<a href = "./saleList.jsp">판매내역조회</a>|
<a href = "./categoryStats.jsp">분류별판매통계</a>|
<a href = "./index.jsp">홈으로</a>|
</nav>
<section>
	<span>판매내역조회</span>
	
	<table class="data-tb">
	<thead>
	<tr>
	<th>판매일자</th>
	<th>판매번호</th>
	<th>상품명</th>
	<th>분류명</th>
	<th>수량</th>
	<th>판매금액</th>
	</tr>
	</thead>
	<tbody>
	<tr>
	<%
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/HRD_20261027", 
						"root", "admin");
				Statement stmt = conn.createStatement();
					
					String sql = "SELECT SALE_DATE, SALE_NO, PROD_NAME, CAT_NAME, SALE_QTY, UNIT_PRICE, BUYER_NAME"
							+" FROM TBL_SALE TS"
							+" LEFT OUTER JOIN TBL_PRODUCT TP ON TS.PROD_CODE = TP.PROD_CODE"
							+" LEFT OUTER JOIN tbl_category TC ON TP.CAT_CODE=TC.CAT_CODE"
							+" ORDER BY SALE_DATE, SALE_NO";

					ResultSet rs = stmt.executeQuery(sql);
						/*DecimalFormat df = new DecimalFormat("￦#,###");*/
						SimpleDateFormat osdf = new SimpleDateFormat("yyyyMMdd");
						SimpleDateFormat nsdf = new SimpleDateFormat("yyyy년MM월dd일");
						DecimalFormat df = new DecimalFormat("￦#,###");
						
					while (rs.next()) {

						Date date = osdf.parse(rs.getString("sale_date")); 
						
						int unitPrice = rs.getInt("unit_price");
						out.print("<tr>");
						out.print("<td>" + nsdf.format(date) + "</td>");
						out.print("<td>" + rs.getString("sale_no") + "</td>");
						out.print("<td>" + rs.getString("prod_name") + "</td>");
						out.print("<td>" + rs.getString("cat_name") + "</td>");
						out.print("<td>" + rs.getInt("sale_qty") + "</td>");
						out.print("<td>" + df.format(rs.getInt("unit_price")) + "</td>");
						out.print("</tr>");
					}
				} catch (Exception e) {
					out.print("오류발생.관리자문의하세요.");

				}
		%>	
	</tbody>
	</table>
</section>
<footer>
	CopyLight &copy; 2026 국제인재개발원 All right reserved.
</footer>
</body>
</html>