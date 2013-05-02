<%@ page import = "filbook.*" %>
<%@ page import = "java.util.ArrayList" %>
<jsp:include page="menu.jsp" />
<%
	User currentUser = (User)session.getAttribute("userAccount");
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
	//response.sendRedirect("note.jsp?noteCreator="+currentUser.getName()+"?noteNumber="+noteNum);
	//Group newGroup = GroupRepository.instance().createNewGroup(name, currentUser);
	//newGroup.setPurpose(desc);
	//currentUser.joinGroup(newGroup);
	//newGroup.addMember(currentUser);
	//response.sendRedirect(".jsp?group=" + newGroup.getName());

%>
