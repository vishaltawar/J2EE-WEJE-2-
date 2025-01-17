<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Management</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
/*
body {
	min-width: 700px;
	height: 100vh;
	background:
		url(https://images.pexels.com/photos/267586/pexels-photo-267586.jpeg)
		no-repeat center center/cover;;
}
*/
nav {
	border: 1px solid;
	padding: 10px;
	min-width: 700px;
	box-shadow: 12px 10px 15px;
	height: auto;
	background: linear-gradient(rgb(34, 44, 92), rgb(31, 171, 227));
	display: flex;
	justify-content: space-between;
}

.logo {
	/*border: 1px solid;*/
	padding: 5px 0px 0px 35px;
	min-width: 250px;
	color: white;
	cursor: pointer;
}

.logo:hover {
	color: orangered;
	border-radius: 8px;
}

ul {
	/*border: 1px solid;*/
	display: flex;
	padding: 10px;
}

ul li {
	/*border: 1px solid  red;*/
	margin: 0 2px;
	list-style: none;
}

ul li:hover {
	background-color: rgba(241, 235, 235, 0.622);
	border-radius: 5px;
}

ul li a:hover {
	color: black;
	border-radius: 5px;
}

ul li a {
	/* border: 1px solid;*/
	color: white;
	text-decoration: none;
	padding: 5px 10px;
	font-size: 25px;
}

#logout {
	background-color: red;
	font-size: 25px;
	font-weight: bolder;
	height: 35px;
	border-radius: 5px;
}
</style>
</head>
<body>
	<nav>
		<div class="logo">
			<h2>Student Management</h2>
		</div>
		<ul>
			<li><a href="./home">Home</a></li>
			<li><a href="./search">Search</a></li>
			<li><a href="./remove">Remove</a></li>
			<li><a href="./update">Update</a></li>
			<li><a href="./add">Add</a></li>
			<li><a href="./view">View</a></li>
			<li id="logout"><a href="./logout">Logout</a></li>
		</ul>
	</nav>
</body>
</html>