package filbook;
import java.util.ArrayList;
import java.util.Date;

public class MessageThread{
	private User owner;
	private User correspondent;
	private ArrayList<Message> messages;
	private Date mostRecent;
	private boolean newMessages = true;
	
	public MessageThread(Message first){
		messages = new ArrayList<Message>();
		messages.add(first);
	}

	public void addMessage(Message m){ 
		//here be some code that updates "mostRecent" as well 
	}

	public Date getDate(){}

	public void removeMessage(int index){}

	public void printMessages(){} 

	public void printThread(){}

	public void setNewMessages(boolean b){
		newMessages = b;
	}

	public boolean getNewMessages(){
	
	}
} 
