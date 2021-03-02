
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<div class="contain">
	<div class="row">
		<div class="col-md-8 col-12">
			<section class="products">
				<h1>Products</h1>
				<div class="row">
					<c:forEach var="product" items="${pProduct.items}">
						<div class="col-md-4 col-6">
							<div class="product">
								<a href='<c:url value="/information?id=${product.getId()}"/>'>
									<img class="product__photo"
									src='<c:url value="${product.getSrc() }"/>' alt="">
									<h5 class="product__name">
										<c:out value="${product.getName()}" />
									</h5>
								</a>
								<div class="product__cart">
									<div class="product__price">
										<small>$<c:out value="${product.getPrice()}" /></small>
									</div>
									<span class="box-inline"> <a class="btn btn--cart"
										href='<c:url value="/add-cart?action=add&id=${product.getId() }"/>'>
											<img class="icon" src="./images/carts.png" alt=""> <span>Add
												to cart</span>
									</a>
									</span>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</section>

			<div class="pagination">
				<c:choose>
					<c:when test="${not empty search}">
						<c:forEach var="pageNum" begin="1"
							end="${pProduct.getCountPage()}">
							<a class="btn"
								href='<c:url value="/search">
								<c:if test="${not empty brand}">
									<c:param name="brand" value="${brand}"></c:param>
								</c:if>
								<c:if test="${not empty search}">
									<c:param name="search" value="${search}"></c:param>
								</c:if>
								<c:param name="page" value="${pageNum }"></c:param>
							</c:url>'>
								<c:out value="${pageNum}"></c:out>
							</a>
						</c:forEach>

					</c:when>
					<c:otherwise>
						<c:forEach var="pageNum" begin="1"
							end="${pProduct.getCountPage()}">
							<a class="btn"
								href='<c:url value="/list">
								<c:if test="${not empty brand}">
									<c:param name="brand" value="${brand}"></c:param>
								</c:if>
								<c:param name="page" value="${pageNum }"></c:param>
							</c:url>'>
								<c:out value="${pageNum}"></c:out>
							</a>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="col-md-4 col-12">
			<jsp:include page="cart.jsp"></jsp:include>
		</div>
	</div>
</div>


<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>