<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
</head>
<body>
   <nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
      <div class="container-fluid">
         <a class="navbar-brand" href="index.jsp">My Doctor</a>
         <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
               
              <c:if test="${empty userObj}">
                <li class="nav-item">
                  <a class="nav-link" aria-current="page" href="#">Find Doctor</a>
               </li>
               <li class="nav-item">
                  <a class="nav-link" href="#">Book Appointment</a>
               </li>
               <li class="nav-item">
                  <a class="nav-link" href="#">Medicines</a>
               </li>
               <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  Login
                  </a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                     <li><a class="dropdown-item" href="user-login.jsp">User</a></li>
                     <li><a class="dropdown-item" href="admin-login.jsp">Admin</a></li>
                     <li><a class="dropdown-item" href="doctor-login.jsp">Doctor</a></li>
                  </ul>
               </li>
              </c:if>
               
             <c:if test="${not empty userObj}">
             <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="#">Find Doctor</a>
               </li>
               <li class="nav-item">
                  <a class="nav-link" href="../user/BookAppointment.jsp">Book Appointment</a>
               </li>
               <li class="nav-item">
                  <a class="nav-link" href="#">My Appointments</a>
               </li>
               
               <div class="nav-item dropdown active">
			  <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
			    <i class="fa-solid fa-circle-user"></i> ${userObj.firstName}
			  </button>
			  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
			    <li><a class="dropdown-item" href="../user-logout">LogOut</a></li>
			  </ul>
			</div>
          </c:if>    
            </ul>
         </div>
      </div>
   </nav>
   
   
</body>
</html>
