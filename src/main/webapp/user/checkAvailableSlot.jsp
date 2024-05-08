<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <%@page import="com.db.DBConnect"%>
 <%@page import="java.util.*"%>
 <%@page import="com.virtusa.dao.slotDao"%>
 <%@page import="java.util.ArrayList"%>
 <%@page import=" com.virtusa.entity.Slot"%>
 <%@page import=" com.virtusa.entity.Appointment"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>
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
        <p class="text-center fs-3">Select Slot</h2>
    
		<form action="../saveAppointment" method="post" class="row g-3">
		
		<c:if test="${not empty slotNotAvailable}">
		      <p class="text-center text-success fs-3">${slotNotAvailable}</p>
		      <c:remove var="slotNotAvailable" scope="session"/>
		 </c:if>
		 <div class="col-md-6">
		    <div class="form-group">
		        <label for="slot" class="form-label">Slot of Appointment:</label>
		        <select class="form-control" id="slot" name="slot" required>
		         <%

					HttpSession appointmentSession = request.getSession();
					Appointment ap = (Appointment) appointmentSession.getAttribute("appointmentObj");
					
				  %>
		          <option>--Select--</option>
			            <% slotDao sdao = new slotDao(DBConnect.getConnection());
			             ArrayList<Slot> slotList = sdao.getAvailableSlot(ap.getAppointmentDate(),ap.getDoctorId());
			             if(slotList.isEmpty()){
			             %>
			             <option>Slots are filled..Please select new Date</option>
			             <%
			             }else{
			             for(Slot s : slotList){
			             %>
		               <option><%=s.getSlotTime()%></option>
		                 <%
		                 }
		                 }
		                 %>
		   
		        </select>
		       
		    </div>
		 </div> 
		 
		   <button class="col-md-6 offset-md-3 btn btn-success">Book Appointment</button>
		  </form>
		</div>
      </div>  
    </div>
  </div>
</div> 

</body>
</html>
