package iot.isd.controller;



import java.io.IOException;

import java.sql.Connection;

import java.sql.SQLException;

import java.util.logging.Level;

import java.util.logging.Logger;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import iot.isd.model.dao.*;



public class ConnServlet extends HttpServlet {



    private DBConnector db;

    private DBManager manager;

    private Connection conn;



    @Override //Create and instance of DBConnector for the deployment session

    public void init() {

        try {

            db = new DBConnector(); //Create a database conncection when the application starts

        } catch (ClassNotFoundException | SQLException ex) {

            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);

        }      

    }



     //Add the DBConnector, DBManager, Connection instances to the session

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");       
        HttpSession session = request.getSession();
        
        try {
            conn = db.openConnection(); // Create a DB connection
            if (conn != null) {
                manager = new DBManager(conn); // Create a DB Manager
                session.setAttribute("manager", manager); // Add the manager to the session
                Logger.getLogger(ConnServlet.class.getName()).log(Level.INFO, "DBManager and connection added to session successfully.");
            } else {
                Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, "Database connection could not be opened.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, "SQL Exception in initializing DBManager", ex);
        }
    }



    @Override //Destroy the servlet and release the resources of the application (terminate also the db connection)

     public void destroy() {

        try {
            db.closeConnection(); //close the DB connection once the session is terminated
        } catch (SQLException ex) {
            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}