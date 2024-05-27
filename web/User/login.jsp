<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="../Css/bootstrap.min.css" type="text/css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script>
            // Get the current URL
            var url = new URL(window.location.href);

            // Get the value of the logout parameter from the URL
            var logoutParam = url.searchParams.get('logout');

            // If the logout parameter is set to 'true'
            if (logoutParam === 'true') {
                // Set the logout status in sessionStorage
                sessionStorage.setItem('logout', 'true');
            } else if (logoutParam === 'false') {
                // Set the logout status in sessionStorage
                sessionStorage.setItem('logout', 'false');
            }

            // Check if the logout status is 'true'
            var isLoggedOut = sessionStorage.getItem('logout') === 'true';

            // If the user has logged out
            if (isLoggedOut && window.history && window.history.pushState) {
                // Prevent back navigation
                window.history.pushState(null, null, './#');
                window.onpopstate = function (event) {
                    // Redirect to login.jsp if the user tries to navigate back
                    window.location.replace('login.jsp');
                };
            }
        </script>

        <style>
            body {
                background: linear-gradient(to right, rgb(13, 249, 206), rgb(95, 16, 216));
                background-size: cover;
                background-position: center;
            }

            .login-container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .login-form {
                background-color: rgba(255, 255, 255, 0.5);
                padding: 40px;
                border-radius: 20px;
                box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.5);
                width: 80%;
                max-width: 400px;
                height: auto;
                margin: 0 auto;
                text-align: center;
                position: relative;
            }

            .login-form input[type="text"],
            .login-form input[type="password"],
            .login-form input[type="email"],
            .login-form button {
                margin-bottom: 20px;
                border-radius: 10px;
                width: 100%; /* Set inputs and buttons to full width */
            }

            .login-form button:hover {
                background: rgb(13, 249, 206);
                color: black;
            }

            .google-option {
                background-color: white;
                border: 2px solid black;
                padding: 10px;
                border-radius: 10px;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-wrap: wrap;
                text-align: center;
                cursor: pointer;
            }

            .google-option img {
                width: 20px;
                height: 20px;
                margin-right: 10px;
            }

            .register-line {
                position: absolute;
                bottom: 20px;
                left: 42px;
                text-align: left;
                width: 100%; /* Ensure full width */
            }

            .register-link {
                color: blue;
            }

            .register-link:hover {
                background-color: rgb(13, 249, 206);
                color: black;
                border-radius: 5px;
                transition: 0.5s;
            }

            .google-option {
                margin-bottom: 20px;
            }

            .eye-icon {
                position: absolute;
                right: 10px;
                top: 50%;
                transform: translateY(-50%);
                cursor: pointer;
            }

            #forgot:hover {
                color: blue;
            }

            #forgot {
                color: black;
            }

            @media (max-width: 768px) {
                .login-form {
                    width: 75%; /* Adjust width for smaller screens */
                }
            }
        </style>
        <script src="../Js/Validation.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="login-container">
                        <div class="login-form">
                            <h2 style="margin-bottom: 20px; font-family: 'Poppins', sans-serif;">Welcome User!</h2>
                            <form method="POST" action="<%= application.getContextPath()%>/LoginServlet" onsubmit="return LoginValidation();">
                                <div id="usernameFields">
                                    <input type="text" id="username" name="username" placeholder="Username" class="form-group form-control"/>
                                    <div style="position: relative;">
                                        <input type="password" id="password" name="password" placeholder="Password" class="form-group form-control"/>
                                        <i class="bi bi-eye-slash-fill  eye-icon" id="eyeicon" onclick="togglePassword()"></i>
                                    </div>
                                </div>
                                <div id="emailFields" style="display: none;">
                                    <input type="email" id="email" name="email" placeholder="Email" class="form-group form-control"/>
                                    <div style="position: relative;">
                                        <input type="password" id="emailPassword" name="emailPassword" placeholder="Password" class="form-group form-control"/>
                                        <i class="bi bi-eye-slash-fill eye-icon" id="emailEyeicon" onclick="toggleEmailPassword()"></i>
                                    </div>
                                </div>
                                <a href="forgotpassword.jsp" class="register-link" style="float: right; margin-top: 0px; position:relative; top:64px" id="forgot">Forgot Password?</a>
                                <button type="submit" class="btn btn-primary form-control">Login</button>
                            </form>

                            <div class="google-option mt-3" onclick="toggleLoginType()">
                                <img src="../Images/maillogo.jpg" alt="Google icon">
                                Use Email Instead
                            </div>
                            <div class="register-line mt-3">
                                <span style="font-family: 'Poppins', sans-serif;">New User?
                                    <a href="registration.jsp" class="register-link">Register Here</a></span>
                                <!-- Register option with link -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--        this part gives alert message after user uses logout fucntion and reaches to this page-->
        <script>
            // Check if the current page is login.jsp
//            if (window.history && window.history.pushState) {
//                window.history.pushState('forward', null, './');
//                window.onpopstate = function (event) {
//                    window.location.replace('login.jsp');
//                    // Redirect to login.jsp if the user tries to navigate back
//                };
//            }
            function togglePassword() {
                var passwordInput = document.getElementById("password");
                var eyeIcon = document.getElementById("eyeicon");
                if (passwordInput.type === "password") {
                    passwordInput.type = "text";
                    eyeIcon.classList.remove("bi-eye-slash-fill");
                    eyeIcon.classList.add("bi-eye-fill");
                } else {
                    passwordInput.type = "password";
                    eyeIcon.classList.remove("bi-eye-fill");
                    eyeIcon.classList.add("bi-eye-slash-fill");
                }
            }

            function toggleEmailPassword() {
                var emailPasswordInput = document.getElementById("emailPassword");
                var eyeIcon = document.getElementById("emailEyeicon");
                if (emailPasswordInput.type === "password") {
                    emailPasswordInput.type = "text";
                    eyeIcon.classList.remove("bi-eye-slash-fill");
                    eyeIcon.classList.add("bi-eye-fill");
                } else {
                    emailPasswordInput.type = "password";
                    eyeIcon.classList.remove("bi-eye-fill");
                    eyeIcon.classList.add("bi-eye-slash-fill");
                }
            }

            function toggleLoginType() {
                var usernameFields = document.getElementById("usernameFields");
                var emailFields = document.getElementById("emailFields");
                if (usernameFields.style.display === "none") {
                    usernameFields.style.display = "block";
                    emailFields.style.display = "none";
                } else {
                    usernameFields.style.display = "none";
                    emailFields.style.display = "block";
                }
            }
        </script>
    </body>
</html>
