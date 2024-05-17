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
public class ProductCreateServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // Assuming using GET or change to doPost if using POST form method
    HttpSession session = request.getSession();
    int productId = Integer.parseInt(request.getParameter("productId"));
    String productName = request.getParameter("productName");
    String productType = request.getParameter("productType");
    double productPrice = Double.parseDouble(request.getParameter("productPrice"));
    int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
    String productImage = request.getParameter("productImage");

    DBManager manager = (DBManager) session.getAttribute("manager");

    // Do something with the data, like putting it in the session or request

        try {
            manager.createProduct(productId, productName, productType, productPrice, productQuantity, productImage);
        } catch (Exception ex) {
     
        }
    // Forward to purchaseProduct.jsp
    request.getRequestDispatcher("productUpdated.jsp").forward(request, response);
    
    }

}
