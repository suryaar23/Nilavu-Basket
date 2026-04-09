package com.nilavu.servlet.agent;

import java.io.IOException;

import com.nilavu.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/agent/agent-dashboard")
public class AgentDashboardServlet extends HttpServlet{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException,IOException{
			
			HttpSession session = request.getSession();
			User  u = (User) session.getAttribute("loggedUser");
			
			if(u == null || !"AGENT".equals(u.getRole())) {
				response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
				return;
			}
			
			request.getRequestDispatcher("/agent/agent-dashboard.jsp").forward(request, response);
	}

}
