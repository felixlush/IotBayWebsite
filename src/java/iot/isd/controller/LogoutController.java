package iot.isd.controller;

import iot.isd.model.LogEntry;
import iot.isd.model.User;
import iot.isd.model.dao.DBManager;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Get session if exists, no creation
        Time timeNow = new Time(System.currentTimeMillis());
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
        String timeString = timeFormat.format(timeNow);        
        if (session != null) {
            User user = (User) session.getAttribute("user");
            System.out.println("Getting User");
            if (user != null) {
                DBManager manager = (DBManager) session.getAttribute("manager");
                try {
                    LogEntry logEntry = (LogEntry)session.getAttribute("logEntry");
                    logEntry.setLogoutTime(timeString);
                    // Assume you have a method to log the logout activity
                    System.out.println("Logging logout");
                    manager.logLogin(logEntry);
                } catch (SQLException ex) {
                    System.out.println("Error logging out: " + ex.getMessage());
                    ex.printStackTrace();
                }
            }
            session.invalidate(); // Invalidate session to clear all attributes
        }
        response.sendRedirect("index.jsp"); // Redirect to the homepage or login page
    }
}
