/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.DecimalFormat;

/**
 *
 * @author T495s
 */
public class OrderDetail {
    private int productID;
    private String size;
    private int quantity;
    private float total;
    
    DecimalFormat df = new DecimalFormat("#.00");

    public OrderDetail() {
    }

    public OrderDetail(int productID, String size, int quantity, float total) {
        this.productID = productID;
        this.size = size;
        this.quantity = quantity;
        this.total = Float.parseFloat(df.format(total));
    }
}
