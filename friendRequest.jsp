<%@ page import = "filbook.*" %>

<%
User requester = ((User) session.getAttribute("userAccount"));
User requestee = ((User) UserRepository.instance().getUser(request.getParameter("newRequest")));
if (requester == null || requestee == null)
	response.sendRedirect("home.jsp");
requester.sendFriendRequest(requestee);
response.sendRedirect("home.jsp");
