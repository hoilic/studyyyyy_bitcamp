package user.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserUpdateService implements UserService {

	@Override
	public void execute() {
		
		//데이터
		Scanner scan = new Scanner(System.in);

		System.out.println("수정할 아이디 입력 : ");
		String id = scan.next();
		
		
		//DB
		UserDAO userDAO = UserDAO.getInstance();  //싱글톤
		UserDTO userDTO= userDAO.userupdate(id);// userDTO 에 담아오세요
		
		//응답		
		
	
			if(userDTO == null) { //null 이 라는건 데이터가 없다는 거다.
				System.out.println("찾고자 하는 아이디가 없습니다.");
				return;
			}
				System.out.println(userDTO.getName() + "\t"
						+ userDTO.getId() + "\t"
						+ userDTO.getPwd() + "\t");
					
				System.out.println();
				System.out.print("수정 할 이름 입력 : ");
				String name = scan.next();
				System.out.print("수정 할 비밀번호 입력 : ");
				String pwd = scan.next();
				
				Map<String, String> map = new HashMap<String, String>();
				map.put("name", name);
				map.put("id", id);
				map.put("pwd", pwd);
				
				int su = userDAO.update2(map);
						
				System.err.println(su + "개의 데이터를 수정하였습니다.");
		
			}
					
	
	}


