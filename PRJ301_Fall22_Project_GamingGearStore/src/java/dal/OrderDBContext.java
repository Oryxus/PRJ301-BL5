/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Cart;
import model.CartItem;
import model.Order;

/**
 *
 * @author Tsuki
 */
public class OrderDBContext extends DBContext {

    DecimalFormat df = new DecimalFormat("#.00");

    public void addOrder(Order order, Cart cart) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try {
            //add vào bang Order
            String sql = "INSERT INTO Orders VALUES (?,?,?,ROUND(?, 2),ROUND(?, 2),ROUND(?, 2),?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, order.getOdate());
            st.setString(2, order.getSdate());
            st.setInt(3, order.getuID());
            st.setFloat(4, Float.parseFloat(df.format(order.getPayment())));
            st.setFloat(5, Float.parseFloat(df.format(order.getShipping())));
            st.setFloat(6, Float.parseFloat(df.format(order.getPayment() + order.getShipping())));
            st.setString(7, order.getStatus());
            st.executeQuery();
        } catch (SQLException ex) {
            System.out.println("Add vao order");
        }

        try {
            //lay ra id cua Order vua add
            String sql1 = "SELECT TOP 1 orderID FROM Orders ORDER BY orderID DESC";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            //add vào bang OrderDetail
            if (rs.next()) {
                int oid = rs.getInt(1);
                for (CartItem i : cart.getItems()) {
                    try {
                        String sql2 = "INSERT INTO OrdersDetail VALUES (?,?,?,ROUND(?, 2),?,ROUND(?, 2))";
                        PreparedStatement st2 = connection.prepareStatement(sql2);
                        st2.setInt(1, oid);
                        st2.setInt(2, i.getProduct().getId());  
                        st2.setFloat(3, Float.parseFloat(df.format(i.getPrice())));
                        st2.setInt(4, i.getQuantity());
                        st2.setFloat(5, Float.parseFloat(df.format(i.getQuantity() * i.getPrice())));
                        st2.executeUpdate();
                    } catch (SQLException e) {
                        System.out.println("Them vao detail");
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("Them vao detail nhung o ngoai");
        }
       

    }
    public List<Order> getAllOrder(String uID) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * Orders ";
        if(uID!=""){
            sql = sql.concat(" WHERE uID = '"+uID+"' ");
        }
        sql = sql.concat(" ORDER BY orderID DESC");
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOid(rs.getInt(1));
                o.setOdate(rs.getString(2));
                o.setSdate(rs.getString(3));
                o.setuID(Integer.parseInt(uID));
                o.setPayment(rs.getFloat(5));
                o.setShipping(rs.getFloat(6));
                o.setTotal(rs.getFloat(7));
                o.setStatus(rs.getString(8));
                list.add(o);
            }
        } catch (SQLException ex) {
            System.out.println("lay tat ca don hang");
        }
        return list;
    }
}
