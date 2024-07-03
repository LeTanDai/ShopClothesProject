/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class ShoppingCartItem {
    private int id;
    private int quantity;
    private String size;
    private int productid;
    private int shopping_cartid;

    public ShoppingCartItem() {
    }

    public ShoppingCartItem(int id, int quantity, String size, int productid, int shopping_cartid) {
        this.id = id;
        this.quantity = quantity;
        this.size = size;
        this.productid = productid;
        this.shopping_cartid = shopping_cartid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public int getShopping_cartid() {
        return shopping_cartid;
    }

    public void setShopping_cartid(int shopping_cartid) {
        this.shopping_cartid = shopping_cartid;
    }

    @Override
    public String toString() {
        return "ShoppingCartItem{" + "id=" + id + ", quantity=" + quantity + ", size=" + size + ", productid=" + productid + ", shopping_cartid=" + shopping_cartid + '}';
    }

    
    
    
}
