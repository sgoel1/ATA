package com.ata.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionFilter implements Filter {

	//private ArrayList<String> urlList;

	public void destroy() {
	}

	public void doFilter(ServletRequest req, ServletResponse res,FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		//String url = request.getServletPath();
		
		
			HttpSession session = request.getSession(false);
			if (null == session||session.getAttribute("user")==null) {
				request.getRequestDispatcher("/Error.jsp").forward(req, res);
				//response.sendRedirect("Error.jsp");
			} else {
				chain.doFilter(request, response);
			}
		
}
	

	public void init(FilterConfig config) throws ServletException {
		
		}
}