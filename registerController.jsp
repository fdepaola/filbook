<%@ page import = "filbook.*" %>
<jsp:include page="menu.jsp" />
<%
	boolean add = true;
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	if (name.equals("") || email.equals(""))
		response.sendRedirect("register.jsp");
	else{
		name = name.replaceAll("[\\W]", "");
		String pw = request.getParameter("pass");
		String verify = request.getParameter("pass2");
		if (UserRepository.instance().getUser(email) != null){
			%>
			E-Mail Address already in use. Try logging in.
			<form action="register.jsp"><input type=submit value="Ok!"></form>
			<%
			add = false;
		}
		if(!pw.equals(verify)){
			%>
			Passwords do not match. Please try again.
			<form action="register.jsp"><input type=submit value="Okay!"></form>
			<%
			add = false;
		}
		if(add){
			User toAdd = UserRepository.instance().createNewUser(name, email, pw);
			toAdd.setBirthday(Integer.parseInt(request.getParameter("bmo")), Integer.parseInt(request.getParameter("bdt")), Integer.parseInt(request.getParameter("byr")));
			session.setAttribute("userAccount", toAdd);
			response.sendRedirect("home.jsp");
		}
	}
%>
