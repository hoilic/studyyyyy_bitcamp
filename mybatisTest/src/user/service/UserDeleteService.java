package user.service;

import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserDeleteService implements UserService {

	@Override
	public void execute() {
		
		//데이터
		Scanner scan = new Scanner(System.in);

		System.out.println("삭제할 아이디 입력 : ");
		String id = scan.next();
		
		//DB
		UserDAO userDAO = UserDAO.getInstance();  //싱글톤
		UserDTO userDTO = userDAO.userupdate(id);
		
		
		
				
		//응답		
		if(userDTO == null)//null 이 라는건 데이터가 없다는 거다.
			System.out.println("삭제할 아이디가 없습니다.");
		
		userDAO.delete(id);// userDTO 에 담아오세요
		
		System.out.println("모든 데이터를 삭제했씁니다.");

				

	}

}
