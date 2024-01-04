package memberAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;

public class FindIdEAction implements Action {
	
	MemberDAO dao = new MemberDAO();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		String name = request.getParameter("inputName");
		String email = request.getParameter("inputEmailId")+"@"+request.getParameter("selectEmail");
		
		System.out.println(name);
		System.out.println(email);
		
		String foundId = dao.findIdE(name, email);
		request.setAttribute("FOUNDID", foundId);
		
		return "/findIdResult.jsp";
	}
}
