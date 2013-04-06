package filbook;
import java.util.Date;
import java.util.ArrayList;

/**
	A TextPost contains a generic text body which allows Users. 
	
	@author Greg
	*/
public class TextPost extends Action{
	
	private String text;
	private ArrayList<Comment> comments;
	
	public TextPost(){
 		
	}
	
	public void setText(String s){
		text = t;
	}

	public String getText(){
		return text;
	}

	public void addComment(Comment c){
		comments.add(c);
	}

	public void removeComment(Comment c){

	}
	
	public void display(){
	
	}
}
