package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.management.loading.PrivateClassLoader;

import member.bean.MemberDTO;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "bit";
	
	private static MemberDAO memberDAO = new MemberDAO(); 
	public static MemberDAO getInstance() {
		return memberDAO;
	}
	

	public MemberDAO() { // 컨트롤 + 스페이스바 로 생성자 생성
		try {
			Class.forName(driver); //생성
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}		
	}
	public void getConnection() {
		try {
			conn = DriverManager.getConnection( url, username,password ); 
		} catch (SQLException e) {		
			e.printStackTrace();
		} 		
	}


	public int memberWrite(MemberDTO memberDTO) {
		int su =0; //지역변수라서 초기값 주는거다 초기화를 안해주면 오류가 난다. 초기화 안해주면 쓰레기 값을 가지고 있기 때문에
		String sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
		
		getConnection(); //접속
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			//DB 에서 sql 문 실행하기 직전까지 담아두는 역할
			
			pstmt.setString(1, memberDTO.getName());
			pstmt.setString(2, memberDTO.getId());
			pstmt.setString(3, memberDTO.getPwd());
			pstmt.setString(4, memberDTO.getGender());
			pstmt.setString(5, memberDTO.getEmail1());
			pstmt.setString(6, memberDTO.getEmail2());
			pstmt.setString(7, memberDTO.getTel1());
			pstmt.setString(8, memberDTO.getTel2());
			pstmt.setString(9, memberDTO.getTel3());
			pstmt.setString(10, memberDTO.getZipcode());
			pstmt.setString(11, memberDTO.getAddr1());
			pstmt.setString(12, memberDTO.getAddr2());
			
			su = pstmt.executeUpdate();	
			//executeUpdate 가 SQL 에서 ctrl+Enter
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally { //DB 가 연결이 안되어 있을 경우 서버와의 연결을 끊으면 안되닌까 오류방지용 으로 실행
			try {
				if(pstmt !=null) pstmt.close(); // 내용이 없지 않으면, 즉 내용이 있으면 끊어라
				if(conn !=null) conn.close(); // 할일이 다끝나면 끊어라는 뜻
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return su; // 끝날때 메소드 종료되면 메모리가 전부 삭제 되는데 return 은 받은값은 들고나와라 라는 말이다
	}


	public String memberLogin(String id, String pwd) {
		String name = null;
		String sql = "select * from member where id=? and pwd=?";
		// id 와 pwd 가 일치한 이용자가 DB table 에 있는지 보려고
		
		getConnection(); //접속
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  id);
			pstmt.setString(2,  pwd);
			
			rs=pstmt.executeQuery();//실행 - ResultSet 리턴
			
			if(rs.next())name = rs.getString(name);
			// 아무것도 없을때는 false 이기 때문에 가져올것이 없다.
			// 입력 값이 하나라도 있으면 rs.getString(name)실행이 된다.
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(pstmt !=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return name;
	}

}
