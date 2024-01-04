package dao;

import java.sql.Connection;
import java.util.Date;

import dto.*;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PayDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// 연결
	public Connection openConnection() {
		try {
			String url = "jdbc:mysql://localhost:3306/yata?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
			String user = "root";
			String pw = "mysql";
			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection(url, user, pw);
			System.out.println("커넥션 생성");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}

	// 해제
	public void closeConnection(Connection conn) {
		try {
			if(conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 교통 저장
	public int insertTrans(Connection conn, Transportation trans) {
		String sql = "insert into Transportation(departure_station, arrival_station, transportation_type, transportation_number) values(?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, trans.getDeparture_station());
			pstmt.setString(2, trans.getArrival_station());
			pstmt.setString(3, trans.getTransportation_type());
			pstmt.setString(4, trans.getTransportation_number());

			System.out.println("교통 저장 전");
			return pstmt.executeUpdate(); // transportation에 정보 저장

		} catch (Exception e) {
			e.printStackTrace();
			try {
				if(conn != null) {
					conn.rollback();
				}
			} catch (Exception e2) {}
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {}
		}

		return 0; // 실패
	}
	// 스케줄 저장
	public int insertSchedule(Connection conn, Schedule schedule) {
		String sql = "insert into Schedule(departure_time, arrival_time, total_time) values(?,?,?)";
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, schedule.getDeparture_time());
			pstmt.setString(2, schedule.getArrival_time());
			pstmt.setString(3, schedule.getTotal_time());

			System.out.println("저장 전");
			return pstmt.executeUpdate(); // schedule에 정보 저장
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {}
		}
		return 0; // 실
	}
	// 좌석 1-30 만들기
	public int insertSeat(Connection conn, Transportation trans, Schedule schedule) {
		String sql = "insert into Seat(transport_id, schedule_id, seat_number, is_available, seatClass) values(?,?,?,?,?)";

		try {

			pstmt = conn.prepareStatement(sql);

			if(trans.getTransportation_type().contains("KTX")) { // ktx일때는 특실 좌석 만들어야함
				for(int i = 1; i <= 30; i++) {
					pstmt.setInt(1, trans.getTransport_id());
					pstmt.setInt(2, schedule.getSchedule_id());
					pstmt.setInt(3, i);
					pstmt.setInt(4, 1);
					if(i%3 == 0 && i != 1) {
						pstmt.setString(5, "special"); // 3의 배수는 우등석
					} else {
						pstmt.setString(5, "normal"); // 나머지는 일반석
					}
					pstmt.executeUpdate();
				}
				System.out.println("좌석넣기 완");
				return 1;
			} else {
				for(int i = 1; i <= 30; i++) {
					pstmt.setInt(1, trans.getTransport_id());
					pstmt.setInt(2, schedule.getSchedule_id());
					pstmt.setInt(3, i);
					pstmt.setInt(4, 1);
					pstmt.setString(5, "normal"); // ktx 아닐경우 다 일반석

					pstmt.executeUpdate();
				}
				System.out.println("좌석넣기 완");
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {}
		}
		return 0; // 실패

	}
	// transport_id 가져오기
	public int getTransId(Connection conn, Transportation trans) {
		try {
			pstmt = conn.prepareStatement("select transport_id from Transportation where departure_station = ? and arrival_station = ? and transportation_type = ? and transportation_number = ?");
			pstmt.setString(1, trans.getDeparture_station());
			pstmt.setString(2, trans.getArrival_station());
			pstmt.setString(3, trans.getTransportation_type());
			pstmt.setString(4, trans.getTransportation_number());

			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("교통 아이디");
				return rs.getInt(1); // 얻어오기
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {}
		}
		return 0; // transId 실패
	}

	// schedule_id 가져오기
	public int getScheduleId(Connection conn, Schedule schedule) {
		try {
			pstmt = conn.prepareStatement("select schedule_id from Schedule where departure_time = ? and arrival_time = ?");
			pstmt.setString(1, schedule.getDeparture_time());
			pstmt.setString(2, schedule.getArrival_time());

			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("교통 아이디, 타입 얻기");
				return rs.getInt(1); // schedule_id 얻어오기
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {}
		}
		return 0; // transId 실패
	}

	// 선택 가능 좌석 보여주기
	public ArrayList<Seat> showAvailableSeat(Connection conn, Transportation trans, Schedule schedule) {
		String sql = "select seat_id, seat_number, is_available from Seat where transport_id = ? and schedule_id = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, trans.getTransport_id());
			pstmt.setInt(2, schedule.getSchedule_id());

			rs = pstmt.executeQuery();
			ArrayList<Seat> seatList = new ArrayList<Seat>();
			while(rs.next()) { // 선택 가능한 좌석갯수만큼
				Seat seat = new Seat();
				seat.setSeat_id(rs.getInt("seat_id"));
				seat.setSeat_number(rs.getInt("seat_number"));
				seat.setIs_available(rs.getBoolean("is_available"));
				seatList.add(seat);
			}
			return seatList;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {}
		}
		return null; // 실패
	}

	// 좌석 남은 갯수 구하기
	public int restSeat(Connection conn, Transportation trans, Schedule schedule) {
		String sql = "select count(*) from Seat where transport_id = ? and schedule_id = ? and is_available = 1";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, trans.getTransport_id());
			pstmt.setInt(2, schedule.getSchedule_id());

			rs = pstmt.executeQuery();
			while(rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {}
		}
		return 0; // 실패
	}

	// 좌석 선택 후 available false 변환
	public int seatUpdate(Connection conn, Seat seat) {
		String sql = "UPDATE Seat SET is_available = 0 WHERE seat_id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seat.getSeat_id());

			pstmt.executeUpdate();
			System.out.println("false 변환 완");
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {}
		}

		return 0; // 실패
	}

	// 티켓 생성
	public int insertTicket(Connection conn, Seat seat, Ticket ticket) {
		String sql = "insert into Ticket(seat_id, payment_status, price, age) values(?,?,?,?)";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seat.getSeat_id());
			pstmt.setString(2, "결제전");
			pstmt.setInt(3, ticket.getPrice());
			pstmt.setString(4, ticket.getAge());
			pstmt.executeUpdate();
			System.out.println("티켓 생성 완");
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {}
		}

		return 0; //실패
	}
	// 결제 생성
	public int insertPay(Connection conn, Payment pay) {
		String sql = "insert into Payment(member_id, quantity, payment_date, payment_method, points_earned, points_used, total_price) values(?,?,now(),?,?,?,?)";
		try {

			pstmt = conn.prepareStatement(sql); // 결제 저장
			pstmt.setString(1, pay.getMember_id());
			pstmt.setInt(2, pay.getQuantity());
			pstmt.setString(3, pay.getPayment_method());
			pstmt.setInt(4, pay.getPoints_earned());
			pstmt.setInt(5, pay.getPoints_used());
			pstmt.setInt(6, pay.getTotal_price());

			System.out.println("결제 생성 전");
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {}
		}
		return 0; // 실패
	}
	// 포인트 사용시 변환
	public int updatePoint(Connection conn, Payment pay, Point point) {
		String sql = "update Point set point = ?, update_date = now() where member_id = ?";
		try {

			pstmt = conn.prepareStatement(sql); // 포인트 변경
			pstmt.setInt(1, point.getPoint() + pay.getPoints_earned() - pay.getPoints_used());
			pstmt.setString(2, pay.getMember_id());

			System.out.println("포인트 변환 전");
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {}
		}
		return 0; // 실패
	}
	// 결제 취소시 포인트 반환
	public int deletePayPoint(Connection conn, Payment pay, Point point, String memberId) {
		String sql = "update Point set point = ?, update_date = now() where member_id = ?";
		try {

			pstmt = conn.prepareStatement(sql); // 포인트 변경
			pstmt.setInt(1, point.getPoint() - pay.getPoints_earned() + pay.getPoints_used());
			pstmt.setString(2, memberId);

			System.out.println("포인트 변환 전");
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {}
		}
		return 0; // 실패
	}
	// 결제 취소시 포인트 얻은거랑 쓴거 얻어내기
	public Payment getUsePointAndgetPoint(Connection conn, int payId) {
		String sql = "select points_earned, points_used from Payment where payment_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, payId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Payment pay = new Payment();
				pay.setPoints_earned(rs.getInt("points_earned"));
				System.out.println(pay.getPoints_earned());
				pay.setPoints_used(rs.getInt("points_used"));
				System.out.println(pay.getPoints_used());
				return pay;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {}
		}
		return null; // 실패
	}
	// 티켓 변환
	public int updateTicket(Connection conn, Payment pay, Seat seat) {
		String sql = "UPDATE Ticket SET payment_id = ?, payment_status = '결제완료' WHERE seat_id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pay.getPayment_id());
			pstmt.setInt(2, seat.getSeat_id());

			pstmt.executeUpdate();
			System.out.println("티켓 변환 완");
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {}
		}

		return 0; // 실패
	}


	// 결제 취소
	public int deletePay(Connection conn, int paymentId) {
		String sql = "delete from Payment where payment_id = ?";
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paymentId);

			System.out.println("취소 전");
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {}
		}
		return 0; // 실
	}

	// 결제 번호 찾기
	public int getPayId(Connection conn, String member_id) {
		String selectPaySql = "select payment_id from Payment where member_id = ? order by payment_date desc limit 1";
		try {
			pstmt = conn.prepareStatement(selectPaySql); // 결제 번호 찾기
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {}
		}
		return -1; // 실패
	}

	// 예매 내역 보기 (아이디, 오늘날짜)
	public ArrayList<ShowReservation> reservation(String id) {
		String sql = "select * from reservation_view where member_id = ? and departure_time >= now() order by departure_time desc";
		ArrayList<ShowReservation> reserveList = new ArrayList<ShowReservation>();
		openConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ShowReservation showReservation = new ShowReservation();
				showReservation.setDeparture_time(rs.getString("departure_time"));
				showReservation.setArrival_time(rs.getString("arrival_time"));
				showReservation.setTotal_time(rs.getString("total_time"));
				showReservation.setSeat_number(rs.getInt("seat_number"));
				showReservation.setDeparture_station(rs.getString("departure_station"));
				showReservation.setArrival_station(rs.getString("arrival_station"));
				showReservation.setTransportation_type(rs.getString("transportation_type"));
				showReservation.setTransportation_number(rs.getString("transportation_number"));
				showReservation.setPayment_id(rs.getInt("payment_id"));
				showReservation.setQuantity(rs.getInt("quantity"));
				showReservation.setPayment_date(rs.getString("payment_date"));
				showReservation.setTotal_price(rs.getInt("total_price"));
				showReservation.setAge(rs.getString("age"));

				reserveList.add(showReservation);
			}
			return reserveList;
		} catch (Exception e) {
			e.printStackTrace();
		}  finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {}
		}
		return null; // 실패
	}
	// 지난 예매 보기 (아이디, 오늘날짜)
	public ArrayList<ShowReservation> lastReservation(String id) {
		String sql = "select * from reservation_view where member_id = ? and departure_time < now() order by departure_time desc";
		ArrayList<ShowReservation> reserveList = new ArrayList<ShowReservation>();
		openConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ShowReservation showReservation = new ShowReservation();
				showReservation.setDeparture_time(rs.getString("departure_time"));
				showReservation.setArrival_time(rs.getString("arrival_time"));
				showReservation.setTotal_time(rs.getString("total_time"));
				showReservation.setSeat_number(rs.getInt("seat_number"));
				showReservation.setDeparture_station(rs.getString("departure_station"));
				showReservation.setArrival_station(rs.getString("arrival_station"));
				showReservation.setTransportation_type(rs.getString("transportation_type"));
				showReservation.setTransportation_number(rs.getString("transportation_number"));
				showReservation.setPayment_id(rs.getInt("payment_id"));
				showReservation.setQuantity(rs.getInt("quantity"));
				showReservation.setPayment_date(rs.getString("payment_date"));
				showReservation.setTotal_price(rs.getInt("total_price"));
				showReservation.setAge(rs.getString("age"));

				reserveList.add(showReservation);
			}
			return reserveList;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {}
		}
		return null; // 실패
	}
	// 마일리지 보기
	public Point showPoint(String id) {
		String sql = "select * from Point where member_id = ?";
		openConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.Point point = new dto.Point();
				point.setPoint(rs.getInt("point"));
				point.setUpdate_date(rs.getTimestamp("update_date"));

				return point;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {}
		}
		return null; // 실패
	}
}
