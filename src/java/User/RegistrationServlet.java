package User;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegistrationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegistrationServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistrationServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    System.out.println("Reached"); // Debugging statement to check if servlet is reached
    
    // Retrieve form parameters
    String name = request.getParameter("name");
    String contact = request.getParameter("contact");
    String email = request.getParameter("email");
    String address = request.getParameter("city");
    String uname = request.getParameter("user");
    String password = request.getParameter("pass");
    String question = request.getParameter("securityQuestion");
     String answer = request.getParameter("securityAnswer");

    // JDBC connection details
    String connectionString = "jdbc:mysql://localhost/eduverse";
    
    try {
        // Load JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        // Establish connection
        Connection con = DriverManager.getConnection(connectionString, "root", "root@123");
        
        // Create statement
        Statement stmt = con.createStatement();

        // SQL query to insert user data into the database
        String sql = "INSERT INTO user(Name, ContactNo, Email, City, Username, Password, SecurityQuestion, SecurityAnswer) "
                     + "VALUES('" + name + "','" + contact + "','" + email + "','" + address + "','" + uname + "','" + password + "','"+question+"','"+answer+"')";

        // Execute query
        int res = stmt.executeUpdate(sql);
        
        // Close resources
        stmt.close();
        con.close();
        
        // Debugging statement to check if registration is successful
        System.out.println("Registration successful");
        
        // Redirect to login page after successful registration
        response.sendRedirect("User/login.jsp");
    } catch (ClassNotFoundException | SQLException ex) {
        // Log any exceptions that occur during registration
        Logger.getLogger(RegistrationServlet.class.getName()).log(Level.SEVERE, null, ex);
    }
}

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
