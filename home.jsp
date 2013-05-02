<%@ page import = "filbook.*" %>
<%@ page import = "java.util.*" %>
	<jsp:include page="menu.jsp" />
<%
User currentUser = ((User) session.getAttribute("userAccount"));
if (currentUser == null)
	response.sendRedirect("register.jsp");
else {
session.setAttribute("wallOwner",currentUser);
ArrayList<User> allUsers = UserRepository.instance().getAllUsers();
out.println(currentUser.getName());
ArrayList<Group> allGroups = GroupRepository.instance().getAllGroups();
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
<form action="group.jsp" method=POST>
<select name="group">
<%
for (int i=0; i<allGroups.size(); i++){
	Group showGroup = allGroups.get(i);
	out.println("<option value=" + showGroup.getName() + ">" + showGroup.getName() + "</option>");
}
%>
</select>
<input type=submit value="View Group's Page" />
</form>
</br>
</br>
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
<table border=1 width=20% height=100% style="float:left">
<tr height=10%>
<td>
<%out.println(currentUser.getName() + "'s homepage and newsfeed");%>
</td></tr>
<tr height=30%>
<td>
Notes: <br>
<%
	if(currentUser.getNotes().isEmpty())
		out.println("You have no notes :(  Try writing one for your fellow Filberts!");
	for(Note n : currentUser.getNotes())
		out.println("<a href=\"note.jsp?title="+n.getTitle() +"\">" + n.getTitle()+"</a><br>");
//  n.getTitle()+"<br>");
	out.println("<br><a href=\"newNote.jsp\">Write a Note</a>");
%>
</td>
</tr>
<tr height=30%>
<td>
Friends: <br>
<%
	if(currentUser.getFriends().isEmpty())
		out.println("You have no friends :( Try our nifty search function to find like-minded Filberts!");
	for (User f : currentUser.getFriends())
		out.println(f.getName()+"<br>");
%>
</td>
</tr>
<tr height=30%>
<td>
Groups: </br>
<%
        if (currentUser.getGroups().isEmpty())
                out.println(currentUser.getName() + " isn't in any groups!</br></br>");
        for (Group g : currentUser.getGroups())
                out.println("<a href=\"group.jsp?group=" + g.getName() + "\">" + g.getName() + "</a><br>");
        out.println("<br><a href=\"newGroup.jsp\">Create a Group</a>");
%>
</td>
</tr>
</table>
<table border=1 width=80% height=100% style="float:right">
<%
ArrayList<NewsFeedItem> news = currentUser.getNewsfeed();

if(news.size()==0){
	out.println("Your newsfeed is empty :(  Get out there and befriend Filberts!");
	}
for(int i=news.size()-1; i>=0; i--){
	out.println("<tr><td>");
	out.println(news.get(i).getCreator()+ " " + news.get(i).getDescription());
	out.println("</td></tr>");
}
%>
</textarea><br>
</form></td></tr>
</table>
</body>
