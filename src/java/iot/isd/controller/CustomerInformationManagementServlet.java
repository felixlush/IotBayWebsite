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
import java.util.ArrayList;
import iot.isd.model.User;

/**
 *
 * @author henry
 */
public class CustomerInformationManagementServlet extends HttpServlet {
    @Override   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {       
        //1- retrieve the current session
        HttpSession session = request.getSession();
        //2- retrieve the manager instance from session  
        //3- capture the posted password
        String name = (String)request.getParameter("name");
        
        //3- capture the posted phone
        String email = (String)request.getParameter("email");
        DBManager manager = (DBManager)session.getAttribute("manager"); 

        try {
            ArrayList<User> listOfUsers = manager.listCustomers(name, email);
            session.setAttribute("listOfUsers", listOfUsers);
            request.getRequestDispatcher("CustomerInformationManagement.jsp").include(request, response);
        } catch (SQLException ex) {           
            Logger.getLogger(CustomerInformationManagementServlet.class.getName()).log(Level.SEVERE, null, ex);       
        }
    }
}
