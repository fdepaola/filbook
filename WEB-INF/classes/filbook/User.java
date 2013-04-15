package filbook;
import java.util.*;

/**
Represents a person who has registered as a user and stores information and activity. The person's friends, groups, wall posts, and messages are managed via methods of this class. 
@author frankie
*/
public class User {
	private String name;
	private GregorianCalendar birthday;
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
	private Hashtable<String, MessageThread> inbox;
	private ArrayList<TextPost> notesList;
	private ArrayList<String> notifications;
	private Wall wall;
	private String profilePic;

	/**
	Constructs a new default User. This constructor is to be called during bootstrap.
	*/
	User() {
		init();
	}

	/**
	Constructs a new User object with the given parameters as its name, email, and password member variables.
	@param n the User's name
	@param e the User's e-mail address
	@param p the User's password
	*/
	User(String n, String e, String p){
		setName(n);
		setEmail(e);
		setPassword(p);
		init();
	}

	private void init(){
		birthday = null;
		setGender('U');
		setJob(null);
		setSchool(null);
		setRelationship(null);
		setPartner(null);
		setPhone(null);	
		setPrivate(false);
		friendList = new ArrayList<User>();
		groupList = new ArrayList<Group>();
		inbox = new Hashtable<String, MessageThread>(100);
		notesList = new ArrayList<TextPost>();
		notifications = new ArrayList<String>();
		wall = new Wall(this);
		setPicture("/profilePics/filbert.jpg");
	}	

	/**
	Sets the User's name member variable.
	@param n the new name of the User
	*/
	public void setName(String n) {
		name = n;
	}
	
	/**
	Returns the User's name as a String.
	@return the name of the User object
	*/
	public String getName() {
		return name;
	}
	
	/**
	Sets the User's birthday according to the month, day, and year specified. Ensure that month is an integer less than 13 and date is an integer less than 31. Year should aalso not exceed the current year.
	@param month the integer between 1 and 12 (inclusive) that specifies the User's birth month
	@param date the integer between 1 and 31 (inclusive) that specifies the User's birth date
	@param year the integer that specifies the User's birth year
	*/
	public void setBirthday(int month, int date, int year) {
		birthday = new GregorianCalendar(year, month, date);
	}
	
	/**
	Returns the User's birthday as a Calendar object. Any date formatting can then be performed if desired.
	@return the Date of the User's birth
	*/
	public Calendar getBirthday() {
		return birthday;
	}

	/**
	Sets the User's gender member variable to either "Male", "Female", or "Unspecified".
	@param g the gender of the User
	*/
	public void setGender(char g) {
		g = Character.toUpperCase(g);
		if (g != 'M' && g != 'F')
			g = 'U';
		gender = g;
	}

	/**
	Returns the User's gender as a char.
	@return the gender of the User: m for male, f for female, u for unspecified
	*/
	public char getGender() {
		return gender;
	}

	/**
	Sets the User's job member variable.
	@param j the new job of the User
	 */
	public void setJob(String j) {
		job = j;
	}
	
	/**
	Returns the User's job as a String.
	@return the current job of the User
	*/
	public String getJob() {
		return job;
	}

	/**
	Sets the User's school member variable.
	@param s the new school of the User
	*/
	public void setSchool(String s) {
		school = s;
	}

	/**
	Returns the User's school as a String.
	@return the current school of the User
	*/
	public String getSchool() {
		return school;
	}

	/**
	Sets the User's current relationship status. This may be limited to a relatively small set of options such as "Single," "Married," etc.
	@param r the new relationship status of the User
	*/
	public void setRelationship(String r) {
		relationship = r;
	}

	/**
	Returns the User's relationship status member variable as a String.
	@return the current relationship status of the User
	*/
	public String getRelationship() {
		return relationship;
	}

	/**
	Sets the User's current relationship partner.
	@param p the new relationship partner of the User
	*/
	public void setPartner(String p) {
		partner = p;
	}
	
	/**
	Returns the User's relationship partner's name as a String.
	@return the current relationship partner of the User
	*/
	public String getPartner() {
		return partner;
	}

	/**
	Sets the User's current phone number.
	@param p the new phone number of the User
	*/
	public void setPhone(String p) {
		phone = p;
	}
	
	/**
	Returns the User's phone number as a String.
	@return the current phone number of the User
	*/
	public String getPhone() {
		return phone;
	}

