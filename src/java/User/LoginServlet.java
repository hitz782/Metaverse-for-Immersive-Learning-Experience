package User;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId=0;
        String Password="";
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String Userpassword = request.getParameter("password");
        String connectionString="jdbc:mysql://localhost/eduverse";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con= DriverManager.getConnection(connectionString,"root","root@123");
            Statement stmt=con.createStatement();
            
            String sql = "";
            if (username != null && !username.isEmpty()) {
                // If username is provided, validate using username
                sql = "select * from user where Username='" + username + "'";
            } else if (email != null && !email.isEmpty()) {
                // If email is provided, validate using email
                sql = "select * from user where Email='" + email + "'";
            } else {
                // Handle case where neither username nor email is provided
                response.setContentType("text/html;charset=UTF-8");
                try (PrintWriter out = response.getWriter()) {
                    out.println("<script>alert('Please provide username or email');</script>");
                    out.println("<script>window.location.href = 'User/login.jsp';</script>");
                }
                return; // Exit the method
            }
            
            ResultSet result = stmt.executeQuery(sql);
            if (result.next()) {
                userId = result.getInt("Id");
                Password = result.getString("Password");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if (Userpassword.equals(Password)) {
            response.sendRedirect("User/home.jsp?userId=" + userId);
        } else {    
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                out.println("<script>alert('Username or password is incorrect');</script>");
                out.println("<script>window.location.href = 'User/login.jsp';</script>");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
