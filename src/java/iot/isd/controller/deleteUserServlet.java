/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package iot.isd.controller;

import iot.isd.model.User;
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
 * @author thebigmoney
 */
public class deleteUserServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        User user = (User)session.getAttribute("user"); 

        try {
            if (user != null){
                manager.deleteUser(user.getEmail());
                session.removeAttribute("user");
                session.setAttribute("deletion", "Deletion was successful");
            } else {
                session.setAttribute("deletion", "Deletion was not successful!");
            }
            response.sendRedirect("index.jsp"); // Redirect to the home page after processing
        } catch (SQLException ex) {
            Logger.getLogger(UpdateUserServlet.class.getName()).log(Level.SEVERE, null, ex);
            session.setAttribute("deletion", "Database error: " + ex.getMessage());
            response.sendRedirect("editUser.jsp"); // Redirect on error
        }
    }

    

}
