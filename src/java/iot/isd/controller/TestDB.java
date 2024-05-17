/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package iot.isd.controller;

import iot.isd.model.dao.DBConnector;
import iot.isd.model.dao.DBManager;
import java.sql.*;

import java.util.*;

import java.util.logging.*;

 

public class TestDB {

    private static final Scanner in = new Scanner(System.in);

    public static void main(String[] args) {

        try {

            DBConnector connector = new DBConnector();

            Connection conn = connector.openConnection();

            DBManager db = new DBManager(conn);



//            System.out.print("User email: ");
//
//            String email = in.nextLine();
//
//            System.out.print("User name: ");
//
//            String name = in.nextLine();
//
//            System.out.print("User password: ");
//
//            String password = in.nextLine();
//
//            System.out.print("User gender: ");
//
//            String gender = in.nextLine();
//
//            System.out.print("User favorite color: ");
//
//            String favcol = in.nextLine();`
//            db.addUser("John@gmail.com", "password", "John Bloggs", "31 Dury Lane");   
//            
//            db.checkConnection();
//            db.listTables();

            
                
//            System.out.println("User is added to the database.");

            connector.closeConnection();



        } catch (ClassNotFoundException | SQLException ex) {

            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);

        }

    }

}
