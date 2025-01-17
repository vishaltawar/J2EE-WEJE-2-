<%@page import="com.jspider.springmvc.pojo.StudentPojo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="Navbar.jsp"></jsp:include>
<%
StudentPojo student = (StudentPojo) request.getAttribute("student");
String massage = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Student Details</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	background: radial-gradient(rgb(22, 227, 11), rgb(12, 241, 146))
		no-repeat;
	background-size: cover;
	min-height: 100vh;
	max-height: auto;
}

#main {
	border: 1px solid;
	margin: 50px auto 30px auto;
	min-width: 250px;
	max-width: 30%;
	padding: 20px;
	box-shadow: 8px 8px 5px; border-radius : 10px;
	background-color: rgba(244, 235, 235, 0.52);
	border-radius: 10px;
}

table {
	margin: 0 auto;
}

input {
	width: 100%;
	margin: 5px;
	border-radius: 5px;
	background: none;
	outline: none;
	padding: 8px;
	color: red;
	padding-left: 15px;
}

#search {
	background-color: rgb(21, 252, 63);
	color: black;
	font-weight: bolder
}

#headtext {
	text-align: center;
	padding: 5px 0px 15px 0px;
	color: black;
}

.responce {
	color: red;
	text-align: center;
}

#table2 {
	width: 380px;
	padding: 10px;
	background-color: yellow;
	border-radius: 5px;
	margin: 0px auto 20px auto;
}

#table2 tr {
	border: 2px solid;
	color: black;
}
</style>
</head>
<body>
	<div id="main">
		<h2 id="headtext">Search Student</h2>
		<form action="./search" method="post">
			<table>
				<tr>
					<td><input type="text" placeholder="Enter Student Id"
						name="id"></td>
				</tr>
				<tr>
					<td><input id="search" type="submit" value="Search"></td>
				</tr>
			</table>
		</form>
	</div>
	<%
	if (student != null) {
	%>
	<table id="table2">
		<tr>
			<td><label>Student Id</label></td>
			<td>: <%=student.getId()%></td>
		</tr>
		<tr>
			<td><label><label>Student Name</label></label></td>
			<td>: <%=student.getName()%></td>
		</tr>
		<tr>
			<td><label>Contact</label></td>
			<td>: <%=student.getContact()%></td>
		</tr>
		<tr>
			<td><label>City</label></td>
			<td>: <%=student.getCity()%></td>
		</tr>
		<tr>
			<td><label>Username</label></td>
			<td>: <%=student.getUsername()%></td>
		</tr>
		<tr>
			<td><label>Password</label></td>
			<td>: <%="****"%></td>
			<!-- <td  ><%=student.getPassword()%></td>  -->
		</tr>

	</table>
	<%
	} else if (massage != null) {
	%>
	<h3 class="responce"><%=massage%></h3>
	<%
	}
	%>
</body>
</html>