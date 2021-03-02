<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<section class="contain">

	<div id="checkout">
		<c:if test="${!cart.getItems().isEmpty() }">
			<table style="width: 100%">
				<tr>
					<th>Products in cart: 1</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Amount</th>
				</tr>
				<c:forEach var="product" items="${cart.getItems()}">
					<tr>
						<td>
							<div>
								<h5>
									<c:out value="${product.getName()}" />
								</h5>
								<span><c:out value="${product.getId()}" /></span>
							</div>
						</td>
						<td><c:out value="${product.getPrice()}" /></td>
						<td>
							<div>
								<div>
									<c:out value="${product.getNumber()}" />
								</div>
								<div class="btn--group">
									<a class="btn--icon" href='<c:url value="/add-cart?action=add&id=${product.getId() }"/>'>+</a> 
									<a class="btn--icon" href='<c:url value="/add-cart?action=subtract&id=${product.getId() }"/>'>-</a> 
									<a class="btn--icon" 
										href='<c:url value="/add-cart?action=delete&id=${product.getId()}"/>'>
										<img src='<c:url value="/images/delete.png"/>'>
									</a>
								</div>
							</div>
						</td>
						<td><c:out value="${product.getAmount()}"/></td>
						
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4" class="total right-text">Total: <c:out
							value="${cart.getAmount() }" />
					</td>
				</tr>
			</table>
			<form id="checkout-form" action='<c:url value="/pay"/>' method="post">
				<label for="name">Customer name:</label><br> <input
					required="required" type="text" id="name" name="name" value="John"><br>

				<label for="address">Customer address:</label><br> <input
					required="required" type="text" id="address" name="address"
					value="Doe"><br> <label for="discount">Discount
					code(if any):</label><br> <input type="text" id="discount"
					name="discount" value="Doe"><br>

				<button class="btn">checkout</button>
			</form>
		</c:if>
		<c:if test="${cart.getItems().isEmpty() }">
			<p>Cart is empty</p>
			<span class="box-inline"> <a class="btn btn--empty-message"
				href='<c:url value="/list"/>'> <img class="icon"
					src="./images/carts.png" alt=""> <span>Add something
						to cart</span>
			</a>
			</span>
		</c:if>
	</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>