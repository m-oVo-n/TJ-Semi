package memberAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.Member;

public class MemberUpdateAction implements Action {
	
	MemberDAO dao = new MemberDAO();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		Member member = new Member();
		member.setMember_id(request.getParameter("id"));
		member.setName(request.getParameter("name"));
		member.setBirth(request.getParameter("birth"));
		member.setPhone_number(request.getParameter("selectNum")+"-"+request.getParameter("updateNum2"));
		member.setEmail(request.getParameter("updateEmail")+"@"+request.getParameter("updateSelectEmail"));
		
		
		int rs = dao.update(member);
		if(rs!=0) {
			System.out.println("수정 성공");
		}
		
		return "/final/myPage.m";
	}
}
