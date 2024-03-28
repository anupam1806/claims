<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Claims Management System</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
  :root {
    --primary-color: #4e73df;
    --secondary-color: #f6f6f6;
    --font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  }

  body {
    min-height: 100vh;
    background: var(--secondary-color);
    font-family: var(--font-family);
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 10px;
    box-sizing: border-box;
  }

	.col-sm-4::after{
		content: "*";
		color: red;
	}
  .jumbotron {
    background-color: var(--primary-color);
    color: white;
    border-radius: 0;
    margin-bottom: 2rem;
  }

  .card {
    background-color: rgba(255, 255, 255, 0.8);
    margin-top: 2rem;
  }

  .card-header {
    background-color: red;
    color: white;
    font-size: 1.5rem;
    text-align: center;
  }

  .form-label {
    font-weight: bold;
  }
  .btn-primary:disabled {
  background-color: var(--primary-color);
  opacity: 0.65;
  cursor: not-allowed;
}

  .btn-primary {
    background-color: var(--primary-color);
    border: none;
  }

  .alert {
    margin-top: 1rem;
  }
</style>
<script>
  // Function to hide the error message after a specific duration
  function hideErrorMessage() {
    const errorMessage = document.querySelector('.alert-danger');
    if (errorMessage) {
      setTimeout(function() {
        errorMessage.style.display = 'none';
      }, 3000); // Adjust the duration in milliseconds (e.g., 3000 for 3 seconds)
    }
  }
  
  // Call the function when the document is ready
  document.addEventListener('DOMContentLoaded', function() {
    hideErrorMessage();
  });
</script>
</head>
<body>
<div class="container">
  <div class="jumbotron text-center">
    <h1>Claims Management System</h1>
  </div>
  <div class="card">
    <div class="card-header">
      Login Screen
    </div>
    <div class="card-body">
      <form method="post">
        <div class="form-group">
          <label for="userid" class="form-label col-sm-4">User ID </label>
          <input type="text" id="userid" required class="form-control" name="userid" placeholder="User Id">
        </div>
        
        <div class="form-group">
          <label for="pwd" class="form-label col-sm-4">Password</label>
          <input type="password" id="pwd" required class="form-control" name="pwd" placeholder="Password">
        </div>
        
        <div class="form-group">
          <label for="role" class="form-label col-sm-4">Role</label>
          <select id="role" required class="form-control" name="role">
            <option>Admin</option>
            <option>User</option>
          </select>
        </div>
        <div>
        <button type="submit" class="btn btn-primary float-right" >Login</button>
</div>
      </form>
      
      <c:if test="${error ne null }">
        <div class="alert alert-danger text-center">
          ${error}
        </div>
      </c:if>
      <c:if test="${msg ne null }">
        <div class="alert alert-success text-center">
          ${msg}
        </div>      
      </c:if>
    </div>
  </div>
</div>

</body>
</html>