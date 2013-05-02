<%@ page import = "filbook.*" %>
<%
User currentUser = ((User) session.getAttribute("userAccount"));
if (currentUser == null)
	response.sendRedirect("register.jsp");
%>
<html>
<jsp:include page="menu.jsp" />
<h1>Write a Note</h1>

<table>
<form action="noteController.jsp" method=POST>
</td></tr>
<tr><td>
Note TItle:</td><td><input type=text name="title" /></td></tr>
<tr><td>
Note:</td><td><textarea name="noteBody" cols="50" rows="25">Write your note here.</textarea><td></tr>
<tr><td colspan="2" align="right">
<input type=submit value="Add Note!" /></td></tr>
</form>
</table>

</body>
</html>
