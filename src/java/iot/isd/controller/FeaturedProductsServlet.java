/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package iot.isd.controller;

import iot.isd.model.Product;
import iot.isd.model.dao.DBManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
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
public class FeaturedProductsServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String searchString = request.getParameter("searchString");
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        if (searchString == null){
            searchString = "";
        }
        
        try {
            List<Product> products = manager.getFeaturedProducts(searchString);
            session.setAttribute("products", products);
        } catch (SQLException ex) {
            Logger.getLogger(FeaturedProductsServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


}
