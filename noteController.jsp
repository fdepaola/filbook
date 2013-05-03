<%@ page import = "filbook.*" %>
<%@ page import = "java.util.ArrayList" %>
<jsp:include page="menu.jsp" />
<%
	User currentUser = (User)session.getAttribute("userAccount");
	User view = (User)session.getAttribute("wallOwner");
	if (currentUser == null)
		response.sendRedirect("register.jsp");
	String t = request.getParameter("title");
	String b = request.getParameter("noteBody");
	
	Note n = new Note(currentUser, t, b);
	
	ArrayList<User> f = currentUser.getFriends();
	String desc = "wrote a new note titled \""+n.getTitle() + "\"";
	NewsFeedItem news = new NewsFeedItem(currentUser, desc);
	for(int i=0; i<f.size(); i++){
		f.get(i).addNewsFeedItem(news);
	}
			
	ArrayList<Note> nlist = currentUser.getNotes();
	int noteNum = nlist.size();
	currentUser.addNote(n);
	response.sendRedirect("note.jsp?title="+n.getTitle());

%>
