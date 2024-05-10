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
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;



    public class LoginServlet extends HttpServlet {


    @Override   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       


            HttpSession session = request.getSession();
            Validator validator = new Validator();
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            DBManager manager = (DBManager) session.getAttribute("manager");
            User user = null;
            validator.clear(session);
            System.out.println("Starting database");
            LocalDate dateNow = LocalDate.now();
            LocalTime timeNow = LocalTime.now();

            if (manager == null) {
                throw new IllegalStateException("DBManager not set in session");
            }
        
            if (email == null || email.isEmpty()) {
                session.setAttribute("emailErr", "Email cannot be empty");
                response.sendRedirect("login.jsp");
                return;
            }

            if (!validator.validateEmail(email)) {           
                System.out.println("Email Error");
                session.setAttribute("emailErr", "Error: Email format incorrect");
                request.getRequestDispatcher("login.jsp").include(request, response);

            }
            
            if (!validator.validatePassword(password)) {                  
                System.out.println("Pass Error");
                session.setAttribute("passErr", "Error: Password format incorrect");       
                request.getRequestDispatcher("login.jsp").include(request, response);

            }
            
            try {
                user = manager.findUser(email, password);
            } catch (SQLException | NullPointerException ex) {
                 System.out.println(ex.getMessage() == null ? "User does not exists" : "welcome");
            }
            
            
            if (user != null){ //Try adding the login to the USER_LOGS
                
                try{
                    manager.logLogin(email, dateNow, timeNow, "login");
                }   catch (SQLException | NullPointerException ex) {
                    System.out.println(ex.getMessage() == null ? "User does not exists" : "welcome");
                }
                
                session.setAttribute("user", user);
                request.getRequestDispatcher("main.jsp").include(request, response);
            } else {
                System.out.println("Couldn't find user");
                session.setAttribute("existErr", "User does not exist in the Database!");
                request.getRequestDispatcher("login.jsp").include(request, response);
            }
            
        }

    }