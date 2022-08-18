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
import model.TimeSheet;

/**
 *
 * @author Ngo Tung Son
 */
public class TimeSheetDBContext extends DBContext {

    public int getAbsentWithP(int eid) {
        int abP = 0;
        try {
            String sql = "select count(t.tid) from Timesheet t join Employee e \n"
                    + "						on t.eid = e.eid \n"
                    + "						join Absence a\n"
                    + "						on a.aid = t.aid\n"
                    + "						where a.reason is not NULL and e.eid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, eid);
            ResultSet rs = stm.executeQuery();
            abP = rs.getInt(1);
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return abP;
    }

    public int getAbsentWithoutP(int eid) {
        int ab = 0;
        try {
            String sql = "select count (t.tid) from Timesheet t join Employee e \n"
                    + "	on t.eid=e.eid where t.checkin is Null and t.aid is null and e.eid=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, eid);
            ResultSet rs = stm.executeQuery();
            ab = rs.getInt(1);
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ab;
    }

    public int getSalaryPerHour(int eid) {
        int sph = 0;
        try {
            String sql = "select p.salaryPerHour from Position p join Employee e\n"
                    + "	on p.pid=e.pid where e.eid=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, eid);
            ResultSet rs = stm.executeQuery();
            sph = rs.getInt(1);           
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sph;
    }
    public static void main(String[] args) {
        TimeSheetDBContext s = new TimeSheetDBContext();
        int t = s.getAbsentWithP(4);
        System.out.println(t);
    }
}
