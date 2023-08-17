
package com.learn.buyrent.servlets;

import com.learn.buyrent.dao.ProductDao;
import com.learn.buyrent.dao.SellerDao;
import com.learn.buyrent.entities.Product;
import com.learn.buyrent.entities.Seller;
import com.learn.buyrent.helper.FactoryProvider;
import com.learn.buyrent.helper.SendMail;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class ApproveServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int product_Id = Integer.parseInt(request.getParameter("product_id"));
            String op = request.getParameter("op");
            ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
            Product product = pdao.getProductbyId(product_Id);
            SellerDao sdao = new SellerDao(FactoryProvider.getFactory());
            Seller seller = sdao.getUserById(product.getSeller_id());
            
            if(op.equals("approve"))
            {
                product.setProduct_Approved("yes");
            }
            else{
                product.setProduct_Approved("no");
            }
            
            Session hibernateSession = FactoryProvider.getFactory().openSession();
            Transaction tx = hibernateSession.beginTransaction();
            hibernateSession.update(product);
            tx.commit();
            hibernateSession.close();
            
            SendMail sm = new SendMail();
            if(op.equals("approve"))
            {
                
            }
            else
            {
                
            }
            
            response.sendRedirect("productRequests.jsp");
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
