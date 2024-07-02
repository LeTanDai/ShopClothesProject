/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
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
public class ProductDAO extends DBContext{
    
    public List<Product>getAllProducts(){
        List<Product>list = new ArrayList<>();
        String sql = "Select * from Product";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Product product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDouble(5), rs.getInt(6));
                list.add(product);
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    
    public Product getProductById(int id){
        ProductDAO productDAO = new ProductDAO();
        try{
            List<Product> list = productDAO.getAllProducts();
            for(Product p: list){
                if(p.getId()==id){
                    return p;
                }
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return null;
    }
    
    public static void main(String[] args) {
        ProductDAO productDAO = new ProductDAO();
        try{
            Product p = productDAO.getProductById(1);
            System.out.println(p);
        }catch(Exception e){
            System.out.println(e);
        }
    }
}
