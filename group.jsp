<%@ page import = "filbook.*" %>
<%@ page import = "java.util.*" %>
	<jsp:include page="menu.jsp" />
<%
	User currentUser = ((User) session.getAttribute("userAccount"));
	if (currentUser == null)
		response.sendRedirect("login.jsp");
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
                out.println("<a href=\"profile.jsp?toView=" + f.getEmail() + "\">" + f.getName() + "<br>");
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






<table border=1>
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
	out.println(viewWall.get(i).getCreator()+ " posted: ");%><br><%
	out.println(viewWall.get(i).getText());%><br><%
	
	ArrayList<Comment> c = viewWall.get(i).getComments();
        for (int n=0; n<c.size(); n++){
		out.println("<br><br>");
                out.println(viewWall.get(i).getComments().get(n).getCreator()+ " commented: ");
                out.println("<br>");
                out.println(viewWall.get(i).getComments().get(n).getText());
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
		<%
	}
%>
