 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
<title>Login or Register</title>
<style>
body {
	font-family: Arial, sans-serif;
	text-align: center;
	margin-top: 80px;
	height: 100%;
	background-image:
		url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-1tKhLGBbNI_bohTZwKSbLYlFte5X4bH5a-zFNxZJjDH5MaUdiQ2_9bgYSkoa4oebblo&usqp=CAU);
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}

#navbar {
	background-color: aquamarine;
	height: 80px;
	width: 100%;
	text-decoration: none;
	display: flex;
	justify-content: space-between;
	color: rgb(8, 8, 16);
	margin-top: 50px;
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
}

.list {
	list-style: none;
	display: flex;
	margin: 0;
	padding: 0;
}

.list_item {
	text-align: center;
	display: inline;
	margin-right: 100px;
	margin-top: 30px;
	color: #792f62;
	font-family: Verdana, Geneva, Tahoma, sans-serif;
	text-decoration: none;
	justify-content: space-between;
}

.list_item a:hover {
	color: #792f62;
}

.anchor {
	text-decoration: none;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: orange;
	margin-right: 300px;
	min-width: 200px;
}

.dropdown-content li a {
	color: black;
	text-decoration: solid;
	display: block;
	text-align: left;
	position: relative;
}

.dropdown-content li a:hover {
	background-color: #f1f1f1;
}

.dropdown:hover .dropdown-content {
	display: block;
}

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

table {
	width: 50%;
	margin: 20px auto;
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid black;
}

th, td {
	padding: 10px;
	text-align: center;
}

.form-container {
	width: 50%;
	margin: 20px auto;
}
#editUserModal{
display:none;
}
#editUserModal.active{
display:block;
}
</style>

</head>
<body>
	<nav id="navbar">
		<div class="logo">
			<span style="font-size: 1em">Comfort</span><span
				style="color: coral; font-size: 1.5em;">Learning</span>
		</div>
		<div class="menubar">
			<ul class="list">
				<li class="list_item dropdown"><a
					class="anchor dropdown-toggle" href="crud.jsp">Home <i
						class="fa fa-caret-down"></i> <i class="fa fa-caret-up"
						style="display: none;"></i>
				</a>
					<ul class="dropdown-content">
						<li><a href="#">Services</a></li>
						<li><a href="#">Product</a></li>
						<li><a href="#">Care</a></li>
					</ul></li>
				<li class="list_item"><a class="anchor" href="#">About</a></li>
				<li class="list_item dropdown"><a
					class="anchor dropdown-toggle" href="javascript:void(0)">Content
						<i class="fa fa-caret-down"></i> <i class="fa fa-caret-up"
						style="display: none;"></i>
				</a>
					<ul class="dropdown-content">
						<li><a href="#">Machine Learning</a></li>
						<li><a href="#">AI</a></li>
						<li><a href="#">Java</a></li>
						<li><a href="#">Python</a></li>
						<li><a href="#">MERN Stack</a></li>
					</ul></li>
				<li class="list_item"><a class="anchor" href="#">Contact</a></li>
			</ul>
			<button id="searchButton">Search</button>
		</div>
	</nav>


	<div>
		<h1 style="color: rgb(63, 31, 92);">Welcome! Students</h1>
		<h1>Do you have an account?</h1>
		<button id="yesButton">Yes</button>
		<button id="noButton">No</button>
	</div>

	<div id="loginForm" class="form-container"
		style="background-color: #d7d184; width: fit-content; padding: 3px;">
		<h2>Login</h2>
		<form id="loginFormElement" method="post">
			<input type="hidden" name="action" value="login"> <label>Username:</label>
			<input type="text" name="loginUsername" placeholder="Username"
				required><br> <br> <label>Password:</label> <input
				type="password" name="loginPassword" placeholder="Password" required><br>
			<br>
			<button type="submit">Login</button>
		</form>
	</div>

	<div id="registerForm" class="form-container"
		style="padding: 3px; background-color: bisque; width: fit-content;">
		<h2>Registration</h2>
		<form id="registerFormElement" method="post">
			<input type="hidden" name="action" value="register">
			 <label>Name:</label>
			<input type="text" name="registerUsername" placeholder="Username"
				required><br> <br> <label>Date of Birth:</label> <input
				type="date" name="registerDob" required><br> <br>
			<label>Password:</label> <input type="password"
				name="registerPassword" placeholder="Password" required><br>
			<br> <label>Phone No.:</label> <input type="tel"
				name="registerPhoneNo" placeholder="Phone No." required
				pattern="[0-9]{10}" required><br> <br> <label>Email:</label>
			<input type="email" name="registerEmail" placeholder="Email" required><br>
			<br> <label>Course:</label> <select name="registerCourse"
				id="registerCourse">
				<option value="python">Python</option>
				<option value="javascript">JavaScript</option>
				<option value="java">Java</option>
				<option value="csharp">C#</option>
				<option value="cpp">C++</option>
				<option value="php">PHP</option>
			</select><br> <br> <label>City:</label> <input type="text"
				name="registerCity" placeholder="City" required><br> <br>
			<label>Address:</label>
			<textarea name="registerAddress" placeholder="Address" required></textarea>
			<br> <br>
			<button type="submit">Register</button>
		</form>
	</div>

	<div id="searchForm" class="form-container" style="width: fit-content;background-color: #d7d184 ">
		<form id="searchFormElement" method="post">
			<input type="hidden" name="action" value="search"> 
			<label>PhoneNo.:</label><br> <input type="text" name="searchPhoneNo"
				placeholder="Phone No." required><br> <br> 
				<label>Date of Birth:</label><br> <input type="date" name="searchDob" required><br>
			<br>
			<button type="submit">Search</button>
		</form>
	</div>
	<!-- <div class="form-container">
		<h2>Edit User</h2>
		<form method="post" action="singlePage.jsp?action=update">
			<input type="hidden" name="id" value="id"> <label>Name:
			</label> <input type="text" name="name" value=" name "><br> <label>Email:
			</label> <input type="text" name="email" value=" email"><br>
			<button type="submit">Update</button>
		</form>
	</div> -->
	
	 
	

	
