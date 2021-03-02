<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>mobileStore</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href='<c:url value="/css/style.css"/>'>
</head>
<body>
	<nav class="nav">
		<div class="nav__content contain">
			<div class="logo">
				<h1>mobileStore</h1>
			</div>
			<ul class="nav__list">
				<li><a href='<c:url value="/home.jsp"/>'>Home</a></li>
				<li><a href='<c:url value="/about.jsp"/>'>About</a></li>
				<li><a href='<c:url value="/contact.jsp"/>'>Contact</a></li>
			</ul>
			<div class="nav__right">
				<form action="" method="get">
					<input type="search" name="" id="">
					<button class="btn__search">
						<img class="search-icon" src="./images/searh.png" alt="">
					</button>
				</form>
				<ul class="nav__list">
					<%
					if (session.getAttribute("user") != null) {
					%>
					<li><a href='<c:url value="/logout"/>'>Logout</a></li>
					<%
					} else {
					%>
					<li><a href='<c:url value="/login"/>'>Login</a></li>
					<%
					}
					%>
				</ul>
			</div>
		</div>
	</nav>