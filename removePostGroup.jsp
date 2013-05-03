<%@ page import = "filbook.*" %>
<%@ page import = "java.util.ArrayList" %>

<%
User currentUser = ((User) session.getAttribute("userAccount"));
Group view = ((Group) session.getAttribute("wallOwner"));
String prem = request.getParameter("pRemove");
int pr = Integer.parseInt(prem);
//((TextPost) session.getAttribute("txt"));

ArrayList<TextPost> w = view.getWall().getPosts();


view.getWall().removeWallPost(pr);
response.sendRedirect("group.jsp?group="+view.getName());
%>
