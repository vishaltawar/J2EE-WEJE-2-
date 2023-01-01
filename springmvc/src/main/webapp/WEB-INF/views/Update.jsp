<%@page import="java.util.List"%>
<%@page import="com.jspider.springmvc.pojo.StudentPojo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="Navbar.jsp"></jsp:include>
<%
List<StudentPojo> students = (List<StudentPojo>) request.getAttribute("students");
StudentPojo studentStatus=(StudentPojo)request.getAttribute("student");
String msg = (String) request.getAttribute("msg");
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
	background: radial-gradient(rgb(101, 234, 30), rgb(15, 163, 116))
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
	padding-left: 15px;
}

#update {
	background-color: rgb(175, 220, 16);
	color: black;
	font-weight: bolder
}

h3 {
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
	border: 1px solid;
	border-spacing: 10px;
	
}

#fld {
	width: 95%;
	margin: 0 auto 20px auto;
}
</style>
</head>
<body>
	<div id="main">
		<h3>Update Student Details</h3>
		<form action="./update" method="post">
			<table>
				<tr>
					<td><input type="text" required placeholder="Enter Student Id"
						name="id"></td>
				</tr>
				<tr>
					<td><input id="update" type="submit" value="Update"></td>
				</tr>
			</table>
		</form>
	</div>
<%if(studentStatus!=null){ %>
	<%=msg%>
	<%}
	if (students != null) {
	%>
	<fieldset id="fld">
		<legend align="center">
			<h2 style="margin: 0 15px;">Student Details</h2>
		</legend>
		<table id="table2">
			
				<tr>
					<td><h3>SudentId</h3></td>
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
				<td><%=student.getPassword()%></td>
			</tr>
			<%
			}
			%>

		</table>
	</fieldset>
	<%
	}
	%>
</body>
</html>