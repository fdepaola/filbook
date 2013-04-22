<%@ page import = "filbook.*" %>
<%@ page import = "java.util.*" %>
	<jsp:include page="menu.jsp" />
<%
User currentUser = ((User) session.getAttribute("userAccount"));
if (currentUser == null)
	response.sendRedirect("register.jsp");
else {
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
<%
for (String s : currentUser.getNotifications()){
	out.println(s + "</br>");
}

for (FriendRequest fr : currentUser.getFriendRequests()){
	User sender = fr.getSender();
	out.println(sender.getName() + "<form action=\"addFriend.jsp\"><input type=hidden name=\"newFriend\" value=\"" + sender.getEmail() + "\" /><input type=submit value=\"Accept?\" /></form>" + "<form action=\"denyFriend.jsp\" /><input type=hidden name=\"deniedFriend\" value=\"" + sender.getEmail() + "\" /><input type=submit value=\"Deny?\" /></form></br>");
}


}
%>
<form method="post" action="">
<textarea name="newWallPost" cols="70" rows="4">
Write on this person's wall!
</textarea><br>
<input type="submit" value="Submit" />
</form>
<%
if(currentUser!=null){
out.println("currentUser.getWall().displayWall();");
}
%>

</body>
