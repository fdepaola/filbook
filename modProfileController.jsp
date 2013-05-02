<%@ page import = "filbook.*" %>
<%@ page import = "java.util.ArrayList" %>
<jsp:include page="menu.jsp" />
<%
User u = (User)session.getAttribute("userAccount");
if (u == null)
	response.sendRedirect("register.jsp");
else{
	int bmo = Integer.parseInt(request.getParameter("bmonth"));
	int bdt = Integer.parseInt(request.getParameter("bdate"));
	int byr = Integer.parseInt(request.getParameter("byear"));
	String phone = request.getParameter("phone");
	String gender = request.getParameter("gender");
	String job = request.getParameter("job");
	String school = request.getParameter("school");
	String rs = request.getParameter("rs");
	String partner = request.getParameter("partner");
	if (partner == null || rs.equals("Single"))
		partner = "";
	u.setBirthday(bmo, bdt, byr);
	u.setPhone(phone);
	u.setGender(gender);
	u.setJob(job);
	u.setSchool(school);
	u.setRelationship(rs);
	u.setPartner(partner);
	
	
        ArrayList<User> f = u.getFriends();
        String desc = u.getName()+"'s profile information has been modified";
        NewsFeedItem news = new NewsFeedItem(u, desc);
        for(int i=0; i<f.size(); i++){
                f.get(i).addNewsFeedItem(news);
        }

	
	response.sendRedirect("modProfile.jsp");
}
%>
