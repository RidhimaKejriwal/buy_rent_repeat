package com.learn.buyrent.servlets;

import com.learn.buyrent.entities.Seller;
import com.learn.buyrent.entities.User;
import com.learn.buyrent.helper.SendMail;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class VerifyServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //fetch form details..
            String userType = request.getParameter("userType");
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String city = request.getParameter("city");

            SendMail sm = new SendMail();
            String code = sm.getRandom();

            if (userType.equals("User")) 
            {
                User user = new User(email, name, password, phone, address, city, code);
                boolean b = sm.sendToUser(user);
                if (b) {
                    HttpSession session = request.getSession();
                    session.setAttribute("authcode", user);
                    response.sendRedirect("verifyUser.jsp");
                } else {
                    System.out.println("There is some problem in sending mail..");
                }
            } 
            else 
            {
                Seller seller = new Seller(email, name, password, phone, address, city, code);
                boolean b = sm.sendToSeller(seller);
                if (b) {
                    HttpSession session = request.getSession();
                    session.setAttribute("authcode", seller);
                    response.sendRedirect("verifySeller.jsp");
                } else {
                    System.out.println("There is some problem in sending mail..");
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
