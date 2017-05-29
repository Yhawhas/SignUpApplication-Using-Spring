<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE HTML >


<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Registration Page</title>
<style>
p {
	color: red;
	font-weight: bold;
}
.body {
	text-align: center;
	padding-bottom: 50px;
	border-style: outset;
	margin-top: 12%;
	margin-left: 35%;
	margin-right: 29%;
	background-color: #4ABDAC;
}
</style>
<script src="/resources/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function usernameValidation() {
		var chars = userName.toLowerCase();
		for (i = 0; i < chars.length; i++) {
			var nchar = chars.charAt(i);
			if (chars.charAt(i) >= 'a' && chars.charAt(i) <= 'z') {
			} else {
				return false;
			}
		}
		return true;
	}

	function containsCapital() {
		for (i = 0; i < userPassword.length; i++) {
			if (userPassword.charCodeAt(i) >= 65
					&& userPassword.charCodeAt(i) <= 90) {
				return true;
			}
		}
		return false;
	}

	function containsSpecialCharacter() {
		var specialCharacterArray = [ '!', '@', '#', '$', '%', '^', '&', '*',
				'(', ')', '-', '_', '+', '=' ];
		var charSet = new Set(specialCharacterArray);
		for (i = 0; i < userPassword.length; i++) {
			var char = userPassword.charAt(i);
			if (charSet.has(char)) {
				return true;
			}
		}
		return false;
	}

	function containsNumber() {
		for (i = 0; i < userPassword.length; i++) {
			if (userPassword.charCodeAt(i) >= 48
					&& userPassword.charCodeAt(i) <= 57) {
				return true;
			}
		}
		return false;
	}

	function formvalidation() {
		userName = document.getElementById("username").value;
		userPassword = document.getElementById("password1").value;
		var userPassword2 = document.getElementById("password2").value;

		if (userName.length < 3 || !usernameValidation()) {
			alert(" Incorrect Username, only alphabets are allowed")
			return false;
		}
		if (userPassword != userPassword2) {
			alert("Password Mismatch")
			return false;
		}
		if (userPassword.length < 6) {
			alert("Password character should be more than 6");
			return false;
		}
		if (!containsCapital()) {
			alert("Password should have atleast 1 capital letter");
			return false;
		}
		if (!containsSpecialCharacter()) {
			alert("Password should have atleast 1 special character");
			return false;
		}
		if (!containsNumber()) {
			alert("Password should have atleast 1 Number");
			return false;
		} else {
			return true;
		}
	}

	function checkUser() {
		var username = document.getElementById("username").value;
		var text = "username=" + username;
		$.ajax({
					type : "POST",
					url : "/checkUserAvailability",
					data : text,
					success : function(status) {
						if (status == "false") {
							$("#checkUsername").html(
									"<b>User name available</b>");
							$("#checkUsername").css("color", "yellow");
							$("#submit").removeAttr("disabled");
						} else {
							$("#checkUsername").html(
									"<b>Username is unavailable</b>");
							$("#checkUsername").css("color", "red");
							$("#submit").attr("disabled", "disabled");
						}
					}
				});
		return false;
	}
</script>
</head>
<body>
	<%@ page session="false"%>
	<div class="body">
		<h1>Sign Up</h1>

		<p>${signupErrorMessage}</p>
		<form:form modelAttribute="userFormData" action="registerUser"
			method="post" onsubmit="return formvalidation()">
			<table>
				<tr>
					<td><form:label path="userName">Enter User Name</form:label></td>
					<td><form:input path="userName" name="username" id="username"
							onblur="return checkUser()" /></td><td><span id="checkUsername"></span></td>
				</tr>
				
				<tr>
					<td><form:label path="passWord">Enter Password</form:label></td>
					<td><form:password path="passWord" name="password1"
							id="password1" /></td>
				</tr>
				<tr>
					<td><label>Confirm Password:</label></td>
					<td><input type="password" name="password2" id="password2"
						required></td>
				</tr>
				<tr>
					<td><input type="submit" value="Sign Up" id="submit"><br>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>
