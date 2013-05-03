<%@ page import = "filbook.*" %>
<%@ page import = "java.util.*" %>
<%
User currentUser = ((User) session.getAttribute("userAccount"));

if (currentUser == null)
	response.sendRedirect("register.jsp");
else {
	Group remove = GroupRepository.instance().getGroup(request.getParameter("removed"));
	if (remove != null){
		remove.removeMember(currentUser);
		/*
		ArrayList<User> f = currentUser.getFriends();
	        String desc = " is no longer friends with " + remove.getName();
	        NewsFeedItem news = new NewsFeedItem(currentUser, desc);
	        for(int i=0; i<f.size(); i++){
        	        f.get(i).addNewsFeedItem(news);
	        }
		*/
		currentUser.leaveGroup(remove);
	}
	response.sendRedirect("group.jsp?group=" + remove.getName());	
}
%>
