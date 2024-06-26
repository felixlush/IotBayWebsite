/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package iot.isd.controller;

import iot.isd.model.dao.DBConnector;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import iot.isd.model.dao.DBManager;
import java.sql.Connection;

/**
 *
 * @author henry
 */
public class EditCustomerServlet extends HttpServlet {
    @Override   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {       
        // retrieve the current session
        HttpSession session = request.getSession();
        // create an instance of the Validator class
        Validator validator = new Validator();
        // capture the posted email
        String email = request.getParameter("email");
        // capture the posted name    
        String name = request.getParameter("name");
        // capture password
        String password = request.getParameter("password");
        // capture the posted phone
        String address = request.getParameter("address");
        
        String status = request.getParameter("status");
        // retrieve the manager instance from session  
        DBManager manager = (DBManager)session.getAttribute("manager"); 
        
        validator.clear(session);
        
        if (name==null) {
            request.getRequestDispatcher("EditCustomer.jsp").include(request, response);
        }
        
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
        
        if (!validator.validatePassword(password)) {                  
            //11-set incorrect password error to the session     
            session.setAttribute("passErr", "Error: Password format incorrect");
            //12- redirect user back to the CreateCustomer.jsp  
            request.getRequestDispatcher("EditCustomer.jsp").include(request, response);
        }
        
        try {       
            //6- find user by email and password
            manager.updateUser(email, name, password, address, status);
            session.setAttribute("editedUser", "(Success: Edited user)");
            request.getRequestDispatcher("EditCustomer.jsp").include(request, response);
        } catch (SQLException ex) {           
            Logger.getLogger(EditCustomerServlet.class.getName()).log(Level.SEVERE, null, ex);       
        }
    }
}
