package filbook;
import java.util.*;

/**
	An abstract class representing events that users have participated in.  
	Subclasses should provide a substitute display() method to print out any 
	text or display any images based on what should be seen on the screen.
	Actions will typically be stored in such a way that allows multiple
	different subclasses to be listed off all at once.  

	@author Greg
	*/
public abstract class Action{

	protected String creator;
	protected GregorianCalendar dateOfPost;
	protected ArrayList<Comment> comments;
	
	/**
		Sets the Action's creator member variable.
		@param c the creator of the action
	*/
	public void setCreator(String c){
		creator = c;
	}
	/**
		Returns the Action's creator's name as a String.
		@return the name creatior of the action as a String
	*/
	public String getCreator(){
		return creator;
	}
	/**
		Sets the Action's date of creation.
		@param d the date of the action's creation as a Date
	*/
	public void setDate(){
		dateOfPost = new GregorianCalendar();
	}
	/**
		Returns the Actin's date of creation as a Date.
		@return the date of the Action's creation as a Date
	*/
	public GregorianCalendar getDate(){
		return dateOfPost;
	}
	/**
		An abstract method which requires any Action subclasses to provide a
		format in which to be displayed.
	
	*/
	abstract void display();
	
	abstract ArrayList<Comment> getComments();
}
	
