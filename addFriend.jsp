<%@ page import = "filbook.*" %>
<%@ page import = "java.util.*" %>
<%
User currentUser = ((User) session.getAttribute("userAccount"));
if (currentUser == null)
	response.sendRedirect("register.jsp");
else {
	User newFriend = UserRepository.instance().getUser(request.getParameter("newFriend"));
	if (newFriend != null){
		currentUser.addFriend(newFriend);
		newFriend.addFriend(currentUser);
		currentUser.removeFriendRequest(newFriend);
		newFriend.removeFriendRequest(currentUser);
	
		ArrayList<User> f = currentUser.getFriends();
	        String desc = " is now friends with " + newFriend.getName();
	        NewsFeedItem news = new NewsFeedItem(currentUser, desc);
	        for(int i=0; i<f.size(); i++){
	                f.get(i).addNewsFeedItem(news);
	        }


	}
	response.sendRedirect("home.jsp");	
}
%>
