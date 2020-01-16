function validateMenuItemForm(){
	var itemName=document.forms["menuItemForm"]["name"].value;
	var itemPrice=document.forms["menuItemForm"]["price"].value;
	var itemDOL=document.forms["menuItemForm"]["dateOfLaunch"].value;
	var itemCategory=document.forms["menuItemForm"]["category"].value;
	var itemActive=document.forms["menuItemForm"]["active"].value;
	var name=itemName.trim();
	if(name==""){
		alert("Title is required");
		return false;
	}
	if (name.length<2||name.length>65){
		alert("Title should have to be 2 to 65 characters");
		return false;
	}
	if (itemPrice==""){
		alert("Price is required");
		return false;
	}
	if (isNaN(itemPrice)){
		alert("Price has to be a number");
		return false;
	}
	if (itemDOL.length==0){
		alert("Date is required");
		return false;
	}
	if (itemActive.length==0){
		alert("Select the active status");
		return false;
	}
	if(itemCategory==0){
		alert("Select one option");
		return false;
	}
	
}
	
	
		
	