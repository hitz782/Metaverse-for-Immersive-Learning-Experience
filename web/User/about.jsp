<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>About Us</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');

            /* Style for the entire page */
            body {
                background-color: #f5f5f5; /* Light gray background */
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
            }

            /* Style for the image container */
            .image-container {
                margin-left: 0px; /* Add 70px space from the left */
                float: left;
                width: 100%; /* Change width to 100% */
                height: 400px; /* Adjust height */
                background-image: url("https://media.licdn.com/dms/image/D4D12AQF97zepdXQXjw/article-cover_image-shrink_720_1280/0/1688356915990?e=2147483647&v=beta&t=LQsZrqRAM8WxGoAwPlGoCGDzq7lrEYTD3gwKwap75HY");
                background-size: cover;
                background-position: center;
                position: relative; /* Add relative positioning */
            }

            /* Style for the overlay */
            .overlay {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                color: white;
                font-size: 200px;
                font-weight: bold;
                opacity: 0.7; /* Set opacity to 70% */
            }

            /* Style for the content box */
            .content-box {
                margin-top: 0px; /* Adjust margin top */
                margin-left: 50px; /* Adjust margin left */
                margin-right: 50px; /* Add margin right */
                padding: 20px; /* Adjust padding */
                background-color: #fff;
                border-radius: 32px;
                box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
                text-align: center; /* Center the text */
                z-index: 1;
            }

            /* Style for h1 elements */
            .content-box h1 {
                font-family: "Poppins", sans-serif;
                text-align: center; /* Center align h1 elements */
                margin-bottom: 20px; /* Add margin below h1 elements */
            }

            /* Style for p elements */
            .content-box p {
                font-family: "Poppins", sans-serif;
                text-align: center; /* Justify the text */
            }

            /* Style for ul elements */
            .content-box ul {
                font-family: "Poppins", sans-serif;
                text-align: left; /* Left align the list items */
                padding-left: 20px; /* Add left padding to the list */
            }

            /* Style for heading elements */
            .heading {
                cursor: pointer; /* Change cursor to pointer on hover */
                transition: background-color 0.3s; /* Add transition effect */
            }

            /* Hover effect for heading elements */
            .heading:hover {
                background-color: cyan; /* Change background color on hover */
            }

            /* Style for navbar */
            header {
                font-family: "Poppins", sans-serif;
                display: flex;
                justify-content: space-around;
                align-items: center;
                padding: 20px;
                box-shadow: 0px 3px 5px rgba(0, 0, 0, 0.3);
                background-color: #ffffff; /* Set background color */
                position: sticky; /* Make navbar sticky */
                top: 0; /* Align navbar to the top */
                z-index: 1000; /* Set higher z-index */
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
                color: #000000; /* Set color */
                text-decoration: none; /* Remove underline */
            }

            .nav_links a:hover {
                color: rgb(230, 146, 11); /* Change color on hover */
            }

            button {
                padding: 9px 25px;
                background-color: #4DDBFF;
                border: none;
                border-radius: 50px;
                cursor: pointer;
                transition: all 0.3s ease 0s;
                font-family: "Poppins", sans-serif;
                font-weight: 500;
                font-size: 23px;
                color: #000000;
            }

            button:hover {
                background-color: rgb(13,249,206);
            }

            .start-logo {
                background: linear-gradient(to right, rgb(13, 249, 206), rgb(95, 16, 216));
                -webkit-background-clip: text;
                background-clip: text;
                font-size: 25px;
                color: transparent;
            }
            .logoutBtn{
                padding: 8px 20px;
                background-color: #4DDBFF;
                border: none;
                border-radius: 50px;
                cursor: pointer;
                transition: all 0.3s ease 0s;
            }
            .logoutBtn:hover{
                background-color: #FFF338;
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

        </style>
    </head>

    <body>
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
            <ul class="nav_links"id="navLinks">
                <li><a href="home.jsp?userId=<%=userId%>">Home</a></li>
                <li><a href="#">About</a></li>
                <li><a href="subject.jsp?userId=<%=userId%>">Subjects</a></li>
                <li><a href="faq.jsp?userId=<%=userId%>&loggedIn=true">FAQs</a></li>
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
                                <%  Connection conn = null;
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
        <div class="image-container">
            <div class="overlay">EDUVERSE</div>
        </div>
        <div class="content-box">
            <h1 class="heading" id="welcome">Welcome to Our Metaverse Immersive Learning Platform</h1>
            <p>At Eduverse, we're revolutionizing the way people learn by providing an immersive and interactive metaverse-based learning experience         . Our platform is designed to offer learners a unique and engaging environment where they can explore, interact with 3D models, and delve into rich multimedia content to enhance their understanding of various subjects.</p>
            <h1 class="heading" id="mission">Our Mission</h1>
            <p>Our mission is to democratize education by making learning accessible, engaging, and enjoyable for everyone. We believe that immersive technologies have the power to transform traditional learning methods and unlock new possibilities for knowledge acquisition.</p>
            <h1 class="heading" id="sets-apart">What Sets Us Apart</h1>
            <ul>
                <li>Immersive Learning Environments: Step into virtual classrooms, interactive simulations, and 3D worlds to learn in ways never before possible.</li>
                <li>Rich Multimedia Content: Access a vast library of multimedia resources, including 3D models, videos, animations, and simulations, to enhance your learning experience.</li>
                <li>Personalized Learning Paths: Tailor your learning journey to suit your interests, goals, and learning preferences with customizable learning paths and content recommendations.</li>
            </ul>
            <h1 class="heading" id="vision">Our Vision</h1>
            <p>We envision a future where education transcends physical boundaries, empowering learners to explore, create, and innovate in virtual spaces. By harnessing the power of immersive technologies, we aim to build a global learning community where curiosity thrives, knowledge is shared, and learning knows no limits.</p>
            <h1 class="heading" id="join">Join Us on the Journey</h1>
            <p>Whether you're a student, educator, or lifelong learner, we invite you to join us on this transformative journey of discovery and growth. Explore our platform, immerse yourself in new worlds of knowledge, and embark on an adventure of lifelong learning with Eduverse.</p>
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

