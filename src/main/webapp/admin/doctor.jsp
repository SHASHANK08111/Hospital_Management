<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
  <%@page import="com.db.DBConnect"%>
  <%@page import="com.virtusa.dao.SpecialistDoa"%>
  <%@page import="java.util.ArrayList"%>
  <%@page import=" com.virtusa.entity.Specialist"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<%@include file="../components/allcss.jsp"%>
<style type="text/css">
    .point-card{
        box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
    }
</style>
<body>
    <%@include file="navbar.jsp"%>
    <div class="col-md-4">
        <div class="card point-card">
        <div class="card-body">
            <p class="fs-3 text-center">Add Doctor</p>
		    <c:if test="${not empty succMsg}">
		        <p class="text-center text-success fs-3">${succMsg}</p>
		        <c:remove var="succMsg" scope="session"/>
		    </c:if>
		    <c:if test="${not empty errorMsg}">
		        <p class="text-center text-success fs-3">${errorMsg}</p>
		        <c:remove var="errorMsg" scope="session"/>
		    </c:if>
            <form action="../addDoctor" method="post">
                <div class="mb-3">
                    <label class="form-label">Full Name</label><input type="text"
                    required name="fullname" class="form-control">
                </div>

              <div class="mb-3">
                 <label class="form-label">DOB</label><input type="date"
                 required name="dob" class="form-control">
              </div>

                <div class="mb-3">
                    <label class="form-label">Qualification</label><input type="text"
                    required name="qualification" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label">Specialist</label><select type="text"
                    required name="spec" class="form-control">
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
                <div class="mb-3">
                    <label class="form-label">Email</label><input type="text"
                    required name="email" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label">Mobile Number</label><input type="text"
                    required name="mobno" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label">Password</label><input type="password"
                    required name="password"  class="form-control">
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
        </div>
    </div>
    <div class="col-md-8">
        <div class="card point-card">
            <div class="card-body">
                <p class="fs-3 text-center">Doctor Details</p>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Full Name</th>
                                <th scope="col">Date of Birth</th>
                                <th scope="col">Qualification</th>
                                <th scope="col">Specialist</th>
                                <th scope="col">Email</th>
                                <th scope="col">Mobile Number</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Data rows will be added here -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>


</body>
</head>