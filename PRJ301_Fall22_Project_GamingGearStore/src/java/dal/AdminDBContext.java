/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Product;

/**
 *
 * @author T495s
 */
public class AdminDBContext extends DBContext {

    public void deleteAccount(String id) {
        String query = "delete from Account where uID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertAccount(String user, String pass, String address, String phone, String email, String role) {
        String query = "insert into Account values(?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, address);
            ps.setString(4, phone);
            ps.setString(5, email);
            ps.setString(6, role);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Account getAccountByID(String id) {
        String query = "select * from Account where uID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt("uID"),
                        rs.getString("user"),
                        rs.getString("pass"),
                        rs.getInt("role"),
                        rs.getString("address"),
                        rs.getString("phone"),
                        rs.getString("email"));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void updateAccount(String id, String user, String pass, String role, String address, String phone, String email) {
        String query = "update Account set [user] = ?,"
                + "pass = ?,"
                + "[role] = ?,"
                + "address = ?,"
                + "phone = ?,"
                + "email = ? where [uID] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, role);
            ps.setString(4, address);
            ps.setString(5, phone);
            ps.setString(6, email);
            ps.setString(7, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int getTotalAccount() {
        String query = "select count(*) from Account";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Account> pagingAccount(int index) {
        List<Account> list = new ArrayList<>();
        String query = "select * from Account "
                + "order by uID "
                + "offset ? rows fetch next 10 rows only;";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, ((index - 1) * 10));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt("uID"),
                        rs.getString("user"),
                        rs.getString("pass"),
                        rs.getInt("role"),
                        rs.getString("address"),
                        rs.getString("phone"),
                        rs.getString("email")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Account> getAllSeller() {
        List<Account> list = new ArrayList<>();
        String query = "select * from Account where role = 1";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt("uID"),
                        rs.getString("user"),
                        rs.getString("pass"),
                        rs.getInt("role"),
                        rs.getString("address"),
                        rs.getString("phone"),
                        rs.getString("email")));
            }
        } catch (Exception e) {
        }
        return list;
    }

}
