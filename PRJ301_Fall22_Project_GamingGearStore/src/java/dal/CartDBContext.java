/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import model.Cart;
import model.CartItem;
import model.Product;

/**
 *
 * @author T495s
 */
public class CartDBContext extends DBContext{
    DecimalFormat df = new DecimalFormat("#.00");
    
    public Cart getCart(int uID) {
        
        Cart cart = new Cart(uID);
        String sql = "SELECT * FROM Product INNER JOIN Cart ON Product.id = Cart.pID where uID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getFloat(4),
                        rs.getString(5),
                        rs.getString(6));                
                int quantity = rs.getInt(11);
                float price = p.getPrice();
                CartItem t = new CartItem(p, quantity, price);
                cart.addItem(t);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return cart;
    }

    public void updateCart(Cart cart) {
        String sql1 = "DELETE FROM Cart WHERE uID = ?";
        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, cart.getuID());
            st1.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
        for (int i = 0; i < cart.getItems().size(); i++) {
            String sql2 = "INSERT INTO Cart VALUES (?,?,?,?,?,ROUND(?, 2),ROUND(?, 2))";
            CartItem t = cart.getItems().get(i);
            try {
                PreparedStatement st2 = connection.prepareStatement(sql2);                
                st2.setInt(1, cart.getuID());
                st2.setInt(2, t.getProduct().getId());               
                st2.setInt(3, t.getQuantity());
                st2.setFloat(4, Float.parseFloat(df.format(t.getPrice())));
                st2.setFloat(5, Float.parseFloat(df.format(t.getPrice()))*t.getQuantity());
                st2.executeQuery();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
    }
}
