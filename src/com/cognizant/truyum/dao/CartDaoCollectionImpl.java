package com.cognizant.truyum.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.cognizant.truyum.model.Cart;
import com.cognizant.truyum.model.MenuItem;

public class CartDaoCollectionImpl implements CartDao {
    private static HashMap<Long, Cart> userCarts;

    public CartDaoCollectionImpl() {
        if (userCarts == null) {
            HashMap<Long, Cart> carts = new HashMap<Long, Cart>();
            userCarts = carts;
        }
    }

    @Override
    public void addCartItem(long userId, long menuItemId) {
        MenuItemDao menuItems = new MenuItemDaoCollectionImpl();
        MenuItem menuItem = menuItems.getMenuItem(menuItemId);
        if (userCarts.containsKey(userId)) {
            userCarts.get(userId).getMenuItemList().add(menuItem);
        } else {
            Cart cart = new Cart();
            List<MenuItem> listMenu = new ArrayList<MenuItem>();
            listMenu.add(menuItem);
            cart.setMenuItemList(listMenu);
            userCarts.put(userId, cart);
        }
    }

    @Override
    public Cart getAllCartItems(long userId) throws CartEmptyException {
        Cart cart = userCarts.get(userId);
        if (cart == null || cart.getMenuItemList().isEmpty()) {
            throw new CartEmptyException(); // break;
        }
        List<MenuItem> menuItem = cart.getMenuItemList();
        double total = 0;
        for (MenuItem menuItem2 : menuItem) {
            total = total + menuItem2.getPrice();
        }
        cart.setTotal(total);
        return cart;
    }

    @Override
    public void removeCartItem(long userId, long menuItemId) {
        List<MenuItem> list = userCarts.get(userId).getMenuItemList();
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getId() == menuItemId) {
                list.remove(i);
                break;
            }
        }
    }
}
