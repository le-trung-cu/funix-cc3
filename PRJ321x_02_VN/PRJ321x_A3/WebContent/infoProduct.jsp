<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<section class="contain">
	<div id="product-detail">
		<h2 class="name">
			<c:out value="${product.getName()}" />
		</h2>
		<div class="row">
			<div class="col-md-3 col-12">
				<img alt="" src='<c:url value="${product.getSrc() }"/>'>
			</div>
			<div class="col-md-9 col-12">
				<div class="content">
					<p class="price red-text big-text">
						$<c:out value="${product.getPrice() }" />
					</p>
					<p class="desc">
						Product Description:
						<c:out value="${product.getDesciption() }" />
					</p>
					<span class="box-inline"> <a class="btn btn--cart"
						href='<c:url value="/add-cart?action=add&id=${product.getId() }"/>'>
							<img class="icon" src="./images/carts.png" alt=""> <span>Add
								to cart</span>
					</a>
					</span>
				</div>

			</div>
		</div>
	</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>