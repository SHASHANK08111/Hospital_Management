<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <%@page import="com.db.DBConnect"%>
 <%@page import="java.util.*"%>
 <%@page import="com.virtusa.dao.SpecialistDoa"%>
 <%@page import="com.virtusa.dao.DoctorDao"%>
 <%@page import="com.virtusa.dao.slotDao"%>
 <%@page import="java.util.ArrayList"%>
 <%@page import=" com.virtusa.entity.Specialist"%>
 <%@page import=" com.virtusa.entity.Doctor"%>
 <%@page import=" com.virtusa.entity.Slot"%>
 <%@page import=" com.virtusa.entity.Appointment"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Appointment</title>
    <%@include file="../components/allcss.jsp"%> 
    <link rel="stylesheet" href="../components/navbar.css">
</head>
<body>
    <%@include file="../components/navbar.jsp"%>
    <br>
    <div class="container">
    <div class="row">
      <div class="col-md-6">
      <div class="card">
       <div class="card-body">
        <p class="text-center fs-3">Book an Appointment</h2>
        
        <c:if test="${not empty succMsg}">
		        <p class="text-center text-success fs-3">${succMsg}</p>
		        <c:remove var="succMsg" scope="session"/>
		    </c:if>
		    <c:if test="${not empty errorMsg}">
		        <p class="text-center text-success fs-3">${errorMsg}</p>
		        <c:remove var="errorMsg" scope="session"/>
		    </c:if>
        
		   <form action="../BookAppointment" method="post" class="row g-3">
		   <div class="col-md-6">
		    <div class="form-group">
		        <label for="username" class="form-label">Username:</label>
		        <input type="text" class="form-control" id="username" name="username" required>
		        <div class="invalid-feedback">Please enter your username.</div>
		    </div>
		   </div> 
		
		  <div class="col-md-6">
		    <div class="form-group">
		        <label for="age" class="form-label">Age:</label>
		        <input type="number" class="form-control" id="age" name="age" required>
		        <div class="invalid-feedback">Please enter your age.</div>
		    </div>
		  </div>
		
		<div class="col-md-6">
		    <div class="form-group">
		        <label for="disease" class="form-label">Disease:</label>
		        <input type="text" class="form-control" id="disease" name="disease" required>
		        <div class="invalid-feedback">Please enter your disease.</div>
		    </div>
		 </div>
		  
		  <div class="col-md-6">
		    <div class="form-group">
		        <label for="date" class="form-label">Date of Appointment:</label>
		        <input type="date" class="form-control" id="date" name="appointmentDate" required>
		    </div>
		   </div> 
		
		
		 
		 <div class="col-md-6">
		    <div class="form-group">
		        <label for="specialist" class="form-label">Specialist:</label>
		        <select class="form-control" id="specialist" name="specialist">
		            <option>--Select--</option>
			            <% SpecialistDoa dao = new SpecialistDoa(DBConnect.getConnection());
			             ArrayList<Specialist> list = dao.getAllSpecialist();
			             for(Specialist s : list){
			             %>
		             <option><%=s.getSpecialistName()%></option>
		                 <%
		                 }
		                 %>
		        </select>
		    </div>
		</div>
		    <div class="form-group">
		        <label for="doctor" class="form-label">Doctor:</label>
		        <select class="form-control" id="doctor" name="doctor">
		           <option>--Select--</option>
			            <% DoctorDao ddao = new DoctorDao(DBConnect.getConnection());
			             ArrayList<Doctor> dlist = ddao.getAllDoctors();
			             for(Doctor d : dlist){
			             %>
		                  <option value="<%= d.getId() %>"> <%= d.getFullname() %> - Specialist in <%= d.getSpecialist() %> </option>
		                 <%
		                 }
		                 %>
		        </select>
		    </div>
		    <br>
		    <br>
		    
		    <c:if test="${empty userObj}">
		     <a href="../user-login.jsp" 
		        class="col-md-6 offset-md-3 btn btn-success">Check Available slot</a>
		    </c:if>
		    
		    <c:if test="${not empty userObj}">
		      <button class="col-md-6 offset-md-3 btn btn-success"> Check Available slot</button>
		    </c:if>
		    
		  </form>
		</div>
      </div>  
    </div>
    
  </div>
</div> 

</body>
</html>
