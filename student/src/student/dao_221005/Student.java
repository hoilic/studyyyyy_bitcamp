package student.dao_221005;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class Student {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "bit";
	
	Scanner scan = new Scanner(System.in);
	
	public Student() {
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
	public void menu() {
		while(true){				
			System.out.println("***************");
			System.out.println("       관리      ");
			System.out.println("***************");
			System.out.println("   1. 입력 ");
			System.out.println("   2. 검색 ");
			System.out.println("   3. 삭제 ");
			System.out.println("   4. 종료 ");
			System.out.println("***************");
			System.out.println("   번호선택 :   ");
			int menuNum = scan.nextInt();
			
			if(menuNum == 4) break;
			
			if(menuNum == 1) insertArticle();
			if(menuNum == 2 ) selectArticle();
			if(menuNum == 3 ) deleteArticle();
			
		}//while
		
	}
	public void insertArticle() {
		
		System.out.println("***************");
		System.out.println("   1. 학생 ");
		System.out.println("   2. 교수 ");
		System.out.println("   3. 관리자 ");
		System.out.println("   4. 이전메뉴 ");
		System.out.println("***************");
		System.out.println("   번호선택 :   ");
		int insertNum = scan.nextInt();
		String name = null;
		String value = null;
		int code = 1;
	
		//지역변수는 초기화 시켜주라고
		
		if(insertNum == 4) return;
		
		getConnection();//접속
		
		if(insertNum == 1) {
			System.out.println("1번 학생인 경우 ");
			System.out.println("이름입력 : ");
			name = scan.next();
			System.out.println("학번입력 : ");
			value = scan.next();
			
		}
		if(insertNum == 2) {
			System.out.println("2번 학생인 경우 ");
			System.out.println("이름입력 : ");
			name = scan.next();
			System.out.println("과목입력 : ");
			value = scan.next();
			
		}
		if(insertNum == 3) {
			System.out.println("3번 학생인 경우 ");
			System.out.println("이름입력 : ");
			name = scan.next();
			System.out.println("부서입력 : ");
			value = scan.next();
			
		}
		try {
			 pstmt = conn.prepareStatement(
					"insert into student values(?, ?, ?)");
			 // 명령어 셋팅
			 pstmt.setString(1,name);
			 pstmt.setString(2,value);
			 pstmt.setInt(3,code);
			 int su = pstmt.executeUpdate();//실행 - 개수 리턴
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		finally {
			try {//
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	
	}//insert
	
	public void selectArticle() {
		System.out.println("***************");
		System.out.println("   1. 이름검색 ");
		System.out.println("   2. 전체 검색 ");
		System.out.println("   3. 이전메뉴 ");
		System.out.println("***************");
		System.out.println("   번호선택 :   ");
		
		int selectNum = scan.nextInt();
		String sql1 = "select*from student where name like ?";
		String sql2 = "select*from student";
		String name = null;
		String value = null;
	
		//지역변수는 초기화 시켜주라고
		if(selectNum == 3) return;
		
		getConnection();//접속
		if(selectNum == 1) {
			System.out.println("이름검색 : ");
			name = scan.next();			
		}
		try {
			 pstmt = conn.prepareStatement(sql1);
			 pstmt.setString(1, "%"+name+"%");	
			 
			 int su = pstmt.executeUpdate();//실행 - 개수 리턴

		} catch (SQLException e) {			
			e.printStackTrace();
		}
		
		
		if(selectNum == 2) 
		try {
			 pstmt = conn.prepareStatement(sql2);

		} catch (SQLException e) {			
			e.printStackTrace();
		}
		try {
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
               System.out.println(rs.getString("name") + "\t"
                            + rs.getString("value") + "\t"
                            + rs.getInt("code"));
            }
         } catch (SQLException e) {
            e.printStackTrace();
         }finally {
            try {
               if(rs != null)rs.close();
            } catch (SQLException e) {
               e.printStackTrace();
               }
         }
      }//select
	
	
	public void deleteArticle() {
		System.out.println("삭제를 원하는 이름 입력 : ");
		String name = scan.next();
		
		String sql3 = "delete student where name = ?";
		getConnection();//접속
		
		try {
			 pstmt = conn.prepareStatement(sql3);
			 pstmt.setString(1, name);
			 int su = pstmt.executeUpdate();//실행 - 개수 리턴

		} catch (SQLException e) {			
			e.printStackTrace();
		}	finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
	}//delete	
	
	public static void main(String[] args) {
		Student student = new Student();
		student.menu();
		System.out.println("프로그램을 종료합니다.");
	}

}
