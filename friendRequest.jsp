<%@ page import = "filbook.*" %>

<%
User requester = ((User) session.getAttribute("userAccount"));
User requestee = ((User) UserRepository.instance().getUser(request.getParameter("newRequest")));
if (requester == null || requestee == null)
	response.sendRedirect("home.jsp");
boolean add = true;
for (FriendRequest fr : requestee.getFriendRequests()){
	if (fr.getSender() == requester){
		add = false;
	}
}
if (add == true)
	requester.sendFriendRequest(requestee);
response.sendRedirect("home.jsp");
%>
