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
	
	//out.println(noteTitle+"<br><br>");
        ArrayList<Note> notess = view.getNotes();
        int noteInd = 0;
	for(int i=0; i<notess.size(); i++){
                if(noteTitle.equals(notess.get(i).getTitle())){
                        noteInd=i;
                }
        }

//	out.println("<br>"+noteInd);
%>
<table border=0 width=100% align=right>
<tr><td align=right>
<% 
	if(noteInd>0){
		out.print("<a href=\"note.jsp?title=" + notess.get(noteInd-1).getTitle() + "\">older note</a>");
	}else{
		out.print("oldest note");
	}%>|
	<%
        if(noteInd<notess.size()-1){
                out.print("<a href=\"note.jsp?title=" + notess.get(noteInd+1).getTitle() + "\">newer note</a>");
        }else{
                out.print("newest note");
        }
         %>
</tr></td>
</table>
<table border=1 width=20% height=100% style="float:left">
<tr height=10%>
<td>
<%out.println(view.getName() + "'s notes");%>
</td></tr>
<tr height=30%>
<td>
<%out.println(view.getName()+"'s Notes: ");%><br>
<%
        if(view.getNotes().isEmpty())
                out.println(view.getName() + " has no notes :(");
        for(Note n : view.getNotes())
                out.println("<a href=\"note.jsp?title="+n.getTitle() +"\">" + n.getTitle()+"</a><br>");
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
		out.println(view.getName()+" has no friends :(");
	for (User f : view.getFriends())
		out.println(f.getName()+"<br>");
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
	Note thisNote = notes.get(0);
	for(int i=0; i<notes.size(); i++){
		if(noteTitle.equals(notes.get(i).getTitle())){
			out.println(notes.get(i).getText());
			out.println("<br><br><br>");
			thisNote = notes.get(i);
		}
	}
	session.setAttribute("thisNote", thisNote);
	out.println("<form name=\""+noteInd+"\" action=\"commentNote.jsp?title=" + thisNote.getTitle()+ "\" method=\"get\"><textarea name=\"newComment\">");
                //out.println("input type=\"hidden\" name=\"txt\" value=\"" + i + "\" />");
                out.println("Comment on this post");
                out.println("</textarea><br><input type=\"submit\" value=\"Comment\" /></form></td></tr>");
	
			ArrayList<Comment> c = thisNote.getComments();
			if(c.size()>0){
				for(int x=0; x<c.size(); x++){
					out.println("<tr><td>");
					out.println(c.get(x).getCreator() + " wrote <br>" + c.get(x).getText()+"<br>");
					out.println("</td></tr>");
				}
			}
	%></td></tr><%

//	out.println(view.getNotes().get(noteIndex).getTitle());
%>
</textarea><br>
</form></td></tr>
</table>
</body>
