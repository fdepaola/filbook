<%@ page import = "filbook.*" %>
<jsp:include page="menu.jsp" />
<%
User currentUser = ((User) session.getAttribute("userAccount"));
if (currentUser == null)
	response.sendRedirect("home.jsp");
String search = request.getParameter("query");
%>
<h1>Search Results</h1>
<h2>Matching Users</h2>
<%
	for (User u : UserRepository.instance().getAllUsers())
		if (u.getName().contains(search) || u.getEmail().contains(search))
			out.println("<form action=\"profile.jsp\" method=POST><input type=hidden name=\"view\" value=\"" + u.getEmail() + "\" />" + u.getName() + "<input type=submit value=\"View!\" /></form></br>");
%>
<h2>Matching Groups</h2>
<%
	for (Group g : GroupRepository.instance().getAllGroups())
		if (g.getName().contains(search) || g.getPurpose().contains(search))
			out.println("<form action=\"group.jsp\" method=POST><input type=hidden name=\"group\" value=\"" + g.getName() + "\" />" + g.getName() + "<input type=submit value=\"View!\" /></form></br>");
%>
