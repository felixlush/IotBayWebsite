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



    public class CancelServlet extends HttpServlet {


    @Override   
    protected void doGet(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       


            HttpSession session = request.getSession();
            Validator validator = new Validator();
//            DBManager manager = (DBManager) session.getAttribute("manager");
            validator.clear(session);

            request.getRequestDispatcher("index.jsp").include(request, response);
    }
}