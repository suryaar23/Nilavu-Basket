package com.nilavu.servlet.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.nilavu.dao.UserDAO;
import com.nilavu.daoImplements.UserDAOImpl;
import com.nilavu.model.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserDAO userDAO = new UserDAOImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");

        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setPhone(phone);

        boolean status = userDAO.register(user);

        if (status) {
            response.sendRedirect("auth/login.jsp");
        } else {
            request.setAttribute("error", "Registration failed. Try again.");
            request.getRequestDispatcher("auth/register.jsp").forward(request, response);
        }
    }
}
