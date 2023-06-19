/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author T495s
 */
public class Cart {

    private List<CartItem> items;
    private int uID;
    private float total;

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public Cart() {
    }

    public Cart(int uID) {
        items = new ArrayList<>();
        this.uID = uID;
    }

    public List<CartItem> getItems() {
        return items;
    }

    public void setItems(List<CartItem> items) {
        this.items = items;
    }

    public int getuID() {
        return uID;
    }

    public void setuID(int uID) {
        this.uID = uID;
    }

    

    public int getItemQuantity(int id) {
        return getExactItem(id).getQuantity();
    }

    public CartItem getExactItem(int id) {
        for (CartItem i : items) {
            int productID = i.getProduct().getId();           
            if (productID == id) {
                return i;
            }
        }
        return null;
    }
// add 1 sản phẩm vào giỏ, nếu có rồi thì tăng số lượng

    public void addItem(CartItem t) {
        if (getExactItem(t.getProduct().getId()) != null) {
            CartItem m = getExactItem(t.getProduct().getId());
            m.setQuantity(m.getQuantity() + t.getQuantity());
        } else {
            items.add(t);
        }
    }
//loại sản phẩm khỏi giỏ

    public void removeItem(int id) {
        if (getExactItem(id) != null) {
            items.remove(getExactItem(id));
        }
    }
//tổng tiền của cả giỏ hàng – sẽ add vào bảng Order

    public float getTotalMoney() {
        float t = 0;
        for (CartItem i : items) {
            t += (i.getQuantity() * i.getPrice());
        }
        return t;
    }
}
