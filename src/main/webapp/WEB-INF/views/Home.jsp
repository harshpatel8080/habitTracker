<%@page import="com.enums.UserType"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="import.jsp"></jsp:include>
</head>
<body>


	<jsp:include page="userNav.jsp" />


	<h1>Welcome to Home</h1>

	<a href="addhabit">Add Habit</a>
	<a href="gethabits?direction=SelectHabit">Add reminder</a>
	<a href="gethabits?direction=ListHabits">list habits</a>
	<a href="gethabits?direction=addLogs">add log</a>
	<a href="getlogs">view logs</a>


</body>
</html>