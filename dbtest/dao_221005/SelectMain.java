package dbtest.dao_221005;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SelectMain {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "bit";
	
	public SelectMain() {//기본생성자
		try {
			Class.forName(driver); //생성
			System.out.println("driver loading success");
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
	public void selectArticle() {
		String sql = "select * from dbtest";
		
		getConnection();//접속
		
		try {
			pstmt = conn.prepareStatement(sql);//생성
			rs= pstmt.executeQuery(); //ResultSet 리턴
			System.out.println(rs);
			
			/*
			 rs의 크기를 구해오는 함수가 없다.
			 rs.next() - 현재 위치에 항목이 있으면 T, 없으면 F
			 rs.getString("name")/rs.getString(1)
			 
			 */
			
			while(rs.next()) {
				System.out.println(rs.getString("name") + "\t"
								+ rs.getInt("age") + "\t" 
								+ rs.getDouble("height") + "\t" 
								+ rs.getString("logtime") + "\t" 
								);
			}//while
	
					
		} catch(SQLException e) {		
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
			
		
	}

	public static void main(String[] args) {
		SelectMain selectMain = new SelectMain();
		selectMain.selectArticle(); 

	}

}
