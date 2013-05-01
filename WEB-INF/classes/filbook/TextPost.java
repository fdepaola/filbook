package filbook;
import java.util.*;

/**
	A TextPost is a sublcass of Actions which can display its creator, date of
	creation, and primary text.  Users should specify a character limit when
	creating a textbody.  Should acharacter limit not be specified, the default
	character limit of 2147483647 will be used.  Be warned: it is extremely 
	likely that a stack overflow error will occur if the desired string 
	exceeds available memory.
	
	@author Greg
	*/
public class TextPost extends Action{
	
	private String text;
	/**
		Constructs a new TextPost.
	*/	
	public TextPost(User u, String s){
 		creator = u.getName();
		text = s;
		comments = new ArrayList<Comment>();
	}
	/**
		Sets the TextPost's text member variable.
		@param s the text destined to be displayed
	*/

	TextPost(String e, int m, int d, int y, String t){
		creator = e;
		text = t;
		dateOfPost = new GregorianCalendar(y, m, d);
	}		
	
	public void setText(String t){
		text = t;
	}
	/**
		Returns the TextPost's text as a String.
		@return the text to be displayed
	*/
	public String getText(){
		return text;
	}
	/**
		Adds a Comment to the TextPost's ArrayList of Comments.  Default
		addition locaiton is at the end of the ArrayList in order to 
		preserve ascending order based on time of post.
		@param c the Comment to be added to the TextPost
	*/
	public void addComment(Comment c){
		comments.add(c);
	}
	/**
		Removes a Comment from the TextPost's ArrayList of Comments.
		The Comment will be removed based on matching the Comment's index 
		lcoation.
	*/
	public void removeComment(Comment c){

	}
	/**
		Prints out the TextPost's creator, dateOfPost, and text, as well as
		manually iterrating through the TextPost's Comments and calling the
		display() method for each Comment.
	*/
	public void display(){
	
	}
	
	public ArrayList<Comment> getComments(){
		return comments;
	}
}
