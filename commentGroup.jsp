<%@ page import = "filbook.*" %>
<%@ page import = "java.util.ArrayList" %>

<%
User currentUser = ((User) session.getAttribute("userAccount"));
Group view = ((Group) session.getAttribute("wallOwner"));
String t = request.getParameter("txt");
//((TextPost) session.getAttribute("txt"));
String s = request.getParameter("newComment");

ArrayList<User> f = currentUser.getFriends();
String desc = "commented on a post on " + view.getName() + "'s wall.";
NewsFeedItem n = new NewsFeedItem(currentUser, desc);
for(int x=0; x<f.size(); x++){
	f.get(x).addNewsFeedItem(n);
}

int i = Integer.parseInt(t);

Comment c = new Comment(currentUser, s);
view.getWall().getPosts().get(i).addComment(c);
response.sendRedirect("group.jsp?group="+view.getName());
%>
