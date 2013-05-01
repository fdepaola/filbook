<%@ page import = "filbook.*" %>

<%
User currentUser = ((User) session.getAttribute("userAccount"));
User view = ((User) session.getAttribute("wallOwner"));
String t = request.getParameter("txt");
//((TextPost) session.getAttribute("txt"));
String s = request.getParameter("newComment");

int i = Integer.parseInt(t);

Comment c = new Comment(currentUser, s);
view.getWall().getPosts().get(i).addComment(c);
response.sendRedirect("profile.jsp");
%>
