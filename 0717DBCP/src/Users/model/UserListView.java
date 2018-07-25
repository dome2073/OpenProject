package Users.model;

import java.util.List;


public class UserListView {
	public UserListView() {
		// TODO Auto-generated constructor stub
	}
	private int UserTotalCount; //전체 회원수
	private int currentPageNumber; //현재 클릭한 페이지
	private List<User> UserList;
	private int userCountPerPage;
	private int firstRow;
	private int endRow;
	private int pageTotalCount; //?
	
	
	//UserListService에서 받은 매개변수로 생성자 초기화
	public UserListView(List<User> userList, int userTotalCount
			, int currentPageNumber, int userCountPerPage,int firstRow, int endRow){
		// TODO Auto-generated constructor stub
		
		this.UserList =userList;
		this.UserTotalCount = userTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.userCountPerPage = userCountPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;
		CalculatePageTotalCount();
	}
	
	// 전체 페이지수를 카운트
	private void CalculatePageTotalCount() {
		// TODO Auto-generated method stub
		if(UserTotalCount ==0) {
			pageTotalCount = 0;
		}else {
			pageTotalCount = UserTotalCount / userCountPerPage;
			
			if(UserTotalCount % userCountPerPage >0) {
				pageTotalCount++;
			}
		}
		
	}
	public int getUserTotalCount() {
		return UserTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public List<User> getUserList() {
		return UserList;
	}

	public int getUserCountPerPage() {
		return userCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}
	public boolean isEmpty() {
		return pageTotalCount ==0;
	}

	
}
	
	
