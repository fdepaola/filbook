package filbook;
	
	/**
		A FriendRequest is an invitation for a mutual virtual friendship.
		Note that a FriendRequest has no effect on the status of the Users'
		friendship until it is accepted by the recipient.
		@author Greg
	*/
public class FriendRequest{
	
	private User sender;
	private User receiver;
	/**
		Constructs a new FriendRequest.
		@param sender the sender of the FriendRequest
		@param receiver  the receiver of the FriendRequest
	*/	
	FriendRequest(User s, User r){
		sender = s;
		receiver = r;
		receiver.addNotification("New friend request from " + sender.getName());
	}
	/**
		Adds the recipient of the FriendRequest to the sender's FriendList
		as well as adding the sender of the FriendRequest to the 
		recipient's FriendList.
	*/
	public void acceptRequest(){
		sender.addFriend(receiver);
		receiver.addFriend(sender);
	}
	/**
		Removes the FriendRequest from the recipient's notifications.
	*/
	public void denyRequest(){
		//this.remove;
	}

	public User getSender(){
		return sender;
	}
	
}
	
