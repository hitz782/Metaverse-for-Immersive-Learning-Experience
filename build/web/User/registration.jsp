<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link rel="stylesheet" href="../Css/bootstrap.min.css" type="text/css">
        <style>
            /* Include the same basic styles from the login page */
            body {
                background: linear-gradient(to right, rgb(13, 249, 206), rgb(95, 16, 216));
                background-size: cover;
                background-position: center;
                margin: 0;
                position: relative; /* Add relative positioning to the body */
                font-family: "Poppins", sans-serif; /* Apply font-family to all text */
            }

            /* Style for the registration form container */
            .registration-form {
                display: flex;
                justify-content: flex-end; /* Align content to the right */
                align-items: center;
                height: 100vh;
                margin-right: 50px;
            }

            /* Style for the registration frame */
            .registration-frame {
                background-color: rgba(255, 255, 255, 0.5);
                padding: 15px 20px;
                border-radius: 20px;
                box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.5);
                width: 80%;
                max-width: 400px;
                height: auto;
                text-align: center;
            }

            /* Style for the registration form elements */
            .registration-frame input[type="text"],
            .registration-frame input[type="password"],
            .registration-frame input[type="email"],
            .registration-frame textarea,
            .registration-frame button {
                margin-bottom: 20px;
                font-family: "Poppins", sans-serif; /* Apply font-family to form elements */
                border-radius: 10px;
            }

            /* Remove the registration link for now */
            .register-link {
                display: none;
            }
            .btn-primary {
                background-color: blue; /* Set the default background color */
                color: white; /* Set the text color */
                transition: background-color 0.3s ease, color 0.3s ease; /* Add a smooth transition effect */
            }

            .btn-primary:hover {
                background-color: rgb(13, 249, 206); /* Change the background color on hover */
                color: black;
            }
            /* Style for the signup image */
            .signup-img {
                position: absolute;
                left: 30%;
                top: 50%;
                transform: translate(-50%, -50%); /* Center the image horizontally and vertically */
                max-width: 50%; /* Adjust the maximum width of the image */
            }
            #login-button{
                position:relative;
                top: 550px;
                width: 70px;
                left: 360px;
            }
        </style>
    </head>
    <body>
        <button id="login-button" class="btn btn-primary" onclick="window.location.href = 'login.jsp';">Login</button>
        <div class="registration-form">
            <img src="../Images/signup.png" alt="Sign Up" class="signup-img"> <!-- Add the signup image -->
            <div class="registration-frame">
                <h3>Welcome New User!</h3>
                <form method="post" action="<%= application.getContextPath()%>/RegistrationServlet" onsubmit="return ValidateRegistrationForm();">
                    <input type="text" id="name" name="name" placeholder="Name" class="form-group form-control">
                    <input type="text" id="contact" name="contact" placeholder="Contact No" class="form-group form-control">
                    <input type="email" id="email" name="email" placeholder="Email Id" class="form-group form-control">
                    <input type='text' id="city" name="city"  placeholder="City" class="form-group form-control">
                    <input type="text" id="user" name="user" placeholder="Username" class="form-group form-control">
                    <input type="password" id="pass" name="pass" placeholder="Password" class="form-group form-control">
                    <select id="securityQuestion" name="securityQuestion" class="form-group form-control">
                        <option value="" disabled selected>Choose a security question</option>
                        <option value="What is your favourite movie?">What is your favourite movie?</option>
                        <option value="What is the name of your pet?">What is the name of your pet?</option>
                        <option value="What is your best friend's name?">What is your best friend's name?</option>
                    </select>
                    <input type="text" id="securityAnswer" name="securityAnswer" placeholder="Type your answer" class="form-group form-control">

                    <button type="submit" class="btn btn-primary form-control">Register</button>
                </form>
            </div>
        </div>
        <script src="../Js/Validation.js" type="text/javascript"></script>
    </body>
</html>
