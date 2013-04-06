package filbook;
import java.util.Date;

/**
	The abstract superclass of all Actions which monitors the Creator of the
	Action, as well as the Date of the Action's creation. Subclasses should
	provide a substitute display() method.  

	@author Greg
	*/
public abstract class Action{

	private String creator;
	private Date dateOfPost;
	
	public Action(){}	
	
	/**
		Set the name of the creator.
		@param creator the creator of the action
	*/
	public void setCreator(String c){
		creator = c;
	}
	/**
		the worst method ever.
	*/
	public String getCreator(){
		return creator;
	}
	/**
		dates are pretty tasty
	*/
	public void setDate(Date d){
		dateOfPost = d;
	}

	public Date getDate(){
		return dateOfPost;
	}
	
	abstract void display(){

	}
}
	
