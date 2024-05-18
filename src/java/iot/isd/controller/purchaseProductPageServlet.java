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
public class purchaseProductPageServlet extends HttpServlet {

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // Assuming using GET or change to doPost if using POST form method
    HttpSession session = request.getSession();
    String productId = request.getParameter("productId");
    String productName = request.getParameter("productName");
    Double productPrice = Double.parseDouble(request.getParameter("productPrice"));
    DBManager manager = (DBManager) session.getAttribute("manager");

    // Do something with the data, like putting it in the session or request

        try {
            Product product = manager.getProduct(productId);
            session.setAttribute("selectedProduct", product);
        } catch (SQLException ex) {
            Logger.getLogger(purchaseProductPageServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    // Forward to purchaseProduct.jsp
    request.getRequestDispatcher("purchaseProduct.jsp").forward(request, response);
    
    }

}
