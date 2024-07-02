/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author ASUS
 */
public class User {
    private int id;
    private String username;
    private String name;
    private String password;
    private String address;
    private String phone;
    private String email;
    private int isSell;
    private int isAdmin;

    public User() {
    }

    public User(int id, String username, String name, String password, String address, String phone, String email, int isSell, int isAdmin) {
        this.id = id;
        this.username = username;
        this.name = name;
        this.password = password;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.isSell = isSell;
        this.isAdmin = isAdmin;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getIsSell() {
        return isSell;
    }

    public void setIsSell(int isSell) {
        this.isSell = isSell;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    @Override
    public String toString() {
        return "\nUser{" + "id=" + id + ", username=" + username + ", name=" + name + ", password=" + password + ", address=" + address + ", phone=" + phone + ", email=" + email + ", isSell=" + isSell + ", isAdmin=" + isAdmin + '}';
    }
}
