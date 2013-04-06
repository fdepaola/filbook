package filbook;
import java.util.Date;

/**
	An abstract class representing events that users have participated in.  
	Subclasses should provide a substitute display() method to print out any 
	text or display any images based on what should be seen on the screen.
	Actions will typically be stored in such a way that allows multiple
	different subclasses to be listed off all at once.  

	@author Greg
	*/
public abstract class Action{

	private String creator;
	private Date dateOfPost;
	
	public Action(){}	
	
	/**
		Sets the Action's creator member variable.
		@param c the creator of the action
		@author Greg
	*/
	public void setCreator(String c){
		creator = c;
	}
	/**
		Returns the Action's creator's name as a String.
		@return the name creatior of the action as a String
		@author Greg
	*/
	public String getCreator(){
		return creator;
	}
	/**
		Sets the Action's date of creation.
		@param d the date of the action's creation as a Date
		@author Greg
	*/
	public void setDate(Date d){
		dateOfPost = d;
	}
	/**
		Returns the Actin's date of creation as a Date.
		@return the date of the Action's creation as a Date
		@author Greg
	*/
	public Date getDate(){
		return dateOfPost;
	}
	/**
		An abstract method which requires any Action subclasses to provide a
		format in which to be displayed.
		@author Greg
	
	*/
	abstract void display(){

	}
}
	
