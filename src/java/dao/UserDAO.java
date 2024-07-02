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
                + "     VALUES\n" + "(?,0,?,0,0,?,0,0)";
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
     public void editProfile(String username, String password, String email, int userID) {
        String sql = "UPDATE  Users set [userName]=?,\r\n"
        		+ "[pass]=?,\r\n"
        		+ "[email]=?\r\n"
        		+ "where [userId] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            st.setString(3, email);
            st.setInt(4, userID);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
