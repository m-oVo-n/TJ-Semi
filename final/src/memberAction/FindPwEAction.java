package memberAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;

public class FindPwEAction implements Action {
	
	MemberDAO dao = new MemberDAO();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("inputId");
		String email = request.getParameter("inputEmailId")+"@"+request.getParameter("selectEmail");
		System.out.println(id);
		System.out.println(email);
		
		String foundPw = dao.findPwE(id, email);
		request.setAttribute("FOUNDPW", foundPw);
		
		return "/findPwResult.jsp";
	}
}
