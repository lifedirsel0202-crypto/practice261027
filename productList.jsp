<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
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
<a href = "./index.jsp">홈으로</a>
</nav>
<section>
	<span>상품조회</span>
	<table class="data-tb">
	<thead>
	<tr>
	<th>상품코드</th>
	<th>상품명</th>
	<th>분류명</th>
	<th>단가</th>
	</tr>
	</thead>
	<tbody>
<%
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/HRD_20261027", "root", "admin");
					Statement stmt = conn.createStatement();

				String sql = "select prod_code, prod_name, cat_name, unit_price";
					sql += " from tbl_product tp";
					sql += " left outer join tbl_category tc";
					sql += " on tp.cat_code=tc.cat_code";

					ResultSet rs = stmt.executeQuery(sql);
						/*DecimalFormat df = new DecimalFormat("￦#,###");*/
						/*DecimalFormat df = new DecimalFormat("￦#,###");*/
					
					
					while (rs.next()) {
						int unitPrice = rs.getInt("unit_price");
						DecimalFormat df = new DecimalFormat("￦#,###");
						
						String date = "20261029";
						SimpleDateFormat osdf = new SimpleDateFormat("yyyyMMdd");
						
						Date realDate = osdf.parse(date);
						
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일");
						
						sdf.format(realDate);
						
						out.print("<tr>");
						out.print("<td>" + rs.getString("prod_code") + "</td>");
						out.print("<td>" + rs.getString("prod_name") + "</td>");
						out.print("<td>" + rs.getString("cat_name") + "</td>");
						out.print("<td>" + df.format(unitPrice) + "</td>");
						out.print("</tr>");
					}
				} catch (Exception e) {
					out.print("오류발생.관리자문의하세요.");

				}
				
				
				/*<tr>
				<td><%=rs.getString("prde_code") % ></td>
				<td><%=rs.getString("prde_name") % ></td>
				<td><%=rs.getString("cat_name") % ></td>
				<td><%=df.format(unitPrice) % ></td>
				</tr>*/
				%>
	</tbody>
	</table>
</section>
<footer>
	CopyLight &copy; 2026 국제인재개발원 All right reserved.
</footer>
</body>
</html>