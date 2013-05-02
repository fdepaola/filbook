package filbook;

import java.io.*;
import java.util.*;

/**
A class following the Singleton design pattern that is responsible for the instantiation, aggregation, and accessibility of all Group objects. The Group objects are stored in a Hashtable that allows a Group object to be retrieved via its associated e-mail address String.
@author frankie
*/
public class GroupRepository{
	private static GroupRepository theInstance;
	private Hashtable<String,Group> groupTable;

	/**
	Returns the one instance of the GroupRepository class. If the instance does not exist, this method will instantiate one before returning it.
	@return the instance of the GroupRepository Singleton class
	*/
	public static GroupRepository instance(){
		if(theInstance==null){
			theInstance = new GroupRepository();
			theInstance.bootstrap();
		}
		return theInstance;
	}

	/**
	Constructs a new, empty GroupRepository object containing a Hashtable for e-mail addresses and Group objects as its Key-Value pairs. This constructor is only called from the instance method and only in the event that a GroupRepository does not already exist.
	*/
	private GroupRepository(){
		groupTable = new Hashtable<String,Group>(30);
	}
	
	/**
	Returns the Group object to which the e-mail address is mapped as its Key. If no Group is mapped to this Key, returns null.
	@param name the Group's name
	@return the Group that owns the parameter e-mail address.
	*/
	public Group getGroup(String name){
		Group aGroup = groupTable.get(name);
    		return aGroup;
	}	

	/**
	Instantiates a new Group object and inserts it into the GroupRepository Hashtable using its e-mail address as the Key.
	@param name the Group's name
	@return returns the newly constructed Group
	*/
	public Group createNewGroup(String name, User creator){
		Group newGroup = new Group(name, creator);
		groupTable.put(name, newGroup);
		return newGroup;
	}		

	/**
	Returns an ArrayList containing all Group in the GroupRepository.
	@return ArrayList of all Group in the system
	*/
	public ArrayList<Group> getAllGroups(){
		ArrayList<Group> allGroups = new ArrayList<Group>(groupTable.values());	
		return allGroups;
	}

	/**
	Restores the system back to its most recently saved state. Repopulates all objects in memory and their associations with each other. This method is only called when the single instance of the GroupRepository is instantiated. 
	*/
	void bootstrap(){
		GroupList gl = new GroupList();
		File currentDir = new File("/home/fdepa7na/tomcat/webapps/filbook/groups/");
		String[] groupFileNames = currentDir.list(gl);
		for (int i=0; i<groupFileNames.length; i++) {
			Group ng = new Group();
			ng.setName(groupFileNames[i].substring(0, groupFileNames[i].length()-6));
			groupTable.put(groupFileNames[i].substring(0, groupFileNames[i].length()-6), ng);
		}		
		for (Group g : instance().getAllGroups()) {
			g.load("/home/fdepa7na/tomcat/webapps/filbook/groups/" + g.getName() + ".group");
		} 
	}
}

class GroupList implements FilenameFilter {
	public boolean accept(File dir, String name) {
		if (name.endsWith(".group")) {
			return true;
		} else {
			return false;
		}
	}
}
