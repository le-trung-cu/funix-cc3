<%@page import="model.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
Account acc = (Account) session.getAttribute("account");
pageContext.setAttribute("account", acc);
%>
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
				<li><a href='<c:url value="/"/>'>Home</a></li>
				<li><a href='<c:url value="/list"/>'>Product</a></li>
				<li><a href='<c:url value="/about.jsp"/>'>About</a></li>
				<li><a href='<c:url value="/contact.jsp"/>'>Contact</a></li>
			</ul>
			<div class="nav__right">
				<form action="search" method="get">
					<select name="brand">
						<option value="">Categories</option>
						<option value="apple"
							<%="apple".equalsIgnoreCase(request.getParameter("brand")) ? "selected" : ""%>>Apple</option>
						<option value="nokia"
							<%="nokia".equalsIgnoreCase(request.getParameter("brand")) ? "selected" : ""%>>Nokia</option>
					</select> <input type="search" name="search" id=""
						value='<c:out value="${search }"/>'>
					<button class="btn__search">
						<img class="search-icon" src="./images/searh.png" alt="">
					</button>
				</form>
				<ul class="nav__list">
					<c:if test="${not empty account}">
						<c:if test="${account.isAdmin()}">
							<li><a href='<c:url value="/admin"/>'> Admin </a></li>
						</c:if>
						<li><a href='<c:url value="/logout"/>'>Logout <c:out
								value="${account.getDisplayName()}" /></a></li>
					</c:if>
					<c:if test="${empty account}">
					<li><a href='<c:url value="/login"/>'>Login</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<!-- show hello message -->
	<c:if test="${not empty message }">
		<div class="contain">
			<div class="toast" role="alert" aria-live="assertive"
				aria-atomic="true">
				<div class="toast-header">
					<strong class="mr-auto">Message</strong>
				</div>
				<div class="toast-body">
					<c:out value="${message }" />
				</div>
			</div>
		</div>
	</c:if>