package memberAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;

public class ChangePwAction implements Action{
	
	MemberDAO dao = new MemberDAO();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String originPw = request.getParameter("Pw");
		String changePw = request.getParameter("updatePw");
		String id = (String)session.getAttribute("ID");
		
		int rs = dao.changePw(id, originPw, changePw);
		if(rs==1) {
			//session.setAttribute("CHANGEPW", "비밀번호 변경 성공");
			System.out.println("비밀번호 변경 성공");
			session.invalidate();
		}
		return "/login.jsp";
	}
}
