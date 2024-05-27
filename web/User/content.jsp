<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Content</title>
        <!-- Include FontAwesome CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <!-- Your custom CSS file -->
        <link rel="stylesheet" href="../Css/navbar.css">
        <link rel="stylesheet" href="../Css/content.css">
    </head>
    <body>
        <%
            // Get userId and TopicId from the request parameters
            String userIdStr = request.getParameter("userId");
            String topicIdStr = request.getParameter("TopicId");
            int userId = Integer.parseInt(userIdStr);
            int topicId = Integer.parseInt(topicIdStr);

            // Get the current date and time
            java.util.Date date = new java.util.Date();
            java.sql.Timestamp timestamp = new java.sql.Timestamp(date.getTime());

            // Connection variables
            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                // Establish database connection
                Class.forName("com.mysql.jdbc.Driver");
                String connectionString = "jdbc:mysql://localhost/eduverse";
                String username = "root";
                String password = "root@123";
                conn = DriverManager.getConnection(connectionString, username, password);

                // Insert into history table
                String query = "INSERT INTO eduverse.history (UserID, TopicID, ViewedDateTime) VALUES (?, ?, ?)";
                pstmt = conn.prepareStatement(query);
                pstmt.setInt(1, userId);
                pstmt.setInt(2, topicId);
                pstmt.setTimestamp(3, timestamp);
                pstmt.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Close the resources
                try {
                    if (pstmt != null) {
                        pstmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        %>

        <%
            // Retrieve topic details from the database
            Connection conn1 = null;
            PreparedStatement pstmt1 = null;
            ResultSet rs1 = null;

            try {
                String topicIdParam = request.getParameter("TopicId"); // Rename to avoid conflict
                Class.forName("com.mysql.jdbc.Driver");
                String connectionString = "jdbc:mysql://localhost/eduverse";
                String username = "root";
                String password = "root@123";
                String imagepath = "";
                conn1 = DriverManager.getConnection(connectionString, username, password);
                String query = "SELECT * FROM eduverse.topic WHERE TopicID=?";
                pstmt1 = conn1.prepareStatement(query);
                pstmt1.setString(1, topicIdParam); // Use the renamed variable
                rs1 = pstmt1.executeQuery();

                if (rs1.next()) {
                    String topicName = rs1.getString("TopicName");
                    imagepath = topicName + ".jsp";
                    String topicImage = rs1.getString("TopicImage");
                    String topicDescription = rs1.getString("TopicDescription");
                    String content1 = rs1.getString("Content1");
                    String content2 = rs1.getString("Content2");
                    String content3 = rs1.getString("Content3");
                    String imageLink1 = rs1.getString("ImageLink1");
                    String imageLink2 = rs1.getString("ImageLink2");
                    String imageLink3 = rs1.getString("ImageLink3");
        %>
        <header class="sticky-header">
            <ul class="logo">
                <li><a href="#" class="start-logo">Eduverse</a></li>
            </ul>
            <ul class="nav_links">
                <li><a href="home.jsp?userId=<%=userId%>">Home</a></li>
                <li><a href="about.jsp?userId=<%=userId%>">About</a></li>
                <li><a href="subject.jsp?userId=<%=userId%>">Subjects</a></li>
                <li><a href="faq.jsp?userId=<%=userId%>">FAQs</a></li>
            </ul>
            <!-- Profile button with tooltip -->
            <div class="tooltip">
                <button class="profile-button" onclick="toggleMenu()">
                    <img src="../Images/user.png" alt="Profile">
                </button>
                <span class="tooltiptext">User Account</span>
                <!-- Menu for logout -->
                <div class="menu" id="menu">
                    <a href="login.jsp?logout=true">
                        <div class="logout-box">
                            <div>
                                <%
                                    String userName = "";
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        String connectionString1 = "jdbc:mysql://localhost/eduverse";
                                        String username1 = "root";
                                        String password1 = "root@123";
                                        conn1 = DriverManager.getConnection(connectionString, username1, password1);
                                        String query1 = "SELECT Name FROM eduverse.user WHERE Id = ?";
                                        pstmt1 = conn1.prepareStatement(query1);
                                        pstmt1.setInt(1, userId);
                                        rs1 = pstmt1.executeQuery();

                                        // Check if the result set has any rows
                                        if (rs1.next()) {
                                            userName = rs1.getString("Name");
                                            // Now you have the username, you can use it as needed
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    } finally {
                                        // Close the resources
                                        try {
                                            if (rs1 != null) {
                                                rs1.close();
                                            }
                                            if (pstmt1 != null) {
                                                pstmt1.close();
                                            }
                                            if (conn1 != null) {
                                                conn1.close();
                                            }
                                        } catch (SQLException ex) {
                                            ex.printStackTrace();
                                        }
                                    }
                                %>
                                <div class="logout-box">
                                    <div>
                                        <p style="background: linear-gradient(to right, rgb(13, 249, 206), rgb(95, 16, 216)); color: transparent; -webkit-background-clip: text; background-clip: text; padding: 10px; text-align: center; margin: 0;">Hello, <%= userName != null ? userName : "Guest"%>!</p>
                                    </div>
                                    <div class="logout-btn">
                                        <span>Logout</span>
                                        <img src="../Images/Logout.png" alt="Logout" width="20" height="20">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </header>

        <div class="content">
            <div class="topic-heading">
                <h1><%= topicName%></h1>
            </div>
            <div class="topic-description">
                <p><%= topicDescription%></p>
            </div>
            <div class="content-wrapper">
                <div class="content-left">
                    <p><%= content1%></p>
                </div>
                <div class="content-right">
                    <img src="<%= imageLink1%>" alt="Image 1">
                </div>
            </div>
            <div class="content-wrapper">
                <div class="content-left">
                    <img src="<%= imageLink2%>" alt="Image 2">
                </div>
                <div class="content-right">
                    <p><%= content2%></p>
                </div>
            </div>
            <div class="content-wrapper">
                <div class="content-left">
                    <p><%= content3%></p>
                </div>
                <div class="content-right">
                    <img src="<%= imageLink3%>" alt="Image 3">
                </div>
            </div>
        </div>

        <div class="sticky-container">
            <div class="explore-text">Explore different learning views here</div>
            <div class="sticky-button" onclick="toggleOptions()" title="Explore different views">
                <i class="fas fa-eye"></i>
            </div>
            <div class="floating-options" id="floatingOptions">
                <a href="../Models/<%= topicName%>/<%= topicName + "1" + ".jsp"%>" class="float-option" title="View the concept in Meta">
                    <img src="../Images/metaicon.png" alt="Meta View">
                </a>
                <a href="3d.jsp?topicId=<%= topicId%>" class="float-option" title="View the concept in 3D">
                    <img src="../Images/3dmodelicon.png" alt="3D View">
                </a>
                <a href="video.jsp?topicId=<%= topicId%>" class="float-option" title="View the concept in animation">
                    <img src="../Images/animationicon.png" alt="animation View">
                </a>
            </div>


        </div>
        <%
        } else {
        %>
        <p>No content available for this topic.</p>
        <%
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
                e.printStackTrace();
            } finally {
                try {
                    if (rs1 != null) {
                        rs1.close();
                    }
                    if (pstmt1 != null) {
                        pstmt1.close();
                    }
                    if (conn1 != null) {
                        conn1.close();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        %>

        <!-- "Give Feedback" button -->
        <!-- "Give Feedback" button -->
        <div class="feedback">
            <a href="feedback.jsp?userId=<%=userId%>" class="feedback-link">Give Feedback</a>
            <div class="feedback-icon">
                <img src="../Images/feedback1.png" alt="Feedback Icon">
            </div>
        </div>


        <!-- Your JavaScript code -->
        <script>
            // Function to toggle the menu visibility
            function toggleMenu() {
                var menu = document.getElementById("menu");
                if (menu.style.display === "block") {
                    menu.style.display = "none";
                } else {
                    menu.style.display = "block";
                }
            }

            // Function to toggle options visibility
            function toggleOptions() {
                var options = document.getElementById("floatingOptions");
                options.classList.toggle("active");
            }

            // Function to open feedback form
            function openFeedbackForm() {
                // Add your logic here to open the feedback form
            }
        </script>
    </body>
</html>