<%
	String action = request.getParameter("action");
 System.out.println(action);
	/* if (action == null) { */
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
	     
	  %>
	      <table>
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
	    	  <td><button type="button" id="submit-btn" style="background-color: blue" onclick="editUser(<%=rs.getInt("Id") %> )">Edit</button></td>
	    	  <td><button type="button" id="submit-btn" style="background-color: blue"onclick="deleteUser(<%= rs.getInt("Id") %>)">Delete</button></td>
	    	  </tr>
	   <%
	    }
	   %>
	    	 </table>  
	  <% 
	  if(action!=null){
	      
	   if (action.equals("login")) {
	          String username = request.getParameter("loginUsername");
	          String pasword = request.getParameter("loginPassword");
	      	System.out.println(username+" "+pasword);
	          pst = con.prepareStatement("SELECT * FROM student WHERE Name=? AND Password=?");
	          pst.setString(1, username);
	          pst.setString(2, pasword);
	          rs = pst.executeQuery();
	          

	            if (rs.next()) {
	            // Store username in session
	            session.setAttribute("username", username);
	            // Redirect to welcome page
	            response.sendRedirect("welcome.jsp");
	            } else {
	             out.println("<script>alert('Invalid username or password');</script>");
	      }
	      } else if (action.equals("register")) {
	           String username = request.getParameter("registerUsername");
	           String dob = request.getParameter("registerDob");
	           String password = request.getParameter("registerPassword");
	           String phone = request.getParameter("registerPhoneNo");
	           String email = request.getParameter("registerEmail");
	           String course = request.getParameter("registerCourse");
	           String city = request.getParameter("registerCity");
	           String address = request.getParameter("registerAddress");

	          pst = con.prepareStatement("INSERT INTO student (Name, DOB, Password, PhoneNo, Email,Course, City, Address) VALUES (?, ?, ?, ?, ?,?, ?, ?)");
	      	  pst.setString(1, username);
	          pst.setString(2, dob);
	          pst.setString(3, password);
	          pst.setString(4, phone);
	          pst.setString(5, email);
	          pst.setString(6, course);
	          pst.setString(7, city);
	          pst.setString(8, address);
	        
	          int row = pst.executeUpdate();
	          if (row > 0) {
	            out.println("<script>alert('Registration successful');</script>");
	            session.setAttribute("username", username);
	            // Redirect to welcome page
	            response.sendRedirect("welcome.jsp");
	          } else {
	             out.println("<script>alert('Registration failed');</script>");
	      }
	      } else if (action.equals("search")) {
	             String phone = request.getParameter("searchPhoneNo");
	             String DOB = request.getParameter("searchDob");
	             System.out.println(DOB);
	             // System.out.println("yes");
	             pst = con.prepareStatement("SELECT * FROM student WHERE PhoneNo=? AND DOB=?");
	             // System.out.println(pst);
	             pst.setString(1, phone);
	             pst.setString(2, DOB);
	             rs = pst.executeQuery();
	             System.out.println(rs = pst.executeQuery());
	             if (rs.next()) {

	             session.setAttribute("phone", phone);
	             session.setAttribute("DOB", DOB);
	             session.setAttribute("username", rs.getString("name"));
	             session.setAttribute("email", rs.getString("email"));
	             session.setAttribute("city", rs.getString("city"));
	             session.setAttribute("address", rs.getString("address"));
	             session.setAttribute("course", rs.getString("course"));

	             response.sendRedirect("details.jsp");
	            } else {
	              out.println("<script>alert('Invalid Phoneno or date of birth');</script>");
	      }
	      }else if ("edit".equals(action)) {
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
	
   %>
   
<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
   <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">	
        <h5 class="modal-title" id="editUserModalLabel">Edit User</h5>
        <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- Form for adding a new user -->
        <form id="editUserForm" method="post">
          <!-- Input fields for each column in the table -->
        <div class="form-group">
          <label for="userId">Id</label>
          <input type="text" class="form-control" id="editId" name="editId" readonly>
        </div>
        <div class="form-group">
          <label for="name">Name</label>
          <input type="text" class="form-control" id="editName" name="editName">
        </div>
         <div class="form-group">
          <label for="dob">DOB</label>
          <input type="text" class="form-control" id="editDob" name="editDob">
        </div>
        <div class="form-group">
          <label for="password">Password</label>
          <input type="text" class="form-control" id="editPassword" name="editPassword">
        </div>
        <div class="form-group">
          <label for="phoneno">PhoneNo</label>
          <input type="text" class="form-control" id="editPhoneNo" name="editPhoneNo">
        </div>
        <div class="form-group">
          <label for="email">Email</label>
          <input type="text" class="form-control" id="editEmail" name="editEmail">
        </div>
        <div class="form-group">
          <label for="city">City</label>
          <input type="text" class="form-control" id="editCity" name="editCity" >
        </div> 
        <div class="form-group">
           <label for="course">Course</label>
           <input type="text" class="form-control" id="editCourse" name="editCourse">
        </div>   
        <div class="form-group">
           <label for="address">Address</label>
           <input type="text" class="form-control" id="editAddress" name="editAddress">
        </div>
        <button type="button" class="btn btn-primary" id="editUserBtn">Update</button>
      </form>                                                                                                                                            
      </div>
    </div>
  </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<script>
		
		document.getElementById('yesButton').addEventListener(
				'click',
				function() {
					document.getElementById('loginForm').classList
							.add('active');
					document.getElementById('registerForm').classList
							.remove('active');
					document.getElementById('searchForm').classList
							.remove('active');
				});

		document.getElementById('noButton').addEventListener(
				'click',
				function() {
					document.getElementById('registerForm').classList
							.add('active');
					document.getElementById('loginForm').classList
							.remove('active');
					document.getElementById('searchForm').classList
							.remove('active');
				});

		document.getElementById('searchButton').addEventListener(
				'click',
				function() {
					document.getElementById('searchForm').classList
							.add('active');
					document.getElementById('loginForm').classList
							.remove('active');
					document.getElementById('registerForm').classList
							.remove('active');
				});
		 document.getElementById('submit-btn').addEventListener('click',function(){
			document.getElementById('editUserModal').classList.add('active');
			
		}) 
		

		document.querySelectorAll('.dropdown-toggle').forEach(
    function (dropdownToggle) {
        dropdownToggle.addEventListener('click', function () {
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
    }
);
		 async function updateUser(id, updatedUserData){
			
			 try{
				 const res = await fetch('UpdateUser.jsp',{
					 method: 'POST',
					    headers: {
					        'Content-Type': 'application/x-www-form-urlencoded',
					    },
					    body: new URLSearchParams(updatedUserData)
					 
				 });
					const userData = await res.json();
					
				 }
			 catch(error){
				 
			 }
			 finally{
				 window.location.reload();
			 }
			 
			
			}
		 
		 
			const editUser = async (id)=>{

				var editUserModal = new bootstrap.Modal(document.getElementById('editModal'));
	            editUserModal.show();
				const res = await fetch('fetchUserData.jsp?id='+id);
				const userData = await res.json();
				if(userData){
				document.getElementById("editId").value = userData.id;
		        document.getElementById("editName").value = userData.username;
		        document.getElementById("editDob").value = userData.dob;
		        document.getElementById("editPassword").value = userData.password;
		        document.getElementById("editPhoneNo").value = userData.phoneno;
		        document.getElementById("editEmail").value = userData.email;
		        document.getElementById("editCity").value = userData.city;
		        document.getElementById("editCourse").value = userData.course;
		        document.getElementById("editAddress").value = userData.address;
				}

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
		    };
		    
		    async function deleteUser(id)
		    {
		try{
	    	
			  const obj= confirm("Are you sure to delete?")
			  if(obj){
				  const res = await fetch('DeleteUser.jsp?id='+id);
				  const userData = await res.json();
			  }
			  
		}
		catch(err){
			
		}finally{
			window.location.reload();
		}
			  
		  
		    	
		    }
		    
		    
		    
		    
		    
		    
</script>
</body>
</html>

