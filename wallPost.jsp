<%@ page import = "filbook.*" %>

<%
User postWriter = ((User) session.getAttribute("userAccount"));
User wallOwner = ((User) UserRepository.instance().getUser(request.getParameter("toView")));

wallOwner.getWall.addWallPost("newWallPost");
response.sendRedirect("home.jsp");
%>
