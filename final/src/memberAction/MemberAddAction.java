package memberAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.Member;

public class MemberAddAction implements Action{
	MemberDAO dao = new MemberDAO();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Member member = new Member();
		member.setMember_id(request.getParameter("inputId"));
		member.setPassword(request.getParameter("inputPw"));
		member.setName(request.getParameter("inputName"));
		member.setBirth(request.getParameter("inputBirth"));
		member.setGender(request.getParameter("gender"));
		member.setPhone_number(request.getParameter("selectNum")+"-"+request.getParameter("inputNum")); // form 값 확인
		member.setEmail(request.getParameter("emailId")+"@"+request.getParameter("selectEmail"));
		
		int res = dao.join(member);
		int rs = dao.createPoint(member.getMember_id());
		
		if(rs!=0) {
			System.out.println("포인트 실패");
		}
		
		if(res != 0) {
			return "/final/login.jsp";
		}else {
			return "/final/join.jsp";
		}
	}
}
