<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<style>
body {
	background: url(./images/trucks.jpg) no-repeat center center fixed;
	background-size: cover;
}
</style>
</head>
<body>
	<div class="container" align="right">
		<h1 align="center" style="color: white;">TRAC- Transport
			Cleansheet Costing Tool</h1>
		<h2 style="padding-right: 35%; color: white;">Login</h2>
		<form class="form-inline" role="form" action="Login" method="post">
			<div class="form-group">
				<input type="text" class="form-control" name="emp"
					placeholder="Enter Employee Id" required>
			</div>
			<div class="form-group">
				<input type="password" class="form-control" name="pass"
					placeholder="Enter Password" required>
			</div>
			<button type="submit" class="btn btn-primary active" name="login">Sign
				In</button>
			<br> <a href="register.jsp"
				style="padding-right: 1%; color: white;">Sign Up</a>
		</form>
	</div>
</body>
</html>
