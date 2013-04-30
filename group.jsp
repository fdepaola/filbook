<%@ page import = "filbook.*" %>
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
		%>
		<h1>Welcome to <%=thisGroup.getName() %></h1>
		<%
	}
%>
