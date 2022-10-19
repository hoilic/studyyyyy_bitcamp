package dbtest.dao_221005;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class UpdateMain {
	private Connection conn;
	private PreparedStatement pstmt;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "bit";
	
	public UpdateMain(){ // ctrl+ space -> 생성자 생성
		//driver loading	
		
		try {
			Class.forName(driver); //생성
			// class 명으로 forname 으로 바로 접근했으므로 static 이다. 
			// new 없이 접근하면 static 이다.
			System.out.println("driver loading success");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
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
	public void updateArticle() {
		//접속
		//데이터
		Scanner scan = new Scanner(System.in);
		System.out.println("수정 할 이름 입력 : ");
		String name = scan.next();
				
		this.getConnection();
		
		String sql = "update dbtest set age=age+1, height=height+1 where name like ?";
		
		try {
			 pstmt = conn.prepareStatement(sql);			
			 pstmt.setString(1, "%"+name+"%");			
			 
			int su = pstmt.executeUpdate();//실행 - 개수 리턴
			System.out.println(su+"개의 행 이(가) 수정 되었습니다.");
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public static void main(String[] args) {
		UpdateMain updateMain = new UpdateMain();
		updateMain.updateArticle();
	}

}
