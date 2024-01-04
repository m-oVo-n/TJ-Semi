package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.DeletePayAction;
import action.PayAction;
import action.SearchAction;
import action.SelectAgeAction;
import action.SelectSeatAction;
import action.SelectTicketAction;

@WebServlet("*.p")
public class PayFrontController extends HttpServlet{
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length()); // 경로 얻어냄
		String path = "";
		
		if(command.equals("/search.p")) { // 메인화면에서 검색했을 때
			SearchAction action = new SearchAction();
			path = action.process(req, resp);
			RequestDispatcher rd = req.getRequestDispatcher(path);
			rd.forward(req, resp);
		}
		else if(command.equals("/selectTicket.p")) { // 검색화면에서 교통수단 선택했을 때
			SelectTicketAction action = new SelectTicketAction();
			path = action.process(req, resp);
			resp.sendRedirect(path);
		}
		else if(command.equals("/age.p")) { // 연령 선택했을 때
			SelectAgeAction action = new SelectAgeAction();
			path = action.process(req, resp);
			RequestDispatcher rd = req.getRequestDispatcher(path);
			rd.forward(req, resp);
		}
		else if(command.equals("/seat.p")) { // 좌석 눌렀을 때
			SelectSeatAction action = new SelectSeatAction();
			path = action.process(req, resp);
			resp.sendRedirect(path);
		}
		else if(command.equals("/pay.p")) { // 결제 눌렀을 때
			PayAction action = new PayAction();
			path = action.process(req, resp);
			resp.sendRedirect(path);
		}
		else if(command.equals("/myReservation.p")) {	// 예약내역 볼 때
			resp.sendRedirect("/final/myReservation.jsp");
		}
		else if(command.equals("/deletePay.p")) {
			DeletePayAction action = new DeletePayAction();
			path = action.process(req, resp);
			resp.sendRedirect(path);
		}
	}
	
	// get으로 들어오면 doProcess로 보냄
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	// post으로 들어오면 doProcess로 보냄
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
}
