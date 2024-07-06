<%-- 
    Document   : remove
    Created on : Jul 5, 2024, 10:03:34 PM
    Author     : lethe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="dao.ShoppingCartItemDAO" %>
<%@ page import="java.util.List" %>
<%
    // Retrieve the contact ID from the URL parameter
    String spcId = request.getParameter("id");
    int id = Integer.parseInt(spcId);
    
    // Delete the contact from the database using the ID
    ShoppingCartItemDAO dao = new ShoppingCartItemDAO();
    dao.removeProductFromShoppingCart(id);
    
    // Redirect the user back to the ListContacts.jsp page
    response.sendRedirect("cart.jsp");
%>

