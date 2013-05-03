<%@ page import = "filbook.*" %>
<%@ page import = "java.util.ArrayList" %>

<%
User currentUser = ((User) session.getAttribute("userAccount"));
User view = ((User) session.getAttribute("wallOwner"));
Note naughty = ((Note) session.getAttribute("thisNote"));
String prem = request.getParameter("pRemove");
int pr = Integer.parseInt(prem);
String crem = request.getParameter("cRemove");
int cr = Integer.parseInt(crem);

//((TextPost) session.getAttribute("txt"));

ArrayList<Note> w = view.getNotes();
Note n = w.get(pr);
ArrayList<Comment> c = n.getComments();


n.removeComment(cr);
response.sendRedirect("note.jsp?title="+naughty.getTitle());
%>
