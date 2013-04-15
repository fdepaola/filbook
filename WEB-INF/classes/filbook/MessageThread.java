package filbook;
import java.util.ArrayList;
import java.util.Date;
	/**
		A MessageThread is a container for holding Messages.  MessageTheads
		will be displayed inside of a User's inbox as a series of Strings.
		A MessageThread is instantiated upon the first Message being sent
		between two specfic Users.
		@author Greg
	*/
public class MessageThread{
	private User owner;
	private User correspondent;
	private ArrayList<Message> messages;
	private Date mostRecent;
	private boolean newMessages = true;
	/**
		Constructs a new MessageThread, taking a Message as a parameter for the first message.
	*/
	public MessageThread(Message first){
		messages = new ArrayList<Message>();
		messages.add(first);
	}
	/**
		Adds a Message to the MessageThread's ArrayList of Messages.
	*/
	public void addMessage(Message m){ 
		//here be some code that updates "mostRecent" as well 
	}
	/**
		Returns the date of the most recent Message added to the
		MessageThread.
		@return the date of the most recent Mssage
	*/
	public Date getDate(){
		return mostRecent;
	}

	/**
		Removes a Message from the MessageThread's ArrayList of Messages.
		The Message will be removed based on matching the Comment's index
		location.
	*/
	public void removeMessage(int index){}
	/**	
		Iterates through the MessageThread's Messages and calls 
		printMessage() on each of them.
	*/
	public void printMessages(){} 
	/**
		Prints the MessageThread's correspondent and most recent date, as 
		well as displaying whether or not the MessageThread contains a new
		Message since the last time the MessageThread has been observed by
		the owner of the MessageThread.
	*/
	public void printThreadInboxTitle(){}
	/**
		Sets the value of the boolean newMessage variable.  True indicates
		that there is an unread Message within the MessageThread, whereas
		false indicates that every Message has been observed.
	*/
	public void setNewMessages(boolean b){
		newMessages = b;
	}
	/**
		Returns the boolean value of the newMessage variable.  True indicates
		that ther eis an unread Message within the MessageThread, whereas
		false indicates that every Message has been observed.
	*/
	public boolean getNewMessages(){
		return false;
	}
} 
