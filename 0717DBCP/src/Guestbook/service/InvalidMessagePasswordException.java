package Guestbook.service;

//예외처리 클래스 
//별다른 구현하지 않아도 클래스명으로 정의가 가능함.(Exception상속)
public class InvalidMessagePasswordException extends Exception {

	public InvalidMessagePasswordException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}
	
}
