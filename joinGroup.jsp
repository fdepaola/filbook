<%@ page import = "filbook.*" %>
<%@ page import = "java.util.*" %>
<%
User currentUser = ((User) session.getAttribute("userAccount"));
if (currentUser == null)
	response.sendRedirect("register.jsp");
else {
	Group newGroup = GroupRepository.instance().getGroup(request.getParameter("group"));
	if (newGroup != null){
		currentUser.joinGroup(newGroup);
		newGroup.addMember(currentUser);
	        }
	response.sendRedirect("group.jsp?group=" + newGroup.getName());	
}
%>