	/**
	Sets the User's e-mail address. This private method will usually only be called by the User's constructor and will not be changed once set.
	@param e the e-mail address of the User
	*/
	void setEmail(String e) {
		email = e;
	}
	
	/**
	Returns the User's e-mail address as a String.
	@return the e-mail address of the User
	*/
	public String getEmail() {
		return email;
	}

	/**
	Sets the User's password.
	@param p the new password of the User
	*/
	public void setPassword(String p) {
		password = p;
	}
		
	/**
	Returns the User's password as a String.
	@return the current password of the User
	*/
	public String getPassword() {
		return password;
	}

	/**
	Toggles the privacy setting of the User's profile page. If set to true, the profile will be set to "Private" and only visible by current members of the User's friends list. If false, the profile will be "Public" and visible to any user.
	@param p the boolean value corresponding to whether the User's profile is private
	*/
	public void setPrivate(boolean p) {
		isPrivate = p;
	}

	/**
	Returns the User's current privacy setting as a boolean. Returns true if the profile is set to private, otherwise returns false.
	@return true if User's profile is "private," else false
	*/
	public boolean getPrivate() {
		return isPrivate;
	}
	
	/**
	Instantiates a new FriendRequest object with the parameter User being the sender of the request and the User on whom this method is called being the receiver. If the two users are already friends, this will do nothing.
	@param u the User who is sending the new Friend Request
	*/
	public void sendFriendRequest(User u){
		FriendRequest fr = new FriendRequest();
	}
	
	/**
	Adds another User to the friends list of the User on whom this method is called. This has no effect if the two Users are already friends.
	@param u the User to be added as a friend
	*/
	public void addFriend(User u) {
		if(!friendList.contains(u))
			friendList.add(u);
		if(!u.friendList.contains(this))
			u.friendList.add(this);
	}

	/**
	Removes a User from the friends list of the User on whom this method is called. This has no effect if the two Users are not currently friends.
	@param u the User to be removed
	*/
	public void removeFriend(User u) {
		friendList.remove(u);
		u.friendList.remove(this);
	}

	/**
	Adds the User to the specified Group's member list and adds this Group to the User's groups list. If the User is already a member of the Group this does nothing.
	@param g the Group that the User is joining
	*/
	public void joinGroup(Group g) {
		if (!groupList.contains(g))
			groupList.add(g);
	}

	/**
	Removes the User from the specified Group's member list and removes the Group from the User's groups list. If the User is not a current member of the Group this does nothing.
	@param g the Group that the User is leaving
	*/
	public void leaveGroup(Group g) {
		groupList.remove(g);
	}

	/**
	Adds a new String to the User's notifications list that describes a new activity such as a relevant Wall Post or Comment. The String will indicate what User performed the activity and what specific activity that User performed. For example: "Greg posted on your Wall."
	@param n the String that summarizes the new activity
	*/
	public void addNotification(String n) {
		notifications.add(n);	
	}	

	/**
	Removes a String from the User's notification list according to its index within the ArrayList.
	@param index the index of the String to be removed from the notifications list
	*/
	public void removeNotification(int i) {
		notifications.remove(i);
	}

	/**
	Returns the User's Wall as a Wall object.
	@return the Wall object belonging to the User
	*/
	public Wall getWall(){
		return wall;
	}

	/**
	Prints a summary of each MessageThread in the User's inbox. MessageThreads will be ordered by the Date of their most recent Message and any MessageThread with new, unread Messages will be listed first. The other User (correspondent) of each MessageThread is listed along with the Date and a notifier of whether any Messages within are unread.
	*/
	public void printInbox(){
	//displays inbox page with buttons
	}

	/**
	Returns the MessageThread object from the inbox Hashtable that corresponds to the Key e-mail.
	@param email the email address of the correspondent
	@return the MessageThread object that is the value for the e-mail address key 
	*/
	public MessageThread getMessageThread(String email){
		return inbox.get(email);	
	}
	
	/**
	Returns the directory and filename of the User's current profile picture. Returns null if the User has no profile picture set.
	@returns the User's profilePic instance variable
	*/
	public String getPicture(){
		return profilePic;
	}

	/**
	Changes the User's profile picture by assigning a new filename.
	@param p the directory and filename of the new picture
	*/
	public void setPicture(String p){
		profilePic = p;
	}

	private void save(){

	}

	public void load(String filename){

	}
}
