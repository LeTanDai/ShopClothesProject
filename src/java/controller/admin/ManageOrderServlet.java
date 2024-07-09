/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.OrderDAO;
import dao.UserDAO;
import entity.Order;
import entity.Product;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class ManageOrderServlet extends HttpServlet {

    private final String ORDER_PAGE = "admin/jsp/admin_order.jsp";
    private final String ORDER_DETAIL_PAGE = "admin/jsp/admin_order_detail.jsp";
    private final String HOME_PAGE = "admin/jsp/admin_home.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManageOrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageOrderServlet at " + request.getContextPath() + "</h1>");
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
        OrderDAO odao = new OrderDAO();
        UserDAO udao = new UserDAO();
        ArrayList<Order> listo = odao.getallorder();
        listo.sort((Order a, Order b) -> Integer.compare(b.getId(), a.getId()));
        String action = request.getParameter("action");
        String url = null;
        if (action == null) {
            url = ORDER_PAGE;
            Map<Order, User> map = new LinkedHashMap<>();
            for (Order o : listo) {
                User user = udao.getUserById(o.getUserid());
                map.put(o, user);
            }
            request.setAttribute("LIST_ORDERS", map);
        } else {
            url = ORDER_DETAIL_PAGE;
            String billId = request.getParameter("bill_id");
            ArrayList<Product> listp = odao.getallProductbyOrderid(Integer.parseInt(billId));
            listp.sort((Product a, Product b) -> Integer.compare(a.getId(), b.getId()));
            request.setAttribute("LIST_PRODUCTS_IN_ORDER", listp);
        }
        request.getRequestDispatcher(url).forward(request, response);
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
