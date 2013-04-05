package filbook;
import java.util.Date;

public class Message{
	private User author;
	private User recipient;
	private String messageBody;
	private Date date;

	public Message(String text){
		//constructor takes body as a paramter
		//don't forget to manually set author/recipient/date
	}

	public void setSender(User sender){}

	public User getSender(){}

	public void setRecipient(User recipient){}

	public User getRecipient(){}

	public String getContents(){}

	public void printMessage(){}

}
