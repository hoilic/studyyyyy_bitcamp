package dbtest.dao_221005;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class InsertMain {
	
	private Connection conn;
	private PreparedStatement pstmt;
	
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "bit";
	
	public InsertMain(){
		//driver loading
	
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
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
				System.out.println("connection success");
		} catch (SQLException e) {
		
			e.printStackTrace();
		} 
		
	}
	public void insertArticle() {
		//접속
		//데이터
		Scanner scan = new Scanner(System.in);
		System.out.print("이름 입력 : ");
		String name = scan.next();
		System.out.print("나이 입력 : ");
		int age = scan.nextInt();
		System.out.print("키 입력 : ");
		double height = scan.nextDouble();
		
		this.getConnection();
		
		try {
			 pstmt = conn.prepareStatement(
					"insert into dbtest values(?, ?, ?, sysdate)");
			 pstmt.setString(1,name);
			 pstmt.setInt(2,age);
			 pstmt.setDouble(3,height);
			int su = pstmt.executeUpdate();
			System.out.println(su+"개의 행 이(가) 삽입되었습니다.");
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) {
		InsertMain insertMain = new InsertMain();
		insertMain.insertArticle();
	}

}
