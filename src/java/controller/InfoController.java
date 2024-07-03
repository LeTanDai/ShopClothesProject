package controller;

import dao.InfoDAO;
import dao.ProductDAO;
import entity.Category;
import entity.Information;
import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "InfoController", urlPatterns = {"/InfoController"})
public class InfoController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            InfoDAO dao = new InfoDAO();
            ProductDAO productDAO = new ProductDAO(); // Add this line
            List<Information> info = dao.getAllInformation();
            List<Category> listC = productDAO.getAllCategory(); // Add this line
            request.setAttribute("address", dao.getAddress(info));
            request.setAttribute("tel", dao.getTel(info));
            request.setAttribute("mail", dao.getMail(info));
            request.setAttribute("openHours", dao.getOpenHours(info));
            request.setAttribute("listC", listC); // Add this line
            request.getRequestDispatcher("contact.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Info Controller";
    }
}
