<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Page</title>
<style>
body {
	margin-top: 10%;
	margin-left: 43%;
	margin-right: 25%;
	margin-bottom: 25%;
}
</style>
	<script>
		function textValidation(){
			var firstName = document.getElementById("firstName").value;
			var lastName = document.getElementById("lastName").value;
			var firstNameString = firstName.toLowerCase();
			var lastNameString = lastName.toLowerCase();
			for (i = 0; i < firstNameString.length; i++) {
				if (firstNameString.charAt(i) >= 'a' && firstNameString.charAt(i) <= 'z') {
				} else {
					alert("Invalid First Name, Only Alphabets");
					return false;
				}
			}
			for (i = 0; i < lastNameString.length; i++) {
				if (lastNameString.charAt(i) >= 'a' && lastNameString.charAt(i) <= 'z') {
					} else {
					alert("Invalid Last Name, Only Alphabets");
					return false;
				}
			}
		}
			
		</script>
</head>
<body>
	<c:set value="${sessionScope['usernameSession']}" var="sessionUsername"></c:set>
	<p>
			Welcome <b><c:out value="${sessionUsername}"></c:out></b>
	</p>
	
	<form:form modelAttribute="personFormData" action="submitPersonData"
		method="post" onsubmit="return formvalidation()">
		<table>
			<tr>
				<td><form:label path="firstName">First Name:</form:label></td>
				<td><form:input path="firstName" name="username" id="username" />
				</td>
			</tr>
			<tr>
				<td><form:label path="lastName">Last Name:</form:label></td>
				<td><form:input path="lastName" name="lname" id="lastName" />
				</td>
			</tr>
			<tr>
				<td><form:label path="myemail">E-Mail:</form:label></td>
				<td><form:input path="myemail" type="email" name="email" />
				</td>
			</tr>
			<tr>
				<td><form:label path="dateOfBirth">D.O.B:</form:label></td>
				<td><form:input path="dateOfBirth" type="date" name="dateOfBirth" />
				</td>
			</tr>
			<tr>
				<td><form:label path="address">Address:</form:label></td>
				<td><form:input path="address" type="text" name="address" />
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="Submit"/></td>
			</tr>
	</table>
	</form:form>
	
	
	<br>
	
	<button onclick="location.href='/logout'">Log Out</button>
	<button onclick="location.href='/profilepage'">Profile Page</button>
	


</body>
</html>