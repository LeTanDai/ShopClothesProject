/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Category;
import entity.Product;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ASUS
 */
public class ProductDAO extends DBContext {

    public List<Product> getAllProducts() {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT p.productId, p.prod_name, p.prod_image, p.descriptions, p.price, p.quantity, c.prod_category_id, c.prod_category_name "
                + "FROM Product p "
                + "JOIN Product_category c ON p.prod_category_id = c.prod_category_id";

        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                Category category = new Category(rs.getInt("prod_category_id"), rs.getString("prod_category_name"));
                Product product = new Product(
                        rs.getInt("productId"),
                        rs.getString("prod_name"),
                        rs.getString("prod_image"),
                        rs.getString("descriptions"),
                        rs.getDouble("price"),
                        rs.getInt("quantity"),
                        category
                );
                productList.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return productList;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "Select * from Product_category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt(1), rs.getString(2));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProductByProductId(int id) {
        ProductDAO productDAO = new ProductDAO();
        try {
            List<Product> list = productDAO.getAllProducts();
            for (Product p : list) {
                if (p.getId() == id) {
                    return p;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> searchByName(String txtSearch) {
        String query = "SELECT p.productId, p.prod_name, p.price, p.prod_image, p.descriptions, p.quantity, c.prod_category_id, c.prod_category_name "
                + "FROM Product p "
                + "JOIN Product_category c ON p.prod_category_id = c.prod_category_id "
                + "WHERE p.prod_name LIKE ?";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category(rs.getInt("prod_category_id"), rs.getString("prod_category_name"));
                Product product = new Product(rs.getInt("productId"), rs.getString("prod_name"),
                        rs.getString("prod_image"), rs.getString("descriptions"),
                        rs.getDouble("price"), rs.getInt("quantity"), category);
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        ProductDAO productDAO = new ProductDAO();
        try {
            List<Category> c = productDAO.getAllCategory();
            List<Product> p = productDAO.getAllProducts();
            System.out.println(p);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public Product getProductById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
