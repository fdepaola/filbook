<%@ page import = "filbook.*" %>
<%@ page import = "java.util.*" %>
<%
User currentUser = ((User) session.getAttribute("userAccount"));
if (currentUser == null)
	response.sendRedirect("register.jsp");
else {
	User newFriend = UserRepository.instance().getUser(request.getParameter("deniedFriend"));
	if (newFriend != null){
		currentUser.removeFriendRequest(newFriend);
		newFriend.removeFriendRequest(currentUser);
	}
	response.sendRedirect("home.jsp");	
}
%>
