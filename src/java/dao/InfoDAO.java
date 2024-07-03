/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Information;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author ASUS
 */
public class InfoDAO extends DBContext {

    public List<Information> getAllInformation() {
        List<Information> list = new ArrayList<>();
        String sql = "Select * from Information";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Information info = new Information(rs.getInt(1), rs.getString(2), rs.getString(3));
                list.add(info);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public String getAddress(List<Information> info) throws Exception {
        for (int i = 0; i < info.size(); i++) {
            if (info.get(i).getName().equals("address")) {
                return info.get(i).getContent();
            }
        }
        return "";
    }

    public String getTel(List<Information> info) throws Exception {
        for (int i = 0; i < info.size(); i++) {
            if (info.get(i).getName().equals("tel")) {
                return info.get(i).getContent();
            }
        }
        return "";
    }

    public String getMail(List<Information> info) throws Exception {
        for (int i = 0; i < info.size(); i++) {
            if (info.get(i).getName().equals("mail")) {
                return info.get(i).getContent();
            }
        }
        return "";
    }

    public List<String> getOpenHours(List<Information> info) throws Exception {
        List<String> days = new ArrayList<>();
        for (int i = 0; i < info.size(); i++) {
            if (info.get(i).getName().contains("day")) {
                days.add(info.get(i).getName() + ": " + info.get(i).getContent());
            }
        }
        return days;
    }
    
    public static void main(String[] args) {
        InfoDAO infoDAO = new InfoDAO();
        List<Information>list = infoDAO.getAllInformation();
        System.out.println(list);
    }
}
