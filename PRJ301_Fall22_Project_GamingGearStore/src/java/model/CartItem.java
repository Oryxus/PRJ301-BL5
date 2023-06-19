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
public class CartItem {
    private Product product;
    private int quantity;
    private float price;
    
    DecimalFormat df = new DecimalFormat("#.00");

    public CartItem() {
    }

    public CartItem(Product product, int quantity, float price) {
        this.product = product;
        this.quantity = quantity;
        this.price = Float.parseFloat(df.format(price));
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = Float.parseFloat(df.format(price));
    }

    

    
    
    

}
