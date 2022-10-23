package user.service;

import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserInsertService implements UserService {

	@Override
	public void execute() {
		Scanner scan = new Scanner(System.in);
		
		System.out.print("이름 입력 : ");
		String name = scan.next();
		System.out.print("아이디 입력 : ");
		String id = scan.next();
		System.out.print("비밀번호 입력 : ");
		String pwd = scan.next();
		
		UserDTO userDTO = new UserDTO() ; //위에서 입력한 데이터를 DTO 에 모아두자!
		
		userDTO.setName(name);
		userDTO.setId(id);
		userDTO.setPwd(pwd);
		// name, id, pwd에 입력한 값들을 setName, setId, setPwd 에 저장해놓는다.
		
		
		//DB연동
		UserDAO userDAO = UserDAO.getInstance(); //싱글톤
		// UserDAO  자료형 인 userDAO 객체에 getInstance 생성자를 만들었다!
		userDAO.write(userDTO);
		// userDAO 객체(즉 UserDAO 안에 있는것들 을 담고있는) write 메소드에 userDTO 값을 집어 넣어 실행시킨다.
		
		//응답
		System.out.println("데이터를 DB에 저장했습니다.");

	}

}
