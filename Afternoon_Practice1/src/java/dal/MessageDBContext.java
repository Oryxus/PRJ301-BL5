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
import model.Message;

/**
 *
 * @author T495s
 */
public class MessageDBContext extends DBContext {

    public ArrayList<Message> getMessages(String receiver) {
        ArrayList<Message> messages = new ArrayList<>();
        try {
            String sql = "SELECT m.[mid]\n"
                    + "      ,m.[content]\n"
                    + "      ,m.[sender]\n"
                    + "      ,m.[receiver]\n"
                    + "  FROM [Message] m \n"
                    + "		INNER JOIN Account a \n"
                    + "		ON m.sender = a.username\n"
                    + "		WHERE m.receiver = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, receiver);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Message m = new Message();
                m.setId(rs.getInt("mid"));
                m.setContent(rs.getString("content"));
                Account sender = new Account();
                sender.setUsername(rs.getString("sender"));
                m.setSender(sender);
                messages.add(m);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MessageDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return messages;
    }
}
