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
for(int i=0; i<viewWall.size(); i++){
	out.println("<tr><td>");
	out.println(viewWall.get(i).getCreator()+ " posted: ");%><br><%
	out.println(viewWall.get(i).getText());%><br><%
	out.println("</td></tr>");
}
%>
</table>
		<%
	}
%>
