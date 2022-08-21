/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author Ngo Tung Son
 */
public class Employee {
    private int id;
    private String name;
    private String position;
    private double salaryPerHour;   
    private int absentWithP;
    private int absentWithoutP;
    private double bonus;
    private double grossPercentage;

    private ArrayList<Absence> getAbsences = new ArrayList<>();

    public int getAbsentWithP() {
        return absentWithP;
    }

    public void setAbsentWithP(int absentWithP) {
        this.absentWithP = absentWithP;
    }

    public int getAbsentWithoutP() {
        return absentWithoutP;
    }

    public void setAbsentWithoutP(int absentWithoutP) {
        this.absentWithoutP = absentWithoutP;
    }

    public double getSalaryPerHour() {
        return salaryPerHour;
    }

    public void setSalaryPerHour(double salaryPerHour) {
        this.salaryPerHour = salaryPerHour;
    }

    public double getBonus() {
        return bonus;
    }

    public void setBonus(double bonus) {
        this.bonus = bonus;
    }

    public double getGrossPercentage() {
        return grossPercentage;
    }

    public void setGrossPercentage(double grossPercentage) {
        this.grossPercentage = grossPercentage;
    }
           
  
    public Employee() {
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }
    private ArrayList<TimeSheet> timesheets = new ArrayList<>();
    
    public int getNumberOfWorkingDays()
    {
        return timesheets.size();
    }
    
    public float getNumberOfWorkingHours()
    {
        float sum = 0;
        for (TimeSheet timesheet : timesheets) {
            sum+= timesheet.getWorkingHours();
        }
        return sum;
    }
    
    
    
    public ArrayList<TimeSheet> getTimesheets() {
        return timesheets;
    }

    public void setTimesheets(ArrayList<TimeSheet> timesheets) {
        this.timesheets = timesheets;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
}
