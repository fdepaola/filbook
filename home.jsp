<%@ page import = "filbook.*" %>
<%@ page import = "java.util.*" %>
	<jsp:include page="menu.jsp" />
<%
User currentUser = ((User) session.getAttribute("userAccount"));
ArrayList<User> allUsers = UserRepository.instance().getAllUsers();
out.println(currentUser.getName());
%>
<form action="profile.jsp" method=POST>
<select name="toView">
<%
for (int i=0; i<allUsers.size(); i++){
	User showUser = allUsers.get(i);
	if (currentUser != showUser){
		out.println("<option value=" + showUser.getEmail() + ">" + showUser.getName() + "</option>");
	}
}
%>
</select>
<input type=submit value="View Profile" />
</form>
</body>
