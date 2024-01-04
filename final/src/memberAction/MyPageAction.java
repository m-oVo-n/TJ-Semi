package memberAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.Member;

public class MyPageAction implements Action{
	
	MemberDAO dao = new MemberDAO();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("ID");
		Member member = dao.search(id);
		String num = member.getPhone_number();
		String num1 = num.substring(0,3);
		String num2 = num.substring(4);
		session.setAttribute("NUM1", num1);
		session.setAttribute("NUM2", num2);
		
		String email = member.getEmail();
		String emailId = email.split("@")[0];
		String emailE = email.split("@")[1];
		
		session.setAttribute("EMAILID", emailId);
		session.setAttribute("EMAILE", emailE);
		
		session.setAttribute("MEMBER", member);
		
		return "/final/myPage.jsp";
	}
}
