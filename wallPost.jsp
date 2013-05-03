<%@ page import = "filbook.*" %>
<%@ page import = "java.util.ArrayList" %>

<%
User currentUser = ((User) session.getAttribute("userAccount"));
User view = ((User) session.getAttribute("wallOwner"));
//User view = ((User) UserRepository.instance().getUser(request.getParameter("toView")));
String s = request.getParameter("newWallPost");
ArrayList<User> f = currentUser.getFriends();

String desc = "wrote on " + view.getName() + "'s wall.";

NewsFeedItem n = new NewsFeedItem(currentUser, desc);
//n.setCreator(currentUser.getName());

//a.setDate();

for(int i=0; i<f.size(); i++){
	f.get(i).addNewsFeedItem(n);
}

TextPost t = new TextPost(currentUser, s, view.getWall());
view.getWall().addWallPost(t);
view.save();
response.sendRedirect("profile.jsp?toView=" + view.getEmail());
%>
