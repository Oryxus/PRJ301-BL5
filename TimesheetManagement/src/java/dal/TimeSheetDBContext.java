/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import helper.DateTimeHelper;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Absence;
import model.Employee;
import model.TimeSheet;

/**
 *
 * @author Ngo Tung Son
 */
public class TimeSheetDBContext extends DBContext {

    public int getAbsentWithP(int eid, Date begin, Date end) {
        int abP = 0;
        try {
            String sql = "select count(t.tid) from Timesheet t join Employee e \n"
                    + "						on t.eid = e.eid \n"
                    + "						join Absence a\n"
                    + "						on a.aid = t.aid\n"
                    + "						where a.reason != 'NP' and e.eid = ?"
                    + "                                         and a.date >= ?\n"
                    + "                                        	AND\n"
                    + "                                        	a.date <= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, eid);
            stm.setTimestamp(2, DateTimeHelper.getTimeStamp(DateTimeHelper.removeTime(begin)));
            stm.setTimestamp(3, DateTimeHelper.getTimeStamp(DateTimeHelper.removeTime(end)));
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                abP = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return abP;
    }

    public int getAbsentWithoutP(int eid, Date begin, Date end) {
        int ab = 0;
        try {
            String sql = "select count(t.tid) from Timesheet t join Employee e \n"
                    + "						on t.eid = e.eid \n"
                    + "						join Absence a\n"
                    + "						on a.aid = t.aid\n"
                    + "						where a.reason = 'NP' and e.eid = ?"
                    + "                                         and a.date >= ?\n"
                    + "                                        	AND\n"
                    + "                                        	a.date <= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, eid);
            stm.setTimestamp(2, DateTimeHelper.getTimeStamp(DateTimeHelper.removeTime(begin)));
            stm.setTimestamp(3, DateTimeHelper.getTimeStamp(DateTimeHelper.removeTime(end)));
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ab = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ab;
    }

    public ArrayList<Absence> getAllAbsence(Date begin, Date end) {
        ArrayList<Absence> absences = new ArrayList<>();
        try {
            String sql = "select e.eid,e.ename,p.pname,a.date,a.sid,a.reason \n"
                    + "from Timesheet t left join Absence a\n"
                    + "join Employee e on e.eid = a.eid\n"
                    + "join Position p on p.pid = e.pid\n"
                    + "on t.aid = a.aid where t.checkin is Null \n"
                    + "and a.date >= ?\n"
                    + "AND a.date <= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setTimestamp(1, DateTimeHelper.getTimeStamp(DateTimeHelper.removeTime(begin)));
            stm.setTimestamp(2, DateTimeHelper.getTimeStamp(DateTimeHelper.removeTime(end)));
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Absence absence = new Absence();
                Employee employee = new Employee();
                employee.setId(rs.getInt("eid"));
                employee.setName(rs.getString("ename"));
                employee.setPosition(rs.getString("pname"));
                absence.setEmployee(employee);
                absence.setDate(rs.getDate("date"));
                absence.setSid(rs.getInt("sid"));
                absence.setReason(rs.getString("reason"));
                absences.add(absence);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return absences;
    }

}
