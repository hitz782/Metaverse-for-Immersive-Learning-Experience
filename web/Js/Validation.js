function LoginValidation() {
  var username = document.getElementById("username").value;
  var password = document.getElementById("password").value;

  // Check all required fields for emptiness
   if (username == "" || password == "")
   {
        alert("Please fill all required details.");
        return false;
   }
  return true; // Allow form submission
}
function ValidateRegistrationForm() {
    var username = document.getElementById("user").value;
    var password = document.getElementById("pass").value;
    var name = document.getElementById("name").value;
    var contact = document.getElementById("contact").value;
    var email = document.getElementById("email").value;
    var city = document.getElementById("city").value;
    var question = document.getElementById("securityQuestion").value;
    var answer = document.getElementById("securityAnswer").value;

    // Check for empty fields
    if (username == "" || password == "" || name == "" || contact == "" || email == "" || city == "" || answer =="" || question =="") {
        alert("Please fill all required details.");
        return false; // Prevent form submission
    }

    // Add more specific validation checks as needed:
    // - Username format (letters, numbers, underscores)
    // - Password strength (length, character types)
    // - Email format using a regular expression
    // - Contact number format (based on region/type)

    // Additional server-side validation (after form submission)
    // ... (see next step)

    return true; // Allow form submission if all client-side checks pass
}
   





