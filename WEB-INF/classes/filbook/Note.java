package filbook;
import java.util.*;

/**
	A Note is a sublcass of Actions which can display its creator, date of
	creation, and primary text.  Users should specify a character limit when
	creating a textbody.  Should acharacter limit not be specified, the default
	character limit of 2147483647 will be used.  Be warned: it is extremely 
	likely that a stack overflow error will occur if the desired string 
	exceeds available memory.
	
	@author Greg
	*/
public class Note extends Action{
	
	private String text;
	private String title;
	private int index;
	/**
		Constructs a new Note.
	*/	
	public Note(User u, String noteTitle, String noteText){
 		creator = u.getName();
		title = noteTitle;
		text = noteText;
		comments = new ArrayList<Comment>();
	}
	/**
		Sets the Note's text member variable.
		@param s the text destined to be displayed
	*/

	Note(String e, int m, int d, int y, String t){
		creator = e;
		text = t;
		dateOfPost = new GregorianCalendar(y, m, d);
	}		
	public void setIndex(int i){
		index = i;
	}
	public int getIndex(){
		return index;
	}
	public void setTitle(String t){
		title = t;
	}
	public String getTitle(){
		return title;
	}
		
	public void setText(String t){
		text = t;
	}
	/**
		Returns the Note's text as a String.
		@return the text to be displayed
	*/
	public String getText(){
		return text;
	}
	/**
		Adds a Comment to the Note's ArrayList of Comments.  Default
		addition locaiton is at the end of the ArrayList in order to 
		preserve ascending order based on time of post.
		@param c the Comment to be added to the Note
	*/
	public void addComment(Comment c){
		comments.add(c);
	}
	/**
		Removes a Comment from the Note's ArrayList of Comments.
		The Comment will be removed based on matching the Comment's index 
		lcoation.
	*/
	public void removeComment(Comment c){

	}
	/**
		Prints out the Note's creator, dateOfPost, and text, as well as
		manually iterrating through the Note's Comments and calling the
		display() method for each Comment.
	*/
	public void display(){
	
	}
	
	public ArrayList<Comment> getComments(){
		return comments;
	}
}
