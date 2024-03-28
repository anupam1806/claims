<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<script src="js/jquery-3.4.1.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/datatables.js"></script>
<title>Search Claims</title>
<style>
body{
background:linear-gradient(rgba(255,255,255,.7),rgba(255,255,255,0.6)), no-repeat;min-height:100vh;
background-size:100% 100%;
}
a.list-group-item{
	background-color:rgba(255,255,255,0.4);
}
.list-group{
	min-height: 88.5vh;
    background-color: rgba(255,255,255,0.4);
}
</style>
</head>
<body>
<c:set var="url" value="<%= new UrlPathHelper().getOriginatingRequestUri(request) %>"></c:set>
<div class="jumbotron p-3 rounded-0 mb-0 text-left bg-dark text-white">
	<h5 class="float-left"><button class="menu-button" onclick="toggleMenu()"><span class="menu-icon">&#9776;</span></button></h5>
	<a href="/logout" class="float-right btn btn-primary btn-sm" style="background-color:transparent; border-color:transparent; "><i class="fas fa-sign-out-alt fa-2x" style="color:#ffffff;"></i></a>
	<h4>Welcome ${sessionScope.uname } </h4>
	<center><h2>Claims Management System</h2></center>
</div>
<div class="container-fluid">
	<div class="row">
		<% String url= new UrlPathHelper().getOriginatingRequestUri(request); %>
		<div id="menuItems" class="col-sm-2 p-0" style="min-height:30vh; display:none;">
    <div class="list-group mt-2">  
        <c:if test="${sessionScope.role == 'Admin' }"> 
	        <a href="/dashboard" class="list-group-item list-group-item-action">Dashboard</a>
	        <a href="/newmember" class="list-group-item list-group-item-action">New Member</a>
	        <a href="/members" class="list-group-item list-group-item-action">Update Member</a>
	        <a href="/newrequest" class="list-group-item list-group-item-action">New Claim Request</a>
	        <a href="/claims" class="list-group-item list-group-item-action">Search Claim</a>
	        <a href="/process" class="list-group-item list-group-item-action">Process Claim</a>
        </c:if>	
        <c:if test="${sessionScope.role == 'User' }"> 
        	<a href="/profile" class="list-group-item list-group-item-action">Profile</a>
	        <a href="/newmrequest" class="list-group-item list-group-item-action">New Claim Request</a>
	        <a href="/mclaims" class="list-group-item list-group-item-action">My Claims</a>
        </c:if>		
    </div>
</div>
		<div class="col-sm-10 p-2">
			<div class="card shadow" style="background-color:rgba(255,255,255,0.4)">
				<div class="card-body" style="min-height:88.5vh;">
				
			<script>
// JavaScript function to toggle menu visibility
function toggleMenu() {
    var menu = document.getElementById("menuItems");
    if (menu.style.display === "none") {
        menu.style.display = "block";
    } else {
        menu.style.display = "none";
    }
}
</script>	