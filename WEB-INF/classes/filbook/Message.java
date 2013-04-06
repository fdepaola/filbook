package filbook;
import java.util.Date;
	/**
		A Message is a virtual letter which is sent between Users discretely
		.  Messages are stored inside of MessageThreads
	
	@author Greg
	*/
public class Message{
	private User author;
	private User recipient;
	private String messageBody;
	private Date date;

	public Message(String text){
		//constructor takes body as a paramter
		//don't forget to manually set author/recipient/date
	}
	/**
		Sets the Message's author member variable.
		@param sender the author of the Message
	*/
	public void setSender(User sender){}
	/**
		Returns the Message's author as a User.
		@return the author of the Message
	*/
	public User getSender(){}
	/**
		Sets the Message's recipient member variable.
		@param recipient the recipient of the message
	*/
	public void setRecipient(User recipient){}
	/**
		Returns the Message's recipient as a User.
		@return the recipient of the Message
	*/
	public User getRecipient(){}
	/**
		Sets the Message's messageBody member variable.
		@param s the desired text to be displayed
	*/
	public void setContents(String s){}
	/**
		Returns the Message's messageBody as a String.
		@return the messageBody of the Message
	*/
	public String getContents(){}
	/**
		Prints out the Message's author, date, and messageBody.  This will
		typically be called by the MessageThread class.
	*/
	public void printMessage(){}

}
