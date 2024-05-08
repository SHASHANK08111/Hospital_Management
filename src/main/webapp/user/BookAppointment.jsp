<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <%@page import="com.db.DBConnect"%>
  <%@page import="java.util.*"%>
 <%@page import="com.virtusa.dao.SpecialistDoa"%>
  <%@page import="com.virtusa.dao.DoctorDao"%>
 <%@page import="java.util.ArrayList"%>
 <%@page import=" com.virtusa.entity.Specialist"%>
 <%@page import=" com.virtusa.entity.Doctor"%>
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
        <h2>Book an Appointment</h2>
        
        <c:if test="${not empty succMsg}">
		        <p class="text-center text-success fs-3">${succMsg}</p>
		        <c:remove var="succMsg" scope="session"/>
		    </c:if>
		    <c:if test="${not empty errorMsg}">
		        <p class="text-center text-success fs-3">${errorMsg}</p>
		        <c:remove var="errorMsg" scope="session"/>
		    </c:if>
        
   <form action="../BookAppointment" method="post">
    <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" class="form-control" id="username" name="username" required>
        <div class="invalid-feedback">Please enter your username.</div>
    </div>

    <div class="form-group">
        <label for="age">Age:</label>
        <input type="number" class="form-control" id="age" name="age" required>
        <div class="invalid-feedback">Please enter your age.</div>
    </div>

    <div class="form-group">
        <label for="disease">Disease:</label>
        <input type="text" class="form-control" id="disease" name="disease" required>
        <div class="invalid-feedback">Please enter your disease.</div>
    </div>

    <div class="form-group">
        <label for="date">Date of Appointment:</label>
        <input type="date" class="form-control" id="date" name="appointmentDate" required>
    </div>

    <div class="form-group">
        <label for="slot">Slot of Appointment:</label>
        <select class="form-control" id="slot" name="slot" required>
            <option value="">Select Slot</option>
            <option value="10AM-11AM">10AM - 11AM</option>
            <option value="11AM-12PM">11AM - 12PM</option>
            <option value="12PM-1PM">12PM - 1PM</option>
            <option value="2PM-3PM">2PM - 3PM</option>
            <option value="3PM-4PM">3PM - 4PM</option>
        </select>
        <div class="invalid-feedback">Please select the slot for your appointment.</div>
    </div>

    <div class="form-group">
        <label for="specialist">Specialist:</label>
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

    <div class="form-group">
        <label for="doctor">Doctor:</label>
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
    <button type="submit" class="btn btn-primary">Book Appointment</button>
</form>
        
    </div>
    

</body>
</html>
