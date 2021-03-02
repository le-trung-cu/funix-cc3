<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<section class="contain">

	<div id="checkout">
		<c:if test="${!order.getLp().isEmpty() }">
			<table style="width: 100%">
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
			<form id="checkout-form" action='<c:url value="/pay"/>' method="post">
				<label for="name">Customer name:</label><br> <input disabled
					type="text" id="name" name="name"
					value='<c:out value="${order.getUserMail() }"/>'><br>

				<label for="address">Customer address:</label><br> <input
					disabled type="text" id="address" name="address"
					value='<c:out value="${order.getAddress() }"/>'><br>

			</form>
		</c:if>
	</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>