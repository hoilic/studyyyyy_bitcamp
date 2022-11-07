package board.bean;

import lombok.Data;

@Data
public class BoardPaging {
	
	private int currentPage; //현재페이지
	private int pageBlock; // [이전] [1] [2] [3] [다음]
	private int pageSize; //1페이지당 5개씩
	private int totalA; //총글수
	private StringBuffer pagingHTML;
	//String - 편집x (추가, 삭제), 영구불변
	//StringBuffer / StringBuilder - 편집가능
	
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA + pageSize-1)/ pageSize; //총 페이지수
		
		int startPage = (currentPage-1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if(endPage > totalP) endPage = totalP; //endPage 마지막일때
		
		if(startPage != 1 ) pagingHTML.append("<span id='paging' onclick='boardPaging("+ (startPage-1)+")'>[이전]</span>");
		//append 는 stringBuffer 가 가지고있는 메소드다. append에 데이터를 담아 pagingHTML 을 실행
		// onclick='boardPaging("+ (startPage-1)+") 은 boardList에서 script를 실행하기 위해  boardPaging 으로 펑션을 걸었다!
		// 예를들어 startPage는 현재 pageBlock이 3이닌까 1 4 7... 이다.
		//4일때 4-1 은 3 임으로 [이전] 키를 누르면 3으로 이동한다 는 뜻이다.
		
		
		for(int i=startPage; i<=endPage; i++){ // 출력을 위한 함수 1이고 현재페이지도 1 이면 나머지 2,3,4,5,6도 똑같이 출력해줘라~그런뜻임
			if(i == currentPage) pagingHTML.append("<span id='currentPaging' onclick='boardPaging("+ i +")'>"+ i +"</span>");
			//1번이 선택 된거닌까 1번에만 currentPaging 로 효과 주고 나머지는 else로
			else
				pagingHTML.append("<span id='paging' onclick='boardPaging("+ i +")'>"+ i +"</span>");
		}//for
		
		if(endPage < totalP) pagingHTML.append("<span id='paging' onclick='boardPaging("+ (endPage+1)+")'>[다음]</span>");
		//totalP가 4일때 endPage가 3이면 다음이 출력된다. "1 2 3 [다음]" 있어야 하닌까
	}

}
