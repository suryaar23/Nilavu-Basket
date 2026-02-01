package com.nilavu.servlet.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.nilavu.dao.AddressDAO;
import com.nilavu.daoImplements.AddressDAOImpl;
import com.nilavu.model.Address;
import com.nilavu.model.User;

@WebServlet("/address")
public class AddressServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private AddressDAO addressDAO = new AddressDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedUser");

        if (user == null) {
            response.sendRedirect("auth/login.jsp");
            return;
        }

        Address address = addressDAO.getAddressByUser(user.getUserId());
        request.setAttribute("address", address);
        request.getRequestDispatcher("user/address.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedUser");

        if (user == null) {
            response.sendRedirect("auth/login.jsp");
            return;
        }

        String street = request.getParameter("street");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String pincode = request.getParameter("pincode");

        Address address = new Address();
        address.setUserId(user.getUserId());
        address.setStreet(street);
        address.setCity(city);
        address.setState(state);
        address.setPincode(pincode);

        addressDAO.saveOrUpdate(address);

        response.sendRedirect("address");
    }
}
