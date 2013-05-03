<html>
<jsp:include page="menu.jsp" />
<h1>Register/Login</h1>
<table>
<tr><td>

<table>
<tr><td>
<h2>Register</h2><form action="registerController.jsp" method=POST>
</td></tr>
<tr><td>
Your Name:</td><td><input type=text name="name" /></td></tr>
<tr><td>
Your E-Mail Address:</td><td><input type=text name="email" /><td></tr>
<tr><td>
Choose a Password:</td><td><input type=password name="pass" /></td></tr>
<tr><td>
Re-Type Password:</td><td><input type=password name="pass2" /></td></tr>
<tr><td>
Date of Birth (M/D/Y):</td><td><select name="bmo">
<%
	for (int i=1; i<13; i++)
		out.println("<option value=\"" + i + "\">" + i + "</option>");
%>
</select>
<select name="bdt">
<%
	for (int i=1; i<32; i++)
		out.println("<option value=\"" + i + "\">" + i + "</option>");
%>
</select>
<select name="byr">
<%
	for (int i=2013; i>1969; i--)
		out.println("<option value=\"" + i + "\">" + i + "</option>");
%>
</select>
</td></tr>
<tr><td colspan="2" align="right">
<input type=submit value="Take Me To The World of the Filberts!" /></td></tr>
</form>
</table>

</td>
<td valign=top>

<table>
<tr><td colspan=2>
<h2>Already a Filbert?</h2><form action="loginController.jsp" method=POST>
</td></tr>
<tr><td>
E-Mail:</td><td><input type=text name="email" /></td></tr>
<tr><td>
Password:</td><td><input type=password name="pass" /></td></tr>
<tr><td colspan="2" align="right">
<input type=submit value="Let Me Back In!" /></td></tr>
</form>
</table>

</td></tr>
</table>

</body>
</html>
