/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import dao.ProductCategoryDAO;
import dao.ProductDAO;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author HuuThanh
 */
@WebServlet(name = "EditProductServlet", urlPatterns = {"/EditProductServlet"})
public class EditProductServlet extends HttpServlet {

    private static final String EDIT_PAGE = "admin/jsp/admin_edit_product.jsp";
    private static final String MANAGE_PRODUCT_CONTROLLER = "ManageProductServlet";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
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
        try {
            response.setContentType("text/html;charset=UTF-8");
            String pId = request.getParameter("product_id");
            
            int id;
            ProductCategoryDAO pCate = new ProductCategoryDAO();
            ProductDAO pDAO = new ProductDAO();

            List<Category> listCategories = pCate.getAllproductCategory();
            id = Integer.parseInt(pId);
            Product p = pDAO.getProductById(id);
            request.setAttribute("LIST_CATEGORIES", listCategories);
            request.setAttribute("product", p);
            request.getRequestDispatcher(EDIT_PAGE).forward(request, response);

        } catch (NumberFormatException e) {
            System.out.println(e);
        } catch (SQLException ex) {
            Logger.getLogger(EditProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

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
        ProductDAO pDao = new ProductDAO();
        try {
            String url = MANAGE_PRODUCT_CONTROLLER;
            int id = Integer.parseInt(request.getParameter("product_id"));
            int quantity = Integer.parseInt(request.getParameter("product_stock"));
            int category = Integer.parseInt(request.getParameter("category_id"));
            String pName = request.getParameter("product_name");
            double price = Double.parseDouble(request.getParameter("product_price"));
            String descrip = request.getParameter("product_description");
            String img = request.getParameter("product_img");

            pDao.editProduct(id, pName, img, descrip, price, quantity, category);
        } catch (Exception ex) {
            log("EditUserServlet error: " + ex.getMessage());
        }
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
