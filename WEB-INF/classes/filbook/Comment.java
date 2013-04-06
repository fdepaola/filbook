package filbook;
import java.util.Date;
	
	/**
		A Comment is a block of text with an author and date of creation
		that can be added to TextPosts.  Users should specify a character
		limit when creating a comment to a reasonable and modest amount to
		prevent a relatively short series of comments to be massive (500 is
		a recommended character limit).
		@author Greg
	*/
public class Comment {

	private User author;
	private Date date;
	private String text;
	/**
		Constructs a new Comment.
		@param t the textbody of the Comment
	*/	
	public Comment(String t){

	}	
	
	/**
		Sets the Comment's text member variable.
		@param t the new text that the text variable will be modified too
	*/
	public void setText(String t){
		text = t;
	}
	/**
		Returns the Comment's text as a String.
		@return the text to be displayed
	*/
	public String getText(){
		return text;
	}
	/**
		Prints out the Comment's author, date of creation, and text.  It
		should be noted that this method will most likely be called by
		an Action subclass which contains a list of Comments to be
		displayed.
	*/
	public void display(){

	}
}
