<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
      <div class="container-fluid">
         <a class="navbar-brand" href="index.jsp">ADMIN DASHBOARD</a>
         <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                     <li><a class="dropdown-item" href="user-login.jsp">User</a></li>
                     <li><a class="dropdown-item" href="index.jsp">Admin</a></li>
                     <li><a class="dropdown-item" href="../doctor.jsp">Doctor</a></li>
            </ul>
			<div class="dropdown">
			  <button class="btn btn-warning dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
			    DOCTOR
			  </button>
			  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
			    <li><a class="dropdown-item" href="../doctor-logout">LogOut</a></li>
			  </ul>
			</div>

         </div>
      </div>
   </nav>
