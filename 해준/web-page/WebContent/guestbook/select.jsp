<%@page import="gb.GuestBookVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select</title>
<link rel="stylesheet" type="text/css" href="./css/guestbook.css">
<script type="text/javascript" src="./js/guestbook.js"></script>
</head>
<body>
<jsp:useBean id="dao" class="gb.GuestBookDao"></jsp:useBean>
	
	<div id="guestbook">
		<h2>방명록</h2>
		
		<%-- 검색바--%>
		<form action="" name="frm_gb" id="frm_gb" method="post">
			<input type="search" name="findStr" value="${param.findStr }" size="30" placeholder="작성자나 내용으로 검색">
			<input type="submit" value="검색" id="btnFind">
		</form>
		<%
			String findStr = "";
			if(request.getParameter("findStr") != null) {
				findStr = request.getParameter("findStr");
			}
			
			List<GuestBookVo> list = dao.select(findStr);
			request.setAttribute("list", list);
		
		%>

		
		
		<%-- 방명록 입력 화면 
		방법 1
		<c:if test="${not empty sessionScope.mid }">
		<%@include file="./insert.jsp" %>
		</c:if>
		<c:if test="${empty sessionScope.mid }">
			<font color="blue">로그인 하시면 방명록을 작성하실 수 있습니다.</font>
		</c:if>
		--%>
		
		<c:choose>
			<c:when test="${not empty sessionScope.mid }">
			<%@include file="./insert.jsp" %>
			</c:when>
			<c:otherwise>
			<font color="blue">로그인하시면 방명록을 작성하실 수 있습니다.</font>
			</c:otherwise>
		</c:choose>
		
		
		
		<%-- 방명록 list --%>		
		<div id="list">
			<c:forEach var="vo" items="${list }">
				<div id="item">
				<form action="" name="frm_temp" method="post">
					<label>작성자</label>
					<input type="text" name="mid" class="mid" value="${vo.mid }" readOnly/>
					
					<label>작성일자</label>
					<output class="mdate">${vo.mdate }</output>
					<br/>
					
					<textarea rows="5" cols="80" disabled name="doc">${vo.doc}</textarea>
					<br/>
					
					<c:if test="${vo.mid == sessionScope.mid}">
					<div class="btns">
						<input type="button" value="수정" id="btnUpdate" name="btnUpdate" onclick="funcUpdate(this.form)"/>
						<input type="button" value="삭제" id="btnDelete" onclick="funcDelete(this.form)"/>
					</div>
					</c:if>
					<input type="hidden" name="serial" value="${vo.serial}">
					<input type="hidden" name="pwd"/>
				</form>
				</div>
			</c:forEach>
		</div>
	</div>
	<script>
	guestbook();
	</script>
</body>
</html>