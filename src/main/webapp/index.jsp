<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MYIRCTC Registration</title>
<style>
  /* You can add custom CSS rules here later if needed */
</style>
</head>
<body>

<form action="action_page.php">
  <div class="container">
    <h1>Welcome to MYIRCTC website </h1>
    <h1>Provide below information to book a flight ticket!!</h1>
    <p>Please fill in this form</p>
    <hr>

    <label for="name"><b>Name</b></label><br>
    <input type="text" placeholder="Enter Name" name="name" id="name" required><br><br>

    <label for="email"><b>Email</b></label><br>
    <input type="text" placeholder="Enter Email" name="email" id="email" required><br><br>

    <label for="aadhar"><b>Aadhar Number</b></label><br>
    <input type="text" placeholder="Enter Aadhar Number" name="aadhar" id="aadhar" required><br><br>

    <label for="mother"><b>Mother Name</b></label><br>
    <input type="text" placeholder="Mother Name" name="mother" id="mother" required><br><br>

    <label for="father"><b>father Name</b></label><br>
    <input type="text" placeholder="father Name" name="father" id="father" required><br><br>

    <label for="pan card"><b>pan card</b></label><br>
    <input type="text" placeholder="pan card" name="pancard" id="pancard" required><br><br>

    <label for="voter card"><b>voter card</b></label><br>
    <input type="text" placeholder="voter card" name="votercard" id="votercard" required><br><br>
    <hr>

    <p>By giving above details, you agree to our <a href="#">Terms & Privacy</a>.</p>
    <button type="submit" class="registerbtn">Register</button>
  </div>
</form>

<p>Already have an account? <a href="#">Sign in</a>.</p>

</body>
</html>
