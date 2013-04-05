package filbook;
import java.util.ArrayList;

/**
Represents a person who has registered as a user and stores information and activity. The person's friends, groups, wall posts, and messages are managed via methods of this class.
@author frankie
*/
public class User {
	private String name;
	private Date birthday;
	private char gender;
	private String job;
	private String school;
	private String relationship;
	private String partner;
	private String phone;
	private String email;
	private String password;
	private boolean isPrivate;
	private ArrayList<User> friendList;
	private ArrayList<Group> groupList;
	private ArrayList<MessageThread> inbox;
	private ArrayList<TextPost> notesList;
	private ArrayList<String> notifications;
	private Wall wall;

	/**
	Sets the user's name member variable.
	@author frankie
	*/
	public void setName(String n) {}
	
	/**
	Returns the user's name.
	@author frankie
	*/
	public String getName() {
		return name;
	}
	
	public void setBirthday(Date b) {}
	public Date getBirthday() {
		return birthday;
	}

	public void setGender(char g) {}
	public char getGender() {
		return gender;
	}

	public void setJob(String j) {}
	public String getJob() {
		return job;
	}

	public void setSchool(String s) {}
	public String getSchool() {
		return school;
	}

	public void setRelationship(String r) {}
	public String getRelationship() {
		return relationship;
	}

	public void setPartner(String p) {}
	public String getPartner() {
		return partner;
	}

	public void setPhone(String p) {}
	public String getPhone() {
		return phone;
	}

	private void setEmail() {}
	public String getEmail() {
		return email;
	}

	public void setPassword(String p) {}
	public String getPassword() {
		return password;
	}

	public void setPrivate(boolean p) {}
	public boolean getPrivate() {
		return isPrivate;
	}

	public void addFriend(User u) {}

	public void removeFriend(User u) {}

	public void joinGroup(Group g) {}

	public void leaveGroup(Group g) {}

	public void addNotification(String n) {}

	public void removeNotification(String n) {}

	public Wall getWall(){}

	public ArrayList<MessageThread> getInbox(){}
}
