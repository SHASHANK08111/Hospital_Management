<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@include file="../components/allcss.jsp"%>
    <style type="text/css">
      .paint-card{
      		box-shadow:0 0 10px 0 rgba(0,0,0,0.3);
      }
    </style>
    <link rel="stylesheet" href="../components/navbar.css">
</head>
<body>
    <%@include file="navbar.jsp"%>
    <div class="container p-5">
        <div class="row">
          <div class="col-md-4">
          <a href="TotalAppointment.jsp" class="card-link">
            <div class="card paint-card">
              <div class="card-body text-center">

                <i class="fa-solid fa-user-doctor fa-3x"></i><br></a>

                <p class="fs-4 text-center">
                   TOTAL APPOINTMENT<br>5
                <p>
              </div>
            </div>
           </a>
          </div>
          <div class="col-md-4">
            <div class="card paint-card">

              <div class="card-body text-center">
                <a href="PendingAppointment.jsp" class="card-link"><i class="fa-solid fa-users fa-3x"></i></a><br>
                <p class="fs-4 text-center">
                    PENDING APPOINTMENT<br>12
                <p>
              </div>

            </div>
          </div>
          <div class="col-md-4">
            <div class="card paint-card">
              <div class="card-body text-center">
                <i class="far fa-calendar-check fa-3x"></i><br>
                <p class="fs-4 text-center">
                    NEED TO APPROVE<br>24
                <p>
              </div>
            </div>
          </div>
         </div>
        </div>
</body>
</html>