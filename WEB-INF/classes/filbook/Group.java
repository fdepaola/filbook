package filbook;
import java.util.ArrayList;

/**
A collection of User objects who share some common interest.
@author frankie
*/
public class Group{
	private String name;
	private String purpose;
	private User creator;
	private ArrayList<User> members;
	private Wall wall;
	private ArrayList<TextPost> notesList;
	
	/**
	Constructs a new Group object with the given name, purpose, and creator instance variables.
	@param name the given name for the new Group
	@param purpose a statement of the Group's focus
	@param creator the User who started the Group
	*/
	public Group(String name, String purpose, User creator){
		setName(name);
		setPurpose(purpose);
		setCreator(creator);
		init();
	}

	private void init(){
		members = new ArrayList<User>();
		wall = new Wall(this);
		notesList = new ArrayList<TextPost>();
	}

	/**
	Sets the Group's name.
	@param s the new name of the Group
	*/
	public void setName(String n){
		name = n;
	}

	/**
	Returns the Group's name as a String.
	@return the name of the Group
	*/
	public String getName(){
		return name;
	}

	/**
	Sets the Group's purpose.
	@param s the Group's new purpose
	*/
	public void setPurpose(String p){
		purpose = p;
	}	

	/**
	Returns the Group's purpose as a String.
	@return the Group's current purpose
	*/
	public String getPurpose(){
		return purpose;
	}

	/**
	Returns the Group's creator as a User object.
	@return the Group's creator User
	*/
	public User getCreator(){
		return creator;
	}

	/**
	Sets the Group's creator. This method will typically only be called from the constructor.
	@param u the User who started the Group
	*/
	private void setCreator(User u){
		creator = u;
	}

	/**
	Adds a new User to the Group's member list and adds the Group to that User's groups list. Does nothing if the User is already a member of the Group.
	@param u the User who is joining the Group
	*/
	public void addMember(User u){
		members.add(u);
	}

	/**
	Removes a User from the Group's member list and removes the Group from that User's groups list. Does nothing if that User is not currently a member of the Group.
	@param u the User who is leaving the Group
	*/
	public void removeMember(User u){
		members.remove(u);
	}

	/**
	Returns the Group's Wall object.
	@return the Wall object instantiated by the Group
	*/
	public Wall getWall(){
		return wall;
	}	

}
