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
    Connection connection = null;
    PreparedStatement statement = null;
    int rowsDeleted = 0;

    try {
        connection = DriverManager.getConnection(Url, user, pass);
        
        // Update query without quotes around placeholders
        String query = "Delete from Student WHERE Id=?";
        statement = connection.prepareStatement(query);
        statement.setString(1, id);
        rowsDeleted = statement.executeUpdate();
        
        if (rowsDeleted > 0) {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("success");
        } else {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("failed to delete");
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Log the exception for debugging
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("failed to delete");
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