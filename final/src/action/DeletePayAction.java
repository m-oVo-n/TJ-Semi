package action;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import dao.PayDAO;
import dto.Member;
import dto.Payment;
import dto.Point;

public class DeletePayAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int paymentId = Integer.parseInt(request.getParameter("paymentId"));
		System.out.println(paymentId);
		PayDAO dao = new PayDAO();
		Connection conn = null;
		try {
			conn = dao.openConnection();
			conn.setAutoCommit(false);
			
			Point point = dao.showPoint((String)session.getAttribute("Id"));
			System.out.println("find point");
			Payment pay = dao.getUsePointAndgetPoint(conn, paymentId);
			System.out.println("find payment");
			
			int rs1 = dao.deletePayPoint(conn, pay, point, (String)session.getAttribute("Id"));
			System.out.println("delete point");
			if(rs1 == 0) {
				throw new Exception();
			}
			
			int rs2 = dao.deletePay(conn, paymentId);
			System.out.println("pay delete");
			if(rs2 == 0) {
				throw new Exception();
			}
			
			conn.commit();
		}catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {}
		} finally {
			dao.closeConnection(conn);
		}
		return "/final/main.jsp";
	}

}
