package memberAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;

public class FindPwPAction implements Action{

	MemberDAO dao = new MemberDAO();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		
		String id = request.getParameter("inputId");
		String phone = request.getParameter("selectNum")+"-"+request.getParameter("inputNum1")+"-"+request.getParameter("inputNum2");
		
		System.out.println(id);
		System.out.println(phone);
		
		String foundPw = dao.findPwP(id, phone);
		request.setAttribute("FOUNDPW", foundPw);
		
		return "/findPwResult.jsp";
	}
}
