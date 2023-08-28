package com.learn.buyrent.servlets;

import com.learn.buyrent.dao.RentCartDao;
import com.learn.buyrent.dao.SellerDao;
import com.learn.buyrent.dao.UserDao;
import com.learn.buyrent.entities.RentCart;
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
import org.hibernate.SessionFactory;

public class CartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            SessionFactory factory = FactoryProvider.getFactory();

            int product_Id = Integer.parseInt(request.getParameter("product_id"));
            String op = request.getParameter("op");
            RentCartDao rcdao = new RentCartDao(factory);
            RentCart rentProduct = rcdao.getProductwithId(product_Id);
            SellerDao sdao = new SellerDao(factory);
            Seller seller = sdao.getUserById(rentProduct.getSellerId());
            UserDao udao = new UserDao(factory);
            User user = udao.getUserById(rentProduct.getUserId());
            HttpSession session = request.getSession();

            String mode = rentProduct.getModeOfDelivery();

            SendMail sm = new SendMail();

            switch (op) {
                case "approve":
                    rentProduct.setRequestAccepted("yes");
                    if (mode == null || mode.equals("pickup")) {
                        sm.cartRequestAccepted(seller, user, rentProduct);
                    } else {
                        sm.buyRequestAccepted(user, rentProduct);
                    }
                    rcdao.updateProduct(rentProduct);
                    response.sendRedirect("requests.jsp");
                    break;
                case "reject":
                    rentProduct.setRequestAccepted("no");
                    sm.cartRequestRejected(user, rentProduct);
                    rcdao.deleteProduct(rentProduct.getId());
                    response.sendRedirect("requests.jsp");
                    break;
                case "deliver":
                    String code = sm.getRandom();
                    System.out.println(code);
                    rentProduct.setVerifyOTP(code);
                    rcdao.updateProduct(rentProduct);
                    sm.exchangeOTPUser(user, rentProduct);
                    response.sendRedirect("ScheduledExchanges.jsp");
                    break;
                case "verify":
                    String database_code = rentProduct.getVerifyOTP();
                    String entered_code = request.getParameter("authcode");
                    if (entered_code.equals(database_code)) {
                        System.out.println();
                        rentProduct.setIsDelivered("yes");
                        if (mode != null) {
                            rentProduct.setProcessComplete("complete");
                        }
                        rentProduct.setVerifyOTP(null);
                        rcdao.updateProduct(rentProduct);
                        response.sendRedirect("ScheduledExchanges.jsp");
                    } else {
                        HttpSession httpSession = request.getSession();
                        httpSession.setAttribute("error_message", "Invalid OTP !!..");
                        response.sendRedirect("ScheduledExchanges.jsp");
                    }
                    break;
                case "return":
                    String otp = sm.getRandom();
                    System.out.print(otp);
                    rentProduct.setVerifyOTP(otp);
                    rcdao.updateProduct(rentProduct);
                    sm.exchangeOTPSeller(seller, rentProduct);
                    response.sendRedirect("ScheduledExchange.jsp");
                    break;
                case "verifyreturn":
                    database_code = rentProduct.getVerifyOTP();
                    entered_code = request.getParameter("authcode");
                    if( entered_code.equals(database_code)){
                        rentProduct.setIsReturned("yes");
                        rentProduct.setProcessComplete("complete");
                        rentProduct.setVerifyOTP(null);
                        rcdao.updateProduct(rentProduct);
                        response.sendRedirect("ScheduledExchanges.jsp");
                    }
                    else{
                        HttpSession httpSession = request.getSession();
                        httpSession.setAttribute("error_message", "Invalid OTP !!..");
                        response.sendRedirect("ScheduledExchanges.jsp");
                    }
                    break;
                default:
                    break;
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
