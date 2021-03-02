<%@page import="dao.OrdersDAO"%>
<%@page import="model.Orders"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-800">Orders:</h1>
</div>

<!-- Content Row -->
<div>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Id</th>
				<th>User Order</th>
				<th>Address</th>
				<th>Date</th>
				<th>Price</th>
				<th>Discount</th>
				<th>Status</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="order" items="${pagination.items}">
				<tr>
					<td><c:out value="${order.getOrderId() }"></c:out></td>
					<td><c:out value="${order.getUserMail() }"></c:out></td>
					<td><c:out value="${order.getAddress() }"></c:out></td>
					<td><c:out value="${order.getOrderDate() }"></c:out></td>
					<td><c:out value="${order.getPrice() }"></c:out></td>
					<td><c:out value="${order.getDiscount() }"></c:out></td>
					<td><c:out value="${order.getStatus() }"></c:out></td>
					<td><a
						href='<c:url value="/admin/orders?id=${order.getOrderId()}"/>'>detail</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<ul class="pagination">
	<c:forEach var="pageNum" begin="1" end="${pagination.getCountPage()}">
		<li class="page-item"><a class="page-link"
			href='<c:url value="/admin/orders?page=${pageNum }"/>'><c:out
					value="${pageNum}"></c:out></a></li>
	</c:forEach>
</ul>

<!-- /.container-fluid -->

<jsp:include page="footer.jsp"></jsp:include>
