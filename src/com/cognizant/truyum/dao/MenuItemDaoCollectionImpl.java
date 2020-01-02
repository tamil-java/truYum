package com.cognizant.truyum.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.cognizant.truyum.model.MenuItem;
import com.cognizant.truyum.util.DateUtil;

public class MenuItemDaoCollectionImpl implements MenuItemDao {
    private static List<MenuItem> menuItemList;

    public MenuItemDaoCollectionImpl() {
        if (menuItemList == null || menuItemList.isEmpty()) {
            MenuItem item1 = new MenuItem(1, "Sandwich", 99.00f, true,
                    DateUtil.convertToDate("15/03/2017"), "Main Course", true);
            MenuItem item2 = new MenuItem(2, "Burger", 129.00f, true,
                    DateUtil.convertToDate("23/12/2017"), "Main Course", false);
            MenuItem item3 = new MenuItem(3, "Pizza", 149.00f, true,
                    DateUtil.convertToDate("21/08/2018"), "Main Course", false);
            MenuItem item4 = new MenuItem(4, "French Fries", 57.00f, false,
                    DateUtil.convertToDate("02/07/2017"), "Starters", true);
            MenuItem item5 = new MenuItem(5, "Chocolate Brownie", 32.00f, true,
                    DateUtil.convertToDate("02/11/2022"), "Dessert", true);
            menuItemList = new ArrayList<MenuItem>();
            menuItemList.add(item1);
            menuItemList.add(item2);
            menuItemList.add(item3);
            menuItemList.add(item4);
            menuItemList.add(item5);
        }

    }

    @Override
    public List<MenuItem> getMenuItemListAdmin() {
        return menuItemList;
    }

    @Override
    public List<MenuItem> getMenuItemListCustomer() {
        ArrayList<MenuItem> menuItems = new ArrayList<MenuItem>();
        for (MenuItem menuItem : menuItemList) {
            if ((menuItem.getDateOfLaunch().before(new Date())
                    || menuItem.getDateOfLaunch().equals(new Date()))
                    && menuItem.isActive() == true) {
                menuItems.add(menuItem);
            }
        }
        return menuItems;
    }

    @Override
    public void modifyMenuItem(MenuItem menuitem) {
        for (int i = 0; i < menuItemList.size(); i++) {
            if (menuItemList.get(i).getId() == menuitem.getId()) { // existing_item_id==user_item_id
                menuItemList.set(i, menuitem);
            }
        }
    }

    @Override
    public MenuItem getMenuItem(long menuItemId) {
        for (MenuItem menuItem : menuItemList) {
            if (menuItem.getId() == menuItemId) { // existing_id=user_item_id
                return menuItem;
            }
        }
        return null; // when id is not existing, this line executes.
    }
}





