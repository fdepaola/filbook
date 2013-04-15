<%@ page import = "filbook.*" %>
<jsp:include page="menu.jsp" />
<%
	String email = request.getParameter("email");
	String pw = request.getParameter("pass");
	if (email == null)
		response.sendRedirect("register.jsp");
	else{
		User in = UserRepository.instance().getUser(email);
		if (in != null && pw.equals(in.getPassword())) {
			session.setAttribute("userAccount", in);
			response.sendRedirect("home.jsp");
		} else
			response.sendRedirect("loginFailed.jsp");
	}
%>
