<%@page import="com.springsignup.model.PersonDataStorage"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="java.util.Iterator"%>
<%@  page import="java.util.ArrayList ,java.util.Map, com.springsignup.bean.Person, java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Profile Page</title>
<style>
body {
	margin-top: 12%;
	margin-left: 42%;
	margin-right: 25%;
	margin-bottom: 25%;
}
</style>
</head>
<body>
	Welcome, <b><c:out value="${sessionScope['usernameSession']}" /></b><br><br>
	<c:set value="${sessionScope['usernameSession']}" var="sessionUsername"></c:set>
	<c:forEach var="personData" items="${applicationScope['personDataMap'] }">
	<c:set value="${personData.key}" var="usernameKey"></c:set>	
		<c:if test="${sessionUsername == usernameKey}">
		<c:forEach var="person" items="${personData.value}" >
		First Name: <c:out value="${person.firstName}"/><br>
		Last Name: <c:out value="${person.lastName}"/><br>
		E-Mail: <c:out value="${person.myemail}"/><br>
		Date Of Birth: <c:out value="${person.dateOfBirth}"/><br>
		Address: <c:out value="${person.address}"/><br><br>						
		</c:forEach>
		</c:if>
	</c:forEach>	
	<br>

	<br>
	<a href="/logout"><input type="submit" value="Log Out"></a>
	<br>
	<a href="/welcome"><input type="submit"
		value="Add one more Person Detail"></a>

</body>
</html>