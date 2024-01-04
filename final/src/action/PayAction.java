package action;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PayDAO;
import dto.Payment;
import dto.Point;
import dto.Seat;
import dto.Ticket;

public class PayAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Payment payment = (Payment)session.getAttribute("payment");
		String chk = payment.check();
		System.out.println(chk);
		System.out.println(request.getParameter("toPrice"));
		System.out.println(request.getParameter("coupon"));
		payment.setTotal_price(Integer.parseInt(request.getParameter("toPrice")));
		payment.setPoints_used(Integer.parseInt(request.getParameter("coupon")));
		payment.setMember_id((String)(session.getAttribute("ID")));
		
		
		PayDAO dao = new PayDAO();
		ArrayList<Seat> seats = (ArrayList<Seat>)session.getAttribute("seat");
		ArrayList<Ticket> tickets = (ArrayList<Ticket>)session.getAttribute("ticket");
		
		
		Connection conn = null;
		try {
			int rs1 = -1;
			int rs2 = -1;
			int rs3 = -1;
			int rs4 = -1;
			int rs5 = -1;
			int rs6 = -1;
			conn = dao.openConnection();
			conn.setAutoCommit(false);
			for(Seat seat : seats) {
				rs1 = dao.seatUpdate(conn, seat);
				rs2 =dao.insertTicket(conn, seat, tickets.remove(0));
			}
			rs3 = dao.insertPay(conn, payment);
			int payId = dao.getPayId(conn, (String)session.getAttribute("ID"));
			System.out.println(payId);
			payment.setPayment_id(payId);
			rs4 = dao.updatePoint(conn, payment, (Point)session.getAttribute("point"));
			for(Seat seat : seats) {
				rs5 = dao.updateTicket(conn, payment, seat);
				rs6 = dao.updateTicket(conn, payment, seat);
			}
			if(rs1 == 0|| rs2 ==0|| rs3 ==0|| rs4 ==0|| rs5 ==0|| rs6 ==0) {
				throw new Exception("예외발생");
			}
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			}catch (Exception e1) {System.out.println("rollback()");}
			return "/final/failedPay.jsp";
		} finally {
			dao.closeConnection(conn);
		}
		
		
		return "/final/completedPay.jsp";
	}

}
