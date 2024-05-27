<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
    <style>
        .subject-name{
            margin-top:40px;
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../Css/navbar.css">
        <link rel="stylesheet" href="../Css/subjects.css">
        <title>Subjects</title>
    </head>
    <body>
        <%
            // Get userId from the request parameter
            String userIdstr = request.getParameter("userId");
            int userId = Integer.parseInt(userIdstr);

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
                                    Connection conn = null;
                                    PreparedStatement pstmt = null;
                                    ResultSet rs = null;
                                    String userName = "";
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        String connectionString = "jdbc:mysql://localhost/eduverse";
                                        String username = "root";
                                        String password = "root@123";
                                        conn = DriverManager.getConnection(connectionString, username, password);
                                        String query = "SELECT Name FROM eduverse.user WHERE Id = ?";
                                        pstmt = conn.prepareStatement(query);
                                        pstmt.setInt(1, userId);
                                        rs = pstmt.executeQuery();

                                        // Check if the result set has any rows
                                        if (rs.next()) {
                                            userName = rs.getString("Name");
                                            // Now you have the username, you can use it as needed
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    } finally {
                                        // Close the resources
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
        <div class="heading">
            Choose a topic to learn
        </div>
        <div class="container">
            <%@ page import="java.sql.Connection" %>
            <%@ page import="java.sql.DriverManager" %>
            <%@ page import="java.sql.ResultSet" %>
            <%@ page import="java.sql.PreparedStatement" %>
            <%@ page contentType="text/html; charset=UTF-8" %>
            <%@ page language="java" %>
            <%
                try {
                    String subjectId = request.getParameter("subjectId");
                    Class.forName("com.mysql.jdbc.Driver");
                    String connectionString = "jdbc:mysql://localhost/eduverse";
                    String username = "root";
                    String password = "root@123";
                    conn = DriverManager.getConnection(connectionString, username, password);
                    String query = "SELECT * FROM eduverse.topic WHERE SubjectID=?";
                    pstmt = conn.prepareStatement(query);
                    pstmt.setString(1, subjectId); // Set the parameter value
                    rs = pstmt.executeQuery();
            %>
            <%
                if (!rs.next()) { // If the result set is empty
            %>
            <p>No topics available</p>
            <%
            } else {
                do {
                    String topicName = rs.getString("TopicName");
                    String image = rs.getString("TopicImage");
            %>
            <div class="subject-container">
                <a href="content.jsp?TopicId=<%= rs.getInt("TopicID")%>&userId=<%= userId%>">
                    <img src="<%= image%>" alt="<%= topicName%>">
                </a>
                <p class="subject-name"style="bottom:40px"><%= topicName%></p>
            </div>
            <%
                    } while (rs.next());
                }
            %>
            <% } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                    e.printStackTrace();
                } finally {
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
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            %>
        </div>
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

            // Function to handle logout action
            function logout() {
                // Set the sessionStorage item to indicate logout
                sessionStorage.setItem('loggedOut', 'true');
            }
        </script>
    </body>
</html>
