package filbook;
import java.util.*;
import java.io.*;

/**
Represents a person who has registered as a user and stores information and activity. The person's friends, groups, wall posts, and messages are managed via methods of this class. 
@author frankie
*/
public class User {
	private String name;
	private GregorianCalendar birthday;
	private String gender;
	private String job;
	private String school;
	private String relationship;
	private String partner;
	private String phone;
	private String email;
	private String password;
	private boolean isPrivate;
	private ArrayList<NewsFeedItem> newsfeed;
	private ArrayList<User> friendList;
	private ArrayList<Group> groupList;
	private Hashtable<String, MessageThread> inbox;
	private ArrayList<Note> notesList;
	private ArrayList<String> notifications;
	private ArrayList<FriendRequest> friendRequests;
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
		name = n;
		email = e;
		password = p;
		init();
		save();
	}

	private void init(){
		setBirthdayNS(0,0,0);
		gender = "Unspecified";
		job = "";
		school = "";
		relationship = "";
		partner = "";
		phone = "";	
		isPrivate = false;
		newsfeed = new ArrayList<NewsFeedItem>();
		friendList = new ArrayList<User>();
		groupList = new ArrayList<Group>();
		inbox = new Hashtable<String, MessageThread>(100);
		notesList = new ArrayList<Note>();
		notifications = new ArrayList<String>();
		friendRequests = new ArrayList<FriendRequest>();
		wall = new Wall(this);
		profilePic = "profilePics/filbert.jpg";
	}	

	/**
	Sets the User's name member variable.
	@param n the new name of the User
	*/
	public void setName(String n) {
		name = n;
		save();
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
		save();
	}

	public void setBirthdayNS(int month, int date, int year) {
		birthday = new GregorianCalendar(year, month, date);
	}
	
	/**
	Returns the User's birthday as a Calendar object. Any date formatting can then be performed if desired.
	@return the Date of the User's birth
	*/
	public Calendar getBirthday() {
		return birthday;
	}

	public boolean isFriends(User u) {
		return friendList.contains(u);
	}

	/**
	Sets the User's gender member variable to either "Male", "Female", or "Unspecified".
	@param g the gender of the User
	*/
	public void setGender(String g) {
		gender = g;
		save();
	}

	/**
	Returns the User's gender as a char.
	@return the gender of the User: m for male, f for female, u for unspecified
	*/
	public String getGender() {
		return gender;
	}

	/**
	Sets the User's job member variable.
	@param j the new job of the User
	 */
	public void setJob(String j) {
		job = j;
		save();
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
		save();
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
		save();
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
		save();
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
		save();
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
		save();
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
		save();
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
		if (!isFriends(u)) {
			FriendRequest fr = new FriendRequest(this, u);
			u.friendRequests.add(fr);
			u.save();
		}
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
		save();
		u.save();
	}

	/**
	Removes a User from the friends list of the User on whom this method is called. This has no effect if the two Users are not currently friends.
	@param u the User to be removed
	*/
	public void removeFriend(User u) {
		friendList.remove(u);
		u.friendList.remove(this);
		save();
		u.save();
	}
	
	public ArrayList<User> getFriends(){
		return friendList;
	}
	
	public void addNote(Note n){
		notesList.add(n);
		save();
	}
	public void removeNote(int i){
		notesList.remove(i);
		save();
	}	
	public ArrayList<Note> getNotes(){
		return notesList;
	}
	/**
	Adds the User to the specified Group's member list and adds this Group to the User's groups list. If the User is already a member of the Group this does nothing.
	@param g the Group that the User is joining
	*/
	public void joinGroup(Group g) {
		if (!groupList.contains(g))
			groupList.add(g);
		save();
	}

	/**
	Removes the User from the specified Group's member list and removes the Group from the User's groups list. If the User is not a current member of the Group this does nothing.
	@param g the Group that the User is leaving
	*/
	public void leaveGroup(Group g) {
		groupList.remove(g);
		save();
	}

	public ArrayList<Group> getGroups(){
		return groupList;
	}

	/**
	Adds a new String to the User's notifications list that describes a new activity such as a relevant Wall Post or Comment. The String will indicate what User performed the activity and what specific activity that User performed. For example: "Greg posted on your Wall."
	@param n the String that summarizes the new activity
	*/
	public void addNotification(String n) {
		notifications.add(n);	
		save();
	}	

	/**
	Removes a String from the User's notification list according to its index within the ArrayList.
	@param index the index of the String to be removed from the notifications list
	*/
	public void removeNotification(int i) {
		notifications.remove(i);
		save();
	}
	
	public ArrayList<NewsFeedItem> getNewsfeed(){
		return newsfeed;
	}
	public void addNewsFeedItem(NewsFeedItem a){
		newsfeed.add(a);
	}

	public ArrayList<String> getNotifications() {
		return notifications;
	}

	public ArrayList<FriendRequest> getFriendRequests() {
		return friendRequests;
	}

	public void removeFriendRequest(User u) {
		for (int i = friendRequests.size()-1; i>=0; i--)
			if (friendRequests.get(i).getSender() == u)
				friendRequests.remove(i);
		save();
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
		save();
	}

	public void save(){
		try {
			File f = new File("/home/fdepa7na/tomcat/webapps/filbook/users/" + email.replaceAll("[\\W]", "") + ".user");
			PrintWriter pw = new PrintWriter(new FileWriter(f));
			pw.println(this.email);
			pw.println(this.name);
			pw.println(this.password);
			pw.println(this.birthday.get(Calendar.MONTH));
			pw.println(this.birthday.get(Calendar.DAY_OF_MONTH));
			pw.println(this.birthday.get(Calendar.YEAR));
			pw.println(this.gender);
			pw.println(this.job);
			pw.println(this.school);
			pw.println(this.relationship);
			pw.println(this.partner);
			pw.println(this.phone);
			pw.println(this.isPrivate);
			pw.println(this.profilePic);
			pw.println("***");
			for (User fr : friendList)
				pw.println(fr.email);
			pw.println("---");
			for (Group g : groupList)
				pw.println(g.getName());
			pw.println("@@@");
			for (String n : notifications)
				pw.println(n);
			pw.println("###");
			for (FriendRequest frq : friendRequests)
				pw.println(frq.getSender().getEmail());
			pw.println("---");
			for (TextPost t : this.getWall().getPosts()){
				pw.println(t.getCreator());	
				//pw.println(t.getDate().get(Calendar.MONTH));
				//pw.println(t.getDate().get(Calendar.DAY_OF_MONTH));
				//pw.println(t.getDate().get(Calendar.YEAR));
				pw.println(t.getText());
				pw.println("___");
				for (Comment c : t.getComments()){
					pw.println(c.getCreator());
					//pw.println(c.getDate());
					pw.println(c.getText());
					pw.println("___");
				}
				pw.println("^^^");
			}
			pw.println("$$$");
			for (Note n : notesList){
				pw.println(n.getTitle());
				pw.println(n.getText());
				pw.println("___");
				for (Comment c : n.getComments()){
					pw.println(c.getCreator());
					pw.println(c.getText());
					pw.println("___");
				}
				pw.println("^^^");
			}
			pw.println("!!!");
			pw.close();
		} catch (Exception e) {e.printStackTrace();}
	}

	public void load(String filename){
		try {
			File f = new File(filename);
			BufferedReader br = new BufferedReader(new FileReader(f));
			email = br.readLine();
			name = br.readLine();
			password = br.readLine();
			int mo = (new Integer(br.readLine())).intValue();
			int da = (new Integer(br.readLine())).intValue();
			int yr = (new Integer(br.readLine())).intValue();
			setBirthdayNS(mo, da, yr);
			gender = br.readLine();
			job = br.readLine();
			school = br.readLine();
			relationship = br.readLine();
			partner = br.readLine();
			phone = br.readLine();
			String priv = br.readLine();
			if (priv.equals("true"))
				isPrivate = true;
			else
				isPrivate = false;
			profilePic = br.readLine();
			br.readLine();
			String line = br.readLine();
			while (!line.equals("---")) {
				User af = UserRepository.instance().getUser(line);
				if(!friendList.contains(af))
					friendList.add(af);
				line = br.readLine();
			}
			line = br.readLine();
			while (!line.equals("@@@")) {
				Group g = GroupRepository.instance().getGroup(line);
				groupList.add(g);
				g.addMember(this);
				line = br.readLine();
			}
			line = br.readLine();
			while (!line.equals("###")) {
				notifications.add(br.readLine());
				line = br.readLine();
			}
			line = br.readLine();
			while (!line.equals("---")) {
				User sfr = UserRepository.instance().getUser(line);
				friendRequests.add(new FriendRequest(sfr, this));
				line = br.readLine();
			}
			line = br.readLine();
			while (!line.equals("$$$")) {
				User u = UserRepository.instance().getUser(line);
				//int m = (new Integer(br.readLine())).intValue();
				//int d = (new Integer(br.readLine())).intValue();
				//int y = (new Integer(br.readLine())).intValue();
				String t = br.readLine();
				line = br.readLine();
				while (!line.equals("___")) {
					t += "\n";
					t += line;
					line = br.readLine();
				}
				TextPost nt = new TextPost(u, t, wall);
				wall.addWallPost(nt);
				line = br.readLine();
				while (!line.equals("^^^")) {
					u = UserRepository.instance().getUser(line);
					//m = (new Integer(br.readLine())).intValue();
					//d = (new Integer(br.readLine())).intValue();
					//y = (new Integer(br.readLine())).intValue();
					t = br.readLine();
					line = br.readLine();
					while (!line.equals("___")) {
						t += "\n";
						t += line;
						line = br.readLine();
					}
					Comment nc = new Comment(u, t);
					nt.addComment(nc);
					line = br.readLine();
				}
				line = br.readLine();
			}
			line = br.readLine();
			while (!line.equals("!!!")) {
				String title = line;
				String tx = br.readLine();
				line = br.readLine();
				while (!line.equals("___")) {
					tx += "\n";
					tx += line;
					line = br.readLine();
				}
				Note nn = new Note(this, title, tx);
				notesList.add(nn);
				line = br.readLine();
				while (!line.equals("^^^")) {
					User u = UserRepository.instance().getUser(line);
					String t = br.readLine();
					line = br.readLine();
					while (!line.equals("___")) {
						t += "\n";
						t += line;
						line = br.readLine();
					}
					Comment nc = new Comment(u, t);
					nn.addComment(nc);
					line = br.readLine();
				}
				line = br.readLine();
			}
		} catch (Exception e) {e.printStackTrace();}
	}	
}
