/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.ProductCategoryDAO;
import dao.ProductDAO;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author lethe
 */
@WebServlet(name = "ManageProductServlet", urlPatterns = {"/ManageProductServlet"})
public class ManageProductServlet extends HttpServlet {

    private final String PRODUCT_PAGE = "admin/jsp/admin_products.jsp";
    private final String INSERT_PRODUCT_PAGE = "admin/jsp/admin_products_insert.jsp";
    private final String INSERT = "Insert";
    private final String DELETE_PRODUCT_CONTROLLER = "DeleteProductServlet";
    private final String INSERT_PRODUCT_CONTROLLER = "InsertProductServlet";
    private final String Delete = "Delete";

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
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String url = PRODUCT_PAGE;
        try {
            String action = request.getParameter("action");
            ProductDAO pDao = new ProductDAO();
            ProductCategoryDAO pcDao = new ProductCategoryDAO();

            List<Product> listProducts = pDao.getAllProducts();
            List<Category> listCategories = pcDao.getAllproductCategory();
            if (action == null) {
                request.setAttribute("LIST_PRODUCTS", listProducts);
                request.setAttribute("LIST_CATEGORIES", listCategories);
                request.setAttribute("CURRENTSERVLET", "Product");
            } else if (action.equals(INSERT)) {
                url = INSERT_PRODUCT_CONTROLLER;
            } else if (action.equals("update")) {
                request.setAttribute("LIST_PRODUCTS", listProducts);
                request.setAttribute("LIST_CATEGORIES", listCategories);
                request.setAttribute("CURRENTSERVLET", "User");
            }
        } catch (Exception ex) {
            log("ManageProductServlet error:" + ex.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
