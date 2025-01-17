<%@page import="java.util.List"%>
<%@page import="com.jspider.springmvc.pojo.StudentPojo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="Navbar.jsp"></jsp:include>

<%

List<StudentPojo> students = (List<StudentPojo>) request.getAttribute("students");
String msg = (String) request.getAttribute("msg");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Remove Student</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	background: radial-gradient(rgb(187, 220, 95), rgb(241, 123, 12))
		no-repeat;
	background-size: cover;
	min-height: 100vh;
	max-height: auto;
}

#main {
	border: 1px solid;
	margin: 50px auto;
	min-width: 250px;
	max-width: 30%;
	padding: 20px;
	border-radius: 10px;
	background-color: rgba(244, 235, 235, 0.52);
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
}

#remove {
	background-color: rgb(252, 90, 21);
	font-weight: bolder;
	color: black;
}

#headtext {
	text-align: center;
	padding: 5px 0px 15px 0px;
	color: black;
}

#table2 {
	margin: 20px auto;
	background-color: yellow;
	width: 100%;
	padding: 15px;
	text-align: center;	
	border-spacing: 0px
}
#table2 tr td{
padding: 8px;
}
#fld{
width: 95%;
margin: 0 auto 20px auto;

}
</style>
</head>
<body>
	<div id="main">
		<h2 id="headtext">Remove Student</h2>
		<form action="./remove" method="post">
			<table>
				<tr>
					<td><input type="text" selected name="id"
						placeholder="Enter Student Id"></td>
				</tr>
				<tr>
					<td><input id="remove" type="submit" value="Remove"></td>
				</tr>
			</table>
		</form>
	</div>

	<%
	if (msg != null) {
	%>
	<h3
		style="margin: 0px auto 15px auto; text-align: center; color: green;"><%=msg%></h3>
	<%
	} 
	if (students != null) {
	%>
	
		<legend align="center">
			<h2 style="margin: 0 15px;padding:5px; background-color: rgb(6 7 7 / 20%); border-radius:10px">Student Details</h2>
		</legend>
		<table id="table2" border="1px solid black";>
			<thead>
				<tr>
					<td><h3>Sudent Id</h3></td>
					<td><h3>Student Name</h3></td>
					<td><h3>Email Id</h3></td>
					
					<td><h3>Contact</h3></td>
					<td><h3>City</h3></td>
					<td><h3>Username</h3></td>
					<td><h3>Password</h3></td>
				</tr>
				<%
				for (StudentPojo student : students) {
				%>
				<tr>
					<td><%=student.getId()%></td>
					<td><%=student.getName()%></td>
					<td><%=student.getEmail()%></td>
					<td><%=student.getContact()%></td>
					<td><%=student.getCity()%></td>
					<td><%=student.getUsername()%></td>
					<td><%="****"%></td>
				</tr>
				<%
				}
				%>
			</thead>
		</table>
	
	<%
	}
	%>


</body>
</html>