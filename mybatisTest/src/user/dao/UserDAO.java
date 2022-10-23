package user.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import user.bean.UserDTO;

public class UserDAO {
	// 인터페이스라서 new 가 안되닌까 메소드를 이용해서 메모리 할당하려고
	private SqlSessionFactory sqlSessionFactory;
	//팩토리가 있어야 sql session 을 만들수 있다.
  	private static UserDAO userDAO = new UserDAO();
	//private 로 설정 되어 있기때문에 외부에서는 접근할수가 없다.
	
	public static UserDAO getInstance() {
		// TODO Auto-generated method stub
		return userDAO;
	}
	public UserDAO() { //생성자 만들자
		// 환경설정 파일 (mybatis-config.xml)을 읽어온다.
		
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			//DB에 접속한 정보들
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void write(UserDTO userDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();//생성
		//DB 와 연결
		sqlSession.insert("userSQL.write", userDTO);
		//userDTO 데이터를 가지고  userSQL.write 를 실행시켜랏
		sqlSession.commit(); //commit 은 insert, update, delete만 쓴다
		sqlSession.close();
		 
	}
	public List<UserDTO> getList() {
		SqlSession sqlSession = sqlSessionFactory.openSession();//생성
		List<UserDTO> list = sqlSession.selectList("userSQL.getList");
		sqlSession.close();
		
		return list;
	}
	public UserDTO userupdate(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();//생성
		UserDTO userDTO = sqlSession.selectOne("userSQL.userupdate", id);
		
		sqlSession.close(); 
		
		return userDTO;
	}
	public int update2(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();//생성
		int su = sqlSession.update("userSQL.update2", map);
		sqlSession.commit(); //commit 은 insert, update, delete만 쓴다
		sqlSession.close();
		
		return su;
	}
	public void delete(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();//생성
		int su = sqlSession.delete("userSQL.delete", id);
		sqlSession.commit(); //commit 은 insert, update, delete만 쓴다
		sqlSession.close();
		
	}
	public List<UserDTO> search(int num, String search) {
		SqlSession sqlSession = sqlSessionFactory.openSession();//생성
		String so = null;
		if(num == 1) {
			so="name";
		}
		else so="id";
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("so", so);
		map.put("search", search);

		
		List<UserDTO> list = sqlSession.selectList("userSQL.search", map);
		
		sqlSession.close();
		
		return list;
	}

		
	
}
