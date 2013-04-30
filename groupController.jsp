<%@ page import = "filbook.*" %>
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
		response.sendRedirect("group.jsp?group=" + newGroup.getName());
	}

%>
