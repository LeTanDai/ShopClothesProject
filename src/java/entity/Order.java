/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class Order {
    private int id;
    private Date date;
    private double total;
    private String status;
    private String address_shipping;
    private int userid;

    public Order() {
    }

    public Order(int id, Date date, double total, String status, String address_shipping, int userid) {
        this.id = id;
        this.date = date;
        this.total = total;
        this.status = status;
        this.address_shipping = address_shipping;
        this.userid = userid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAddress_shipping() {
        return address_shipping;
    }

    public void setAddress_shipping(String address_shipping) {
        this.address_shipping = address_shipping;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }
    
    
}
