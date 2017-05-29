<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Log In Page</title>
<style>
body {
	margin-top: 12%;
	margin-left: 30%;
	margin-right: 25%;
	margin-bottom: 25%;
}

p {
	color: red;
	text-align: center;
	font-weight: bold;
	font-size: 20px;
}

.body {
	text-align: center;
	padding-bottom: 50px;
	border-style: outset;
	margin-top: 12%;
	margin-left: 28%;
	margin-right: 10%;
	background-color: #4ABDAC;
}
</style>
</head>
<body>
	<%@ page session="false"%>

	<div class="body">
		<h1>Log In page</h1>
		<p>${message}</p>
		<form:form modelAttribute="loginFormData" action="checkUser"
			method="post" onsubmit="return formvalidation()">
			<table>
				<tr>
					<td><form:label path="userName">User Name</form:label></td>
					<td><form:input path="userName" name="username" id="username" />
					</td>
				</tr>
				<tr>
					<td><form:label path="passWord">Password</form:label></td>
					<td><form:password path="passWord" name="password"
							id="password" /></td>
				</tr>
				<tr>
					<td><input type="submit" value="Log In"><br>
				</tr>
			</table>
		</form:form>
	</div>
	<script>
		function usernameValidation() {
			userName = document.LoginForm.uname.value;
			var chars = userName.toLowerCase();
			for (i = 0; i < chars.length; i++) {
				if (chars.charAt(i) >= 'a' && chars.charAt(i) <= 'z') {
				} else {
					alert("Invalid Username, Only Alphabets");
					return false;
				}
			}
			return true;
		}
	</script>
</body>
</html>