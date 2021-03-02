<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-800">Accounts:</h1>
</div>

<!-- Content Row -->
<div>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>usr</th>
				<th>Name</th>
				<th>Password</th>
				<th>Address</th>
				<th>Phone</th>
				<th>Role</th>
				<th>Check</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="account" items="${pagination.items}">
				<tr>
					<td><c:out value="${account.getUsr() }"></c:out></td>

					<td><c:out value="${account.getName() }"></c:out></td>
					<td><c:out value="${account.getPwd() }"></c:out></td>
					<td><c:out value="${account.getAddress() }"></c:out></td>
					<td><c:out value="${account.getPhone() }"></c:out></td>
					<td><c:out value="${account.getRole() }"></c:out></td>
					<td><c:out value="${account.getCheck() }"></c:out></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="pagination">
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<c:forEach var="pageNum" begin="1" end="${pagination.getCountPage()}">
				<li class="page-item"><a class="page-link"
					href='<c:url value="/admin?page=${pageNum }"/>'><c:out
							value="${pageNum}"></c:out></a></li>

			</c:forEach>
		</ul>
	</nav>

</div>
<!-- /.container-fluid -->

<jsp:include page="footer.jsp"></jsp:include>
