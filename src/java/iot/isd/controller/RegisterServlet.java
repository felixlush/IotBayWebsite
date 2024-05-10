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

import iot.isd.model.User;

import iot.isd.model.dao.DBManager;
import iot.isd.model.User;



public class RegisterServlet extends HttpServlet {


    @Override   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       

        HttpSession session = request.getSession();
        Validator validator = new Validator();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        DBManager manager = (DBManager) session.getAttribute("manager");
        validator.clear(session);
        System.out.println("Starting database");

        if (manager == null) {
            throw new IllegalStateException("DBManager not set in session");
        }
        
        if (email == null) {
            throw new IllegalStateException("Email not set in session");
        }

        if (!validator.validateEmail(email)) {
            System.out.println("Email Error");
            session.setAttribute("emailErr", "Error: Email format incorrect");
            request.getRequestDispatcher("register.jsp").include(request, response);
        } else if (!validator.validatePassword(password)) {
            System.out.println("Pass Error");
            session.setAttribute("passErr", "Error: Password format incorrect");       
            request.getRequestDispatcher("register.jsp").include(request, response);
        } else if (!validator.validateName(name)) {      
            System.out.println("Name Error");            
            session.setAttribute("nameErr", "Error: Name format incorrect");       
            request.getRequestDispatcher("register.jsp").include(request, response);
        } else {
            try {
                User exist = manager.findUser(email, password);
                if (exist != null){
                    session.setAttribute("existErr", "User already exists!");
                    request.getRequestDispatcher("register.jsp").include(request, response);
                } else {
                    manager.addUser(email, password, name, address);
                    User user = new User(name, email, password, address);
                    session.setAttribute("user", user);
                    request.getRequestDispatcher("main.jsp").include(request, response);
                }
            } catch (SQLException | NullPointerException ex) {
                 System.out.println(ex.getMessage() == null ? ex.getMessage() : ex.getMessage());
            }
        }
    }

}