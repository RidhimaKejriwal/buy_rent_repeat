package com.learn.buyrent.servlets;

import com.learn.buyrent.dao.SellerDao;
import com.learn.buyrent.dao.UserDao;
import com.learn.buyrent.entities.Seller;
import com.learn.buyrent.entities.User;
import com.learn.buyrent.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                String userType = request.getParameter("userType");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                HttpSession httpsession = request.getSession();

                if (userType.equals("User")) {
                    UserDao userDao = new UserDao(FactoryProvider.getFactory());
                    User user = userDao.getUserByEmailAndPassword(email, password);

                    if (user == null) {
                        httpsession.setAttribute("error_message", "Invalid details !! try again");
                        response.sendRedirect("login.jsp");
                        return;
                    } else {
                        httpsession.setAttribute("current-user", user);
                        response.sendRedirect("userDahboard.jsp");
                    }
                }
                else{
                    SellerDao sellerDao = new SellerDao(FactoryProvider.getFactory());
                    Seller seller = sellerDao.getUserByEmailAndPassword(email, password);
                    if (seller == null) {
                        httpsession.setAttribute("error_message", "Invalid details !! try again");
                        response.sendRedirect("login.jsp");
                        return;
                    } else {
                        httpsession.setAttribute("current-seller", seller);
                        response.sendRedirect("sellerDashboard.jsp");
                    }

                }
            } catch (Exception e) {
                e.printStackTrace();
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
