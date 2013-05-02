<%@ page import = "filbook.*" %>
<%@ page import = "java.util.*" %>
<%
User currentUser = ((User) session.getAttribute("userAccount"));
if (currentUser == null)
	response.sendRedirect("register.jsp");
else {
	User remove = UserRepository.instance().getUser(request.getParameter("removed"));
	if (remove != null){
		currentUser.removeFriend(remove);
		
		ArrayList<User> f = currentUser.getFriends();
	        String desc = " is no longer friends with " + remove.getName();
	        NewsFeedItem news = new NewsFeedItem(currentUser, desc);
	        for(int i=0; i<f.size(); i++){
        	        f.get(i).addNewsFeedItem(news);
	        }


	}
	response.sendRedirect("home.jsp");	
}
%>
