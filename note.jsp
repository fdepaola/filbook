<%@ page import = "filbook.*" %>
<%@ page import = "java.util.*" %>
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
	String noteTitle = request.getParameter("title");
	/*
	String stringNoteIndex = request.getParameter("noteNumber");
	int noteIndex = Integer.parseInt(stringNoteIndex);
	out.println("This is note number " + noteIndex);
	*/
%>
<table border=0 width=100% align=right>
<tr><td align=right>
older note | newer note
</tr></td>
</table>
<table border=1 width=20% height=100% style="float:left">
<tr height=10%>
<td>
<%out.println(currentUser.getName() + "'s notes");%>
</td></tr>
<tr height=30%>
<td>
Notes: <br>
<%
	if(currentUser.getNotes().isEmpty())
		out.println("You have no notes :(  Try writing one for your fellow Filberts!");
	for(Note n : currentUser.getNotes())
		out.println(n.getTitle()+"<br>");
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
                out.println("<a href=\"group.jsp?group=" + g.getName() + "\">" + g.getName() + "</a>");
        out.println("<br><a href=\"newGroup.jsp\">Create a Group</a>");
%>
</td>
</tr>
</table>
<table border=1 width=80% height=100% style="float:right">
<tr><td>
<%
	out.println(noteTitle+"<br><br>");
	ArrayList<Note> notes = view.getNotes();
	for(int i=0; i<notes.size(); i++){
		if(noteTitle.equals(notes.get(i).getTitle())){
			out.println(notes.get(i).getText());
		}
	}
//	out.println(view.getNotes().get(noteIndex).getTitle());
%>
</textarea><br>
</form></td></tr>
</table>
</body>
