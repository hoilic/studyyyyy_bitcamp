package student.dao_221005; //강사님 문제풀이

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class Student_teacher {
	private Connection conn;
	private PreparedStatement pstmt;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "bit";
	private ResultSet rs;
	
	
	public Student_teacher() {//생성자!
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} //생성 기능
	}//Student_teacher
	public void getConnection() {
		try {
			conn = DriverManager.getConnection( url, username,password ); 
		} catch (SQLException e) {		
			e.printStackTrace();
		} 		
	}//getConnection
	
	public void menu() {
		Scanner scan = new Scanner(System.in);
		int num;
		
		while(true) {
			System.out.println("***************");
			System.out.println("       관리      ");
			System.out.println("***************");
			System.out.println("   1. 입력 ");
			System.out.println("   2. 검색 ");
			System.out.println("   3. 삭제 ");
			System.out.println("   4. 종료 ");
			System.out.println("***************");
			System.out.print("   번호입력 :   ");
			num = scan.nextInt();
			if(num == 4 ) break;
			
			if(num ==1) insertArticle();
			if(num == 2) selectArticle();
			if(num == 3) deleteArticle();
		}//while
	}//menu
	
	public void insertArticle() {
		Scanner scan = new Scanner(System.in);
		int num;
		while(true) {
			System.out.println("***************");
			System.out.println("   1. 학생 ");
			System.out.println("   2. 교수 ");
			System.out.println("   3. 관리자 ");
			System.out.println("   4. 이전메뉴 ");
			System.out.println("***************");
			System.out.print("   번호선택 :   ");
			num = scan.nextInt();
			if(num == 4 ) break; //retrun 해도 됩니다
			
			System.out.print("이름 입력 : ");//이름은 공통이라 if 위로 빼놓음
			String name = scan.next();	
			String value = null; //지역변수 이기에 초기값을 잡아줘야 오래 살수 있다.
			
			if(num ==1) {//학생
				System.out.print("학번 입력 : ");
				 value = scan.next();			
			}
			else if(num == 2) {//교수
				System.out.print("과목 입력 : ");
				 value = scan.next();						
			}
			else if(num == 3) {//관리자
				System.out.print("부서 입력 : ");
				 value = scan.next();		
			}
			
			//DB - insert 접속
			getConnection();//접속
			
			String sql = "insert into student values(?,?,?)";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, value);
				pstmt.setInt(3, num);
				
				int su = pstmt.executeUpdate();//실행 - 개수 리턴
				System.out.println(su + "개의 행 이(가) 삽입되었습니다.");

			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {//
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}	//	finally	
			
			
			
		}//while
		
	}//insertArticle
	
	public void selectArticle() {
		Scanner scan = new Scanner(System.in);
		int num;
		while(true) {
			System.out.println();
			System.out.println("***************");
			System.out.println("   1. 이름 검색 ");
			System.out.println("   2. 전체 검색 ");
			System.out.println("   3. 이전 메뉴 ");
			System.out.println("***************");
			System.out.print("   번호입력 :   ");
			num = scan.nextInt();
			if(num == 3 ) break;
			
			String name = null;
			if(num ==1) {
				System.out.println("검색할 이름 입력 : ");
				name = scan.next();				
			}
			
			//DB - select
			getConnection();//접속
			
			String sql = null;
			if(num ==1)
				sql = "select * from student where name like ?";
			else
				sql = "select * from student";
			try {
				 pstmt = conn.prepareStatement(sql);
				 if(num ==1)pstmt.setString(1, "%"+name+"%");	
				 
				 rs = pstmt.executeQuery();//실행 - ResultSet 리턴
				 
				 while(rs.next()) {
					 System.out.println("이름 = " + "\t" + rs.getString("name"));
					 if(rs.getInt("code") == 1)
						 System.out.println("학번 = " +"\t"+ rs.getString("value"));
					 
					 else if(rs.getInt("code") == 2)
						 System.out.println("과목 = " +"\t"+ rs.getString("value"));
					 
					 else if(rs.getInt("code") == 3)
						 System.out.println("부서 = " +"\t"+ rs.getString("value"));					 
				 }//while

			} catch (SQLException e) {			
				e.printStackTrace();
			}finally {
	            try {
	                if(rs != null)rs.close();
	                if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
	             } catch (SQLException e) {
	                e.printStackTrace();
	             }
	          }//finally			
		}//while	
	}//selectArticle
	
	public void deleteArticle() {
		Scanner scan = new Scanner(System.in);
		
		System.out.println();
		System.out.println("삭제할 이름 입력 : ");
		String name = scan.next();
		
		//DB - delete
		getConnection();//접속
		String sql = "delete student where name = ?"; //delete 는 절대로 like 사용금지
		try {
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, name);
			 int su = pstmt.executeUpdate();//실행 - 개수 리턴
			 System.out.println(su + "개의 행 이(가) 삽입되었습니다.");

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
		
	}//deleteArticle

	
	public static void main(String[] args) {
		Student_teacher student_teacher = new Student_teacher();
		student_teacher.menu();
		System.out.println("프로그램을 종료합니다.");
		

		
	}// void main 은 보통 클래스위 맨 앞 or 맨 뒤!
}
