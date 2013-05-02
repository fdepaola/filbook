<%@ page import="java.util.*" %>
<%@ page import = "filbook.*" %>
	<jsp:include page="menu.jsp" />
<%
	User currentUser = ((User) session.getAttribute("userAccount"));
	User view;
	if (request.getParameter("toView") == null){
		view = currentUser;
	}else{
		view = UserRepository.instance().getUser(request.getParameter("toView"));
	}
	if (currentUser == null || view == null)
		response.sendRedirect("home.jsp");
	else {
		if (!currentUser.isFriends(view) && currentUser != view) {
			out.println("<form action =\"friendRequest.jsp\" method=POST><input type=\"hidden\" name=\"newRequest\" value=\"" + view.getEmail() + "\" /><input type=submit value=\"Send Friend Request\" /></form>");
		}
		//out.println(view.getName() + "'s wall.");
		session.setAttribute("wallOwner", view);
	%>
	<table>
	<tr><td colspan="2"><h1><%=view.getName() %>'s Info</h1></td></tr>
	<tr><td>Birthday:</td><td><% out.println(view.getBirthday().get(Calendar.MONTH) + " " + view.getBirthday().get(Calendar.DAY_OF_MONTH) + ", " + view.getBirthday().get(Calendar.YEAR)); %></td></tr>
	<tr><td>E-Mail Address:</td><td><%= view.getEmail() %></td></tr>
	<tr><td>Phone Number:</td><td><%= view.getPhone() %></td></tr>
	<tr><td>Gender:</td><td><%= view.getGender() %></td></tr>
	<tr><td>Occupation:</td><td><%= view.getJob() %></td></tr>
	<tr><td>School:</td><td><%= view.getSchool() %></td></tr>
	<tr><td>Relationship Status:</td><td><%= view.getRelationship() %></td></tr>
	<% if (!view.getRelationship().equals("Single") && !view.getRelationship().equals(""))
		out.println("<tr><td>Significant Other:</td><td>" + view.getPartner() + "</td></tr>");
	%>

	</table>
	<%
		if (currentUser.isFriends(view)) {
			out.println("<form action =\"removeFriend.jsp\" method=POST><input type=\"hidden\" name=\"removed\" value=\"" + view.getEmail() + "\" /><input type=submit value=\"Kill Friendship\" /></form>");
		}
	}
%>
