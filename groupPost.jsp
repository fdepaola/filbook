<%@ page import = "filbook.*" %>

<%
User currentUser = ((User) session.getAttribute("userAccount"));
Group view = (Group)session.getAttribute("wallOwner");
String s = request.getParameter("newWallPost");

TextPost t = new TextPost(currentUser, s, view.getWall());
view.getWall().addWallPost(t);
view.save();
response.sendRedirect("group.jsp?group=" + view.getName());
%>
