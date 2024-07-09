/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import com.sun.jdi.connect.spi.Connection;
import context.DBContext;
import entity.Order;
import entity.Product;
import entity.User;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderDAO extends DBContext {

    public boolean addOrder(java.sql.Date sqlDate, int userId, double total, String status, String address) {
        String sql = "insert into Orders values(?, ?, ?, ?, ?)";
        try {
            PreparedStatement state = connection.prepareStatement(sql);
            state.setDate(1, sqlDate);
            state.setDouble(2, total);
            state.setString(3, status);
            state.setString(4, address);
            state.setInt(5, userId);
            state.execute();
            state.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public ArrayList<Integer> getOrderidByUserid(int userid) {
        ArrayList<Integer> orderid = new ArrayList<>();
        String sql = "select * from Orders where Orders.userId = ?";
        try {
            PreparedStatement state = connection.prepareStatement(sql);
            state.setInt(1, userid);
            ResultSet rs = state.executeQuery();
            while (rs.next()) {
                orderid.add(rs.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderid;
    }

    public void addOrderProduct(int orderid, ArrayList<Integer> productid) {
        String sql = "insert into Order_Product values(?,?)";
        try {
            PreparedStatement state = connection.prepareStatement(sql);
            for (int i : productid) {
                state.setInt(1, orderid);
                state.setInt(2, i);
                state.execute();
            }
            state.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Product> getallProductbyOrderid(int orderid) {
        ArrayList<Product> listproduct = new ArrayList<>();
        String sql = "select * from Order_Product where Order_Product.orderId = ?";
        ProductDAO dao = new ProductDAO();
        try {
            PreparedStatement state = connection.prepareStatement(sql);
            state.setInt(1, orderid);
            ResultSet rs = state.executeQuery();
            while (rs.next()) {
                Product p = dao.getProductById(rs.getInt(2));
                listproduct.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listproduct;
    }
    public Order getOrderbyOrderid(int orderid) {
        Order order = new Order();
        String sql = "select * from Orders where Orders.orderId = ?";
        try {
            PreparedStatement state = connection.prepareStatement(sql);
            state.setInt(1, orderid);
            ResultSet rs = state.executeQuery();
            while (rs.next()) {
                order = new Order(rs.getInt(1), rs.getDate(2), rs.getDouble(3), rs.getString(4), rs.getString(5), rs.getInt(6));
                return order;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }
    
    public int countAllOrder(){
        int count = 0;
        String sql = "select * from Orders";
        try {
            PreparedStatement state = connection.prepareStatement(sql);
            ResultSet rs = state.executeQuery();
            while (rs.next()) {
                count++;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
    
    public ArrayList<Integer> getAllOrderIds() {
    ArrayList<Integer> orderIds = new ArrayList<>();
    String sql = "SELECT * FROM Orders";
    try {
        PreparedStatement state = connection.prepareStatement(sql);
        ResultSet rs = state.executeQuery();
        while (rs.next()) {
            orderIds.add(rs.getInt(1));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return orderIds;
    }
    public ArrayList<Order> getallorder() {
        ArrayList<Order> listo = new ArrayList<>();
        Order order = new Order();
        String sql = "select * from Orders";
        try {
            PreparedStatement state = connection.prepareStatement(sql);
            ResultSet rs = state.executeQuery();
            while (rs.next()) {
                order = new Order(rs.getInt(1), rs.getDate(2), rs.getDouble(3), rs.getString(4), rs.getString(5), rs.getInt(6));
                listo.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listo;
    }
    public static void main(String[] args) {
        OrderDAO o = new OrderDAO();
        ArrayList<Order> count =o.getallorder();
        for ( Order s : count ) {
            System.out.println(count);
        }
    }
}
