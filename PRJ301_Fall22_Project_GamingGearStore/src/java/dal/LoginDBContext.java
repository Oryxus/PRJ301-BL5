/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Account;

/**
 *
 * @author T495s
 */
public class LoginDBContext extends DBContext{
    public Account login(String user, String pass) {
        String query = "select * from Account\n"
                + "where [user] = ?\n"
                + "and pass = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
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

    public Account checkAccountExist(String user) {
        String query = "select * from Account\n"
                + "where [user] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, user);
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

    public void signUp(String user, String pass) {
        String query = "insert into Account\n"
                + "values(?,?,?,?,?,0)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, "");
            ps.setString(4, "");
            ps.setString(5, "");
            ps.executeUpdate();

        } catch (Exception e) {
        }
    } 
    
}
