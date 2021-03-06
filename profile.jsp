<%@ page import="java.util.ArrayList" %>
<%@ page import = "filbook.*" %>
	<jsp:include page="menu.jsp" />
<%
	User currentUser = ((User) session.getAttribute("userAccount"));
	User view;
	if (request.getParameter("toView") == null){
//	if(session.getAttribute("wallOwner").equals(null)){
		view = currentUser;
	}else{
//		view = ((User)session.getAttribute("wallOwner"));
		view = UserRepository.instance().getUser(request.getParameter("toView"));
	}
	if (currentUser == null)
		response.sendRedirect("register.jsp");
	else {
		if (!currentUser.isFriends(view) && currentUser != view) {
			out.println("<form action =\"friendRequest.jsp\" method=POST><input type=\"hidden\" name=\"newRequest\" value=\"" + view.getEmail() + "\" /><input type=submit value=\"Send Friend Request\" /></form>");
		}
		//out.println(view.getName() + "'s wall.");
		session.setAttribute("wallOwner", view);
	%>

	
	<img src="<%= view.getPicture() %>" />
	<table border=1 width=100% height=1>
	</table>
	<table border=1 width=20% height=100% style="float:left">
	<tr height=10%>
	<td>
	<%out.println(view.getName() + "'s wall");
	out.println("<a href=\"info.jsp?who=" + view.getEmail() + "\">View Info</a>");
	if(view.getBirthday()!=null){
	        //out.println(view.getBirthday());
	%><br><%}
	if(view.getPhone()!=null){
	        out.println(view.getPhone());
	%><br><%}
	//if(view.getGender()=='m' || view.getGender()=='f' || view.getGender()=='u'){
	//        out.println("Gender: " + view.getGender());
	%><br><%//}
	if(view.getJob()!=null){
	        out.println("Employer: " + view.getJob());
	%><br><%}
	if(view.getSchool()!=null){
	        out.println("School: " + view.getSchool());
	%><br><%}
	if(view.getRelationship()!=null){
	        out.println(view.getRelationship() + " to:");
	%><br><%}
	if(view.getPartner()!=null){
	        out.println(view.getPartner());
	}

%>

	</td>
	</tr>
	<tr height=30%>
	<td>
	<%out.println(view.getName()+"'s Notes: ");%><br>
	<%
        if(view.getNotes().isEmpty())
                out.println(view.getName()+ " has no notes :(");
        for(Note n : view.getNotes())
                out.println("<a href=\"note.jsp?title="+n.getTitle() +"\" >" + n.getTitle()+"</a><br>");
//  n.getTitle()+"<br>");
        out.println("<br><a href=\"newNote.jsp\">Write a Note</a>");
%>

	</td>
	</tr>
	<tr height=30%>
	<td>
	<%out.println(view.getName()+"'s Friends: ");%><br>
	<%
        if(view.getFriends().isEmpty())
                out.println(view.getName()+"has no friends :(");
        for (User f : view.getFriends())
                out.println("<a href=\"profile.jsp?toView=" + f.getEmail() + "\">" + f.getName() + "<br>");
	%>

	</td>
	</tr>
	<tr height=30%>
	<td>
	<%out.println(view.getName()+"'s Groups: ");%></br>
	<%
		if (view.getGroups().isEmpty())
			out.println(view.getName() + " isn't in any groups!</br></br>");
		for (Group g : view.getGroups())
			out.println("<a href=\"group.jsp?group=" + g.getName() + "\">" + g.getName() + "</a><br>");
		out.println("<br><a href=\"newGroup.jsp\">Create a Group</a>");
	%>
	</td>
	</tr>
	</table>
	<table border=1 width=80% height=100% style="float:right">
	<tr><td>
<% if(currentUser.equals(view) || currentUser.isFriends(view)){
	out.println("<form name=\"addPost\" action=\"wallPost.jsp\" method=\"get\">");
	out.println("<textarea name=\"newWallPost\" cols=\"70\" rows=\"4\">");
	out.println("Write on " + view.getName() + "'s wall!");
	out.println("</textarea><br>");
	out.println("<input type=\"submit\" value=\"Add Wall Post\" />");
	out.println("</form></td></tr>");
}else{
out.println("You aren't friends with "+view.getName()+" yet.");
}

	
	ArrayList<TextPost> viewWall = view.getWall().getPosts();

	if(viewWall.size()==0){
		out.println(view.getName()+"'s wall is empty. :(");
	}
	for(int i=viewWall.size()-1; i>=0; i--){
		
		out.println("<tr><td>");
		out.println(UserRepository.instance().getUser((viewWall.get(i).getCreator())).getName() + " posted: ");%><br><%

		out.println(viewWall.get(i).getText());
		if(currentUser.equals(view) || currentUser.equals(UserRepository.instance().getUser(viewWall.get(i).getCreator()))){
			out.println("<form action=\"removePostProfile.jsp\" method=POST><input type=\"hidden\" name=\"pRemove\" value=\"" +i+"\" /><input type=\"submit\" value=\"x\" /></form>");
		}
		ArrayList<Comment> c = viewWall.get(i).getComments();
		for (int n=0; n<c.size(); n++){
			out.println("<br><br>");
			out.println(UserRepository.instance().getUser((viewWall.get(i).getComments().get(n).getCreator())).getName()+ " commented: ");
			out.println("<br>");
			out.println(viewWall.get(i).getComments().get(n).getText());
			if(currentUser.equals(view) || currentUser.equals(UserRepository.instance().getUser(viewWall.get(i).getComments().get(n).getCreator()))){
				out.println("<form action=\"removeCommentProfile.jsp\" method=POST><input type=\"hidden\" name=\"cRemove\" value=\"" +n+"\" /><input type=\"hidden\" name=\"pRemove\" value=\""+i+"\" /><input type=\"submit\" value=\"x\" /></form>");
			}
		}
		out.println("<br><br>");
		out.println("This post has " + c.size() + " comments.");
		if(currentUser.equals(view) || currentUser.isFriends(view)){	
		out.println("<form name=\""+i+"\" action=\"comment.jsp\" method=\"get\"><input type=\"hidden\" name=\"txt\" value=\""+i+"\" /><textarea name=\"newComment\">");
		out.println("Comment on this post");
		out.println("</textarea><br><input type=\"submit\" value=\"Comment\" /></form></td></tr>");
		}
	}
		out.println("</td></tr>");
	%>
	</table>
	<%
		if (currentUser.isFriends(view)) {
			out.println("<form action =\"removeFriend.jsp\" method=POST><input type=\"hidden\" name=\"removed\" value=\"" + view.getEmail() + "\" /><input type=submit value=\"Kill Friendship\" /></form>");
		}
	}
%>
