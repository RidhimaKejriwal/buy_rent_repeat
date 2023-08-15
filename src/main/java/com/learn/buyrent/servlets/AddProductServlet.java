package com.learn.buyrent.servlets;

import com.learn.buyrent.dao.CategoryDao;
import com.learn.buyrent.dao.ProductDao;
import com.learn.buyrent.entities.Category;
import com.learn.buyrent.entities.Product;
import com.learn.buyrent.entities.Seller;
import com.learn.buyrent.helper.FactoryProvider;
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

@MultipartConfig
public class AddProductServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String op = request.getParameter("operation");

            if (op.trim().equals("addcategory")) {
                //add category
                //fetching category data
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");
                Category category = new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);

                //category database save
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId = categoryDao.saveCategory(category);

                //out.println("category saved");
                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("message", "Category added successfully!! Category Id: " + catId);
                response.sendRedirect("adminDashboard.jsp");
                return;

            }
            String pName = request.getParameter("p_name");
            String pDesc = request.getParameter("p_desc");
            String pUsedFor = request.getParameter("p_usedfor");
            int pSellPrice = Integer.parseInt(request.getParameter("p_sellingprice"));
            int pRentPrice = Integer.parseInt(request.getParameter("p_rentprice"));
            String prentduration = request.getParameter("p_rentduration");
            int pQuality = Integer.parseInt(request.getParameter("p_quality"));
            int catId = Integer.parseInt(request.getParameter("p_category"));
            int sellerId = Integer.parseInt(request.getParameter("p_sellerid"));

            Part part1 = request.getPart("p_image1");
            Part part2 = request.getPart("p_image2");

            Product p = new Product();
            p.setpName(pName);
            p.setpDesc(pDesc);
            p.setpUsedFor(pUsedFor);
            p.setpSellPrice(pSellPrice);
            p.setpRentPrice(pRentPrice);
            p.setpRentDuration(prentduration);
            p.setpQuality(pQuality);
            p.setpPhoto1(part1.getSubmittedFileName());
            p.setpPhoto2(part2.getSubmittedFileName());
            p.setProduct_Approved("no");
            p.setProduct_Enable("yes");
            p.setSeller_id(sellerId);

            //get category by id
            CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
            Category category = cdao.getCategoryById(catId);
            p.setCategory(category);

            // product save in database-----
            ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
            pdao.saveProduct(p);
//            out.println("Product save success");

            // pic upload-----
            // find out the path to upload file
            String path1 = request.getRealPath("img") + File.separator + "products" + File.separator + part1.getSubmittedFileName();
            System.out.println(path1);
            String path2 = request.getRealPath("img") + File.separator + "products" + File.separator + part2.getSubmittedFileName();
            System.out.println(path2);
            //uploading code
            try {
                FileOutputStream fos = new FileOutputStream(path1);
                InputStream is = part1.getInputStream();
                //reading data
                byte[] data = new byte[is.available()];
                is.read(data);
                //writing data
                fos.write(data);
                fos.close();
                
                FileOutputStream fos2 = new FileOutputStream(path2);
                InputStream is2 = part2.getInputStream();
                //reading data
                byte[] data2 = new byte[is2.available()];
                is2.read(data2);
                //writing data
                fos2.write(data2);
                fos2.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

//            out.println("Product saved");
            HttpSession httpsession = request.getSession();
            httpsession.setAttribute("message", "Your product request has been sent to the admin. You will soon receive confirmation mail.");
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
