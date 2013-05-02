<%@ page import = "filbook.*" %>
<%@ page import = "java.util.ArrayList" %>
<jsp:include page="menu.jsp" />

<%
	User currentUser = (User)session.getAttribute("userAccount");
	if (currentUser == null)
		response.sendRedirect("register.jsp");
	String name = request.getParameter("gname");
	String desc = request.getParameter("gdesc");
	if (name == null)
		response.sendRedirect("home.jsp");
	else{
		Group newGroup = GroupRepository.instance().createNewGroup(name, currentUser);
		newGroup.setPurpose(desc);
		currentUser.joinGroup(newGroup);
		newGroup.addMember(currentUser);
		
		String descr = "created a new group " + newGroup.getName();
		NewsFeedItem n = new NewsFeedItem(currentUser, descr);
		ArrayList<User> f = currentUser.getFriends();
		for(int i =0; i<f.size(); i++){
			f.get(i).addNewsFeedItem(n);
		}
		

		response.sendRedirect("group.jsp?group=" + newGroup.getName());
	}

%>
