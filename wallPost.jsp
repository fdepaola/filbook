<%@ page import = "filbook.*" %>

<%
User currentUser = ((User) session.getAttribute("userAccount"));
User view = ((User) session.getAttribute("wallOwner"));
//User view = ((User) UserRepository.instance().getUser(request.getParameter("toView")));
String s = request.getParameter("newWallPost");

TextPost t = new TextPost(currentUser, s);
view.getWall().addWallPost(t);
response.sendRedirect("profile.jsp");
%>
