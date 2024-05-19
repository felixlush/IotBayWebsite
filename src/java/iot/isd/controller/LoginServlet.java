package iot.isd.controller;

import iot.isd.model.LogEntry;
import iot.isd.model.User;
import iot.isd.model.dao.DBConnector;
import iot.isd.model.dao.DBManager;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.Time;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    @Override   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        DBManager manager = (DBManager)session.getAttribute("manager");
        
        Date dateNow = new Date(System.currentTimeMillis());
        Time timeNow = new Time(System.currentTimeMillis());

        // Create SimpleDateFormat instances
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");

        // Format Date and Time to String
        String dateString = dateFormat.format(dateNow);
        String timeString = timeFormat.format(timeNow);

        // Clear previous errors
        validator.clear(session);

        if (manager == null) {
            try {
                // Assuming DBConnector is a class that manages your database connection
                DBConnector db = new DBConnector();
                Connection conn = db.openConnection();  // open a new connection
                if (conn != null) {
                    manager = new DBManager(conn);
                    session.setAttribute("manager", manager);  // set the new manager in the session
                } else {
                    throw new IllegalStateException("Could not open a connection to the database");
                }
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, "Database connection error", ex);
                response.sendRedirect("errorPage.jsp"); // Redirect to an error page or similar
                return;
            }
        }

        if (email == null || email.isEmpty()) {
            session.setAttribute("emailErr", "Email cannot be empty");
            response.sendRedirect("login.jsp");
            return;
        }

        if (!validator.validateEmail(email)) {
            session.setAttribute("emailErr", "Error: Email format incorrect");
            response.sendRedirect("login.jsp");
            return;
        }

        if (!validator.validatePassword(password)) {
            session.setAttribute("passErr", "Error: Password format incorrect");
            response.sendRedirect("login.jsp");
            return;
        }

        User user = null;
        try {
            user = manager.findUser(email, password);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            session.setAttribute("loginError", "System error occurred. Please try again.");
            response.sendRedirect("login.jsp");
            return;
        }

        if (user != null) {
            session.setAttribute("user", user);

            try {
                LogEntry logEntry = new LogEntry(email, dateString, timeString);
                session.setAttribute("logEntry", logEntry);
                System.out.println("Logging user logs");
                List<LogEntry> logs = manager.getUserLogs(email);
                if (logs != null) {
                    System.out.println("Logs found: " + logs.size());
                } else {
                    System.out.println("No logs found");
                }
                session.setAttribute("logs", logs);
                System.out.println("Logs set in session");
                response.sendRedirect("userAccount.jsp");  
            } catch (SQLException ex) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, "Error logging login attempt", ex);
                // Continue to user account page even if logging fails
                response.sendRedirect("userAccount.jsp");
            }
        } else {
            System.out.println("Couldn't find user");
            session.setAttribute("existErr", "User does not exist in the Database!");
            response.sendRedirect("login.jsp");
        }
    }
}
