/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import dao.OrderDAO;
import dao.ProductDAO;
import dao.UserDAO;
import entity.Order;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author ASUS
 */
@WebServlet(name="AdminServlet", urlPatterns={"/AdminServlet"})
public class AdminServlet extends HttpServlet {
   
    private static final String ADMIN = "admin/jsp/admin_home.jsp";
    private final static String ORDER_DETAIL_PAGE = "admin/jsp/admin_order_detail.jsp";
    
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet AdminServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ProductDAO pDao = new ProductDAO();
        OrderDAO oDao = new OrderDAO();
        UserDAO uDao = new UserDAO();
        
        String url = ADMIN;
        try {  
            int totalProducts = pDao.countAllProduct();
            int totalUsers = uDao.countCustomer();
            int totalOrders = oDao.countAllOrder();
            ArrayList<Product> listP = new ArrayList<>();
            Map<Order, ArrayList<Product>> map = new LinkedHashMap<>();
            Order orderr = new Order();
            ArrayList<Integer> orderIds = oDao.getAllOrderIds();
            orderIds.sort((Integer a, Integer b) -> Integer.compare(b, a));
            for (int order : orderIds) {
                listP = oDao.getallProductbyOrderid(order);
                orderr = oDao.getOrderbyOrderid(order);
                map.put(orderr, listP);
            }
            request.setAttribute("TOTALPRODUCTS", totalProducts);
            request.setAttribute("orderidsorted", orderIds);
            request.setAttribute("TOTALUSERS", totalUsers);
            request.setAttribute("TOTALORDERS", totalOrders);
            request.setAttribute("MapOrder", map);
            request.setAttribute("CURRENTSERVLET", "Dashboard");

        } catch (Exception ex) {
            log("AdminServlet error:" + ex.getMessage());
        } finally {
            request.getRequestDispatcher(ADMIN).forward(request, response);
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
