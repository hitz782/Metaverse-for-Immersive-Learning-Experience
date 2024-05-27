<%--
    Document   : faq
    Created on : 27 Mar, 2024, 10:46:10 PM
    Author     : hithe
--%>
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
        <title>FAQ</title>
        <link rel="stylesheet" href="../Css/navbar.css">
        <style>


            .faq-container {
                display: flex;
                flex-direction: column;
                align-items: center;
                box-sizing: none !important;
            }

            .faq {
                width: 50%; /* Adjust width as needed */
                background-color: #f1f1f1;
                padding: 20px;
                margin-bottom: 15px;
            }

            .faq:hover {
                background-color: #ddd;
            }

            .faq h2 {
                padding: 15px;
                cursor: pointer;
                text-align: left;
                border-bottom: 1px solid #ddd;
                margin-bottom: 10px;
                font-size: 18px;
                background-color: #f1f1f1;
            }

            .faq-content {
                padding: 0 15px;
                display: none;
                color: #888;
                font-size: 18px;
            }

            .container {
                display: flex;
                flex-direction: row;
                width: 100%;
            }

            .image-container {
                flex: 1;
                padding: 20px;
            }

            .text-container {
                flex: 1;
                padding: 150px;
                text-align: center;
            }

            .text-container h2 {
                margin-bottom: 15px;
            }

            .button {
                background-color: #4CAF50; /* Green */
                border: none;
                color: white;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin-top: 10px;
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
        <h2 style="text-align: center;">FAQ's</h2>
        <div class="faq-container">
            <div class="faq">
                <h2> What is EduVerse ?</h2>
                <div class="faq-content">
                    <p>EduVerse is an immersive learning platform that combines cutting-edge
                        technology with educational content, offering a unique and engaging
                        learning experience. Our platform utilizes 3D models, animations,
                        and the metaverse to create an interactive environment for learners. </p>
                </div>
            </div>

            <div class="faq">
                <h2>What is immersive learning?</h2>
                <div class="faq-content">
                    <p>Immersive learning uses virtual reality, 3D models, and other interactive elements to create an engaging and
                        realistic learning experience. It can help you learn faster and retain information better than traditional
                        methods. </p>
                </div>
            </div>
            <div class="faq">
                <h2>How does immersive learning work on EduVerse ?</h2>
                <div class="faq-content">
                    <p>Immersive learning on EduVerse involves the use of 3D models and
                        animations to enhance the educational content. Learners can explore
                        subjects in a more interactive and visually stimulating way, making
                        complex concepts easier to understand. </p>
                </div>
            </div>
            <div class="faq">
                <h2>What courses are available on EduVerse ?</h2>
                <div class="faq-content">
                    <p>We offer a diverse range of courses across various subjects, including
                        science, technology, arts, and humanities. Our courses cater to learners
                        of all ages, providing a broad spectrum of educational opportunities. </p>
                </div>
            </div>
            <div class="faq">
                <h2>Is there a specific age group for EduVerse users?</h2>
                <div class="faq-content">
                    <p>No, EduVerse is designed to accommodate learners of all ages.
                        Whether you're a student, professional, or lifelong learner, you'll find
                        courses that suit your interests and educational goals. </p>
                </div>
            </div>
            <div class="faq">
                <h2>What can I expect from the 3D models and virtual environments?</h2>
                <div class="faq-content">
                    <p>Our platform boasts high-quality 3D models and immersive virtual environments that bring your learning to
                        life! Explore realistic simulations, interact with objects, and feel like you're truly "in" the learning
                        experience. </p>
                </div>
            </div>
            <div class="faq">
                <h2>Can I access EduVerse on different devices?</h2>
                <div class="faq-content">
                    <p>Yes, EduVerse is accessible on various devices, including desktops,
                        laptops, tablets, and mobile phones. This ensures flexibility and
                        convenience for users to learn anytime, anywhere </p>
                </div>
            </div>
            <div class="faq">
                <h2>How can I get started on EduVerse ?</h2>
                <div class="faq-content">
                    <p>To begin your educational journey on EduVerse , simply sign up for an
                        account on our website. Once registered, you can explore our courses,
                        choose your areas of interest, and start learning in an immersive
                        environment.</p>
                </div>
            </div>
            <div class="faq">
                <h2>Is EduVerse free to use?</h2>
                <div class="faq-content">
                    <p>While certain features are available for free, EduVerse also offers
                        premium courses and content. Explore our pricing plans for a more
                        comprehensive learning experience.</p>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="image-container">
                <img src="../Images/faq.png" alt="FAQ Image">
                <!--
                <img src="https://thumbs.dreamstime.com/b/data-scientist-specialist-extract-knowledge-insights-science-analytics-machine-learning-control-big-concept-bright-129700740.jpg" alt="FAQ Image">-->
            </div>
            <div class="text-container">
                <h2>Couldn't find your answer?</h2>
                <p>We're here to help! Send us your question and we'll get back to you as soon as possible.</p>
                <a href="sendfaq.jsp" class="button">Send us your question</a>
            </div>

            <script>
                var faq = document.getElementsByClassName("faq");
                var i;

                for (i = 0; i < faq.length; i++) {
                    faq[i].addEventListener("click", function () {
                        this.classList.toggle("active");
                        var faqContent = this.querySelector(".faq-content");
                        if (faqContent.style.display === "block") {
                            faqContent.style.display = "none";
                        } else {
                            faqContent.style.display = "block";
                        }
                    });
                }

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

//                // Function to parse URL parameters
//                function getUrlParameter(name) {
//                    name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
//                    var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
//                    var results = regex.exec(location.search);
//                    return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
//                }
//
//                // Set isLoggedIn based on the value of the loggedIn URL parameter
//                isLoggedIn = getUrlParameter('loggedIn') === 'true';
//
//                window.addEventListener('DOMContentLoaded', (event) => {
//                    const navLinks = document.querySelectorAll('.nav_links li');
//                    const profileBtn = document.querySelector('button');
//
//                    if (!isLoggedIn) {
//                        // Hide all navigation links except "Explore" and "FAQs"
//                        navLinks.forEach(item => {
//                            const linkText = item.textContent.toLowerCase();
//                            if (linkText !== 'explore' && linkText !== 'faqs') {
//                                item.style.display = 'none';
//                            }
//                        });
//
//                        // Change profile button to login button
//                        profileBtn.textContent = 'Login';
//                        profileBtn.onclick = function () {
//                            window.location.href = 'login.jsp?logout=false';
//                        };
//                    }
//                });


            </script>

    </body>
</html>
