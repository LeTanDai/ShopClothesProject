/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.OrderDAO;
import dao.ProductDAO;
import dao.ShoppingCartItemDAO;
import entity.Order;
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
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class OrderHistoryServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderHistoryServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderHistoryServlet at " + request.getContextPath() + "</h1>");
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
        ArrayList<Product> listP = new ArrayList<>();
        Map<Order, ArrayList<Product>> map = new HashMap<>();
        Order orderr = new Order();
        OrderDAO orderdao = new OrderDAO();
        ArrayList<Integer> orderid = orderdao.getOrderidByUserid(user.getId());
        for (int order : orderid) {
            listP = orderdao.getallProductbyOrderid(order);
            orderr = orderdao.getOrderbyOrderid(order);
            map.put(orderr, listP);
        }
        request.setAttribute("mapOrder", map);
        request.getRequestDispatcher("orderHistory.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");
        OrderDAO orderdao = new OrderDAO();
        ShoppingCartItemDAO scidao = new ShoppingCartItemDAO();
        // Lấy ngày hiện tại
        LocalDate currentDate = LocalDate.now();
        // Chuyển đổi thành java.sql.Date
        java.sql.Date sqlDate = java.sql.Date.valueOf(currentDate);
        if (orderdao.addOrder(sqlDate, user.getId(), (double) session.getAttribute("total"), "Processing", user.getAddress())) {
            ArrayList<Integer> orderid = orderdao.getOrderidByUserid(user.getId());
            List<Product> neworder = scidao.getProductByShoppingCartItem(user.getId());
            ArrayList<Integer> productid = new ArrayList<>();
            for (Product p : neworder) {
                productid.add(p.getId());
                scidao.removeProductFromShoppingCartByProductId(p.getId());
            }
            orderdao.addOrderProduct(orderid.get(orderid.size() - 1), productid);
            ArrayList<Product> listP = new ArrayList<>();
            Map<Order, ArrayList<Product>> map = new HashMap<>();
            Order orderr = new Order();
            for (int order : orderid) {
                listP = orderdao.getallProductbyOrderid(order);
                orderr = orderdao.getOrderbyOrderid(order);
                map.put(orderr, listP);
            }
            request.setAttribute("mapOrder", map);
            request.getRequestDispatcher("orderHistory.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("BillingDetail.jsp").forward(request, response);
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
