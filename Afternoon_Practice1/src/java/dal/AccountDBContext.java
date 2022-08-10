/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Group;

/**
 *
 * @author T495s
 */
public class AccountDBContext extends DBContext {

    public Account getAccount(String username, String password) {
        try {
            String sql = "SELECT [username],[password] FROM Account \n"
                    + "WHERE [username] = ?\n"
                    + "AND [password] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setUsername(username);
                return account;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Group> getGroups(String username) {
        ArrayList<Group> groups = new ArrayList<>();
        try {
            String sql = "SELECT g.gid,g.name FROM [Group] g INNER JOIN Account_Group ag\n"
                    + "ON g.gid = ag.gid \n"
                    + "AND ag.username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Group g = new Group();
                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("name"));
                groups.add(g);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return groups;
    }
}
