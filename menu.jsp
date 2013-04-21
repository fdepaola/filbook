<%@ page import = "filbook.*" %>
<body bgcolor="#FFFF00">
<table width=100%><tr><td valign=top>
<h1>Filbook</h1>
The Filbert Site</td>
<td><img src="http://rosemary.umw.edu/~stephen/cpsc330/filbert.jpg" alt="Lamp" align=top width="150" height="175"></td>
<td valign=top>
Search for other Filberts or Filbert-groups!</br>
<input type=text name="query" />
<form action="search.jsp"><input type=submit value="Search Here!"></form></td>
<td valign=top align=right>
<%
	User currentUser = ((User) session.getAttribute("userAccount"));
	if (currentUser != null){
	%>
<a href="inbox.jsp">Inbox</a> | 
<a href="profile.jsp">My Profile</a> | 
<a href="modProfile.jsp">Modify Profile</a> |
<a href="modAccount.jsp">Account Settings</a>
	<%
	}
%>
</table>


