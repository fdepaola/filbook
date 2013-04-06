package filbook;

public class Group{
	private String name;
	private String purpose;
	private User creator;
	private ArrayList<User> members;
	private Wall wall;
	private ArrayList<TextPost> notesList;
	
	public Group(String name, String purpose, User creator){}

	public void setName(String s){}

	public String getName(){}

	public void setPurpose(String s){}	

	public String getPurpose(){}

	public User getCreator(){}

	private void setCreator(User u){}

	public void addMember(User u){}

	public void removeMember(User u){}

	public Wall getWall(){}	

}
