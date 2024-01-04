package action;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PayDAO;
import dto.Payment;
import dto.Point;
import dto.Schedule;
import dto.Seat;

public class SelectSeatAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		Payment payment = new Payment();
		payment.setPoints_earned((int)Math.ceil((int)session.getAttribute("addPrice")*0.02));
		payment.setQuantity((int)session.getAttribute("quantity"));
		
		
		Schedule schedule = (Schedule) session.getAttribute("schedule");
		String date = schedule.getDeparture_time().substring(0, 10);
		String deTime = schedule.getDeparture_time().substring(11);
		String arrTime = schedule.getArrival_time().substring(11);
		session.setAttribute("date", date);
		session.setAttribute("deTime", deTime);
		session.setAttribute("arrTime", arrTime);
		
		ArrayList<Seat> seats = new ArrayList<Seat>(); // seat 정보 얻어오기
		String[] sArray = request.getParameterValues("seatId");
		System.out.println(request.getParameterValues("seatId").length);
		for(int i = 0; i < request.getParameterValues("seatId").length; i++) {
			Seat s = new Seat();
			String sS[] = sArray[i].split("\\.");
			String sId = sS[0];
			String sNo = sS[1];
			s.setSeat_id(Integer.parseInt(sId));
			s.setSeat_number(Integer.parseInt(sNo));
			seats.add(s);
		}
		session.setAttribute("seat", seats);
		
		PayDAO dao = new PayDAO();
		Connection conn=null;
		Point point = new Point();
		
		try {
			point = dao.showPoint((String)session.getAttribute("ID")); // 문주거랑 비교!!!!!!
			System.out.println("포인트 조회 완");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dao.closeConnection(conn);
			session.setAttribute("payment", payment);
			session.setAttribute("point", point);
		}
		return "/final/pay.jsp";
	}
	
}
