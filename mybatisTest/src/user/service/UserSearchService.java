package user.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSearchService implements UserService {

	@Override
	public void execute() {
//
//		1. 이름 검색
//		2. 아이디 검색
//		번호 선택 : 1
//		
//		1번 선택 시
//		찾고자 이름 입력 : 동
//		
//		홍길동 hong 111
//		희동이 baby 111
//		
//		2번 선택 시
//		찾고자 아이디 검색
//		
//		홍길동 hong 111
//		코난 conan 111
//		
//		=> UserDAO.search() 메소드 1개로 해결
//		=> userMapper.xm1에서 <select id="search" 태그 1개로 해결, % #{}은 같이 쓸 수 없다.		
		Scanner scan = new Scanner(System.in);
		

		System.out.println("1. 이름 검색 : ");
		System.out.println("2. 아이디 검색 : ");		
		System.out.println("번호 선택 : ");
		int num = scan.nextInt();
		
		if(num == 1) System.out.println("찾고자 하는 이름 입력 : ");
			
		else if(num == 2) System.out.println("찾고자 하는 아이디 입력 : ");
			String search = scan.next();
		
		
		UserDAO userDAO = UserDAO.getInstance(); //싱글톤
		List<UserDTO> list = userDAO.search(num, search);// userDTO 에 담아오세요
		
		if( list != null){
			for(UserDTO userDTO : list) {
				System.out.println(userDTO.getName() + "\t"
								+ userDTO.getId() + "\t"
								+ userDTO.getPwd() + "\t");
			}//for
		
	}
		else  System.out.println("검색 항목이 없습니다.");
	


	}
}
