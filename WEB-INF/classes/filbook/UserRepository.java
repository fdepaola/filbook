package filbook;

import java.io.*;
import java.util.*;

public class UserRepository{
	private static UserRepository theInstance;
	private Hashtable<String,User> userTable;

	public static UserRepository instance(){
		if(theInstance==null){
			theInstance = new UserRepository();
			theInstance.bootstrap();
		}
		return theInstance;
	}

	private UserRepository(){
		userTable = new Hashtable<String,User>(30);
	}
	
	public User getUser(String email){
		User aUser = userTable.get(email);
    		return aUser;
	}	

	public User createNewUser(String name, String email, String password){
		User newUser = new User(name, email, password);
		userTable.put(name, newUser);
		return newUser;
	}		

	public ArrayList<User> getAllUsers(){
		ArrayList<User> allUsers = new ArrayList<User>(userTable.values());	
		return allUsers;
	}

	public void removeUser(String name){
		userTable.remove(name);	
	}

	private void bootstrap(){
		UserList ul = new UserList();
		File currentDir = new File("/home/fdepa7na/tomcat/webapps/hw6/users/");
		String[] userFileNames = currentDir.list(ul);
		for (int i=0; i<userFileNames.length; i++) {
			User nu = new User();
			nu.setUsername(userFileNames[i].substring(0, userFileNames[i].length()-5));
			userTable.put(userFileNames[i].substring(0, userFileNames[i].length()-5), nu);
		}		
		for (User u : instance().getAllUsers()) {
			u.load("/home/fdepa7na/tomcat/webapps/hw6/users/" + u.getUsername() + ".user");
		} 
	}
}
