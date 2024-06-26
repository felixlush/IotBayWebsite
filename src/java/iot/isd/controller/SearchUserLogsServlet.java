/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package iot.isd.controller;

import iot.isd.model.LogEntry;
import iot.isd.model.User;
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
public class SearchUserLogsServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchDate = request.getParameter("searchDate");
        System.out.println(searchDate);
        List<LogEntry> filteredLogs = new ArrayList<>();
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        DBManager manager = (DBManager)session.getAttribute("manager");

        if (searchDate != null && !searchDate.isEmpty()) {
            try {
                filteredLogs = manager.searchLogsByDate(searchDate, user.getEmail());
            } catch (SQLException ex) {
                Logger.getLogger(SearchUserLogsServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        request.setAttribute("logs", filteredLogs);
        request.getRequestDispatcher("/userAccount.jsp").forward(request, response);
    }

}
