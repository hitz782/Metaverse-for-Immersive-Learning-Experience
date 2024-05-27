/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SubmitFeedbackServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SubmitMessageServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubmitMessageServlet at " + request.getContextPath() + "</h1>");
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
       
        String userEmail = request.getParameter("userEmail");
        String userMessage = request.getParameter("userMessage");
        boolean isFAQ = Boolean.parseBoolean(request.getParameter("isFAQ"));
        Date submissionDateTime = new Date(); // Get current date/time
        String connectionString="jdbc:mysql://localhost/eduverse";
       
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            java.sql.Connection con= DriverManager.getConnection(connectionString,"root","root@123");
            Statement stmt=con.createStatement();
           
            String sql = "INSERT INTO faq (UserMail, Message, IsFAQ, SubmissionDateTime) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(sql);
       
            pstmt.setString(1, userEmail);
            pstmt.setString(2, userMessage);
            pstmt.setBoolean(3, isFAQ);
            pstmt.setTimestamp(4, new java.sql.Timestamp(submissionDateTime.getTime()));
       
            int rowsAffected = pstmt.executeUpdate();
       
            pstmt.close();
            con.close();
           
            if (rowsAffected > 0) {
                // Data inserted successfully
                response.sendRedirect("User/feedback.jsp?success=true"); // Redirect to sendfaq.jsp with success parameter
            } else {
                // Data insertion failed
                response.sendRedirect("User/feedback.jsp?success=false"); // Redirect to sendfaq.jsp with failure parameter
            }
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
            response.sendRedirect("User/feedback.jsp?success=false"); // Redirect to sendfaq.jsp with failure parameter
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}