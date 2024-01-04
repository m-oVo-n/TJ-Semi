package memberAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;

public class FindIdPAction implements Action {
	
	MemberDAO dao = new MemberDAO();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		String name = request.getParameter("inputName");
		String phone = request.getParameter("selectNum")+"-"+request.getParameter("inputNum1")+"-"+request.getParameter("inputNum2");
		System.out.println(name);
		System.out.println(phone);
		String foundId = dao.findIdP(name, phone);
		
		request.setAttribute("FOUNDID", foundId);
		
		return "/findIdResult.jsp";
	}
}
