<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta charset="UTF-8">
<head>
<title>FineApple Main</title>
<link rel="stylesheet" type="text/css" href="../css/cs_center.css">
<link rel="stylesheet" type="text/css" href="../css/header.css">
<link rel="stylesheet" type="text/css" href="../css/footer.css">
<link rel='stylesheet' type='text/css'
   href='http://code.jquery.com/ui/1.12.1/themes/cupertino/jquery-ui.css'/>
   
<script src="https://code.jquery.com/jquery-3.5.1.js" 
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
        crossorigin="anonymous"></script>
        
<script type="text/javascript" src="./js/inquirybook.js"></script>
</head>

<body>
<!-- include 변수 설정 -->
<%
	request.setCharacterEncoding("utf-8");
	String func = "../cs_center/cs_insert.jsp";
	if(request.getParameter("func") != null) {
		func = request.getParameter("func");
	}
%>


	<!-- header영역 -->
	<%if( session.getAttribute("mid")== null){ //mid의 속성이 없으면 로그인 이전화면 %>
	<jsp:include page="../main/header1.jsp"/>
	
	<%} else {%>
	
	<jsp:include page="../main/header2.jsp"/>
	
	<%} %> 


<!-- 메인 페이지 플렉스 레이아웃 설정 -->
<div class="cs_func_page_container">
	<header class="cs_func_page_title">
		<div class="cs_func_page_title_item">
		<h2>CS CENTER</h2>
		</div>
		<div class="cs_func_page_title_item">
		<a href="cs_func_page.jsp?func=../cs_center/cs_insert.jsp">
		<h4>Q&A</h4>
		<p>질문 전 FAQ를 먼저 확인해주세요.</p>
		</a>
		</div>
		<div class="cs_func_page_title_item">
		<a href="cs_func_page.jsp?func=../cs_center/cs_FAQ.jsp">
		<h4>FAQ</h4>
		<p>자주 묻는 질문</p>
		</a>
		</div>
		<div class="cs_func_page_title_item">
		<a href="inquiry.do?qa=select">
		<h4>게시판</h4>
		<p>다른 고객님의 질문 사항을 확인해주세요.</p>
		</a>
		</div>
		<div class="cs_func_page_title_item">
		<a href="cs_func_page.jsp?func=../cs_center/cs_map.jsp">
		<h4>찾아오시는 길</h4>
		<p>제품을 눈으로 확인하고 구매하세요.</p>
		</a>
		</div>
	</header>
	<section class="cs_func_page_content">
		<nav>
			<div class="cs_func_page_quickmenu">
			<h3>QUICK MENU</h3>
			</div>
			<ul class="cs_func_page_quickmenu_ul">
				<li>
					<a href="#">제품</a>
					<ul>
						<li><a href="">핸드폰</a></li>
						<li><a href="">태블릿</a></li>
						<li><a href="">노트북</a></li>
						<li><a href="">스마트워치</a></li>
						<li><a href="">엑세서리</a></li>
					</ul>
				</li>
				<li>
					<a href="#">마이페이지</a>
					<ul>
						<li><a href="">고객정보수정</a></li>
						<li><a href="">장바구니</a></li>
						<li><a href="">찜목록</a></li>
						<li><a href="">쿠폰함</a></li>
						<li><a href="">문의 내역</a></li>
					</ul>
				</li>
			</ul>
		</nav>
		
		<!-- 실질적으로 변경되는 공간 -->
		<main class="cs_func_page_inquiry">
		<jsp:include page="<%=func%>"></jsp:include>
		</main>
		
		<aside class="cs_func_page_sidebanner">
			<div class="cs_func_page_sidenotice">
				
			</div>
		</aside>
	</section>
</div>


<!-- footer 고정 광고 배너 -->
<div class="cs_home_footer">
		<img alt="" src="../images/adv.png" style="width: 100%; height: 100%; display: block; margin: 50px 0 -50px  0;"/>
</div>	


  <!-- footer영역 -->
   	<%@include file="../main/footer.jsp" %>


<!-- 스크립트 -->
<script>
question()
initmenu()
</script>
</body>
</html>