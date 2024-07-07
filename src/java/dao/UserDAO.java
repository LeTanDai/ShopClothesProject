/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class UserDAO extends DBContext {

    public User checkLogin(String username, String password) {
        String sql = "Select * from Users where userName = ? and pass = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getInt("userId"), rs.getString("userName"), rs.getString("name_user"), rs.getString("pass"), rs.getString("userAddress"), rs.getString("phone"), rs.getString("email"),rs.getInt("isSell"), rs.getInt("isAdmin"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public User checkAccountExist(String username) {
        String sql = "Select * from Users where userName = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getInt("userId"), rs.getString("userName"), rs.getString("name_user"), rs.getString("pass"), rs.getString("userAddress"), rs.getString("phone"), rs.getString("email"),rs.getInt("isSell"), rs.getInt("isAdmin"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public void signup(String username, String password,String email) {
        String sql = "INSERT INTO [dbo].[Users]\n"
                + "     VALUES\n" + "(?,'',?,'','',?,'','')";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            st.setString(3, email);
            st.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    public User getUserByUsername(String username) {
        String sql = "SELECT * FROM Users WHERE userName = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getInt("userId"), rs.getString("userName"), rs.getString("name_user"), rs.getString("pass"), rs.getString("userAddress"), rs.getString("phone"), rs.getString("email"),rs.getInt("isSell"), rs.getInt("isAdmin"));
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updatePassword(User user) {
        String sql = "UPDATE Users SET pass = ? WHERE userName = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getPassword());
            st.setString(2, user.getUsername());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
     public void editProfile(String username, String password, String name, String address, String phone, String email, int userID) {
        String sql = "UPDATE  Users set [userName]=?,\r\n"
                        +"[name_user]=?,\r\n"
        		+ "[pass]=?,\r\n"
                        +"[userAddress]=?,\r\n"
                        +"[phone]=?,\r\n"
        		+ "[email]=?\r\n"
        		+ "where [userId] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, name);
            st.setString(3, password);
            st.setString(4,address);
            st.setString(5,phone);
            st.setString(6,email);
            st.setInt(7,userID);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
     
     public int countCustomer(){
         int count = 0;
        String sql = "SELECT * FROM Users WHERE isSell = ? AND isAdmin = ?";
        try {
            PreparedStatement state = connection.prepareStatement(sql);
            state.setInt(1, 1);
            state.setInt(2, 0);
            ResultSet rs = state.executeQuery();
            while (rs.next()) {
                count++;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
     }
     
     public int countAdmin(){
         int count = 0;
        String sql = "SELECT * FROM Users WHERE isSell = ? AND isAdmin = ?";
        try {
            PreparedStatement state = connection.prepareStatement(sql);
            state.setInt(1, 0);
            state.setInt(2, 1);
            ResultSet rs = state.executeQuery();
            while (rs.next()) {
                count++;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
     public void updateUser(int id, String name, String address, String phone, String email, int isSell, int isAdmin) {
        String sql = "UPDATE Users SET name_user = ?, userAddress = ?, phone = ?, email = ?, isSell = ?, isAdmin = ? WHERE userId = ?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, address);
            st.setString(3, phone);
            st.setString(4, email);
            st.setInt(5, isSell);
            st.setInt(6, isAdmin);
            st.setInt(7, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public User getUserById(int id) {
        String sql = "SELECT * FROM Users WHERE userId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("userId"),
                        rs.getString("userName"),
                        rs.getString("name_user"),
                        rs.getString("pass"),
                        rs.getString("userAddress"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getInt("isSell"),
                        rs.getInt("isAdmin")
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insertUser(User u) {
        String sql = "INSERT INTO [dbo].[Users]([userName],[name_user],[pass],[userAddress],[phone],[email],[isSell],[isAdmin])"
                + "VALUES (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getUsername());
            st.setString(2, u.getName());
            st.setString(3, u.getPassword());
            st.setString(4, u.getAddress());
            st.setString(5, u.getPhone());
            st.setString(6, u.getEmail());
            st.setInt(7, u.getIsSell());
            st.setInt(8, u.getIsAdmin());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteUser(String uid) {
        String sql = "Delete from [dbo].[Users]"
                + "where userId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, uid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();
        String sql = "Select * from Users";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt("userId"), rs.getString("userName"), rs.getString("name_user"), rs.getString("pass"), rs.getString("userAddress"), rs.getString("phone"), rs.getString("email"), rs.getInt("isSell"), rs.getInt("isAdmin"));
                list.add(user);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
     
     public static void main(String[] args) {
        UserDAO u = new UserDAO();
        int countC = u.countCustomer();
        int countA = u.countAdmin();
         System.out.println("Customer : " + countC + 
                 "\n" + "Admin : " + countA);
    }
}
