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
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "InsertProductServlet", urlPatterns = {"/InsertProductServlet"})
public class InsertProductServlet extends HttpServlet {

    private static final String INSERT_PAGE = "admin/jsp/admin_products_insert.jsp";
    private static final String MANAGE_PRODUCT_CONTROLLER = "ManageProductServlet";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

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
        String url = INSERT_PAGE;
        try {
            String action = request.getParameter("action");
            ProductDAO pDao = new ProductDAO();
            if (action != null) {
                ProductCategoryDAO cDao = new ProductCategoryDAO();
                List<Category> listCategories = cDao.getAllproductCategory();

                request.setAttribute("LIST_CATEGORIES", listCategories);
            } else {
                String name = request.getParameter("product_name");
                String price_raw = request.getParameter("price");
                String stock_raw = request.getParameter("stock");
                String description = request.getParameter("description");
                int cid_raw = Integer.parseInt(request.getParameter("category_id"));

                Category cId = new Category(cid_raw);
                int stock = Integer.parseInt(stock_raw);
                double price = Double.parseDouble(price_raw);
                String image = request.getParameter("product_img");

                Product prod = pDao.checkProductExist(name);
                if (prod != null) {
                    url = INSERT_PAGE;
                    request.setAttribute("error", "Product is exist!");
                } else {
                    prod = new Product(0, name, image, description, price, stock, cId);
                    pDao.inserProduct(prod);
                }
                

                request.setAttribute("mess", "Insert successfully!");
                url = MANAGE_PRODUCT_CONTROLLER;
            }
        } catch (Exception ex) {
            log("InsertProductServlet error:" + ex.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
