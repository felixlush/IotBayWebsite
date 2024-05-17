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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.jboss.logging.Logger;
import org.jboss.logging.Logger.Level;

/**
 *
 * @author thebigmoney
 */
public class EditServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       


            HttpSession session = request.getSession();
            Validator validator = new Validator();
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            DBManager manager = (DBManager) session.getAttribute("manager");
            User user = null;

            try {
                user = manager.findUser(email, password);
                if (user != null){
                    session.setAttribute("user", user);
                    request.getRequestDispatcher("main.jsp").include(request, response);
                } else {
                    session.setAttribute("existErr", "User does not exist in the Database!");
                    request.getRequestDispatcher("login.jsp").include(request, response);
                }
            } catch (SQLException ex) {
//                Logger.getLogger(EditServlet.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println(ex.getMessage() == null ? "User does not exists" : "welcome");
            }            

    }

}
