/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author T495s
 */
public class Order {
    private int oid, uID;
    private String odate, sdate;
    private String status;
    private float payment, shipping, total;
    DecimalFormat df = new DecimalFormat("#.00");
    
    public Order() {
        this.status = "delivering";
    }

    public Order(int oid, int uID, float payment, float shipping, float total) {
        
        this.oid = oid;
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        //Given Date in String format
        this.odate = sdf.format(date);
        //Specifying date format that matches the given date

        Calendar c = Calendar.getInstance();
        try {
            //Setting the date to the given date
            c.setTime(sdf.parse(odate));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        //Number of Days to add
        c.add(Calendar.DAY_OF_MONTH, 5);
        //Date after adding the days to the given date
        this.sdate = sdf.format(c.getTime());

        this.uID = uID;
        this.payment = Float.parseFloat(df.format(payment));
        this.shipping = Float.parseFloat(df.format(shipping));
        this.total = Float.parseFloat(df.format(total));
        this.status = "delivering";
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public String getOdate() {
        return odate;
    }

    public void setOdate(String odate) {
        this.odate = odate;
    }

    public String getSdate() {
        return sdate;
    }

    public void setSdate(String sdate) {
        this.sdate = sdate;
    }

    public int getuID() {
        return uID;
    }

    public void setuID(int uID) {
        this.uID = uID;
    }

    public float getPayment() {
        return payment;
    }

    public void setPayment(float payment) {
        this.payment = Float.parseFloat(df.format(payment));
    }

    public float getShipping() {
        return shipping;
    }

    public void setShipping(float shipping) {
        this.shipping = Float.parseFloat(df.format(shipping));
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = Float.parseFloat(df.format(total));
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
}
