package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
		int su =0;
		String sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
		
		getConnection(); //접속
		
		
		try {
			pstmt = conn.prepareStatement(sql);
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
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(pstmt !=null) pstmt.close();
				if(pstmt !=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return su;
	}


	public String memberLogin(String id, String pwd) {
		String name = null;
		String sql = "select * from member where id=? and pwd=?";
		
		getConnection(); //접속
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  id);
			pstmt.setString(2,  pwd);
			
			rs=pstmt.executeQuery();//실행 - ResultSet 리턴
			
			if(rs.next())name = rs.getString(name);
			
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
	
	public boolean isExistId(String id) {
		boolean exist = false;
		String sql = "select * from member where id=? ";
		getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  id);
			
			rs=pstmt.executeQuery();//실행 - ResultSet 리턴
			
			if(rs.next())exist = true;
//			else exist = false;
			
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
		return exist; 
		
		
	}

}
