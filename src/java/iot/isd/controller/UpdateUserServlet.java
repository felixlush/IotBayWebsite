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
public class UpdateUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       


            HttpSession session = request.getSession();
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            DBManager manager = (DBManager) session.getAttribute("manager");
            User user = (User)session.getAttribute("user"); 

            try {
                if (user != null){
                    System.out.println("User is not null");
                    manager.updateUser(email, name, password, address);
                    User updatedUser = new User(name, email, password, address);
                    session.setAttribute("user", updatedUser);
                    session.setAttribute("update", "Update was successful");
                    request.getRequestDispatcher("editUser.jsp").include(request, response);
                } else {
                    session.setAttribute("update", "Update not successful!");
                    request.getRequestDispatcher("editUser.jsp").include(request, response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(UpdateUserServlet.class.getName()).log(Level.SEVERE, null, ex);
                session.setAttribute("update", "Database error: " + ex.getMessage());
                response.sendRedirect("editUser.jsp");
            }
            response.sendRedirect("editUser.jsp");

    }

}
