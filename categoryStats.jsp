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
<a href = "./index.jsp">홈으로</a>|
</nav>
<section>
	<span>분류별판매통계</span>
	<table class="data-tb">
	<thead>
	<tr>
	<th>분류코드</th>
	<th>분류명</th>
	<th>판매건수</th>
	<th>총판매수량</th>
	<th>총판매금액</th>
	</tr>
	</thead>
	<tbody>
	<%
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/HRD_20261027", "root", "admin");
					Statement stmt = conn.createStatement();

				String sql = "select tc.cat_code catCode, tc.cat_name catName,count(tc.cat_code) totalCount,"
								+" sum(sale_qty) totalSaleQty,sum(unit_price*sale_qty) totalSum"
								+" from tbl_category tc left outer join tbl_product tp on  tp.cat_code= tc.cat_code"
								+" left outer join tbl_sale ts on tp.prod_code= ts.prod_code"
								+" group by tc.cat_code, tc.cat_name with rollup"
								+" order by tc.cat_code is null";

					ResultSet rs = stmt.executeQuery(sql);
					
					
						/*DecimalFormat df = new DecimalFormat("￦#,###");*/
						/*DecimalFormat df = new DecimalFormat("￦#,###");*/
					
					
					while (rs.next()) {
						
						if(rs.getString("catCode") != null && rs.getString("catName") != null){
						
							//분류코드, 분류명, 판매건수, 총 판매수량, 총판매금액
							out.print("<tr>");
							out.print("<td>" + rs.getString("catCode") + "</td>");
							out.print("<td>" + rs.getString("catName") + "</td>");
							out.print("<td>" + rs.getInt("totalCount") + "</td>");
							out.print("<td>" + rs.getInt("totalSaleQty") + "</td>");
							out.print("<td>" + rs.getInt("totalSum") + "</td>");
							out.print("</tr>");
						}else if(rs.getString("catCode") == null && rs.getString("catName") == null){
							out.print("<tr>");
							out.print("<td>합계</td>");
							out.print("<td>-</td>");
							out.print("<td>" + rs.getInt("totalCount") + "</td>");
							out.print("<td>" + rs.getInt("totalSaleQty") + "</td>");
							out.print("<td>" + rs.getInt("totalSum") + "</td>");
							out.print("</tr>");
						}
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