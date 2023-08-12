package com.learn.buyrent.servlets;

import com.learn.buyrent.dao.SellerDao;
import com.learn.buyrent.dao.UserDao;
import com.learn.buyrent.entities.Seller;
import com.learn.buyrent.entities.User;
import com.learn.buyrent.helper.FactoryProvider;
import com.learn.buyrent.helper.SendMail;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;

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
            String cpassword = request.getParameter("cpassword");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String pic = "default.png";
            
            Session s = FactoryProvider.getFactory().openSession();
            HttpSession httpSession = request.getSession();
            
            if(!cpassword.equals(password))
            {
                httpSession.setAttribute("error_message", "Confirm password do not match password");
                response.sendRedirect("register.jsp");
                return;
            }

            SendMail sm = new SendMail();
            String code = sm.getRandom();
                        
            if (userType.equals("User")) 
            {
                
                UserDao userDao = new UserDao(FactoryProvider.getFactory());
                User user1 = userDao.getUserByEmail(email);
               
               if(user1 != null)
               {                  
                   httpSession.setAttribute("error_message", "Email already registered");
                   response.sendRedirect("register.jsp");
                   return;
               }
               
                User user = new User(email, name, password, phone, address, city, code, pic);
                boolean b = sm.sendToUser(user);
                if (b) {
                    HttpSession session = request.getSession();
                    session.setAttribute("authcode", user);
                    session.setAttribute("message", "We already sent a verification code to your email!..");
                    response.sendRedirect("verifyUser.jsp");
                } else {
                    System.out.println("There is some problem in sending mail..");
                }
            } 
            else 
            {                
                SellerDao sellerDao = new SellerDao(FactoryProvider.getFactory());
                Seller seller1 = sellerDao.getUserByEmail(email);
               
               if(seller1 != null)
               {                  
                   httpSession.setAttribute("error_message", "Email already registered");
                   response.sendRedirect("register.jsp");
                   return;
               }
               
                Seller seller = new Seller(email, name, password, phone, address, city, code, pic);
                boolean b = sm.sendToSeller(seller);
                if (b) {
                    HttpSession session = request.getSession();
                    session.setAttribute("authcode", seller);
                    session.setAttribute("message", "We already sent a verification code to your email!..");
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
