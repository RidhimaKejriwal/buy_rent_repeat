package com.learn.buyrent.servlets;

import com.learn.buyrent.entities.Seller;
import com.learn.buyrent.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class VerifySellerCode extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            Seller seller = (Seller) session.getAttribute("authcode");
            
            String code = request.getParameter("authcode");
            
            if(code.equals(seller.getUserCode()))
            {
                try
                {
                    String email = request.getParameter(seller.getUserEmail());
                    String name = request.getParameter(seller.getUserName());                    
                    String password = request.getParameter(seller.getUserPassword());
                    String phone = request.getParameter(seller.getUserPhone());
                    String address = request.getParameter(seller.getUserAddress());
                    String city = request.getParameter(seller.getUserCity());
                    
                    String verified = "YES";
                    
                    seller.setUserCode(verified);
                    
                    Session hibernateSession = FactoryProvider.getFactory().openSession();
                    Transaction tx = hibernateSession.beginTransaction();
                    hibernateSession.save(seller);
                    tx.commit();
                    hibernateSession.close();
                    
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("message", "Verification successfull !!..");
                    response.sendRedirect("register.jsp");
                    return;
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            else
            {
                out.println("Incorrect verification code");
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
