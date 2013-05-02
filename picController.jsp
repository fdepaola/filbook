<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "filbook.*" %>
<jsp:include page="menu.jsp" />
<%
User u = (User)session.getAttribute("userAccount");
if (u == null)
	response.sendRedirect("register.jsp");
else{
	MultipartRequest mpr = new MultipartRequest(request, "/home/fdepa7na/tomcat/webapps/filbook/profilePics");
	String picName = mpr.getOriginalFileName("pic");
	u.setPicture("profilePics/" + picName);
	response.sendRedirect("modProfile.jsp");
}
%>
