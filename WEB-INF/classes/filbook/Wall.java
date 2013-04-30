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
	private Group creator;
	private ArrayList<TextPost> wallPosts;
	
	/**
		Constructs a new empty Wall for a User.
		@param u the User who is the new Wall's owner
	*/
	public Wall(User u){
		owner = u;
		wallPosts = new ArrayList<TextPost>();
	}

	/**
		Constructs a new empty Wall for a Group.
		@param g the Group who is the new Wall's creator
	*/
	public Wall(Group g){
		creator = g;
		wallPosts = new ArrayList<TextPost>();
	}

	/**
		Adds a TextPost to the current Wall's ArrayList of Actions.
		@param t the TextPost to add to a wall
	*/
	public void addWallPost(TextPost t){
		wallPosts.add(t);
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
		if(wallPosts.size()==0){
			System.out.println(owner.getName()+"'s wall is empty.");
		}else{
			for(int i=0; i<wallPosts.size(); i++){
				System.out.println(wallPosts.get(i));
			}
		}
	}
	/**
		Returns the Wall's owner as a User.
	*/
	public User getOwner(){
		return owner;
	}	

	public ArrayList<TextPost> getPosts(){
		return wallPosts;
	}
}
