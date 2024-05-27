<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');

            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
                background-color: #FFFFFF;
            }

            li, a, button {
                font-family: "Poppins", sans-serif;
                font-weight: 500;
                font-size: 23px;
                color: #000000;
                text-decoration: none;
            }

            .start-logo {
                background: linear-gradient(to right, rgb(13, 249, 206),rgb(95, 16, 216) );
                -webkit-background-clip: text;
                background-clip: text;
                font-size: 25px;
                color: transparent;
            }

            header {
                font-family: "Poppins", sans-serif;
                display: flex;
                justify-content: space-around;
                align-items: center;
                padding: 20px;
                box-shadow: 0px 3px 5px rgba(0, 0, 0, 0.3);
            }

            .sticky-header {
                position: sticky;
                top: 0;
                background-color: #ffffff;
                padding: 20px;
                z-index: 1000;
            }

            .logo {
                list-style: none;
            }

            .nav_links {
                list-style: none;
            }

            .nav_links li {
                display: inline-block;
                padding: 0px 40px;
            }

            .nav_links a {
                transition: all 0.3s ease 0s;
            }

            .nav_links li a:hover {
                color: rgb(230, 146, 11);
            }

            button {
                padding: 9px 25px;
                background-color: #4DDBFF;
                border: none;
                border-radius: 50px;
                cursor: pointer;
                transition: all 0.3s ease 0s;
            }

            button:hover {
                background-color: #FFF338;
            }

            section {
                padding: 80px 13%;
            }

            .home {
                position: relative;
                top: -70px;
                height: 100vh;
                width: 100%;
                background-size: cover;
                background-position: center;
                display: grid;
                grid-template-columns: 1fr repeat(2, 1fr); /* Modified grid columns */
                gap: 1rem;
                align-items: center;
            }

            .image {
                display: block;
                width: 650px;
                animation: float 3s ease-out infinite;
            }

            @keyframes float {
                50% {
                    transform: translateY(20px);
                }
            }

            .home-text {
                text-align: left; /* Align text to the left */
            }

            .home-text h1 {
                font-size: 40px;
                margin: 25px 0 25px 0;
            }

            .home-text h6 {
                font-size: 24px;
                margin: 25px 0 25px 0;
            }

            .Explore {
                background-color: burlywood;
            }

            .Explore:hover {
                background-color: rgb(13, 249, 206);
            }

            /* Profile button styles */
            .profile-button {
                position: relative;
                width: 50px;
                height: 50px;
                border-radius: 50px;
                overflow: hidden;
                background-color: burlywood;
                border: none;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .profile-button img {
                position: absolute;
                top: 5px;
                left: 5px;
                width: 80%;
                height: 80%;
                object-fit: cover;
                border-radius: 50px;
            }

            .profile-button:hover {
                background-color: rgb(13, 249, 206);
            }


            /* Tooltip styles */
            .tooltip {
                position: relative;
                display: inline-block;
            }

            .tooltip .tooltiptext {
                visibility: hidden;
                width: auto;
                background-color: #333;
                color: #fff;
                text-align: center;
                border-radius: 6px;
                padding: 5px;
                position: absolute;
                z-index: 1;
                top: 50%;
                right: calc(100% + 5px); /* Adjusted position to display to the left of the button */
                transform: translateY(-50%);
                opacity: 0;
                transition: opacity 0.3s;
            }

            .tooltip:hover .tooltiptext {
                visibility: visible;
                opacity: 0.4;
            }

            /* Menu styles */
            .menu {
                position: absolute;
                top: calc(100% + 20px); /* Adjusted position to display below the button */
                left: 50%;
                transform: translateX(-50%);
                background-color: #fff;
                border: 1px
                    solid #ccc;
                border-radius: 5px;
                box-shadow: 0px 3px 5px rgba(0, 0, 0, 0.3);
                display: none;
                padding: 10px;
            }

            .menu a {
                display: block;
                padding: 8px 16px;
                color: #000000;
                text-decoration: none;
                transition: background-color 0.3s ease;
            }

            .menu a:hover {
                background-color: #f0f0f0;
            }
            .logout-box {
                display: flex;
                flex-direction: column;
                align-items: center;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                justify-content: space-between; /* Align items with space between */
            }

            .logout-box img {
                margin-left: 8px; /* Adjust margin to separate image and text */
            }

            .logout-box div {
                margin-top: 5px; /* Add space between the two divs */
            }

            /*            styles for my learning section*/
            .topics-container {
                display: flex;
                justify-content: space-between;
                margin-top: 20px;
                padding: 10px;
                border: 2px solid black; /* Add border to topics container */
                border-radius: 10px; /* Add border radius to topics container */
            }

            .topic-box {
                flex-basis: calc(30% - 15px); /* Adjust the width of each topic box */
                background-color: #f0f0f0;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease;
                position: relative;
            }

            .topic-box:hover {
                transform: translateY(-5px);
            }

            .topic {
                text-align: center;
                position: relative;
            }

            .topic img {
                width: 100%;
                height: auto;
                border-radius: 10px;
            }

            .continue {
                margin-top: 10px;
                padding: 8px 16px;
                background-color: #4DDBFF;
                border: none;
                border-radius: 20px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .continue:hover {
                background-color: rgb(13, 249, 206);
            }

            .topic-name {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: rgba(255, 255, 255, 0.8);
                padding: 5px 10px;
                border-radius: 5px;
                font-size: 16px;
                color: #000;
                text-align: center;
                white-space: nowrap;
            }
            .container{
                position: relative;
                bottom: 140px;

            }
            .most-viewed-topics{
                position: relative;
                bottom: 60px;
            }
            .topics-container{
                background-color: grey;
                padding: 30px;
            }
            .more-button{
                height: 20px;
                position:relative;
                top: 310px;
                left: 25px;
                background: none;
                display: inline-flex; /* Display as inline-flex to align items horizontally */
                align-items: center; /* Align items vertically */

            }

            .more-button a {
                text-decoration: none;
            }

            .more-button a:hover {
                text-decoration: underline;
            }

            .more-button a i {
                margin-left: 5px; /* Adjust the spacing between text and icon */
            }
            .more-button i {
                margin-left: 5px; /* Adjust the spacing between text and icon */
                position: relative;
                right: 5px;
                width: 35px;
                height: 35px;
                padding: 10px;

            }
            .more-button:hover{
                cursor: pointer;
            }



        </style>
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
                <li><a href="faq.jsp?userId=<%=userId%>&loggedIn=true">FAQs</a></li>
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

        <section class="home">
            <div class="home-text"> <!-- Text content moved to the right -->
                <h6>Best online learning platform</h6>
                <h1>Experience a transformative journey of learning</h1>
                <div class="latter">
                    <a href="subject.jsp?userId=<%=userId%>">
                        <button class="Explore">Explore</button>
                    </a>

                </div>
            </div>
            <img src="../Images/Get Started.jpg" alt="Image" class="image">
        </section>
        <section class="my-learning">
            <div class="container">
                <h2>My Learning</h2>
                <div class="topics-container">
                    <%

                        try {
                            // Establish database connection
                            Class.forName("com.mysql.jdbc.Driver");
                            String connectionString = "jdbc:mysql://localhost/eduverse";
                            String username = "root";
                            String password = "root@123";
                            conn = DriverManager.getConnection(connectionString, username, password);

                            // Query to fetch top 3 distinct recent topics viewed by the user
                            String query = "SELECT t.TopicID, t.TopicName, t.TopicImage "
                                    + "FROM eduverse.topic t "
                                    + "INNER JOIN ("
                                    + "    SELECT MAX(h.ViewedDateTime) AS MaxViewedDateTime, h.TopicID "
                                    + "    FROM eduverse.history h "
                                    + "    WHERE h.UserID = ? "
                                    + "    GROUP BY h.TopicID "
                                    + "    ORDER BY MaxViewedDateTime DESC "
                                    + "    LIMIT 3"
                                    + ") AS recent_topics ON t.TopicID = recent_topics.TopicID "
                                    + "ORDER BY recent_topics.MaxViewedDateTime DESC";

                            pstmt = conn.prepareStatement(query);
                            pstmt.setInt(1, userId);
                            rs = pstmt.executeQuery();

                            // Display the top 3 distinct recent topics
                            while (rs.next()) {
                                int topicId = rs.getInt("TopicID");
                                String topicName = rs.getString("TopicName");
                                String topicImage = rs.getString("TopicImage");

                                // Display the topic information
                    %>
                    <div class="topic-box">
                        <div class="topic">
                            <a href="content.jsp?userId=<%=userId%>&TopicId=<%=topicId%>">
                                <img src="<%=topicImage%>" alt="<%=topicName%>">
                                <div class="topic-name"><%=topicName%></div>
                            </a>
                            <button class="continue" onclick="location.href = 'content.jsp?userId=<%=userId%>&TopicId=<%=topicId%>'">Continue</button>
                        </div>
                    </div>

                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            // Close resources
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
                    <div class="more-button">
                        <a href="history.jsp?userId=<%=userId%>">more</a> <!-- "more" text -->
                        <i class="fas fa-arrow-right"></i> <!-- Arrow icon -->
                    </div>

                </div>
            </div>
        </section>
        <section class="most-viewed-topics">
            <div class="container">
                <h2>Our Most Viewed Topics</h2>
                <div class="topics-container">
                    <%
                        try {
                            // Establish database connection
                            Class.forName("com.mysql.jdbc.Driver");
                            String connectionString = "jdbc:mysql://localhost/eduverse";
                            String username = "root";
                            String password = "root@123";
                            conn = DriverManager.getConnection(connectionString, username, password);

                            // Query to fetch top 3 most viewed topics across all users
                            String query = "SELECT t.TopicID, t.TopicName, t.TopicImage, COUNT(*) AS ViewCount "
                                    + "FROM eduverse.topic t "
                                    + "INNER JOIN eduverse.history h ON t.TopicID = h.TopicID "
                                    + "GROUP BY t.TopicID "
                                    + "ORDER BY ViewCount DESC "
                                    + "LIMIT 3";

                            pstmt = conn.prepareStatement(query);
                            rs = pstmt.executeQuery();

                            // Display the top 3 most viewed topics
                            while (rs.next()) {
                                int topicId = rs.getInt("TopicID");
                                String topicName = rs.getString("TopicName");
                                String topicImage = rs.getString("TopicImage");

                                // Display the topic information
                    %>

                    <div class="topic-box">
                        <div class="topic">
                            <a href="content.jsp?TopicId=<%=topicId%>&userId=<%=userId%>">
                                <img src="<%=topicImage%>" alt="<%=topicName%>">
                                <div class="topic-name"><%=topicName%></div>
                            </a>
                        </div>
                    </div>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            // Close resources
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
                </div>
            </div>
        </section>

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





