<%@page import="model.Product"%>
<%@page import="model.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	if(session.getAttribute("cart") == null){
		session.setAttribute("cart", new Cart());
	};
%>
<aside class="cart">
	<div class="cart__head">
		<div class="cart__desc">
			<img class="icon" src="./images/carts.png" alt="">
			<div>
				<h6 class="">
					count:
					<c:out value="${cart.getNumber()}" />
					items
				</h6>
				<h6 class="total">
					total price: $
					<c:out value="${cart.getAmount()}" />
				</h6>
			</div>
		</div>
		<c:if test="${!cart.isEmpty()}">
			<div class="cart__action">
				<a class="btn" href='<c:url value="/checkout.jsp"/>'>Checkout</a>
			</div>
		</c:if>
	</div>
	<c:forEach var="cartItem" items="${cart.getItems()}">
		<li class="cart__item">
			<div class="cart__photo">
				<img src='<c:url value="${cartItem.getSrc()}"/>' alt="">
			</div>
			<div class="detail">
				<a href="#">
					<h5>
						<c:out value="${cartItem.getName() }" />
					</h5>
				</a>
				<p>
					price:
					<c:out value="${cartItem.getPrice()}" />
				</p>
				<p>
					count:
					<c:out value="${cartItem.getNumber()}" />
				</p>
			</div>
			
			<div class="cart__remove">
				<a
					href='<c:url value="/add-cart?action=delete&id=${cartItem.getId()}&url= "/>'>
					<img src='<c:url value="/images/delete.png"/>'>
				</a>
			</div>
		</li>
	</c:forEach>
</aside>
