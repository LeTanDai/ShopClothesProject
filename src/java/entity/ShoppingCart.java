/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author lethe
 */
public class ShoppingCart {

    private int id;
    private int orderid;
    private int userid;

    public ShoppingCart() {
    }

    public ShoppingCart(int id, int orderid, int userid) {
        this.id = id;
        this.orderid = orderid;
        this.userid = userid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    @Override
    public String toString() {
        return "ShoppingCart{" + "id=" + id + ", orderid=" + orderid + ", userid=" + userid + '}';
    }

    
    
    

}
