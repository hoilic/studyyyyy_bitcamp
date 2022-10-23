package user.main;

import java.util.Scanner;


import user.service.UserDeleteService;
import user.service.UserInsertService;
import user.service.UserSearchService;
import user.service.UserSelectService;
import user.service.UserService;
import user.service.UserUpdateService;

public class UserMain {

	public static void main(String[] args) {
		
		//UserMain 호출
		
		UserMain userMain = new UserMain(); // 이름이 userMain 인 UserMain 형태인 new UserMain()생성자
		userMain.menu(); //menu 메소드 실행
		
		System.out.println("프로그램을 종료합니다.");

	}
	
	public void menu(){
		
		Scanner scan = new Scanner(System.in); // 입력을 받기위한 Scanner 생성자 생성!
		int num; // 번호를 입력하는 값을 넣기위해 변수 생성
		
		UserService userService = null ; // 각 항목별 자식들을 동작시키기 위해 부모 클래스 변수를 만든다.
		
		while(true) {
			System.out.println();
			System.out.println("****************");
			System.out.println("   1. 입력 ");
			System.out.println("   2. 출력 ");
			System.out.println("   3. 수정 ");
			System.out.println("   4. 삭제 ");
			System.out.println("   5. 검색 ");
			System.out.println("   6. 종료 ");
			System.out.println("****************");
			System.out.print("번호 입력 : ");
			num = scan.nextInt();  // num 은 우리가 입력할 번호의 값을 받아준다.
			if(num == 6) break; //6번 입력 하면 종료
			
			else if(num == 1) userService = new UserInsertService(); // 부모 = 자식
			// 실제 메모리에 만들어 지는거는  UserInsertService() 이고, userService 리모컨 이다.
			
			else if(num == 2)userService = new UserSelectService(); // 부모 = 자식
			
			else if(num == 3)userService = new UserUpdateService();  // 부모 = 자식
			
			else if(num == 4)userService = new UserDeleteService();  // 부모 = 자식
			
			else  if(num == 5)userService = new UserSearchService(); // 부모 = 자식
			
			
			userService.execute(); //호출
			// 각 번호를 선택하면 각각의 주소값이 정해지고 execute 메소드를 실행시킨다.
			
		}//while	
	}//menu

}
