<%@ page import = "filbook.*" %>
<%@ page import = "java.util.*" %>
	<jsp:include page="menu.jsp" />
<%
	User u = (User)session.getAttribute("userAccount");
	if (u == null)
		response.sendRedirect("register.jsp");
	else{
%>
<h1>Update your vital stats!</h1>
<table>
<form action="modProfileController.jsp"><tr>
<td>Birthday:</td><td><select name="bmonth">
<%
	for (int i=1; i<13; i++){
		out.println("<option value=\"" + i + "\"");
		if (u.getBirthday().get(Calendar.MONTH) == i)
			out.println(" selected");
		out.println(">" + i + "</option>");
	}
%>
</select>
<select name="bdate">
<%
	for (int i=1; i<32; i++){
		out.println("<option value=\"" + i + "\"");
		if (u.getBirthday().get(Calendar.DAY_OF_MONTH) == i)
			out.println(" selected");
		out.println(">" + i + "</option>");
	}
%>
</select>
<select name="byear">
<%
	for (int i=2013; i>1969; i--){
		out.println("<option value=\"" + i + "\"");
		if (u.getBirthday().get(Calendar.YEAR) == i)
			out.println(" selected");
		out.println(">" + i + "</option>");
	}
%>
</select>
<tr><td>Phone Number:</td><td><input type=text name="phone" value="<%= u.getPhone() %>" /></td></tr>
<tr><td>Gender:</td><td><select name="gender">
<%
	out.println("<option value=\"Unspecified\"");
	if(u.getGender().equals("Unspecified"))
		out.println(" selected");
	out.println(">Unspecified</option><option value=\"Male\"");
	if (u.getGender().equals("Male"))
		out.println(" selected");	
	out.println(">Male</option><option value=\"Female\"");
	if (u.getGender().equals("Female"))
		out.println(" selected");
	out.println(">Female</option>");
%>
</select>
</td></tr>
<tr><td>Occupation:</td><td><input type=text name="job" value="<%=u.getJob() %>" /></td></tr>
<tr><td>School:</td><td><input type=text name="school" value="<%=u.getSchool() %>" /></td></tr>
<tr><td>Relationship Status:</td><td><select name="rs">
<%
	out.println("<option value=\"Single\"");
	if(u.getRelationship().equals("Single"))
		out.println(" selected");
	out.println(">Single</option><option value=\"Seeing Someone\"");
	if (u.getRelationship().equals("Seeing Someone"))
		out.println(" selected");	
	out.println(">Seeing Someone</option><option value=\"Engaged\"");
	if (u.getRelationship().equals("Engaged"))
		out.println(" selected");
	out.println(">Engaged</option><option value=\"Married\"");
	if (u.getRelationship().equals("Married"))
		out.println(" selected");
	out.println(">Married</option>");
%>
</select>
</td></tr>
<%
	if (u.getRelationship().equals("Seeing Someone") || u.getRelationship().equals("Engaged") || u.getRelationship().equals("Married"))
		out.println("<tr><td>Significant Other</td><td><input type=text name=\"partner\" value=\"" + u.getPartner() + "\" /></td></tr>");
%>
<tr><td colspan="2"><input type=submit value="Update Now!" /></td></tr>
</form>
</table>	
</br>
<table>
<form action="picController.jsp" method=POST enctype="multipart/form-data">
<tr><td>Change your ugly picture!</td><td><input type=file name="pic" /></td></tr>
<tr><td colspan="2"><input type=submit value="Change this stinking thing!" /></td></tr>
</form></table>
</body>
<%
}
%>
