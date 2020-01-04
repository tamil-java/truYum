package com.cognizant.truyum.dao;

//Custom Exception (User Defined Exception)
public class CartEmptyException extends Exception{

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    @Override
    public String toString() {
        return "Cart is Empty";
    }
    

}
