<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>truYum: Edit-Menu-Item</title>
<link rel="stylesheet" type="text/css" href="Styles/truYum-admin.css" />
<script type="text/javascript" src="Scripts/script.js"></script>
</head>

<body>
	<c:set var="menuItem" value="${menuItem}"></c:set>
	<section class="main-header"> <header> <span
		id="title">truYum&nbsp;&nbsp;</span> <img src="Images/FORK.png"
		alt="Loading"> </header> <nav> <a href="ShowMenuItemListAdmin"
		id="menu-Link" name="link">Menu</a> </nav> </section>
	<section class="edit-items">
	<h3>
		Edit Menu Item <br>
	</h3>
	</section>
	<section class="edit-form">
	<form name="menuItemForm" action="EditMenuItem"
		onsubmit="return validateMenuItemForm()" method="post">

		<input type="hidden" name="id" value="${menuItem.getId()}" />

		<div>
			<div>
				<label for="name">Name 
			</div>

			<div>
				<input type="text" size="100" id="name"
					value="${menuItem.getName()}" name="name" />
			</div>
			<br> <br>

			<section class="second-row">
			<div class="inputs">
				<label for="prc">Price Rs.</label>
			</div>
			<div class="inputs">
				<label for="act">Active</label>
			</div>
			<div class="inputs">
				<label for="dol">Date of launch</label>
			</div>
			<div class="inputs">
				<label for="cat">Category</label>
			</div>
			</section>
			<br>

			<section class="second-row">
			<div class="inputs0">
				<input type="text" size="10" id="prc" value="${menuItem.getPrice()}"
					name="price">
			</div>
			<div class="inputs1">
				<c:choose>
					<c:when test="${menuItem.isActive()==true}">
						<input type="radio" value="Yes" name="active" checked="checked" />Yes
			<input type="radio" value="No" name="active" />No				
			</c:when>
					<c:otherwise>
						<input type="radio" value="Yes" name="active" />Yes
			<input type="radio" value="No" name="active" checked="checked" />No	
			</c:otherwise>
				</c:choose>
			</div>
			<%-- <div class="inputs1">${menuItem.isActive()}</div> --%>
			<div class="inputs2">
				<f:formatDate value="${menuItem.getDateOfLaunch()}"
					pattern="dd/MM/yyyy" var="dateOfLaunch" />
				<input type="text" size="20" id="dol" name="dateOfLaunch"
					value="${dateOfLaunch}">
			</div>
			<div class="inputs2">
				<select id="cat" name="category">
					<option value="${menuItem.getCategory()}">${menuItem.getCategory()}</option>
					<option>Main course</option>
					<option>Starters</option>
					<option>Deserts</option>
					<option>Drinks</option>
				</select>
			</div>
			</section>
			<br> <br>
			<c:choose>
				<c:when test="${menuItem.isFreeDelivery()==true}">
					<input type="checkbox" name="freeDelivery" value="Yes"
						checked="checked" />
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="freeDelivery" value="No" />
				</c:otherwise>
			</c:choose>
			<label for="del">Free delivery</label><br> <br> <input
				type="submit" name="submit" value="Save" id="sub">

		</div>
	</form>
	</section>

	<footer>Copyright &copy; 2019</footer>
</body>
</html>