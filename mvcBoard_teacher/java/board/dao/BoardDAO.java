package board.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;

public class BoardDAO {
	// 인터페이스라서 new 가 안되닌까 메소드를 이용해서 메모리 할당하려고
		private SqlSessionFactory sqlSessionFactory; //
		//팩토리가 있어야 sql session 을 만들수 있다.
		
		private static BoardDAO boardDAO = new BoardDAO();
		
		public static BoardDAO getInstance() {
			return boardDAO;
		}
		
	public BoardDAO() {//생성자 만들자
		// 환경설정 파일 (mybatis-config.xml)을 읽어온다.
		
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml"); //mybatis-config.xml 를 읽어와라!
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			//DB에 접속한 정보들
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}//BoardDAO
	
	public void boardWrite(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();//생성
	
		sqlSession.insert("boardSQL.boardWrite", map);
		//int su 는 1 아니면 0 왜냐면 한행 씩 제목, 내용을 쓰닌까 1행 은 1 입력 안하면 0
		//boardDTO 데이터를 가지고  userSQL.memberWrite 를 실행시켜랏
		sqlSession.commit(); //commit 은 insert, update, delete만 쓴다
		sqlSession.close();	
		
	}
	
	public List<BoardDTO> boardList(Map<String, Integer> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();//생성
	
		List<BoardDTO> list = sqlSession.selectList("boardSQL.boardList", map);

		//boardDTO 데이터를 가지고  boardSQL.boardList 를 실행시켜랏
		
		sqlSession.close();	
		
		return list;
	}
	
	public int getTotalA() {
		SqlSession sqlSession = sqlSessionFactory.openSession();//생성
		int totalA = sqlSession.selectOne("boardSQL.getTotalA");
		
		return totalA;
	}

	
} // class BoardDAO 
