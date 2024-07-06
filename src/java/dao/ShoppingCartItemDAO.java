/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Product;
import entity.ShoppingCart;
import entity.ShoppingCartItem;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author PC
 */
public class ShoppingCartItemDAO extends DBContext {

    private ShoppingCartDAO shoppingCDAO = new ShoppingCartDAO();
    private ProductDAO pDAO = new ProductDAO();

    public ArrayList<ShoppingCartItem> getListItem(int userId) {
        ArrayList<ShoppingCartItem> listItem = new ArrayList<>();
        ShoppingCart spC = shoppingCDAO.getShoppingCartByUserId(userId);

        String sql = "SELECT * FROM [dbo].[Shopping_cart_item] sci "
                + " JOIN Product p ON sci.productId = p.productId "
                + " JOIN Product_category pc ON p.prod_category_id = pc.prod_category_id "
                + " WHERE sci.shoppingcartId = ? ";
        ResultSet rs ;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, spC.getId());
            rs = st.executeQuery();

            while (rs.next()) {
                ShoppingCartItem sCItem = new ShoppingCartItem(rs.getInt("shoppingcart_itemId")
                        , rs.getInt("shoppingcartitem_quantity")
                        , rs.getString("size")
                        , rs.getInt("productId")
                        , spC.getId());
                listItem.add(sCItem);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return listItem;
    }
    
    public ArrayList<Product> getProductByShoppingCartItem(int userId){
        ArrayList<Product> list = new ArrayList<>();
        ArrayList<ShoppingCartItem> listItem = getListItem(userId);
        for(ShoppingCartItem s: listItem){
            Product p = pDAO.getProductByProductId(s.getProductid());
            list.add(p);
        }
        return list;
    }
    
    public void addProductToShoppingCart(int quantity, String size, int productId, int shopping_cartid){
        String query = "INSERT INTO [dbo].[Shopping_cart_item] ( [shoppingcartitem_quantity], [size], [productId], [shoppingcartId] ) " 
                + " VALUES " 
                + "( ? , ? , ? , ? )";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, quantity);
            ps.setString(2, size);
            ps.setInt(3, productId);
            ps.setInt(4, shopping_cartid);
            
            ps.executeUpdate();
            
            ps.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void removeProductFromShoppingCart(int id){
        String sql = "delete from Shopping_cart_item where Shopping_cart_item.shoppingcart_itemId = ?";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1,id);
            ps.executeUpdate();
            ps.close();
        }
        catch(SQLException e){
            System.out.println(e);
        }
    }
    
    public static void main(String[] args) {
        ShoppingCartItemDAO sciDAO = new ShoppingCartItemDAO();
        ArrayList<Product> list =  sciDAO.getProductByShoppingCartItem(1);
        System.out.println(list);
    }
}
