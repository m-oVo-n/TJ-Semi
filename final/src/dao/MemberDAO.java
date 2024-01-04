package dao;
import java.sql.*;

public class MemberDAO {
	String url = "jdbc:mysql://localhost:3306/yata?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	String user = "root";
	String pw = "mysql";
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	// 연결
	private Connection openConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pw);
			System.out.println("커넥션 생성");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	// 해제
	public void closeConnection(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(rs != null) {
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 회원가입
	public int join(dto.Member member) {
		String sql = "insert into Member values(?,?,?,?,?,?,?)";
		openConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMember_id());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getBirth());
			pstmt.setString(5, member.getGender());
			pstmt.setString(6, member.getPhone_number());
			pstmt.setString(7, member.getEmail());
			
			return pstmt.executeUpdate(); // 회원가입 성공
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(conn, pstmt, rs);
		}
		return 0; // 이미 존재하는 회원
	}
	
	// 로그인
	public int login(String id, String pw) {
		String sql = "select password from Member where member_id = ?";
		openConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(pw)) {
					return 1;
				} else {
					return 0; // 비밀번호 불일치
				}
			} else {return -1;} // 존재하지 않는 회원
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(conn, pstmt, rs);
		}
		return -2; // 데이터베이스 오류
	}
	
	// 회원탈퇴
	public int withdrawal(String id, String pw) {
		String sql = "delete from Member where member_id = ? and password = ?";
		openConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(conn, pstmt, rs);
		}
		return 0; // 비밀번호가 다름
	}
	// 아이디찾기(이름, 이메일)
	public String findIdE(String name, String email) {
		String sql = "select member_id from Member where name = ? and email = ?";
		openConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1); // 찾은 아이디 반환
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(conn, pstmt, rs);
		}
		return "이름, 이메일에 맞는 회원 아이디 없음";
	}
	
	// 아이디찾기(이름, 전화번호)
	public String findIdP(String name, String phone) {
		String sql = "select member_id from Member where name = ? and phone_number = ?";
		openConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1); // 찾은 아이디 반환
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(conn, pstmt, rs);
		}
		return "이름, 전화번호에 맞는 회원 아이디 없음";
	}
	
	// 비밀번호찾기(아이디, 전화번호)
	public String findPwP(String id, String phone) {
		String sql = "select password from Member where member_id = ? and phone_number = ?";
		openConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, phone);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1); // 찾은 비밀번호 반환
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(conn, pstmt, rs);
		}
		return "이름, 전화번호에 맞는 회원 비밀번호 없음";
	}
	
	
	public String findPwE(String id, String email) {
		String sql = "select password from Member where member_id = ? and email = ?";
		openConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, pstmt, rs);
		}
		return "이름, 이메일에 맞는 회원 비밀번호 없음";
	}
	
	// 회원조회
	public dto.Member search(String id){
		String sql = "select * from Member where member_id = ?";
		openConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.Member member = new dto.Member();
				member.setMember_id(rs.getString(1));
				member.setPassword(rs.getString(2));
				member.setName(rs.getString(3));
				member.setBirth(rs.getString(4));
				member.setGender(rs.getString(5));
				member.setPhone_number(rs.getString(6));
				member.setEmail(rs.getString(7));
				
				return member; // member객체에 정보 다 담아서 전달
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(conn, pstmt, rs);
		}

		return null; // member 찾을 수 없음
	}
	
	// 회원정보수정
	public int update(dto.Member member) {
		String sql = "update Member set name = ?, birth = ?,  phone_number = ?, email = ? where member_id = ?";
		openConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getBirth());
			pstmt.setString(3, member.getPhone_number());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getMember_id());
			
			return pstmt.executeUpdate(); // 성공적으로 수정 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(conn, pstmt, rs);
		}
		return 0; // 수정 실패
	}
	
	//비밀번호 변경
	public int changePw(String id, String originPw, String changePw) {
		String sql = "update Member set password=? where member_id = ? and password=?";
		
		openConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, changePw);
			pstmt.setString(2, id);
			pstmt.setString(3, originPw);
			
			pstmt.executeUpdate();
			
			return 1;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, pstmt, rs);
		}
		return 0;
	}
	
	// 포인트 생성
		public int createPoint(String id) {
			String sql = "insert into Point values(?,0,now())";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				
				return pstmt.executeUpdate();
			} catch (Exception e){
				e.printStackTrace();
			} finally {
				closeConnection(conn, pstmt, rs);
			}
			return 0; // 실패
		}
}
