package filbook; 
import java.util.ArrayList;
	/**
		A Wall is a virtual bulletin board which displays any recent 
		Actions that a User has participated in as well as any posts
		that other users have specirically posted on the Wall.  	
		@author Greg
	*/
public class Wall{
	private User owner;
	private ArrayList<Action> wallPosts;
	
	public Wall(){
	
	}
	/**
		Adds a TextPost to the current Wall's ArrayList of Actions.
		@param t the TextPost to add to a wall
	*/
	public void addWallPost(TextPost t){

	}
	/**
		Removes a TextPost from the Wall's Arraylist of Actions based on 
		index.
	*/
	public void removeWallPost(TextPost t){

	}
	/**
		Iterrates through the Wall's ArrayList of Actions and calls
		display() on each Action.  Furthermore, each Action is responsible
		for calling display() on each of its Comments.
	*/
	public void displayWall(){
		
	}
	/**
		Returns the Wall's owner as a User.
	*/
	public User getOwner(){

	}	
}
