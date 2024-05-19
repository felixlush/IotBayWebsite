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

/**
 *
 * @author henry
 */
public class DeleteCustomer extends HttpServlet {
    @Override   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {       
        //1- retrieve the current session
        HttpSession session = request.getSession();
        //3- capture the posted email
        String email = request.getParameter("email");
        //5- retrieve the manager instance from session   
        DBManager manager = (DBManager)session.getAttribute("manager"); 
        
        try {       
            //6- find user by email and password
            manager.deleteUser(email);
            session.setAttribute("deletedUser", "(Success: Deleted user)");
            request.getRequestDispatcher("CustomerInformationManagement.jsp").include(request, response);
        } catch (SQLException ex) {           
            Logger.getLogger(DeleteCustomer.class.getName()).log(Level.SEVERE, null, ex);       
        }
    }
}
