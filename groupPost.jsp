<%@ page import = "filbook.*" %>

<%
User currentUser = ((User) session.getAttribute("userAccount"));
Group view = (Group)session.getAttribute("wallOwner");
String s = request.getParameter("newWallPost");

TextPost t = new TextPost(currentUser, s);
view.getWall().addWallPost(t);
response.sendRedirect("group.jsp?group=" + view.getName());
%>
