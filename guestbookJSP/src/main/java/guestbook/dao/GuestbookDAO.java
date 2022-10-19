package guestbook.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import guestbook.bean.GuestbookDTO;


public class GuestbookDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "bit";
	
	private static GuestbookDAO guestbookDAO = new GuestbookDAO(); 
	//딱 한번 new 하고 guestbookDAO 생성 static 이기 때문에 1번만 실행된다.
	public static GuestbookDAO getInstance() {
		System.out.println("getInstance()");
		return guestbookDAO;	
	}
	
	public GuestbookDAO() {
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
	
	public void guestWrite(GuestbookDTO guestbookDTO) {
//		int su =0;
		String sql = "insert into guestbook values(seq_guestbook.nextval ,?, ?, ?, ?, ?, sysdate)";
//		"select * from guestbook where name=? and email=? and homepage=? and subject=? and content=?";
		getConnection(); //접속
		
		try {
			pstmt = conn.prepareStatement(sql); //생성
			
			pstmt.setString(1, guestbookDTO.getName());
			pstmt.setString(2, guestbookDTO.getEmail());
			pstmt.setString(3, guestbookDTO.getHomepage());
			pstmt.setString(4, guestbookDTO.getSubject());
			pstmt.setString(5, guestbookDTO.getContent());
			
//			su = pstmt.executeUpdate();	//실행
			pstmt.executeUpdate();	//실행
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
//				if(rs != null)rs.close();
				if(pstmt !=null) pstmt.close();
				if(pstmt !=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
//		return su;
	
	}
	
	public ArrayList <GuestbookDTO> GuestList(Map<String, Integer> map) {
		
		ArrayList<GuestbookDTO> guestList = new ArrayList<GuestbookDTO>();
		String sql = "select * from "
				+ " (select rownum rn, tt.* from "
				+ " (select name, email, homepage, subject, content, to_char(logtime, 'YYYY.MM.DD') as logtime "
				+ " from guestbook order by seq desc) tt) "
				+ " where rn>=? and rn<=? ";
		

		getConnection(); //접속
		
		try {
			
			pstmt = conn.prepareStatement(sql); //생성
			pstmt.setInt(1, map.get("startNum"));
			pstmt.setInt(2, map.get("endNum"));
			rs = pstmt.executeQuery();	
			
//			GuestbookDTO guestbookDTO = null;
			
			while(rs.next()){
				GuestbookDTO dto = new GuestbookDTO();	
				
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setHomepage(rs.getString("homepage"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setLogtime(rs.getString("logtime"));
				
				guestList.add(dto);
				
			}
			  
		} catch (SQLException e) {
	
			// TODO Auto-generated catch block
			e.printStackTrace();
			guestList = null;
		}
		finally {
			try {
				if(rs != null)rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return guestList;
	
	}
	public int getTotalA() {
		int totalA = 0;
		String sql = "select count(*) from guestbook";
		
		getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();//실행
			
			rs.next();
			totalA = rs.getInt(1);
					
					
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				if(rs != null)rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return totalA;
		
	}
	
	
}