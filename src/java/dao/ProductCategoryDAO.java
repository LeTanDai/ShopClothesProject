/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author lethe
 */
public class ProductCategoryDAO extends DBContext {

    public ProductCategoryDAO() throws SQLException {
    }

    public ArrayList<Category> getAllproductCategory() {
        ArrayList<Category> productCateList = new ArrayList<>();
        String sql = "select * from Product_category";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt(1);
                String prod_cate_name = rs.getString(2);
                Category prodCate = new Category(productId, prod_cate_name);
                productCateList.add(prodCate);
            }

            ps.close();
            rs.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return productCateList;
    }
}
