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
	}
	response.sendRedirect("home.jsp");	
}
%>
