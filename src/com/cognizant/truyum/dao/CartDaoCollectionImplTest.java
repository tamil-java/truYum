package com.cognizant.truyum.dao;

import java.util.List;

import com.cognizant.truyum.model.MenuItem;

public class CartDaoCollectionImplTest {

    static CartDao cartDao = new CartDaoCollectionImpl();

    public static void main(String[] args) {
        testAddCartItem();
        testgetAllCartItems();
        testRemoveCartItem();
        testgetAllCartItems();
    }
    public static void testAddCartItem() {
        System.out.println("Product added into cart");
        cartDao.addCartItem(1, 2); // 1 is userId, 2 is menuItemId
        cartDao.addCartItem(1, 3); // 1 is userId, 3 is menuItemId
    }
    public static void testgetAllCartItems() {
        try {
            System.out.println("Retrieving all the items from cart");
            List<MenuItem> list = cartDao.getAllCartItems(1).getMenuItemList(); // 1 is userId
            for (MenuItem menuItem : list) {
                System.out.println(menuItem);
            }
            System.out.println("Total Price: " + cartDao.getAllCartItems(1).getTotal());
        } catch (CartEmptyException e) {
            System.out.println(e);
        }
    }
    public static void testRemoveCartItem() {
        System.out.println("Remove Cart");
        cartDao.removeCartItem(1, 3);
    }
}
