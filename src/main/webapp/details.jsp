<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<title>details</title>
<style>
 body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 80px;
            height: 800px;
            background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-1tKhLGBbNI_bohTZwKSbLYlFte5X4bH5a-zFNxZJjDH5MaUdiQ2_9bgYSkoa4oebblo&usqp=CAU);
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }
        #navbar{
            background-color: aquamarine;
            height: 80px;
            width: 100%;
            text-decoration: none;
            display:flex;
            justify-content: space-between;
            color: rgb(8, 8, 16);
            margin-top: 50px;
           /*  margin-right:50px; */
        }
        .logo {
            display: flex;
            align-items: center;
            margin-left: 20px;
        }
        .logo span {
            font-size: 1em;
            margin-right: 5px;
        }
        .logo span:last-child {
            color: coral;
            font-size: 1.5em;
        }
      
      .menubar {
            display: flex;
            align-items: center;
            /* margin-left: 80px;
           justify-content: space-between; */
        }  
        .list {
            list-style: none;
            display: flex;
            margin: 0;
            padding: 0;
        }      
        .list_item {
            text-align: center;
            display:inline;
            margin-right: 100px;
            margin-top: 30px;
            color: #792f62; 
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            text-decoration: none;
             justify-content: space-between;
        }
        .list_item a:hover{
            color: #792f62;
        }
        .anchor{
            text-decoration: none;
        }

        .dropdown-content {
            display: none;
            position:absolute;
            background-color: orange;
            margin-right: 300px;
            min-width: 200px;
        }

        /* .dropdown-content li {
            float: none;
        } */

        .dropdown-content li a {
            color: black;
            text-decoration: solid;
            display: block;
            text-align: left;
            position:relative;
        }

        .dropdown-content li a:hover {
            background-color: #f1f1f1;
        }

        /* Show the dropdown menu on hover */
        .dropdown:hover .dropdown-content {
            display: block;
        }
        
/*         #searchButton{
            width: 165px;
            height:35px;
            border-width: 2px;
        }
 */      
        button {
            padding: 10px 20px;
            font-size: 16px;
            margin: 10px;
        }
        
        button:hover {
            background-color: orange;
            
        }
        .form-container {
            display: none;
        }
        .form-container.active {
            display: block;
        }
        form {
            margin-left: 200px;
            text-align: left;
        }
        .dropdown-toggle {
            display: flex;
            align-items: center;
        }
        .fa-caret-up, .fa-caret-down {
            margin-left: 5px;
        }
    </style>
</head>

<body>
<nav id=navbar>
  
    <div class="logo">
       <!--   <i class="fas fa-dragon"></i>-->
        <span style="font-size:1em">Comfort</span><span style="color: coral;font-size: 1.5em;">Learning</span>
    </div>
   <div class="menubar">
      <ul class="list"> 
                <li class="list_item dropdown">
                <a class="anchor dropdown-toggle" href="javascript:void(0)">Home
                    <i class="fa fa-caret-down" id="downArrow" style="display: inline;"></i>
                    <i class="fa fa-caret-up" id="upArrow" style="display: none;"></i>
                </a>
                 <ul class="dropdown-content" id="dropdownMenu">
                    <li><a href="#">services</a></li>
                    <li><a href="#">product</a></li>
                    <li><a href="#">care</a></li>
                    
                </ul>
                </li>
       <li class="list_item"><a  class="anchor" href="#">About</a> </li>
       <li class="list_item dropdown">
                <a class="anchor dropdown-toggle" href="javascript:void(0)">Content
                    <i class="fa fa-caret-down" id="downArrow" style="display: inline;"></i>
                    <i class="fa fa-caret-up" id="upArrow" style="display: none;"></i>
                </a>
                <ul class="dropdown-content" id="dropdownMenu">
                    <li><a href="#">Machine Learning</a></li>
                    <li><a href="#">AI</a></li>
                    <li><a href="#">Java</a></li>
                    <li><a href="#">Python</a></li>
                    <li><a href="#">MERN Stack</a></li>
                </ul>
            </li>
      <li class="list_item"><a  class="anchor" href="#">Contact</a></li>
     </ul>  
     <button id="searchButton">Search</button>
  </div>
</nav>
<div id="searchForm" class="form-container" style=" width: fit-content; ">
    <h2>Search</h2>
    <form id="searchFormElement" method="post">
        <input type="hidden" name="action" value="search">
        <label>Phone No.:</label><br>
        <input type="text" name="searchPhoneNo" placeholder="Phone No." required><br><br>
        <label>Date of Birth:</label><br>
        <input type="date" name="searchDob" required><br><br>
        <button type="submit">Search</button>
    </form>
</div>
 
	
<script type="text/javascript">
document.getElementById('searchButton').addEventListener('click', function() {
        document.getElementById('searchForm').classList.add('active');
        document.getElementById('loginForm').classList.remove('active');
        document.getElementById('registerForm').classList.remove('active');
    });

    document.querySelectorAll('.dropdown-toggle').forEach(function(dropdownToggle) {
        dropdownToggle.addEventListener('click', function() {
            var dropdownContent = this.nextElementSibling;
            var caretDown = this.querySelector('.fa-caret-down');
            var caretUp = this.querySelector('.fa-caret-up');
            if (dropdownContent.style.display === 'block') {
                dropdownContent.style.display = 'none';
                caretDown.style.display = 'inline';
                caretUp.style.display = 'none';
            } else {
                dropdownContent.style.display = 'block';
                caretDown.style.display = 'none';
                caretUp.style.display = 'inline';
            }
        });
    });
