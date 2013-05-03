package filbook;
import java.util.*;
import java.io.*;

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
	
	Group(){
		init();
	}

	/**
	Constructs a new Group object with the given name, purpose, and creator instance variables.
	@param name the given name for the new Group
	@param purpose a statement of the Group's focus
	@param creator the User who started the Group
	*/
	Group(String name, User creator){
		setName(name);
		setCreator(creator);
		init();
		save();
	}

	private void init(){
		purpose = "";
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
		//save();
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
		save();
	}

	/**
	Removes a User from the Group's member list and removes the Group from that User's groups list. Does nothing if that User is not currently a member of the Group.
	@param u the User who is leaving the Group
	*/
	public void removeMember(User u){
		members.remove(u);
		save();
	}

	public ArrayList<User> getMembers(){
		return members;
	}

	/**
	Returns the Group's Wall object.
	@return the Wall object instantiated by the Group
	*/
	public Wall getWall(){
		return wall;
	}	

	public void save(){
		try {
			File file = new File("/home/fdepa7na/tomcat/webapps/filbook/groups/" + name + ".group");
			PrintWriter p = new PrintWriter(new FileWriter(file));
			p.println(this.name);
			p.println(this.creator.getEmail());
			p.println(this.purpose);
			//p.println("***");
			//for (User u : members)
			//	p.println(u.getEmail());
			//p.println("---");
			for (TextPost t : this.getWall().getPosts()){
				p.println(t.getCreator());	
				//p.println(t.getDate().get(Calendar.MONTH));
				//p.println(t.getDate().get(Calendar.DAY_OF_MONTH));
				//p.println(t.getDate().get(Calendar.YEAR));
				p.println(t.getText());
				for (Comment c : t.getComments()){
					p.println(c.getCreator());
					//p.println(c.getDate());
					p.println(c.getText());
				}
				p.println("^^^");
			}	
			p.println("$$$");
			p.close();
		} catch (Exception e) {e.printStackTrace();}
	}


	public void load(String filename){
		try {
			File f = new File(filename);
			BufferedReader br = new BufferedReader(new FileReader(f));
			name = br.readLine();
			creator = UserRepository.instance().getUser(br.readLine());
			purpose = br.readLine();
			String line = br.readLine();
			while (!line.equals("$$$")) {
				User u = UserRepository.instance().getUser(line);
				//int m = (new Integer(br.readLine())).intValue();
				//int d = (new Integer(br.readLine())).intValue();
				//int y = (new Integer(br.readLine())).intValue();
				String t = br.readLine();
				TextPost nt = new TextPost(u, t, wall);
				wall.addWallPost(nt);
				line = br.readLine();
				while (!line.equals("^^^")) {
					u = UserRepository.instance().getUser(br.readLine());
					//m = (new Integer(br.readLine())).intValue();
					//d = (new Integer(br.readLine())).intValue();
					//y = (new Integer(br.readLine())).intValue();
					t = br.readLine();
					Comment nc = new Comment(u, t);
					nt.addComment(nc);
					line = br.readLine();
				}
				line = br.readLine();
			}
		} catch (Exception e) {e.printStackTrace();}
	}
}
