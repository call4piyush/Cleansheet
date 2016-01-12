<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
<link rel="stylesheet" href="css/style.css">
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
	<div class="login-card " style="top: 25%">
		<img src="./images/logo.jpg" alt="Logo"> <br>
		<h4>
			<center>User Created Successfully</center>
		</h4>
		<h4>
			<center>LogIn To Continue</center>
		</h4>
		<form action="Login" method="post">
			<input type="text" class="form-control" name="emp"
				placeholder="User Id" required> <input type="password"
				class="form-control" name="pass" placeholder="Password" required>
			<button type="submit" class="login login-submit" name="login">Sign
				In</button>
			<a href="register.jsp" class="help"
				style="float: right; color: black; background-color: white">Sign
				Up</a>
		</form>
	</div>
</body>
</html>
