<%@ page import = "filbook.*" %>
<%@ page import = "java.util.ArrayList" %>

<%
User currentUser = ((User) session.getAttribute("userAccount"));
User view = ((User) session.getAttribute("wallOwner"));
Note newNote = ((Note) session.getAttribute("thisNote"));

//String title = request.getParameter("title");
String title = newNote.getTitle();
String t = request.getParameter("txt");
//((TextPost) session.getAttribute("txt"));
String s = request.getParameter("newComment");

ArrayList<User> f = currentUser.getFriends();
String desc = "commented on " + view.getName() + "'s note titled \"" + newNote.getTitle() + "\"";
NewsFeedItem n = new NewsFeedItem(currentUser, desc);
for(int x=0; x<f.size(); x++){
	f.get(x).addNewsFeedItem(n);
}
//int i = Integer.parseInt(t);

Comment c = new Comment(currentUser, s);
newNote.addComment(c);
response.sendRedirect("note.jsp?title="+title);
%>
