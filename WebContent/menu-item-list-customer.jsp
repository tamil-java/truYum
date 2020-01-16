<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>truYum: Menu-Items</title>
<link rel="stylesheet" type="text/css" href="Styles/truYum-customer.css">
</head>

<body>

	

	<section class="main-header"> <header> <span
		id="title">truYum&nbsp;&nbsp;</span>
	<img src="Images/FORK.png" alt="Loading"> </header> <nav> <a
		href="ShowMenuItemListCustomer" id="menu-Link">Menu</a> <a
		href="ShowCart" id="cart-Link">Cart</a> </nav> </section>
	<h2>Menu Items</h2>
	<br>
	<c:if test="${addCartStatus==true}">
		<h4 style="color: green">Item Added Into Cart Successfully</h4>
	</c:if>
	<br>
	<table id="menu-table" cellspacing="500px">
		<tr>
			<th class="header-row">Name</th>
			<th>Free Delivery</th>
			<th class="second-row">Price</th>
			<th>Category</th>
			<th>Action</th>
		</tr>
		<c:forEach items="${menuItem}" var="menuItem">
			<tr>
				<td class="headers-row">${menuItem.getName()}</td>
				<td><c:choose>
						<c:when test="${menuItem.isFreeDelivery()==true}">Yes</c:when>
						<c:otherwise>No</c:otherwise>
					</c:choose></td>
				<td class="seconds-row">${menuItem.getPrice()}</td>
				<td>${menuItem.getCategory()}</td>
				<td><a href="AddToCart?menuItemId=${menuItem.getId()}">Add
						to Cart</a></td>
			</tr>
		</c:forEach>
	</table>
	<footer>Copyright &copy; 2019</footer>
</body>


</html>