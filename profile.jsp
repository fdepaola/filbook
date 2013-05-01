<%@ page import="java.util.ArrayList" %>
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
	if (!currentUser.isFriends(view) && currentUser != view) {
		out.println("<form action =\"friendRequest.jsp\" method=POST><input type=\"hidden\" name=\"newRequest\" value=\"" + view.getEmail() + "\" /><input type=submit value=\"Send Friend Request\" /></form>");
	}
	//out.println(view.getName() + "'s wall.");
	session.setAttribute("wallOwner", view);
%>


<table border=1 width=20% height=100% style="float:left">
<tr height=10%>
<td>
<%out.println(view.getName() + "'s wall");%>
</td>
</tr>
<tr height=30%>
<td>
notes
</td>
</tr>
<tr height=30%>
<td>
friends
</td>
</tr>
<tr height=30%>
<td>
Groups: </br>
<%
	if (view.getGroups().isEmpty())
		out.println(view.getName() + " isn't in any groups!</br></br>");
	for (Group g : view.getGroups())
		out.println("<a href=\"group.jsp?group=" + g.getName() + "\">" + g.getName() + "</a>");
	out.println("<a href=\"newGroup.jsp\">Create a Group</a>");
%>
</td>
</tr>
</table>

<table border=1 width=80% height=100% style="float:right">
<tr><td>
<form name="addPost" action="wallPost.jsp" method="get">
<textarea name="newWallPost" cols="70" rows="4">
Write on <%out.print(view.getName());%>'s wall!
</textarea><br>
<input type="submit" value="Add Wall Post" />
</form></td></tr>
<%
ArrayList<TextPost> viewWall = view.getWall().getPosts();

if(viewWall.size()==0){
	out.println(view.getName()+"'s wall is empty. :(");
}
for(int i=viewWall.size()-1; i>=0; i--){
	
	out.println("<tr><td>");
	out.println(viewWall.get(i).getCreator()+ " posted: ");%><br><%
	out.println(viewWall.get(i).getText());
	
	ArrayList<Comment> c = viewWall.get(i).getComments();
	for (int n=0; n<c.size(); n++){
		out.println("<br><br>");
		out.println(viewWall.get(i).getComments().get(n).getCreator()+ " commented: ");
		out.println("<br>");
		out.println(viewWall.get(i).getComments().get(n).getText());
	}
	out.println("<br><br>");
	out.println("This post has " + c.size() + " comments.");
		
	//TextPost txt = ((TextPost) session.setAttribute(viewWall.get(i)));
	//TextPost t = viewWall.get(i);
	//session.setAttribute("txt", t);
	out.println("<form name=\""+i+"\" action=\"comment.jsp\" method=\"get\"><input type=\"hidden\" name=\"txt\" value=\""+i+"\" /><textarea name=\"newComment\">");
	//out.println("input type=\"hidden\" name=\"txt\" value=\"" + i + "\" />");
	out.println("Comment on this post");
	out.println("</textarea><br><input type=\"submit\" value=\"Comment\" /></form></td></tr>");
}
	out.println("</td></tr>");
%>
</table>
<%
	if (currentUser.isFriends(view)) {
		out.println("<form action =\"removeFriend.jsp\" method=POST><input type=\"hidden\" name=\"removed\" value=\"" + view.getEmail() + "\" /><input type=submit value=\"Kill Friendship\" /></form>");
	}
%>
