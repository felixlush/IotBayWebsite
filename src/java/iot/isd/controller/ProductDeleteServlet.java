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
import java.util.ArrayList;
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
public class ProductDeleteServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String productId = request.getParameter("productId");
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        if (manager == null) {
            response.sendRedirect("errorPage.jsp"); // Redirect to an error page if DBManager isn't found
        }
        
        try {
            manager.deleteProduct(productId);
            response.sendRedirect("product.jsp");
            
        } catch (Exception e) {
            session.setAttribute("errorMessage", "Unable to fetch products: " + e.getMessage());
            response.sendRedirect("errorPage.jsp"); // Redirect to error page if there's a problem fetching products
        }
        

        
        
        
}


}
