package memberAction;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;

public class LoginAction implements Action{
   MemberDAO dao = new MemberDAO();
   
   
   
   @Override
   public String process(HttpServletRequest req, HttpServletResponse resp) {
      String userId = req.getParameter("userId");
      String userPw = req.getParameter("userPw");
      
      int loginResult = dao.login(userId, userPw);
      
      if(loginResult==1) {
         //로그인 성공
         HttpSession session = req.getSession();
         session.setAttribute("ID", userId);
         
      }
      else if(loginResult ==0) {
         System.out.println("비밀번호 불일치");
      }
      else if(loginResult == -1) {
         System.out.println("존재하지 않는 회원");
      }
      else {System.out.println("DB오류");}
      
      return "/final/main.jsp";
   }
}