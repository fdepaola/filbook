package filbook;

import java.io.*;
import java.util.*;

/**
A class following the Singleton design pattern that is responsible for the instantiation, aggregation, and accessibility of all User objects. The User objects are stored in a Hashtable that allows a User object to be retrieved via its associated e-mail address String.
@author frankie
*/
public class UserRepository{
	private static UserRepository theInstance;
	private Hashtable<String,User> userTable;

	/**
	Returns the one instance of the UserRepository class. If the instance does not exist, this method will instantiate one before returning it.
	@return the instance of the UserRepository Singleton class
	*/
	public static UserRepository instance(){
		if(theInstance==null){
			theInstance = new UserRepository();
			theInstance.bootstrap();
		}
		return theInstance;
	}

	/**
	Constructs a new, empty UserRepository object containing a Hashtable for e-mail addresses and User objects as its Key-Value pairs. This constructor is only called from the instance method and only in the event that a UserRepository does not already exist.
	*/
	private UserRepository(){
		userTable = new Hashtable<String,User>(30);
	}
	
	/**
	Returns the User object to which the e-mail address is mapped as its Key. If no User is mapped to this Key, returns null.
	@param email the User's e-mail address
	@return the User that owns the parameter e-mail address.
	*/
	public User getUser(String email){
		User aUser = userTable.get(email);
    		return aUser;
	}	

	/**
	Instantiates a new User object and inserts it into the UserRepository Hashtable using its e-mail address as the Key.
	@param name the User's name
	@param email the User's e-mail address
	@param password the User's password
	@return returns the newly constructed User
	*/
	public User createNewUser(String name, String email, String password){
		User newUser = new User(name, email, password);
		userTable.put(email, newUser);
		return newUser;
	}		

	/**
	Returns an ArrayList containing all Users in the UserRepository.
	@return ArrayList of all Users in the system
	*/
	public ArrayList<User> getAllUsers(){
		ArrayList<User> allUsers = new ArrayList<User>(userTable.values());	
		return allUsers;
	}

	/**
	Restores the system back to its most recently saved state. Repopulates all objects in memory and their associations with each other. This method is only called when the single instance of the UserRepository is instantiated. 
	*/
	private void bootstrap(){
		UserList ul = new UserList();
		File currentDir = new File("/home/fdepa7na/tomcat/webapps/filbook/users/");
		String[] userFileNames = currentDir.list(ul);
		for (int i=0; i<userFileNames.length; i++) {
			User nu = new User();
			nu.setEmail(userFileNames[i].substring(0, userFileNames[i].length()-5));
			userTable.put(userFileNames[i].substring(0, userFileNames[i].length()-5), nu);
		}		
		for (User u : instance().getAllUsers()) {
			u.load("/home/fdepa7na/tomcat/webapps/filbook/users/" + u.getEmail() + ".user");
		} 
	}
}

class UserList implements FilenameFilter {
	public boolean accept(File dir, String name) {
		if (name.endsWith(".user")) {
			return true;
		} else {
			return false;
		}
	}
}
