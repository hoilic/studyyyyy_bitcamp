package user.service;

import java.util.List;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSelectService implements UserService {

	@Override
	public void execute() {
		System.out.println();
		
		//DB
		UserDAO userDAO = UserDAO.getInstance(); //싱글톤
		List<UserDTO> list = userDAO.getList();
		//list 라는 이름의 List 객체 배열에  DAO 에 getList 메소드 실행값을 담아준다.
		
		//응답
		for(UserDTO userDTO : list) { //확장 for 문
				System.out.println(userDTO.getName() + "\t"
								+ userDTO.getId() + "\t"
								+ userDTO.getPwd() + "\t");
		}//for

	}

}
