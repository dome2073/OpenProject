package Guestbook.model;

import java.util.List;

public class MessageListView {
	public MessageListView() {
		// TODO Auto-generated constructor stub
	}

	private int messageTotalCount; //messageTotalCount = 작성된 게시물 개수
	private int currentPageNumber; 
	private List<Message> messageList;
	private int pageTotalCount; // pageTotalCount = 페이지 수
	private int messageCountPerPage; // messageCountPerPage = 한 페이지에 들어가는 게시물 수 (상수)
	private int firstRow;
	private int endRow;

	public MessageListView(List<Message> messageList, int messageTotalCount, int currentPageNumber,
			int messageCountPerPage, int startRow, int endRow) {
		this.messageList = messageList;
		this.messageTotalCount = messageTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.messageCountPerPage = messageCountPerPage;
		this.firstRow = startRow;
		this.endRow = endRow;
		calculatePageTotalCount();
	}
	
	//전체페이지수를 구하는 메서드
	private void calculatePageTotalCount() {
		if (messageTotalCount == 0) { //messageTotalCount = 작성된 게시물 개수
			pageTotalCount = 0; // pageTotalCount = 페이지 수  //게시물 개수가 0 이면 페이지수 0
		} else { //게시물 개수가 0 이 아닐경우
			//페이지 수 = 작성된 게시물 수 /  한 페이지에 들어가는 게시물 수 (상수)
			// 페이지 수  = 작성된 게시물 수(10) / 한페이지에 방명록이 3개씩 = 3(페이지 수)...나머지 1
			pageTotalCount = messageTotalCount / messageCountPerPage;
			// 몫이 1이상 남았을 경우 페이지수+1
			if (messageTotalCount % messageCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}

	public int getMessageTotalCount() {
		return messageTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public List<Message> getMessageList() {
		return messageList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public int getMessageCountPerPage() {
		return messageCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public boolean isEmpty() {
		return messageTotalCount == 0;
	}
}
