package com.nilavu.servlet.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.nilavu.dao.PaymentDAO;
import com.nilavu.daoImplements.PaymentDAOImpl;
import com.nilavu.model.Payment;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private PaymentDAO paymentDAO = new PaymentDAOImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String paymentMode = request.getParameter("paymentMode");

        Payment payment = new Payment();
        payment.setOrderId(orderId);
        payment.setPaymentMode(paymentMode);
        payment.setPaymentStatus("SUCCESS");

        paymentDAO.savePayment(payment);

        response.sendRedirect("orderSuccess	");
    }
}
