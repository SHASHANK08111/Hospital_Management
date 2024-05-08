<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <%@include file="../components/allcss.jsp"%>
    <link rel="stylesheet" href="../components/navbar.css">
</head>
<body>
    <%@include file="navbar.jsp"%>
    <div class="container">
      <h2>Appointment Details</h2>
      <div class="table-responsive">
        <table class="table table-bordered table-striped">
          <thead>
            <tr>
              <th>Appointment ID</th>
              <th>User ID</th>
              <th>Doctor ID</th>
              <th>Username</th>
              <th>Age</th>
              <th>Disease</th>
              <th>Appointment Date</th>
              <th>Slot</th>
              <th>Specialist Name</th>
              <th>Doctor Name</th>
              <th>Is Approved</th>
              <th>Comment</th>
              <th>Status</th>
            </tr>
          </thead>
          <tbody>
            <%-- Loop through appointments and display data --%>
            <%

              List<Appointment> appointments = (List<Appointment>) request.getAttribute("appointments");
              for (Appointment appointment : appointments) {
            %>
              <tr>
                <td><%= appointment.getAppointmentId() %></td>
                <td><%= appointment.getUserId() %></td>
                <td><%= appointment.getDoctorId() %></td>
                <td><%= appointment.getUsername() %></td>
                <td><%= appointment.getAge() %></td>
                <td><%= appointment.getDisease() %></td>
                <td><%= appointment.getAppointmentDate() %></td>
                <td><%= appointment.getSlot() %></td>
                <td><%= appointment.getSpecialistName() %></td>
                <td><%= appointment.getDoctorName() %></td>
                <td>
                  <%-- Display buttons based on isApproved status --%>
                  <% if (appointment.isApproved()) { %>
                    <button type="button" class="btn btn-success">Accept</button>
                  <% } else { %>
                    <button type="button" class="btn btn-danger">Reject</button>
                  <% } %>
                </td>
                <td><%= appointment.getComment() %></td>
                <td><%= appointment.getStatus() %></td>
              </tr>
            <% } %>
          </tbody>
        </table>
      </div>
    </div>
</body>
</html>