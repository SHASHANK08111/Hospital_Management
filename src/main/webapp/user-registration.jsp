
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html lang="en">
<head>
<%@include file="components/allcss.jsp"%> 
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <style>
        body {
    font-family: Arial, sans-serif;
    margin: 40px;
    background-image: url('/image/bgimage.jpg');
    background-size: cover;
    background-repeat: no-repeat;
}

.container {
    max-width: 500px;
    margin: auto;
    padding: 20px;
    border: 1px solid #ccc;
    /* background-color: aliceblue; */
    border-radius: 5px;
}
.link{
    margin-left: 500px;
}
input[type="text"], input[type="email"], input[type="password"] {
    width: 100%;
    padding: 8px;
    margin: 10px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
input[type="submit"] {
    width: 100%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
input[type="submit"]:hover {
    background-color: #45a049;
}
    </style>
</head>
<body>
<%@include file="components/navbar.jsp"%>
<div class="container">
    <h2>User Registration</h2>
    
    <c:if test="${not empty successMessage}">
      <p class="text-center text-success fs-3">${successMessage}</p>
      <c:remove var="successMessage" scope="session"/>
    </c:if>
     <c:if test="${not empty errorMessage}">
      <p class="text-center text-success fs-3">${errorMessage}</p>
      <c:remove var="errorMessage" scope="session"/>
    </c:if>
    
    <form action="user-register" method="post">
        <label for="fname">First Name:</label>
        <input type="text" id="fname" name="firstname" placeholder="Your first name.." required>

        <label for="lname">Last Name:</label>
        <input type="text" id="lname" name="lastname" placeholder="Your last name.." required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" placeholder="Your email.." required>

        <label for="psw">Password:</label>
        <input type="password" id="psw" name="password" placeholder="Your password.." required>

        <label for="cpsw">Confirm Password:</label>
        <input type="password" id="cpsw" name="confirmPassword" placeholder="Your password.." required>

        <label for="phonenumber">Phone Number:</label>
        <input type="text" id="phonenumber" name="phonenumber" placeholder="Your phone number.." required>

        <input type="submit" value="Register">
    </form>
</div>
<div class="link">
    <p>Already a user <a href="user-login.jsp">Click here</a></p>
</div>
</body>
</html>