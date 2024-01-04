package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberAction.ChangePwAction;
import memberAction.FindIdEAction;
import memberAction.FindIdPAction;
import memberAction.FindPwEAction;
import memberAction.FindPwPAction;
import memberAction.LoginAction;
import memberAction.LogoutAction;
import memberAction.MemberAddAction;
import memberAction.MemberDeleteAction;
import memberAction.MemberUpdateAction;
import memberAction.MyPageAction;

@WebServlet("*.m")
public class MemberFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length()); // 경로 얻어냄
		String path = "";

		if (command.equals("/login.m")) {
			LoginAction action = new LoginAction();
			path = action.process(req, resp);
			resp.sendRedirect(path);
		} 
		else if (command.equals("/add.m")) {
			MemberAddAction action = new MemberAddAction();
			path = action.process(req, resp);
			resp.sendRedirect(path);
		}

		else if (command.equals("/myPage.m")) {
			MyPageAction action = new MyPageAction();
			path = action.process(req, resp);
			resp.sendRedirect(path);
		}

		else if (command.equals("/findIdP.m")) {
			FindIdPAction action = new FindIdPAction();
			path = action.process(req, resp);
			
			RequestDispatcher rd = req.getRequestDispatcher(path); 
			rd.forward(req, resp);

		}

		else if (command.equals("/findIdE.m")) {
			FindIdEAction action = new FindIdEAction();
			path = action.process(req, resp);
			RequestDispatcher rd = req.getRequestDispatcher(path);
			rd.forward(req, resp);
		}

		else if (command.equals("/findPwP.m")) {
			FindPwPAction action = new FindPwPAction();
			path = action.process(req, resp);
			RequestDispatcher rd = req.getRequestDispatcher(path);
			rd.forward(req, resp);
		}
		
		else if(command.equals("/findPwE.m")) {
			FindPwEAction action = new FindPwEAction();
			path = action.process(req, resp);
			RequestDispatcher rd = req.getRequestDispatcher(path);
			rd.forward(req, resp);
		}

		else if (command.equals("/changePw.m")) {
			ChangePwAction action = new ChangePwAction();
			path = action.process(req, resp);
			RequestDispatcher rd = req.getRequestDispatcher(path);
			rd.forward(req, resp);
		}

		else if (command.equals("/update.m")) {
			MemberUpdateAction action = new MemberUpdateAction();

			path = action.process(req, resp);
			resp.sendRedirect(path);
		}

		else if (command.equals("/delete.m")) {
			MemberDeleteAction action = new MemberDeleteAction();
			path = action.process(req, resp);
			resp.sendRedirect(path);
		}

		else if (command.equals("/logout.m")) {
			LogoutAction action = new LogoutAction();
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