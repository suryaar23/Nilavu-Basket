package com.nilavu.servlet.admin;

import java.io.IOException;

import com.nilavu.dao.AgentDAO;
import com.nilavu.daoImplements.AgentDAOImpl;
import com.nilavu.model.Agent;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/add-agent")
public class AddAgentsServlet extends HttpServlet{
		
		AgentDAO agentDAO = new AgentDAOImpl();
		
		protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
				
				request.getRequestDispatcher("/admin/add-agent.jsp").forward(request,response);
		}
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException{
			
				String name = request.getParameter("name");
				String phone = request.getParameter("phone");
				
				Agent a = new Agent();
				
				a.setName(name);
				a.setPhone(phone);
				
				agentDAO.addAgent(a);
				
				response.sendRedirect(request.getContextPath() + "/admin/manage-agents");
		}

}
