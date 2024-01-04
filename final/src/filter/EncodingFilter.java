package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EncodingFilter implements Filter{

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		  HttpServletRequest req = (HttpServletRequest)request;
	      HttpServletResponse resp = (HttpServletResponse)response;
	      
	      request.setCharacterEncoding("UTF-8");
	      //서블릿에 매번 설정하지 않아도 되게 함
	      response.setContentType("text/html;charset=UTF-8");
	      
	      String fileUri = req.getRequestURI();
	      
	      if(fileUri.contains(".css")) {
	         resp.setContentType("text/css; charset=utf-8");
	      }else if(fileUri.contains(".js")) {
	         resp.setContentType("text/js; charset=utf-8");
	      }else if(fileUri.contains(".png")) {
	         resp.setContentType("image/png;");
	      }else if(fileUri.contains(".jpg")) {
	         resp.setContentType("image/jpeg;");
	      }else if(fileUri.contains(".png")) {
	         resp.setContentType("image/png;");
	      }else if(fileUri.contains(".svg")) {
	         resp.setContentType("image/svg+xml;");
	      }else if(fileUri.contains(".ttf")) {
	         resp.setContentType("font/ttf;");
	      }else if(fileUri.contains(".html")) {
	         resp.setContentType("text/html; charset=utf-8");   
	      }
		
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

}
