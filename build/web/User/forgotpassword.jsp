<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password</title>
        <script>
            function resetPassword() {
                var email = document.getElementById("email").value;
                var securityQuestion = document.getElementById("securityQuestion").value;
                var securityAnswer = document.getElementById("securityAnswer").value;
                var newPassword = document.getElementById("newPassword").value;
                var confirmPassword = document.getElementById("confirmPassword").value;

                // Validate inputs
                if (!email || !securityQuestion || !securityAnswer || !newPassword || !confirmPassword) {
                    alert("Please fill in all fields.");
                    return;
                }

                if (newPassword !== confirmPassword) {
                    alert("Passwords do not match.");
                    return;
                }

                // Make AJAX request to validate security question and answer
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        if (xhr.status === 200) {
                            var response = JSON.parse(xhr.responseText);
                            if (response.success) {
                                // If security question and answer are correct, proceed to update password
                                updatePassword(email, newPassword);
                            } else {
                                alert("Invalid security question or answer.");
                            }
                        } else {
                            alert("Error: " + xhr.status);
                        }
                    }
                };
                xhr.open("POST", "forgot.jsp", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                var params = "action=validate&email=" + encodeURIComponent(email) + "&securityQuestion=" + encodeURIComponent(securityQuestion) + "&securityAnswer=" + encodeURIComponent(securityAnswer);
                xhr.send(params);
            }

            function updatePassword(email, newPassword) {
                // Make AJAX request to update password
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        if (xhr.status === 200) {
                            var response = JSON.parse(xhr.responseText);
                            if (response.success) {
                                alert("Password reset successfully.");
                                window.location.href = "login.jsp"; // Redirect to login page
                            } else {
                                alert("Failed to reset password. Please try again.");
                            }
                        } else {
                            alert("Error: " + xhr.status);
                        }
                    }
                };
                xhr.open("POST", "forgot.jsp", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                var params = "action=update&email=" + encodeURIComponent(email) + "&newPassword=" + encodeURIComponent(newPassword);
                xhr.send(params);
            }
        </script>
    </head>
    <body>
        <h2>Forgot Password</h2>
        <form>
            <div>
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div>
                <label for="securityQuestion">Security Question:</label>
                <select id="securityQuestion" name="securityQuestion" required>
                    <option value="" disabled selected>Choose a security question</option>
                    <option value="What is your favourite movie?">What is your favourite movie?</option>
                    <option value="What is the name of your pet?">What is the name of your pet?</option>
                    <option value="What is your best friend's name?">What is your best friend's name?</option>
                </select>
            </div>
            <div>
                <label for="securityAnswer">Security Answer:</label>
                <input type="text" id="securityAnswer" name="securityAnswer" required>
            </div>
            <div>
                <label for="newPassword">New Password:</label>
                <input type="password" id="newPassword" name="newPassword" required>
            </div>
            <div>
                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
            </div>
            <button type="button" onclick="resetPassword()">Reset Password</button>
        </form>
    </body>
</html>
