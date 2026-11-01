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
	<span>판매등록</span>
	<form action="saleFormProcess.jsp" method="post" onsubmit="FALSE;">
	<table class="data-tb">
	<tbody>
		<tr>
			<th>판매번호</th>
			<td><input type="text" name="saleNo" class="text"></td>
		</tr>
		<tr>
			<th>판매일자</th>
			<td><input type="text" name="saleDate" class="text"></td>
		</tr>
		<tr>
			<th>상품코드</th>
			<td>
<select name="prodCode" class="text">
<option value="">선택</option>
<option value="P1001">[P1001]원두커피</option>
<option value="P1002">[P1002]과일주스</option>
<option value="P1003">[P1003]세탁세제</option>
<option value="P1004">[P1004]주방세제</option>
<option value="P1005">[P1005]볼펜세트</option>

</select>

</td>
		</tr>
		<tr>
			<th>판매수량</th>
			<td><input type="number" name="saleqty" class="text"></td>
		</tr>
		<tr>
			<th>구메자명</th>
			<td><input type="text" name="buyer_name" class="text"></td>
		</tr>
	</tbody>
	</table>
	<input type="submit" value="판매등록" class="addBtn" onclick="formsubmit()">
	<input type="reset" value="다시쓰기" class="resetBtn" onclick="formReset()">
	</form>
</section>
<script type="text/javascript">

function formReset(){
    alert("입력내용을 초기화했습니다.");
    document.querySelector("form").reset();
}

function formsubmit(){

    if(document.querySelector("input[name='saleNo']").value == ''){
        alert("판매번호가 입력되지 않았습니다.");
        document.querySelector("input[name='saleNo']").focus();
        return false;
    }

    if(document.querySelector("input[name='saleDate']").value == ''){
        alert("판매일자가 입력되지 않았습니다.");
        document.querySelector("input[name='saleDate']").focus();
        return false;
    }

    if(document.querySelector("input[name='prodCode']").value == ''){
        alert("상품코드를 선택하지 않았습니다.");
        document.querySelector("select[name='prodCode']").focus();
        return false;
    }

    if(document.querySelector("input[name='saleqty']").value == ''){
        alert("판매수량이 입력되지 않았습니다.");
        document.querySelector("input[name='saleqty']").focus();
        return false;
    }

    if(document.querySelector("input[name='buyer_name']").value == ''){
        alert("구매자명이 입력되지 않았습니다.");
        document.querySelector("input[name='buyer_name']").focus();
        return false;
    }

    return true;
}
		
	}
</script>
<footer>
	CopyLight &copy; 2026 국제인재개발원 All right reserved.
</footer>
</body>
</html>