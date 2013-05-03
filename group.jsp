<%@ page import = "filbook.*" %>
<%@ page import = "java.util.*" %>
	<jsp:include page="menu.jsp" />
<%
	User currentUser = ((User) session.getAttribute("userAccount"));
	if (currentUser == null)
		response.sendRedirect("login.jsp");
	else{
	Group thisGroup;
	if (request.getParameter("group") == null){
		response.sendRedirect("home.jsp");
	}else{
		thisGroup = GroupRepository.instance().getGroup(request.getParameter("group"));
		session.setAttribute("wallOwner", thisGroup);
		%>
		<h1>Welcome to <%=thisGroup.getName() %></h1>
		<% out.println(thisGroup.getPurpose()); %><br><br>
<table border=1 width=100% height=1>
</table>
<br>
<%
	if (!thisGroup.getMembers().contains(currentUser))
		out.println("<form action=\"joinGroup.jsp?group=" + thisGroup.getName() + "\" method=POST><input type=submit value=\"Join the fun!\" /></form>");
%>
<table><tr><td>
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
Members: <br>

<%
	if (thisGroup.getMembers().isEmpty())
		out.println("<tr><td>No members in this group!</br>Why does it even exist?</td></tr>");
	for (User m : thisGroup.getMembers())
		out.println("<a href=\"profile.jsp?toView=" + m.getEmail() + "\">" + m.getName() + "</a><br>");
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
<table border=1 width=80% style="float:right">
<tr><td>
<form name="addPost" action="groupPost.jsp" method="get">
<textarea name="newWallPost" cols="70" rows="4">
Write on <%=thisGroup.getName() %>'s wall!
</textarea><br>
<input type="submit" value="Add Wall Post" />
</form></td></tr>
<%
ArrayList<TextPost> viewWall = thisGroup.getWall().getPosts();

if(viewWall.size()==0){
	out.println(thisGroup.getName()+"'s wall is empty. :( </br></br>");
}


for(int i=viewWall.size()-1; i>=0; i--){
	out.println("<tr><td>");
	out.println(UserRepository.instance().getUser(viewWall.get(i).getCreator()).getName()+ " posted: ");%><br><%
	out.println(viewWall.get(i).getText());%><br><%
	if(currentUser.equals(UserRepository.instance().getUser(viewWall.get(i).getCreator()))){
        	out.println("<form action=\"removePostGroup.jsp\" method=POST><input type=\"hidden\" name=\"pRemove\" value=\"" +i+"\" /><input type=\"submit\" value=\"x\" /></form>");
        }
	
	ArrayList<Comment> c = viewWall.get(i).getComments();
        for (int n=0; n<c.size(); n++){
		out.println("<br><br>");
                out.println(UserRepository.instance().getUser(viewWall.get(i).getComments().get(n).getCreator()).getName()+ " commented: ");
                out.println("<br>");
                out.println(viewWall.get(i).getComments().get(n).getText());
		if(currentUser.equals(UserRepository.instance().getUser(viewWall.get(i).getComments().get(n).getCreator()))){
                	out.println("<form action=\"removeCommentGroup.jsp\" method=POST><input type=\"hidden\" name=\"cRemove\" value=\"" +n+"\" /><input type=\"hidden\" name=\"pRemove\" value=\""+i+"\" /><input type=\"submit\" value=\"x\" /></form>");
                }

		
        }
        out.println("<br><br>");
        out.println("This post has " + c.size() + " comments.");
	session.setAttribute("wallOwner", thisGroup);
        out.println("<form name=\""+i+"\" action=\"commentGroup.jsp\" method=\"get\"><input type=\"hidden\" name=\"txt\" value=\""+i+"\" /><textarea name=\"newComment\">");
        out.println("Comment on this post");
        out.println("</textarea><br><input type=\"submit\" value=\"Comment\" /></form></td></tr>");
        }
        out.println("</td></tr>");



%>
</table>
</td>
<%
		if (thisGroup.getMembers().contains(currentUser)) {
                        out.println("<form action =\"leaveGroup.jsp\" method=POST><input type=\"hidden\" name=\"removed\" value=\"" + thisGroup.getName() + "\" /><input type=submit value=\"Kill Membership\" /></form>");
                }

%>
		<%
	}
}
%>
