
<%@page import="models.Product"%>
<%@page import="java.util.List"%>
<%@page import="services.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<%
ProductService productService = new ProductService(getServletContext());
List<Product> products = productService.getProducts();
%>
<section class="contain">
	<div class="banner">
		<div class="row">
			<div class="col-md-8">
				<div class="banner__big">
					<figure class="banner__item">
						<figcaption class="banner__content">
							<h5>product of the month</h5>
							<h3>SamSung-Galaxy-S-III-(S3)</h3>
							<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
								Consequatur harum nihil beatae similique ratione aliquid eius
								odio dolore! Similique nisi, laudantium maxime accusantium
								consequuntur dignissimos dolorum. Ad dignissimos cupiditate at?</p>
							<button class="btn btn--big">Shop now</button>
						</figcaption>
						<img src="./images/shop mobile.png" alt="">
					</figure>
				</div>
			</div>
			<div class="col-md-4 banner__small-box">
				<div class="banner__small banner__small--1">
					<figure>
						<figcaption>
							<h3>Accessories</h3>
						</figcaption>
						<img src="./images/shop mobile (1).png" alt="">
					</figure>
				</div>
				<div class="banner__small banner__small--2">
					<figure>
						<figcaption>
							<h3>Accessories</h3>
						</figcaption>
						<img src="./images/shop mobile (2).png" alt="">
					</figure>
				</div>
			</div>
		</div>
	</div>
</section>

<div class="contain">
	<div class="row">
		<div class="col-md-8">
			<section class="products">
				<h1>Featured</h1>
				<div class="row">
					<%
					for (Product product : products) {
					%>
					<div class="col-md-3 col-4">
						<div class="product">
							<img class="product__photo" src='<c:url value="<%= product.getPicture() %>"/>' alt="">
							<h5 class="product__name"><%= product.getName()%></h5>
							<div class="product__cart">
								<div class="product__price">
									<del><%= product.getDelPrice() %></del>
									<ins><%= product.getPrice()%></ins>
								</div>
								<span class="box-inline"> <a
									class="btn product__add-cart"> <img class="icon"
										src="./images/carts.png" alt=""> <span>Add to cart</span>
								</a>
								</span>
							</div>
						</div>
					</div>
					<%
					}
					%>

				</div>
			</section>
		</div>
		<div class="col-md-4">
			<jsp:include page="cart.jsp"></jsp:include>
		</div>
	</div>
</div>


<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>