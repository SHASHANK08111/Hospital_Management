<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Doctor Dashboard</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Welcome, Doctor!</h1>

    <h2>Appointments and Patients</h2>
    <table>
        <tr>
            <th>Name</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Appointment Type</th>
            <th>Date</th>
            <th>Time</th>
            <th>Status/Condition</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital","root","root");

                // Retrieve appointments and patients data and combine them
                Statement stmt=con.createStatement();

                // Appointments
                ResultSet rs=stmt.executeQuery("select name, age, gender, type, date, time, status from appointments");
                while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getInt("age") %></td>
            <td><%= rs.getString("gender") %></td>
            <td><%= rs.getString("type") %></td>
            <td><%= rs.getString("date") %></td>
            <td><%= rs.getString("time") %></td>
            <td><%= rs.getString("status") %></td>
        </tr>
        <%
                }
                con.close();
            } catch(Exception e) {
                out.println(e);
            }
        %>
    </table>
</body>
</html>
