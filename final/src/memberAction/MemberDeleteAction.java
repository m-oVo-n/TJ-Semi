package memberAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;

public class MemberDeleteAction implements Action{
	
	MemberDAO dao = new MemberDAO();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("ID");
		String pw = request.getParameter("password");
		
		int rs = dao.withdrawal(id, pw);
		if(rs!=0) {
			System.out.println("회원탈퇴 성공");
			session.invalidate();
		}
		
		return "/final/main.jsp";
	}
}
