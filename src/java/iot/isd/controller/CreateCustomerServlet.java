/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package iot.isd.controller;

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
import iot.isd.controller.Validator;

/**
 *
 * @author henry
 */
public class CreateCustomerServlet extends HttpServlet {
    @Override   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {       
        // retrieve session
        HttpSession session = request.getSession();
        // create Validator class
        Validator validator = new Validator();
        // capture email
        String email = request.getParameter("email");
        // capture name    
        String name = request.getParameter("name");
        // capture password
        String password = request.getParameter("password");
        // capture phone
        String address = request.getParameter("address");
        // retrieve the manager
        DBManager manager = (DBManager)session.getAttribute("manager"); 
        
        // Test if manager is null
        if (manager == null) {
            return;
        }
        
        if (!validator.validateEmail(email)) {           
            // set incorrect email error to session  
            session.setAttribute("emailErr", "Error: Email format incorrect");
            //9- redirect user back to the CreateCustomer.jsp     
            request.getRequestDispatcher("CreateCustomer.jsp").include(request, response);
        } else if (!validator.validatePassword(name)) {                  
            // set incorrect name error to session     
            session.setAttribute("nameErr", "Error: Name format incorrect");
            //12- redirect user back to the CreateCustomer.jsp  
            request.getRequestDispatcher("CreateCustomer.jsp").include(request, response);
        } else if (!validator.validatePassword(password)) {                  
            // set incorrect password error to session    
            session.setAttribute("passErr", "Error: Password format incorrect");
            //12- redirect user back to the CreateCustomer.jsp  
            request.getRequestDispatcher("CreateCustomer.jsp").include(request, response);
        }
        
        try {       
            //6- find user by email and password
            manager.addUser(name, email, password, address, "Customer");
            session.setAttribute("createdUser", "Success: Created new customer");
            request.getRequestDispatcher("CreateCustomer.jsp").include(request, response);
        } catch (SQLException ex) {           
            Logger.getLogger(CreateCustomerServlet.class.getName()).log(Level.SEVERE, null, ex);       
        }
    }
}
