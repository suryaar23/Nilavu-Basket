package com.nilavu.servlet.common;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/change-language")
public class LanguageChangeServlet extends HttpServlet{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
			
			String language = request.getParameter("lang");
			
			HttpSession session = request.getSession();
			session.setAttribute("lang", language);
			
			String referer = request.getHeader("Referer");
			
			if(referer != null) {
				response.sendRedirect(referer);
			}
			
			else {
				response.sendRedirect(request.getContextPath() + "/user/home.jsp");
			}
	}
}
