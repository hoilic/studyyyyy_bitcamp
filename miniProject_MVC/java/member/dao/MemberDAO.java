package member.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.bean.MemberDTO;

public class MemberDAO {
	// 인터페이스라서 new 가 안되닌까 메소드를 이용해서 메모리 할당하려고
	private SqlSessionFactory sqlSessionFactory; //
	//팩토리가 있어야 sql session 을 만들수 있다.
	
	private static MemberDAO memberDAO = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return memberDAO;
	}
	

	
	
	public MemberDAO() { //생성자 만들자
		// 환경설정 파일 (mybatis-config.xml)을 읽어온다.
		
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml"); //mybatis-config.xml 를 읽어와라!
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			//DB에 접속한 정보들
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	public int memberWrite(MemberDTO memberDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();//생성
	
		int su = sqlSession.insert("memberSQL.memberWrite", memberDTO);
		//memberDTO 데이터를 가지고  userSQL.memberWrite 를 실행시켜랏
		sqlSession.commit(); //commit 은 insert, update, delete만 쓴다
		sqlSession.close();
		
		return su; // 회원가입 성공 여부를 판단하기 위해 return 값을 받아서 활용
	}


	public MemberDTO memberLogin(String id, String pwd) {
		Map<String, String> map = new HashMap<String, String>();
		//Map<키 값, 입력 값>
		map.put("id", id);
		map.put("pwd", pwd);

		
		SqlSession sqlSession = sqlSessionFactory.openSession();//생성
		
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.memberLogin", map);
		/*기존의 만들어진 메소드는 인수가 id, pwd 두개인데 selectOne 은 값을 1개만 받을수만 있어서
		 id 와 pwd 두 데이터를 하나로 가공하기 위하여 Mapper 를 진행 한다.
		 map.put("id", id); 앞은 키값 = 데이터의 이름, 뒤는 키값의 데이터(value)
		 */
		sqlSession.close();

			return memberDTO;
	}
	
	public boolean isExistId(String id) {
		boolean exist = false;
		SqlSession sqlSession = sqlSessionFactory.openSession();//생성
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.isExistId", id);
		//1인분 형태를 넣기 위해 DTO 를 가져와서 사용 selectOne 행이 하나일때 
		
		if(memberDTO != null)  // memberDTO 가 null이 아니면 값이 안에 있으므로 true 가 된다.
			exist = true; 
		
		sqlSession.close(); //DB연결 끊고
		
		return exist; //CheckID 로 가서 exit 값 실행
			
	}



	public MemberDTO updateForm(String id) {		
		SqlSession sqlSession = sqlSessionFactory.openSession();//생성
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.updateForm", id);
		
		sqlSession.close(); //DB연결 끊고
		
		return memberDTO;
	}




	public void update(MemberDTO memberDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();//생성
		
		sqlSession.update("memberSQL.update", memberDTO);
		//memberDTO 데이터를 가지고  userSQL.memberWrite 를 실행시켜랏
		sqlSession.commit(); //commit 은 insert, update, delete만 쓴다
		sqlSession.close();
	
	}





}
