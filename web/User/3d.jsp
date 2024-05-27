<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Embedded Sketchfab Model</title>
        <style>
            .overlay {
                position: absolute;
                left: 0;
                right: 0; /* Center the division horizontally */
                top: 110%; /* Adjust the top position */
                transform: translateY(-50%); /* Center the division vertically */
                width: 100%;
                height: 10%;
                background-color: white;
                z-index: 9999;
            }
            .overlay1 {
                position: absolute;
                left: 0;
                right: 0; /* Center the division horizontally */
                top: 18%; /* Adjust the top position */
                transform: translateY(-50%); /* Center the division vertically */
                width: 100%;
                height: 10%;
                background-color: white;
                z-index: 9999;
            }
        </style>
    </head>
    <body>
        <%@page import="java.sql.Connection"%>
        <%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.PreparedStatement"%>
        <%@page import="java.sql.Timestamp"%>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
            String topicIdStr = request.getParameter("topicId");
            int topicId = Integer.parseInt(topicIdStr);
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            // Resource link variable to store the result
            String resourceLink = null;
            try {
                // Establish database connection
                Class.forName("com.mysql.jdbc.Driver");
                String connectionString = "jdbc:mysql://localhost/eduverse";
                String username = "root";
                String password = "root@123";
                conn = DriverManager.getConnection(connectionString, username, password);
                String sql = "SELECT ResourceLink FROM resource WHERE TopicID = ? AND ResourceType = '3D'";

                // Prepare the statement
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, topicId);

                // Execute the query
                rs = pstmt.executeQuery();

                // Check if a record is found
                if (rs.next()) {
                    // Retrieve the resource link from the result set
                    resourceLink = rs.getString("ResourceLink");
                }

                // Close the database connections
                rs.close();
                pstmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                // Close the database connections in case of exceptions
                try {
                    if (rs != null) {
                        rs.close();
                    }
                    if (pstmt != null) {
                        pstmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
        <h1 style="text-align: center;">3D Model</h1>
        <div class="overlay1"></div>
        <div style="text-align: center;">
            <iframe width="800" height="600" src="<%= resourceLink%>"></iframe>
            <div class="overlay"></div>
        </div>
        <p style="font-size: 13px; font-weight: normal; margin: 5px; color: #4A4A4A;">
        </p>
    </body>
</html>
