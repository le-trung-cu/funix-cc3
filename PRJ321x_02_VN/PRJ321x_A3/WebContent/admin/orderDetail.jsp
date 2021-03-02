<%@page import="dao.OrdersDAO"%>
<%@page import="model.Orders"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
</div>

<!-- Content Row -->
<div>
	<h2>Orders</h2>
	<table class="table table-striped">
		<tr>
			<th>Products in cart: <c:out value="${order.getOrderId() }"></c:out></th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Amount</th>
		</tr>
		<c:forEach var="product" items="${order.getLp()}">
			<tr>
				<td>
					<div>
						<h5>
							<c:out value="${product.getNameProduct()}" />
						</h5>
						<span><c:out value="${product.getProductId()}" /></span>
					</div>
				</td>
				<td><c:out value="${product.getPrice()}" /></td>
				<td><c:out value="${product.getAmountProduct()}" /></td>
				<td><c:out value="${product.getPriceAmount()}" /></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="4" class="total right-text">Total: <c:out
					value="${order.getTotal() }" />
			</td>
		</tr>
	</table>
</div>
</div>
<!-- /.container-fluid -->

<jsp:include page="footer.jsp"></jsp:include>
