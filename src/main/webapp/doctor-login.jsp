<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Page</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    body {
      background-color: #f7f7f7;
    }
    .login-container {
      margin-top: 100px;,
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-4">
        <div class="card login-container">
          <div class="card-header bg-primary text-white">
            <h3 class="text-center">Doctor Login</h3>
          </div>
          <div class="card-body">
            <c:if test="${not empty errorMessage}">
          		<p class="text-center text-success fs-3">${errorMessage}</p>
          		<c:remove var="errorMessage" scope="session"/>
          	</c:if>
            <form action="doctor-login" method="post">
              <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" required>
              </div>
              <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password" required>
              </div>
              <button type="submit" class="btn btn-primary btn-block">Login</button>
            </form>

          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
