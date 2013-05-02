package filbook;
import java.util.*;

/**
	A NewsFeedItem is a sublcass of Actions which can display its creator, date of
	creation, and primary description.  Users should specify a character limit when
	creating a textbody.  Should acharacter limit not be specified, the default
	character limit of 2147483647 will be used.  Be warned: it is extremely 
	likely that a stack overflow error will occur if the desired string 
	exceeds available memory.
	
	@author Greg
	*/
public class NewsFeedItem extends Action{
	
	protected String description;
	/**
		Constructs a new NewsFeedItem.
	*/	
	public NewsFeedItem(User u, String s){
 		creator = u.getName();
		description = s;
		comments = new ArrayList<Comment>();
	}
	/**
		Sets the NewsFeedItem's description member variable.
		@param s the description destined to be displayed
	*/

	NewsFeedItem(String e, int m, int d, int y, String t){
		creator = e;
		description = t;
		dateOfPost = new GregorianCalendar(y, m, d);
	}		
	
	public void setDescription(String t){
		description = t;
	}
	/**
		Returns the NewsFeedItem's description as a String.
		@return the description to be displayed
	*/
	public String getDescription(){
		return description;
	}
	/**
		Adds a Comment to the NewsFeedItem's ArrayList of Comments.  Default
		addition locaiton is at the end of the ArrayList in order to 
		preserve ascending order based on time of post.
		@param c the Comment to be added to the NewsFeedItem
	*/
	public void addComment(Comment c){
		comments.add(c);
	}
	/**
		Removes a Comment from the NewsFeedItem's ArrayList of Comments.
		The Comment will be removed based on matching the Comment's index 
		lcoation.
	*/
	public void removeComment(Comment c){

	}
	/**
		Prints out the NewsFeedItem's creator, dateOfPost, and description, as well as
		manually iterrating through the NewsFeedItem's Comments and calling the
		display() method for each Comment.
	*/
	public void display(){
	
	}
	
	public ArrayList<Comment> getComments(){
		return comments;
	}
}