</script>
 <table border="1">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>DOB</th>
				<th>Password</th>
				<th>PhoneNo</th>
				<th>Email</th>
				<th>City</th>
				<th>Address</th>
				<th>Course</th>
				<th>Actions</th>
 			</tr>
	

	
<%
	String action = request.getParameter("action");
	if (action == null) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

	try {
		String url = "jdbc:mysql://localhost:3306/Registration";
		String user = "root";
		String pass = "Mousumi@1998";

			// Load the JDBC driver
		Class.forName("com.mysql.cj.jdbc.Driver");
			// Establish and return the connection
		con = DriverManager.getConnection(url, user, pass);
		  pst = con.prepareStatement("SELECT * FROM Student");
	      rs = pst.executeQuery();
while (rs.next()) {
%>

<tr>
<td><%=rs.getInt("Id") %></td>
<td><%=rs.getString("Name") %></td>
<td><%=rs.getString("DOB") %></td>
<td><%=rs.getString("Password") %></td>
<td><%=rs.getString("PhoneNo") %></td>
<td><%=rs.getString("Email") %></td>
<td><%=rs.getString("City") %></td>
<td><%=rs.getString("Address") %></td>
<td><%=rs.getString("Course") %></td>
<td><button type="button" class="submit-btn" style="background-color: blue"onclick="openEditUserModal(<%= rs.getInt("Id") %>)">Edit</button></td>
<td><button type="button" class="submit-btn" style="background-color: blue"onclick="openEditUserModal(<%= rs.getInt("Id") %>)">Delete</button></td>
</tr>
<%
}
%>
</table>
<script>
 function updateUser(id,userData){
			console.log(id);
		}
		const editUser = async (id)=>{
			var editUserModal = new bootstrap.Modal(document.getElementById('editModal'));
			editUserModal.show();
			const userData = await fetchUserData(id);
			document.getElementById("editId").value = userData.id;
	        document.getElementById("editName").value = userData.username;
	        document.getElementById("editDob").value = userData.dob;
	        document.getElementById("editPassword").value = userData.password;
	        document.getElementById("editPhoneNo").value = userData.phoneno;
	        document.getElementById("editEmail").value = userData.email;
	        document.getElementById("editCity").value = userData.city;
	        document.getElementById("editCourse").value = userData.course;
	        document.getElementById("editAddress").value = userData.address;

	        document.getElementById("editUserBtn").onclick = () => {
	            const updatedUserData = {
	                id: document.getElementById("editId").value,
	                username: document.getElementById("editName").value,
	                dob: document.getElementById("editDob").value,
	                password: document.getElementById("editPassword").value,
	                phoneno: document.getElementById("editPhoneNo").value,
	                email: document.getElementById("editEmail").value,
	                city: document.getElementById("editCity").value,
	                course: document.getElementById("editCourse").value,
	                address: document.getElementById("editAddress").value
	            };

	            updateUser(id, updatedUserData);
	        };
	    }
		</script>


<%
if ("edit".equals(action)) {
       int id = Integer.parseInt(request.getParameter("id"));
       String name = "", email = "";
       pst= con.prepareStatement("SELECT * FROM Student WHERE Id = ?");
       pst.setInt(1, id);
       rs = pst.executeQuery();

     if (rs.next()) {
      name = rs.getString("name");
      email = rs.getString("email");
}
}else if ("update".equals(action)) {
  	int id = Integer.parseInt(request.getParameter("Id"));
  	String name = request.getParameter("name");
  	String email = request.getParameter("email");

  	pst = con.prepareStatement("UPDATE Student SET Name= ?, Email = ? WHERE Id = ?");
  	pst.setString(1, name);
  	pst.setString(2, email);
  	pst.setInt(3, id);
  	pst.executeUpdate();

  	response.sendRedirect("details.jsp");
}

else if ("delete".equals(action)) {
      int id = Integer.parseInt(request.getParameter("Id"));

      pst = con.prepareStatement("DELETE FROM Student WHERE Id = ?");
      pst.setInt(1, id);
      pst.executeUpdate();

     response.sendRedirect("details.jsp");
}
}catch (Exception e) {
e.printStackTrace();
} finally {
if (rs != null)
try {
rs.close();
} catch (SQLException e) {
}
if (pst != null)
try {
pst.close();
} catch (SQLException e) {
}
if (con != null)
try {
con.close();
} catch (SQLException e) {
}
}
}

%>
<%--
HttpSession Session = request.getSession(false);
     String username = (session != null) ? (String) Session.getAttribute("username") : null;
     String phone = (session != null) ? (String) Session.getAttribute("phone") : null;
     String course= (session != null) ? (String) Session.getAttribute("course") : null;
     String city = (session != null) ? (String) Session.getAttribute("city") : null;
     String address = (session != null) ? (String) Session.getAttribute("address") : null;
     /* if (username != null && phone!=null && course!=null && city!=null && address!=null) { */
     %>
     <h1>Name: <%= username %></h1>
     <h1>PhoneNo: <%= phone %></h1>
     <h1>Course: <%= course %></h1>
     <h1>City: <%= city %></h1>
     <h1>Address: <%= address %></h1>
    <%
       //  }
     %> --%>

</body>
</html>