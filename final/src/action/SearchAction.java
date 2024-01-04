package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		return "/result.jsp";
	}
	
}
