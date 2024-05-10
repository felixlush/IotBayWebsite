<%-- 
    Document   : register
    Created on : 26 Mar 2024, 10:24:13 am
    Author     : thebigmoney
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link rel="stylesheet" href="styles/main.css">
    </head>
    <body>
        <%
            String existErr = (String) session.getAttribute("existErr");
            String emailErr = (String) session.getAttribute("emailErr");
            String passErr = (String) session.getAttribute("passErr");
            String nameErr = (String) session.getAttribute("nameErr");
        %>
        
        <h1>
            Sign Up
            <span class="message"><%=(existErr != null ? existErr : "")%></span>
        </h1>
        <form action="RegisterServlet" method="post">
            <table id="form_table">
                <tr>
                    <td>Email Address:</td>
                    <td><input type="text" placeholder="<%=(emailErr != null ? emailErr : "Enter email")%>" name="email" required></td> 
                </tr>
                <tr>
                    <td>Full Name:</td>
                    <td><input type="text" placeholder="<%=(nameErr != null ? nameErr : "Enter name")%>" name="name" required></td>
                </tr>
                <tr>
                    <td>Password: </td>
                    <td><input type="password" placeholder="<%=(passErr != null ? passErr : "Enter password")%>" name="password" required></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><input type="text" placeholder="<%=(passErr != null ? passErr : "Enter address")%>" name="address" required></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <a href="CancelServlet" class="button">Cancel</a>
                        <input class="button" type="submit" value="Sign up">   
                </tr>
            </table>
        </form>
        
        <div class="main-container">
            <div class="form-card">
                <h2>Register:</h2>           
                <form action="welcome.jsp" method="post">
                    <p style="font-style: italic">Please fill in the below details to register for an account</p>
                    <div class="form-group">
                        <div class="input-group">
                            <label for="name">Name:</label>
                            <input type=text" id="fname" name="name">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <label for="address">Address:</label>
                            <input type=text" id="address" name="address">
                        </div>
                    </div>
                    <div class="input-group">
                        <label for="email">Email Address:</label> 
                        <input type=text" id="email" name="email">
                    </div>
                    
                    <br>
                    
                    <div class="input-group">
                        <label for="pwd">Password:</label>
                        <input type="password" id="password" name="password">
                    </div>
                    
                    <div class="form-group" style="margin-top: 20px;">    
                        <input type="submit" value="Submit">
                         <a href="index.jsp" class="custom-button">Back</a>
                    </div>
                </form>
            </div>
        </div>  
    </body>
</html>
