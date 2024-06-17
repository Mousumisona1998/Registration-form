<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="org.json.JSONObject" %> 
<%
    String Url = "jdbc:mysql://localhost:3306/Registration";
    String user = "root";
    String pass = "Mousumi@1998";

    // Retrieve parameters from the request
    String id = request.getParameter("id");
    String username = request.getParameter("username");
    String dob = request.getParameter("dob");
    String password = request.getParameter("password");
    String phoneno = request.getParameter("phoneno");
    String email = request.getParameter("email");
    String city = request.getParameter("city");
    String address = request.getParameter("address");
    String course = request.getParameter("course");

    Connection connection = null;
    PreparedStatement statement = null;
    int rowsUpdated = 0;

    try {
        connection = DriverManager.getConnection(Url, user, pass);
        
        // Update query without quotes around placeholders
        String query = "UPDATE Student SET Name=?, DOB=?, Password=?, PhoneNo=?, Email=?, City=?, Address=?, Course=? WHERE Id=?";
        statement = connection.prepareStatement(query);

        // Set parameters
        statement.setString(1, username);
        statement.setString(2, dob);
        statement.setString(3, password);
        statement.setString(4, phoneno);
        statement.setString(5, email);
        statement.setString(6, city);
        statement.setString(7, address);
        statement.setString(8, course);
        statement.setString(9, id); // Id for WHERE clause

        // Execute update
        rowsUpdated = statement.executeUpdate();

        // Respond based on update result
        if (rowsUpdated > 0) {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("success");
        } else {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("failed to update");
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Log the exception for debugging
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("failed to update");
    } finally {
        // Close resources
        if (statement != null) {
            try { statement.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
        if (connection != null) {
            try { connection.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
%>
