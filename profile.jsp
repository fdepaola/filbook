<%@ page import = "filbook.*" %>
	<jsp:include page="menu.jsp" />
<%
	User currentUser = ((User) session.getAttribute("userAccount"));
	User view = UserRepository.instance().getUser(request.getParameter("toView"));
	if (currentUser == null || view == null)
		response.sendRedirect("home.jsp");
	if (!currentUser.isFriends(view)) {
		out.println("<form action =\"friendRequest.jsp\" method=POST><input type=\"hidden\" name=\"newRequest\" value=\"" + view.getEmail() + "\" /><input type=submit value=\"Send Friend Request\" /></form>");
	}
%>

