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

@WebServlet("/admin/edit-agent")
public class EditAgentsServlet extends HttpServlet{
	
		AgentDAO agentDAO = new AgentDAOImpl();
		
		protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
			
				int id = Integer.parseInt(request.getParameter("id"));
				
				Agent a = agentDAO.getAgentById(id);
				
				request.setAttribute("agent", a);
				
				request.getRequestDispatcher("/admin/edit-agent.jsp").forward(request, response);
		}
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException{
				
				int id = Integer.parseInt(request.getParameter("id"));
				
				Agent a = new Agent();
				
				a.setAgent_id(id);
				a.setName(request.getParameter("name"));
				a.setPhone(request.getParameter("phone"));
				
				agentDAO.updateAgent(a);
				
				response.sendRedirect(request.getContextPath() + "/admin/manage-agents");
		}

}
