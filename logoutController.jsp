<%@ page import = "filbook.*" %>
<%
	session.setAttribute("userAccount",null);
	response.sendRedirect("register.jsp");
%>
