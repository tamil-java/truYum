<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>truYum: Menu-Items</title>
<link rel="stylesheet" type="text/css" href="Styles/truYum-admin.css">
</head>

<body>
	<section class="main-header"> <header> <span
		id="title">truYum&nbsp;&nbsp;</span> <img src="Images/FORK.png"
		alt="Loading"> </header> <nav> <a href="ShowMenuItemListAdmin"
		id="menu-Link">Menu</a> </nav> </section>
	<section class="edit-items">
	<h3>Menu Items</h3>
	</section>

	<table id="menu-table" cellspacing="500px">
		<tr>
			<th class="headers-row">Name</th>
			<th class="seconds-row">Price</th>
			<th>Active</th>
			<th>Date of Launch</th>
			<th>Category</th>
			<th>Free Delivery</th>
			<th>Action</th>
		</tr>

		<c:forEach items="${menuItem}" var="menuItem">
			<tr>
				<td class="headers-row">${menuItem.getName()}</td>
				<td class="seconds-row">${menuItem.getPrice()}</td>
				<td><c:choose>
						<c:when test="${menuItem.isActive()==true}">Yes</c:when>
						<c:otherwise>No</c:otherwise>
					</c:choose></td>
				<td><f:formatDate value="${menuItem.getDateOfLaunch()}"
						pattern="dd/MM/yyyy"/></td>
				<td>${menuItem.getCategory()}</td>
				<td><c:choose>
						<c:when test="${menuItem.isFreeDelivery()==true}">Yes</c:when>
						<c:otherwise>No</c:otherwise>
					</c:choose></td>
				<td><a href="ShowEditMenuItem?menuItemId=${menuItem.getId()}">Edit</a></td>
			</tr>
		</c:forEach>

	</table>

	<footer>Copyright &copy; 2019</footer>
</body>


</html>