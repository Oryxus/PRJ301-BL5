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
import model.Employee;
import model.TimeSheet;

/**
 *
 * @author Ngo Tung Son
 */
public class EmployeeDBContext extends DBContext {

    public ArrayList<Employee> getEmployees(Date begin, Date end) {
        ArrayList<Employee> employees = new ArrayList<>();
        try {
            String sql = "SELECT e.eid,e.ename,p.pname,ISNULL(t.tid,-1) tid,t.checkin,t.checkout,p.salaryPerHour,t.aid,\n"
                    + "                                         al.bonus, g.gross*p.grossPercentage as grossP\n"
                    + "                                        FROM Employee e\n"
                    + "                                        LEFT JOIN (SELECT * FROM Timesheet WHERE \n"
                    + "                                        checkin >= ?  \n"
                    + "                                        AND\n"
                    + "                                        checkin <= ?) t \n"
                    + "                                        ON e.eid = t.eid\n"
                    + "						join Position p\n"
                    + "						on p.pid = e.pid\n"
                    + "						join Allowance al\n"
                    + "						on al.eid=e.eid\n"
                    + "						join Gross g \n"
                    + "						on al.gid = g.gid";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setTimestamp(1, DateTimeHelper.getTimeStamp(DateTimeHelper.removeTime(begin)));
            stm.setTimestamp(2, DateTimeHelper.getTimeStamp(DateTimeHelper.removeTime(end)));
            ResultSet rs = stm.executeQuery();
            Employee curEmp = new Employee();
            TimeSheetDBContext tsdb = new TimeSheetDBContext();
            curEmp.setId(-1);
            while (rs.next()) {
                int eid = rs.getInt("eid");
                if (eid != curEmp.getId()) {
                    curEmp = new Employee();
                    curEmp.setId(eid);
                    curEmp.setName(rs.getString("ename"));
                    curEmp.setPosition(rs.getString("pname"));
                    curEmp.setSalaryPerHour(rs.getDouble("salaryPerHour"));
                    curEmp.setAbsentWithP(tsdb.getAbsentWithP(eid, begin, end));
                    curEmp.setAbsentWithoutP(tsdb.getAbsentWithoutP(eid));
                    curEmp.setBonus(rs.getDouble("bonus"));
                    curEmp.setGrossPercentage(rs.getDouble("grossP"));
                    employees.add(curEmp);
                }
                int tid = rs.getInt("tid");
                if (tid != -1) {
                    TimeSheet t = new TimeSheet();
                    t.setEmployee(curEmp);
                    t.setId(tid);
                    t.setCheckin(DateTimeHelper.getDateFrom(rs.getTimestamp("checkin")));
                    t.setCheckout(DateTimeHelper.getDateFrom(rs.getTimestamp("checkout")));
                    t.setAid(rs.getInt("aid"));
                    curEmp.getTimesheets().add(t);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return employees;
    }

}
