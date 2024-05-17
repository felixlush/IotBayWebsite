/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package iot.isd.controller;

import iot.isd.model.dao.DBManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author julio
 */
public class CreateStaffServlet extends HttpServlet {
    @Override  
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {      
        //1- retrieve the current session
        HttpSession session = request.getSession();
        //2- create an instance of the Validator class
        Validator validator = new Validator();
        //3- capture the posted email
        String email = request.getParameter("email");
        //4- capture the posted name    
        String name = request.getParameter("name");
        //3- capture the posted password
        String password = request.getParameter("password");
        //3- capture the posted phone
        String address = request.getParameter("address");
        String type = request.getParameter("TYPE");
        //5- retrieve the manager instance from session  
        DBManager manager = (DBManager)session.getAttribute("manager");
       
        if (manager == null) {
            return;
        }
       
      
       
        try {      
            //6- find user by email and password
            manager.addStaff(name, email, password, address, type);
            session.setAttribute("createdUser", "Success: Created new user");
            request.getRequestDispatcher("createStaff.jsp").include(request, response);
            response.sendRedirect("staffList.jsp");
        } catch (SQLException ex) {          
            Logger.getLogger(CreateStaffServlet.class.getName()).log(Level.SEVERE, null, ex);      
       }
        response.sendRedirect("staffList.jsp");
    }
}