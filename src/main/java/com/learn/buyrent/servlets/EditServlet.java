package com.learn.buyrent.servlets;

import com.learn.buyrent.entities.Seller;
import com.learn.buyrent.helper.FactoryProvider;
import com.learn.buyrent.helper.Helper;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.hibernate.Session;
import org.hibernate.Transaction;

@MultipartConfig
public class EditServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            //fetch all edited data from form
//            String id = request.getParameter("user_id");
            String email = request.getParameter("user_email");
            String name = request.getParameter("user_name");
            String password = request.getParameter("user_password");
            String phone = request.getParameter("user_phone");
            String adress = request.getParameter("user_address");
            String city = request.getParameter("user_city");
            System.out.println(name);
            System.out.println(email);
            Part part = request.getPart("image");
            String pic = part.getSubmittedFileName();

//            get the user from the session...
            HttpSession session = request.getSession();
            Seller seller = (Seller) session.getAttribute("current-seller");

//            replace new details with details in current user
            seller.setUserName(name);
            seller.setUserPassword(password);
            seller.setUserPhone(phone);
            seller.setUserAddress(adress);
            seller.setUserCity(city);
            String oldFile = seller.getUserPic();
            seller.setUserPic(pic);

            String path = request.getRealPath("img") + File.separator + "seller" + File.separator + pic;
            System.out.println(path);
            //uploading code
            try {
                FileOutputStream fos = new FileOutputStream(path);
                InputStream is = part.getInputStream();
                //reading data
                byte[] data = new byte[is.available()];
                is.read(data);
                //writing data
                fos.write(data);
                fos.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

            Session hibernateSession = FactoryProvider.getFactory().openSession();
            Transaction tx = hibernateSession.beginTransaction();
            hibernateSession.update(seller);
            tx.commit();
            hibernateSession.close();
            response.sendRedirect("sellerDashboard.jsp");
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
