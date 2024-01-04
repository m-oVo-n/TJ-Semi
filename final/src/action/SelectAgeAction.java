package action;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PayDAO;
import dto.Payment;
import dto.Schedule;
import dto.Seat;
import dto.Ticket;
import dto.Transportation;

public class SelectAgeAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		// 성인 아동 노약자 수를 session에 넣고 티켓 수대로 더한 총 가격을 만들기
		String classType = request.getParameter("classType");
		int adultC = Integer.parseInt(request.getParameter("adult"));
		int childC = Integer.parseInt(request.getParameter("child"));
		int elderlyC = Integer.parseInt(request.getParameter("elderly"));
		
		
		HttpSession session = request.getSession();
		session.setAttribute("adultC", adultC);
		session.setAttribute("childC", childC);
		session.setAttribute("elderlyC", elderlyC);
		int specialP = (int)session.getAttribute("spP");
		int normalP = (int)session.getAttribute("price");
		
		int addPrice = 0;
		
		ArrayList<Ticket> ticket = new ArrayList<Ticket>();
		if(classType.equals("special")) {
			addPrice = (specialP * adultC) + (specialP * childC / 2) + (specialP * elderlyC / 2);
			for(int i = 1; i <= adultC; i++) {
				Ticket t = new Ticket();
				t.setAge("adult");
				t.setPrice((int)session.getAttribute("spP"));
				ticket.add(t);
			}
			for(int i = 1; i <= childC; i++) {
				Ticket t = new Ticket();
				t.setAge("child");
				t.setPrice((int)session.getAttribute("spP")/2);
				ticket.add(t);
			}
			for(int i = 1; i <= elderlyC; i++) {
				Ticket t = new Ticket();
				t.setAge("elderly");
				t.setPrice((int)session.getAttribute("spP")/2);
				ticket.add(t);
			}
			
		} else if(classType.equals("normal")) {
			addPrice = (normalP * adultC) + (normalP * childC / 2) + (normalP * elderlyC / 2);
			for(int i = 1; i <= adultC; i++) {
				Ticket t = new Ticket();
				t.setAge("adult");
				t.setPrice((int)session.getAttribute("price"));
				ticket.add(t);
			}
			for(int i = 1; i <= childC; i++) {
				Ticket t = new Ticket();
				t.setAge("child");
				t.setPrice((int)session.getAttribute("price")/2);
				ticket.add(t);
			}
			for(int i = 1; i <= elderlyC; i++) {
				Ticket t = new Ticket();
				t.setAge("elderly");
				t.setPrice((int)session.getAttribute("price")/2);
				ticket.add(t);
			}
		}
		session.setAttribute("addPrice", addPrice);
		session.setAttribute("ticket", ticket);
		
		
		// 선택가능 좌석 보여주기
		PayDAO dao = new PayDAO();
		
		Connection conn=null;
		ArrayList<Seat> seatList = new ArrayList<>();
		int restSeat = 0;
		try {
			conn = dao.openConnection();
			restSeat = dao.restSeat(conn, (Transportation)session.getAttribute("trans"), (Schedule)session.getAttribute("schedule"));
			System.out.println("남은좌석 완");
			seatList = dao.showAvailableSeat(conn, (Transportation)session.getAttribute("trans"), (Schedule)session.getAttribute("schedule"));
			System.out.println("좌석정보 완");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dao.closeConnection(conn);
			request.setAttribute("restSeat", restSeat);
			session.setAttribute("seatList", seatList);
		}
		
		return "/seat.jsp";
	}
	
}
