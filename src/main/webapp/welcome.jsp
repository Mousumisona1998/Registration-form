<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<title>welcome</title>
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
<nav id="navbar">
    <div class="logo">
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
       <li class="list_item"><a class="anchor"href="#">About</a> </li>
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
       <li class="list_item"><a class="anchor" href="#">Contact</a></li>
      </ul> 
      <button id="searchButton">Search</button> 
    </div>
  </nav>
  <div id="searchForm" class="form-container" style=" width: fit-content; ">
    <form id="searchFormElement" method="post">
        <input type="hidden" name="action" value="search">
        <label>Phone No.:</label><br>
        <input type="text" name="searchPhoneNo" placeholder="Phone No." required><br><br>
        <label>Date of Birth:</label><br>
        <input type="date" name="searchDob" required><br><br>
        <button type="submit">Search</button>
    </form>
</div>

<script>
  

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

 <%
        HttpSession Session = request.getSession(false);
        String username = (session != null) ? (String) session.getAttribute("username") : null;
        if (username != null)  {
    %>
        <h1>Welcome, <%= username %>!</h1>
    <%
        }
    %>
    
    
    
    
</body>
</html>