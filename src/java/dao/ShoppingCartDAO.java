/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Category;
import entity.Product;
import entity.ShoppingCart;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class ShoppingCartDAO extends DBContext{
    // Lay cai Id gio hang cua khach theo UserId(moi tai khoan chi co 1 gio nen theo User): Phuc
      
    public ShoppingCartDAO(){
    }

    public ArrayList<ShoppingCart> getAllShopping() {
        String sql = " SELECT * FROM Shopping_cart ";
        ArrayList<ShoppingCart> spCList = new ArrayList<>();
        try (PreparedStatement st = connection.prepareStatement(sql);
                ResultSet rs = st.executeQuery()) {
            
            while (rs.next()) {
                ShoppingCart s = new ShoppingCart(
                        rs.getInt("shoppingcartId")
                        , rs.getInt("orderId")
                        , rs.getInt("userId"));
                spCList.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return spCList;
    }
    
    public ShoppingCart getShoppingCartByUserId(int userId){
        ShoppingCartDAO spCDAO = new ShoppingCartDAO();
        ArrayList<ShoppingCart> spCList = spCDAO.getAllShopping();
        for(ShoppingCart s: spCList){
            if(s.getUserid()==userId){
                return s;
            }
        }
        // Add them ShoppingCart neu User do chua co va return ve cai cai shoppingcart do
        return null;
    }
    
    public void addShoppingCart(int orderId, int userId) {
        String query = "INSERT INTO [dbo].[Shopping_cart]([orderId], [userId]) VALUES (?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, orderId);
            ps.setInt(2, userId);
            
            ps.executeUpdate();
            
            ps.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
