<%@ page import = "filbook.*" %>
<%
User currentUser = ((User) session.getAttribute("userAccount"));
if (currentUser == null)
	response.sendRedirect("register.jsp");
%>
<html>
<jsp:include page="menu.jsp" />
<h1>Create a Group</h1>

<table>
<form action="groupController.jsp" method=POST>
</td></tr>
<tr><td>
Group Name:</td><td><input type=text name="gname" /></td></tr>
<tr><td>
Description:</td><td><textarea name="gdesc" cols="50" rows="3">Enter a brief description or common interest to your new group.</textarea><td></tr>
<tr><td colspan="2" align="right">
<input type=submit value="Make my Group!" /></td></tr>
</form>
</table>

</body>
</html>
