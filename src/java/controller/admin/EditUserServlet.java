package controller.admin;

import dao.UserDAO;
import entity.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@WebServlet(name = "EditUserServlet", urlPatterns = {"/EditUserServlet"})
public class EditUserServlet extends HttpServlet {

    private static final String EDIT_PAGE = "admin/jsp/admin_edit_user.jsp";
    private static final String MANAGE_USER_CONTROLLER = "ManageUserServlet";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditUserServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditUserServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id_raw = request.getParameter("userID");
        int id;
        UserDAO udb = new UserDAO();
        try {
            id = Integer.parseInt(id_raw);
            User u = udb.getUserById(id);
            request.setAttribute("user", u);
            request.getRequestDispatcher(EDIT_PAGE).forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO dao = new UserDAO();
        try {
            String url = MANAGE_USER_CONTROLLER;
            int id = Integer.parseInt(request.getParameter("id"));
            String fullname = request.getParameter("fullname");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String role = request.getParameter("role");
            int isAdmin = role.equals("admin") ? 1 : 0;
            int isSell = role.equals("user") ? 1 : 0; 

            dao.updateUser(id, fullname, address, phone, email, isSell, isAdmin);
            request.setAttribute("mess", "Edit successfully!");
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            log("EditUserServlet error: " + ex.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
