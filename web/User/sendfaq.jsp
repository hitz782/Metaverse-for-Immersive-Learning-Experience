<%--
    Document   : sendfaq
    Created on : 28 Mar, 2024, 4:51:09 PM
    Author     : hithe
--%>

<%--
    Document   : sendfaq
    Created on : Mar 27, 2024, 10:56:16 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FAQ Message Form</title>
        <link rel="stylesheet" href="../Css/bootstrap.min.css" type="text/css">
        <style>
            body {
                background: linear-gradient(to right, rgb(13, 249, 206), rgb(95, 16, 216)); /* Gradient background */
                background-size: cover; /* Cover the entire viewport */
                background-position: center; /* Center the background image */
            }

            .container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .image-container {
                flex: 1;
                padding: 73px;
            }
            .message-form {
                background-color: rgba(255, 255, 255, 0.7); /* White frame with translucent effect */
                padding: 70px;
                border-radius: 20px;
                box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.5);
                width: 500px;  /* Increased the width to 500px */
                max-width: 400px; /* Limit maximum width */
                height: auto; /* Auto height */
                margin-top:center;/* Center horizontally */
                text-align: center; /* Center text */
                position: relative; /* Position for absolute child */
            }

            .message-form input[type="email"],
            .message-form textarea,
            .message-form button {
                margin-bottom: 10px; /* Adjusted bottom margin */
            }
        </style>
    </head>
    <body>

        <%
            String successParam = request.getParameter("success");
            if (successParam != null && successParam.equals("true")) {
        %>
        <script>
            alert("Message submitted successfully!");
        </script>
        <% } else if (successParam != null && successParam.equals("false")) { %>
        <script>
            alert("Error occurred while submitting the message!");
        </script>
        <% }%>
        <div class="container">
            <div class="row">
                <div class="col-4">
                    <div class="image-container">
                        <img src="../Images/faq1.png " alt="FAQ Image">
                    </div>
                </div>
                <div class="col-4"></div>
                <div class="col-4">
                    <div class="message-container">
                        <div class="message-form">
                            <h2>Send us your query </h2>
                            <form method="POST" action="<%= application.getContextPath()%>/SubmitFaqServlet">
                                <input type="email" id="userEmail" name="userEmail" placeholder="Your Email" class="form-group form-control mt-5" required>
                                <textarea id="userMessage" name="userMessage" placeholder="Your Message" class="form-group form-control" rows="5" required></textarea>
                                <input type="hidden" name="isFAQ" value="true"> <!-- Since this is for FAQ, set to true -->
                                <button type="submit" class="btn btn-primary form-control form-group">Submit Message</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="../Js/Validation.js" type="text/javascript"></script>

    </body>
</html>


