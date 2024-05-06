<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>

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
     
  <c:if test="${empty adminObj}">
    <c:redirect url="../admin-login.jsp"></c:redirect>
  </c:if>
  
   <c:if test="${not empty successMessage}">
      <p class="text-center text-success fs-3">${successMessage}</p>
      <c:remove var="successMessage" scope="session"/>
    </c:if>
     <c:if test="${not empty errorMessage}">
      <p class="text-center text-success fs-3">${errorMessage}</p>
      <c:remove var="errorMessage" scope="session"/>
    </c:if>
  
  <div class="container p-5">  
    <div class="row">
      <div class="col-md-4">
        <div class="card paint-card">
          <div class="card-body text-center">
            <i class="fa-solid fa-user-doctor fa-3x"></i><br>
            <p class="fs-4 text-center">
               DOCTOR<br>5
            <p>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card paint-card">
          <div class="card-body text-center">
            <i class="fa-solid fa-users fa-3x"></i><br>
            <p class="fs-4 text-center">
                USER<br>12
            <p>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card paint-card">
          <div class="card-body text-center">
            <i class="far fa-calendar-check fa-3x"></i><br>
            <p class="fs-4 text-center">
                TOTAL APPOINTMENT<br>24
            <p>
          </div>
        </div>
      </div>
      <div class="col-md-4 mt-4">
        <div class="card paint-card" data-bs-toggle="modal" data-bs-target="#exampleModal">
          <div class="card-body text-center">
            <i class="fa-duotone fa-stethoscope fa-3x"></i><br>
            <p class="fs-4 text-center">
          		Specialist<br>6
            <p>
          </div>
        </div>
       </div>    
    </div>
  </div>  
  
  
  
  


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
      
        <form action="../addSpecialist" method="post">
            <div class="form-group">
                <label>Enter Specialist Name</label>
                <input text="text" name = "specName" class="form-control"></input>
            </div>
            <div class="texr-center mt-3">
            <button type="submit" class="btn btn-primary">Add</button>
            </div>

        </form>
        
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

      </div>
    </div>
  </div>
</div>
</body>
</html>