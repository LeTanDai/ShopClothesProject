/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDAO;
import dao.ShoppingCartItemDAO;
import entity.Category;
import entity.Product;
import entity.ShoppingCartItem;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class CheckoutServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckoutServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");
        if (user == null || user.getAddress().equalsIgnoreCase("0") && user.getPhone().equalsIgnoreCase("0")) {
            request.getRequestDispatcher("BillingDetail.jsp").forward(request, response);
        } else {
            Map<ShoppingCartItem, Product> map = new HashMap<>();
            ShoppingCartItemDAO daoshoppingcart = new ShoppingCartItemDAO();
            ArrayList<ShoppingCartItem> shoppingcart = daoshoppingcart.getListItem(user.getId());
            ProductDAO dao = new ProductDAO();
            List<Product> productlist = dao.getAllProducts();
            List<Product> prepareOrder = new ArrayList<>();
            double total = 0;
            int counteachproducttotal = 0;
            for (ShoppingCartItem sci : shoppingcart) {
                for (Product p : productlist) {
                    if (p.getId() == sci.getProductid()) {
                        if (counteachproducttotal == 0) {
                            total += (p.getPrice() * sci.getQuantity());
                            counteachproducttotal++;
                        }
                        prepareOrder.add(p);
                        map.put(sci, p);
                    }
                    counteachproducttotal = 0;
                }
            }
            List<Category> listC = dao.getAllCategory();
            request.setAttribute("listC", listC);
            session.setAttribute("account", user);
            session.setAttribute("total", total);
            request.setAttribute("total", total);
            request.setAttribute("mapPP", map);
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
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
