<%@ page import = "filbook.*" %>
<body bgcolor="#FFFF00">
<table width=100%><tr><td valign=top>
<h1>Filbook</h1>
The Filbert Site
<br>Welcome, <%
User u = ((User) session.getAttribute("userAccount"));
if(u!=null){
	out.println(u.getName());}
%></td>

<td><img src="http://rosemary.umw.edu/~stephen/cpsc330/filbert.jpg" alt="Lamp" align=top width="90" height="110"></td>
<td valign=top align=right>
Search for other Filberts or Filbert-groups!</br>
<form action="search.jsp">
<input type=text name="query" />
<input type=submit value="Search Here!"></form></td>
<td valign=top align=right>
<%
	User currentUser = ((User) session.getAttribute("userAccount"));
	if (currentUser != null){
	%>
<a href="home.jsp">Home</a> |
//<a href="inbox.jsp">Inbox</a> | 
<a href="profile.jsp">My Profile</a> | 
<a href="modProfile.jsp">Modify Profile</a> |
//<a href="modAccount.jsp">Account Settings</a> |
<a href="logout.jsp">Logout</a>
	<%
	} else {
		response.sendRedirect("register.jsp");
	}
%>
</table>
</br>

