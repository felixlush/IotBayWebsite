package iot.isd.controller;

import iot.isd.model.LogEntry;
import iot.isd.model.User;
import iot.isd.model.dao.DBManager;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class StaffListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String search = request.getParameter("search");
        DBManager manager = (DBManager)session.getAttribute("manager");
        
        try {
            List<User> staffList = manager.getStaffList(search);
            System.out.println(staffList.size());
            session.setAttribute("staffList", staffList);            
        } catch (SQLException ex) {
            Logger.getLogger(StaffListServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    }
}
