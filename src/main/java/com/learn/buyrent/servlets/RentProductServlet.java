package com.learn.buyrent.servlets;

import com.learn.buyrent.dao.RentCartDao;
import com.learn.buyrent.entities.RentCart;
import com.learn.buyrent.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class RentProductServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int uid = Integer.parseInt(request.getParameter("u_id"));
            int sid = Integer.parseInt(request.getParameter("s_id"));
            int pid = Integer.parseInt(request.getParameter("p_id"));
            String pname = request.getParameter("p_name");
            String sname = request.getParameter("s_name");
            String uname = request.getParameter("u_name");
            String saddress = request.getParameter("s_address");
            int rentPrice = Integer.parseInt(request.getParameter("p_rentprice"));
            String rentDuration = request.getParameter("p_rentduration");
            int duration_number = Integer.parseInt(request.getParameter("requested_duration_number"));
            String duration_type = request.getParameter("requested_duration_type");
            String exDate = request.getParameter("date");
            LocalDate ldate = LocalDate.parse(exDate);
            String requestAccepted = "no";
            String isReturned = "no";

            HttpSession httpSession = request.getSession();
            if (duration_number == 0) {
                httpSession.setAttribute("error_message", "Invalid rent duration");
                response.sendRedirect("productDisplay.jsp");
                return;
            } else if (duration_type.equals("month(s)") && duration_number >= 6) {
                httpSession.setAttribute("error_message", "Cannot rent for more than six months");
                response.sendRedirect("productDisplay.jsp");
                return;
            } else if (duration_type.equals("week(s)") && duration_number >= 24) {
                httpSession.setAttribute("error_message", "Invalid duration");
                response.sendRedirect("productDisplay.jsp");
                return;
            }

            RentCartDao rcdao = new RentCartDao(FactoryProvider.getFactory());

            int price = rcdao.finalRentPrice(rentPrice, rentDuration, duration_number, duration_type);
            String duration = rcdao.finalRentDuration(duration_number, duration_type);

            RentCart rcart = new RentCart();
            rcart.setUserId(uid);
            rcart.setSellerId(sid);
            rcart.setProductId(pid);
            rcart.setProductName(pname);
            rcart.setSellerName(sname);
            rcart.setUserName(uname);
            rcart.setSellerAddress(saddress);
            rcart.setRentPrice(price);
            rcart.setRentDuration(duration);
            rcart.setExchangeDate(ldate);
            rcart.setRequestAccepted(requestAccepted);
            rcart.setIsReturned(isReturned);
            rcart.setIsDelivered("no");

            Session hibernateSession = FactoryProvider.getFactory().openSession();
            Transaction tx = hibernateSession.beginTransaction();
            hibernateSession.save(rcart);
            tx.commit();
            hibernateSession.close();

            httpSession.setAttribute("message", "Your request has been sent to the seller !!..");
            response.sendRedirect("userDashboard.jsp");
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
