<%@ page import = "filbook.*" %>
	<jsp:include page="menu.jsp" />
<%
	User currentUser = ((User) session.getAttribute("userAccount"));
	if (currentUser == null)
		response.sendRedirect("login.jsp");
	Group thisGroup = 
	
	
