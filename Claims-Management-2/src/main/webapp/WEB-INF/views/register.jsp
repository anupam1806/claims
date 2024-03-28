<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/jquery-3.4.1.js"></script>
<title>Home Page</title>
<style>
body{
min-height:100vh;
background-repeat:no-repeat;
background:linear-gradient(rgba(255,255,255,.7),rgba(255,255,255,.7)),url('images/newimg3.jpg') no-repeat fixed center;
background-size:100% 100%;
}
</style>
</head>
<body>
<div class="jumbotron rounded-0 p-2 text-center text-white shadow" style="background-color:rgba(33,33,33,0.3)">
	<h4>Claims Management System</h4>
</div>
<div class="container">
	<div class="row">	
		<div class="col-sm-6 mx-auto">
			<div class="card shadow bg-transparent mt-3">
				<div class="card-body">
				<form method="post">
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">First Name</label>
					<div class="col-sm-8">
						<input type="text" name="firstname" required class="form-control" pattern="[A-Za-z]{3,15}">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Last Name</label>
					<div class="col-sm-8">
						<input type="text" name="lastname" required class="form-control" pattern="[A-Za-z]{3,15}">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Date of Birth</label>
					<div class="col-sm-8">
						<input type="date" name="dob" id="dob" required class="form-control">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Address</label>
					<div class="col-sm-8">
						<input type="text" name="state" required class="form-control">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Contact Number</label>
					<div class="col-sm-8">
						<input type="text" name="phone" maxlength="10" required class="form-control" pattern="[0-9]{10,10}">
					</div>
				</div>
								
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">userId</label>
					<div class="col-sm-8">
						<input type="text"  name="userId" required class="form-control">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">User name</label>
					<div class="col-sm-8">
						<input type="text" pattern="[A-Za-z]{2,}$" name="username" required class="form-control">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Password</label>
					<div class="col-sm-8">
						<input type="password" name="password" required class="form-control">
					</div>
				</div>
				<button class="btn btn-primary float-right mr-3">Register</button>
			</form>
					<div class="clearfix"></div>
					<c:if test="${error ne null }">
						<div class="alert alert-danger font-weight-bold text-center mt-2">
							${error}
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>
 
</body>
</html>