<%@page import="java.sql.*, java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Video Player</title>
        <style>
            /* Center the video container horizontally and vertically */
            body, html {
                height: 100%;
                margin: 0;
                display: flex;
                align-items: center;
                justify-content: center;
                background-color: #f4f4f4; /* Set background color */
            }
            .video-container {
                background-color: black; /* Set black background color */
                padding: 20px; /* Add some padding */
                border-radius: 10px; /* Add rounded corners */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Add box shadow */
                border: 2px solid black; /* Add black border */
                height: 360px;
                width: 600px;
                position: fixed;
                left: 25%;
                z-index: 1; /* Ensure the container is above other elements */
            }
            iframe {
                width: 100%;
                height: 100%;
            }
            h1 {
                text-align: center;
                position: fixed;
                top: 10px;
                z-index: 2; /* Ensure the header is above the container */
                width: 100%;
            }
        </style>
    </head>
    <body>
        <h1>Video Player</h1>
        <div class="video-container">
            <%
                // Retrieve the topic ID from the request parameters
                String topicIdStr = request.getParameter("topicId");
                String resourceLink = "";

                // Check if topicIdStr is not null and is a valid integer
                if (topicIdStr != null && topicIdStr.matches("\\d+")) {
                    int topicId = Integer.parseInt(topicIdStr);

                    // Database connection details
                    String connectionString = "jdbc:mysql://localhost/eduverse";
                    String username = "root";
                    String password = "root@123";

                    try {
                        // Establish database connection
                        Connection con = DriverManager.getConnection(connectionString, username, password);

                        // Prepare SQL query to retrieve resource link based on topic ID
                        String sql = "SELECT ResourceLink FROM resource WHERE TopicID = ? AND ResourceType = 'video'";
                        PreparedStatement pstmt = con.prepareStatement(sql);
                        pstmt.setInt(1, topicId);

                        // Execute the query
                        ResultSet rs = pstmt.executeQuery();

                        // Check if the result set has any rows
                        if (rs.next()) {
                            resourceLink = rs.getString("ResourceLink");
                        } else {
                            // Handle case where topic ID is valid but no resource link found
                            // You can customize the message or take any other action here
                            resourceLink = ""; // Set resourceLink to empty string
                        }

                        // Close the database connections
                        rs.close();
                        pstmt.close();
                        con.close();
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                        // Handle database errors here
                        resourceLink = ""; // Set resourceLink to empty string
                    }
                } else {
                    // Handle invalid topic ID or missing topic ID parameter
                    // You can customize the message or take any other action here
                    resourceLink = ""; // Set resourceLink to empty string
                }
            %>
            <% if (!resourceLink.isEmpty()) {%>
            <iframe width="560" height="315" src="<%= resourceLink%>" frameborder="0" allowfullscreen></iframe>
                <% } else { %>
            <h2>No video available for the specified topic ID.</h2>
            <% }%>
        </div>
    </body>
</html>
