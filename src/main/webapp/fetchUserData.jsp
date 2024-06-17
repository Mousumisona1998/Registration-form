<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="org.json.JSONObject" %> 
<%
    // Retrieve the ID parameter from the AJAX request
    String userId = request.getParameter("id");


    // JDBC Connection parameters
    String Url = "jdbc:mysql://localhost:3306/Registration";
    String username = "root";
    String pass = "Mousumi@1998";

    // Initialize variables to store user data
    String id = "";
    String usernameValue = "";
    String dob = "";
    String password = "";
    String phoneno = "";
    String email = "";
    String city = "";
    String address = "";
    String course = "";

    // Create a JSON object to store user data
    JSONObject userData = new JSONObject();

    // Connect to the database and retrieve user data based on the provided ID
    Connection connection = null;
    PreparedStatement statement = null;
    ResultSet resultSet = null;

    try {
        // Load the MySQL JDBC driver (not necessary for newer versions of JDBC)
        // Class.forName("com.mysql.jdbc.Driver");

        // Establish connection to the database
        connection = DriverManager.getConnection(Url, username, pass);

        // Prepare and execute the SQL query to retrieve user data based on the ID
        String query = "SELECT * FROM Student WHERE Id = ?";
        statement = connection.prepareStatement(query);
        statement.setString(1, userId); // Use userId obtained from request

        resultSet = statement.executeQuery();

        // Check if a user with the provided ID exists
        if (resultSet.next()) {
            // Retrieve user data from the database
            id = resultSet.getString("Id");
            usernameValue = resultSet.getString("Name");
            dob = resultSet.getString("DOB");
            phoneno = resultSet.getString("PhoneNo");
            email = resultSet.getString("Email");
            password = resultSet.getString("Password");
            address = resultSet.getString("Address");
            city = resultSet.getString("City");
            course = resultSet.getString("Course");
        }

        // Populate the JSON object with user data
        userData.put("id", id);
        userData.put("username", usernameValue); 
        userData.put("dob", dob);
        userData.put("password", password);
        userData.put("email", email);
        userData.put("address", address);
        userData.put("city", city);
        userData.put("course", course);
        userData.put("phoneno", phoneno);

    } catch (SQLException e) {
        e.printStackTrace(); // Handle appropriately in production
    } finally {
        // Close the database connection and resources
        if (resultSet != null) {
            try { resultSet.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
        if (statement != null) {
            try { statement.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
        if (connection != null) {
            try { connection.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }

    // Write the JSON object to the response
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    response.getWriter().write(userData.toString());
%>
