<%@ page import = "filbook.*" %>
<%@ page import = "java.util.ArrayList" %>

<%
User currentUser = ((User) session.getAttribute("userAccount"));
Group view = ((Group) session.getAttribute("wallOwner"));
String prem = request.getParameter("pRemove");
int pr = Integer.parseInt(prem);
String crem = request.getParameter("cRemove");
int cr = Integer.parseInt(crem);

//((TextPost) session.getAttribute("txt"));

ArrayList<TextPost> w = view.getWall().getPosts();
TextPost t = w.get(pr);
ArrayList<Comment> c = t.getComments();


t.removeComment(cr);
response.sendRedirect("group.jsp?group="+view.getName());
%>
