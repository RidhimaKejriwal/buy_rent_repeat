
package com.learn.buyrent.servlets;

import com.learn.buyrent.entities.NGO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class AddNGOServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String Name = request.getParameter("name");
            String Cause = request.getParameter("cause");
            String Description = request.getParameter("description");
            String Email = request.getParameter("email");
            String Phone = request.getParameter("phone");
//            String Photo = request.getParameter("photo");
            String Address = request.getParameter("address");
            String State = request.getParameter("state");
            String City = request.getParameter("city");
            String Link = request.getParameter("link");
            
            Part part = request.getPart("photo");
            
            NGO ngo = new NGO();
            ngo.setName(Name);
            ngo.setEmail(Email);
            ngo.setCause(Cause);
            ngo.setDescription(Description);
            ngo.setPhone(Phone);
            ngo.setAddress(Address);
            ngo.setState(State);
            ngo.setCity(City);
            ngo.setLink(Link);
            ngo.setPhoto(part.getSubmittedFileName());
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
