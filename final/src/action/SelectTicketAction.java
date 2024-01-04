package action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PayDAO;
import dto.Transportation;

public class SelectTicketAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		dto.Transportation trans = new dto.Transportation();
		dto.Schedule schedule = new dto.Schedule();
		
		HttpSession session = request.getSession();
		
		int spP = 0;
		String spPParam = request.getParameter("spP");
		if (spPParam != null && !spPParam.isEmpty() && !spPParam.equals("")) {
		    spP = Integer.parseInt(spPParam);
		}
		session.setAttribute("spP", spP);
		session.setAttribute("spP", spP);
		int price = Integer.parseInt(request.getParameter("price"));
		session.setAttribute("price", price);
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		session.setAttribute("quantity", quantity);
		
		trans.setArrival_station(request.getParameter("arrP"));
		trans.setDeparture_station(request.getParameter("deP"));
		trans.setTransportation_number(request.getParameter("transNo"));
		trans.setTransportation_type(request.getParameter("transType"));
		
		schedule.setArrival_time(request.getParameter("aD")+" "+request.getParameter("arrTime"));
		schedule.setDeparture_time(request.getParameter("dD")+" "+request.getParameter("deTime"));
		schedule.setTotal_time(request.getParameter("toTime").substring(4, 9));
		
		PayDAO dao = new PayDAO();
		
		Connection conn=null;
		try {
			conn = dao.openConnection();
			conn.setAutoCommit(false);
			int rs = dao.insertTrans(conn, trans);
			if(rs == 0) {
				System.out.println("fail");
			} else {
				System.out.println("ok");
			}
			rs = dao.insertSchedule(conn, schedule);
			
			trans.setTransport_id(dao.getTransId(conn, trans));
			schedule.setSchedule_id(dao.getScheduleId(conn, schedule));
			
			rs = dao.insertSeat(conn, trans, schedule);
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dao.closeConnection(conn);
			session.setAttribute("trans", trans);
			session.setAttribute("schedule", schedule);
		}
		
		return "/final/age.jsp";
	}

}
