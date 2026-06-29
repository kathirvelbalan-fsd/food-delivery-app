package com.tap.Utility;

import java.util.Scanner;
import com.tap.DAO.*;
import com.tap.DAOImp.*;
import com.tap.Model.*;

public class Launch {

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);

        UserDAO userDAO = new UserDAOImp();
        RestaurantDAO restaurantDAO = new RestaurantDAOImp();
        MenuDAO menuDAO = new MenuDAOImp();
        OrderDAO orderDAO = new OrderDAOImp();
        OrderItemDAO orderItemDAO = new OrderItemDAOImp();

        boolean running = true;

        while (running) {
            System.out.println("\n========== MAIN MENU ==========");
            System.out.println("1. User Management");
            System.out.println("2. Restaurant Management");
            System.out.println("3. Menu Management");
            System.out.println("4. Order Management");
            System.out.println("5. Order Item Management");
            System.out.println("0. Exit");
            System.out.print("Enter Choice : ");
            int mainChoice = scan.nextInt();
            scan.nextLine(); // Clear buffer

            switch (mainChoice) {
                case 1:
                    boolean userLoop = true;
                    while (userLoop) {
                        System.out.println("\n------ USER MANAGEMENT ------");
                        System.out.println("1. Add User (ID Auto-Generates)");
                        System.out.println("2. Get User by ID");
                        System.out.println("3. Update User");
                        System.out.println("4. Delete User");
                        System.out.println("5. Get All Users");
                        System.out.println("0. Back");
                        System.out.print("Enter Choice : ");
                        int userChoice = scan.nextInt();
                        scan.nextLine(); // Clear buffer
                        
                        switch (userChoice) {
                            case 1:
                                System.out.print("Enter Username : "); String username = scan.nextLine();
                                System.out.print("Enter Password : "); String password = scan.nextLine();
                                System.out.print("Enter Email : "); String email = scan.nextLine();
                                System.out.print("Enter Address : "); String address = scan.nextLine();
                                System.out.print("Enter Role : "); String role = scan.nextLine();
                                // Auto-increment handling: ID context missing intentionally here for insertions
                                userDAO.addUser(new User(username, password, email, address, role));
                                break;
                            case 2:
                                System.out.print("Enter User ID to Search : ");
                                User user = userDAO.getUser(scan.nextInt());
                                System.out.println(user != null ? user : "User Not Found");
                                break;
                            case 3:
                                System.out.print("Enter Existing User ID to Update : "); int updateUserId = scan.nextInt(); scan.nextLine();
                                User updateUser = userDAO.getUser(updateUserId);
                                if (updateUser != null) {
                                    System.out.print("New Username : "); updateUser.setUserName(scan.nextLine());
                                    System.out.print("New Password : "); updateUser.setPassword(scan.nextLine());
                                    System.out.print("New Email : "); updateUser.setEmail(scan.nextLine());
                                    System.out.print("New Address : "); updateUser.setAddress(scan.nextLine());
                                    System.out.print("New Role : "); updateUser.setRole(scan.nextLine());
                                    userDAO.updateUser(updateUser);
                                } else System.out.println("User Not Found");
                                break;
                            case 4:
                                System.out.print("Enter User ID to Delete : "); userDAO.deleteUser(scan.nextInt());
                                break;
                            case 5:
                                for (User u : userDAO.getAllusers()) System.out.println(u);
                                break;
                            case 0: userLoop = false; break;
                        }
                    }
                    break;

                case 2:
                    boolean restaurantLoop = true;
                    while (restaurantLoop) {
                        System.out.println("\n------ RESTAURANT MANAGEMENT ------");
                        System.out.println("1. Add Restaurant (ID Auto-Generates)");
                        System.out.println("2. Get Restaurant by ID");
                        System.out.println("3. Update Restaurant");
                        System.out.println("4. Delete Restaurant");
                        System.out.println("5. Get All Restaurants");
                        System.out.println("0. Back");
                        System.out.print("Enter Choice : ");
                        int restaurantChoice = scan.nextInt();
                        scan.nextLine(); // Clear buffer
                        
                        switch (restaurantChoice) {
                            case 1:
                                System.out.print("Restaurant Name : "); String name = scan.nextLine();
                                System.out.print("Cuisine Type : "); String cuisine = scan.nextLine();
                                System.out.print("Delivery Time (mins) : "); int deliveryTime = scan.nextInt(); scan.nextLine();
                                System.out.print("Address : "); String resAddress = scan.nextLine();
                                System.out.print("Rating : "); double rating = scan.nextDouble();
                                System.out.print("Is Active (true/false) : "); boolean active = scan.nextBoolean(); scan.nextLine();
                                System.out.print("Image Path : "); String imgPath = scan.nextLine();
                                restaurantDAO.addRestaurant(new Restaurant(name, cuisine, deliveryTime, resAddress, rating, active, imgPath));
                                break;
                            case 2:
                                System.out.print("Enter Restaurant ID to Search : ");
                                Restaurant rest = restaurantDAO.getRestaurant(scan.nextInt());
                                System.out.println(rest != null ? rest : "Restaurant Not Found");
                                break;
                            case 3:
                                System.out.print("Enter Existing Restaurant ID to Update : "); int updateRestId = scan.nextInt(); scan.nextLine();
                                Restaurant upRest = restaurantDAO.getRestaurant(updateRestId);
                                if (upRest != null) {
                                    System.out.print("New Name : "); upRest.setName(scan.nextLine());
                                    System.out.print("New Cuisine : "); upRest.setCuisineType(scan.nextLine());
                                    System.out.print("New Time : "); upRest.setDeliveryTime(scan.nextInt()); scan.nextLine();
                                    System.out.print("New Address : "); upRest.setAddress(scan.nextLine());
                                    System.out.print("New Rating : "); upRest.setRating(scan.nextDouble());
                                    System.out.print("Is Active (true/false) : "); upRest.setActive(scan.nextBoolean()); scan.nextLine();
                                    System.out.print("New Image Path : "); upRest.setImagePath(scan.nextLine());
                                    restaurantDAO.updateRestaurant(upRest);
                                } else System.out.println("Restaurant Not Found");
                                break;
                            case 4:
                                System.out.print("Enter Restaurant ID to Delete : "); restaurantDAO.deleteRestaurant(scan.nextInt());
                                break;
                            case 5:
                                for (Restaurant r : restaurantDAO.getAllRestaurant()) System.out.println(r);
                                break;
                            case 0: restaurantLoop = false; break;
                        }
                    }
                    break;

                case 3:
                    boolean menuLoop = true;
                    while (menuLoop) {
                        System.out.println("\n------ MENU MANAGEMENT ------");
                        System.out.println("1. Add Menu Item (ID Auto-Generates)");
                        System.out.println("2. Get Menu Item by ID");
                        System.out.println("3. Update Menu Item");
                        System.out.println("4. Delete Menu Item");
                        System.out.println("5. Get All Menu Items");
                        System.out.println("0. Back");
                        System.out.print("Enter Choice : ");
                        int menuChoice = scan.nextInt();
                        scan.nextLine(); // Clear buffer
                        
                        switch (menuChoice) {
                            case 1:
                                System.out.print("Existing Restaurant ID : "); int restId = scan.nextInt(); scan.nextLine();
                                System.out.print("Item Name : "); String itemName = scan.nextLine();
                                System.out.print("Description : "); String description = scan.nextLine();
                                System.out.print("Price : "); double price = scan.nextDouble();
                                System.out.print("Is Available (true/false) : "); boolean available = scan.nextBoolean(); scan.nextLine();
                                System.out.print("Image Path : "); String imagePath = scan.nextLine();
                                menuDAO.addMenu(new Menu(restId, itemName, description, price, available, imagePath));
                                break;
                            case 2:
                                System.out.print("Enter Menu ID to Search : ");
                                Menu m = menuDAO.getMenu(scan.nextInt());
                                System.out.println(m != null ? m : "Menu Item Not Found");
                                break;
                            case 3:
                                System.out.print("Enter Existing Menu ID to Update : "); int updateMenuId = scan.nextInt(); scan.nextLine();
                                Menu updateMenu = menuDAO.getMenu(updateMenuId);
                                if (updateMenu != null) {
                                    System.out.print("New Item Name : "); updateMenu.setItemName(scan.nextLine());
                                    System.out.print("New Description : "); updateMenu.setDescription(scan.nextLine());
                                    System.out.print("New Price : "); updateMenu.setPrice(scan.nextDouble());
                                    System.out.print("Is Available (true/false) : "); updateMenu.setAvailable(scan.nextBoolean()); scan.nextLine();
                                    System.out.print("New Image Path : "); updateMenu.setImagePath(scan.nextLine());
                                    menuDAO.updateMenu(updateMenu);
                                } else System.out.println("Menu Not Found");
                                break;
                            case 4:
                                System.out.print("Enter Menu ID to Delete : "); menuDAO.deleteMenu(scan.nextInt());
                                break;
                            case 5:
                                for (Menu mn : menuDAO.getAllMenu()) System.out.println(mn);
                                break;
                            case 0: menuLoop = false; break;
                        }
                    }
                    break;

                case 4:
                    boolean orderLoop = true;
                    while (orderLoop) {
                        System.out.println("\n------ ORDER MANAGEMENT ------");
                        System.out.println("1. Create Order (ID Auto-Generates)");
                        System.out.println("2. Get Order Details by ID");
                        System.out.println("3. Update Order Status");
                        System.out.println("4. Delete Order");
                        System.out.println("5. List All Orders");
                        System.out.println("0. Back");
                        System.out.print("Enter Choice: ");
                        int oChoice = scan.nextInt();
                        scan.nextLine(); // Clear buffer
                        
                        switch (oChoice) {
                            case 1:
                                System.out.print("Existing User ID: "); int uid = scan.nextInt();
                                System.out.print("Enter Total Amount: "); double amt = scan.nextDouble(); scan.nextLine();
                                System.out.print("Enter Status (PENDING/DELIVERED): "); String status = scan.nextLine();
                                System.out.print("Enter Payment Method (CARD/CASH): "); String pay = scan.nextLine();
                                System.out.print("Existing Restaurant ID: "); int rid = scan.nextInt();
                                orderDAO.addOrder(new Order(uid, amt, status, pay, rid));
                                break;
                            case 2:
                                System.out.print("Enter Order ID to Search: ");
                                Order o = orderDAO.getOrder(scan.nextInt());
                                System.out.println(o != null ? o : "Order Not Found");
                                break;
                            case 3:
                                System.out.print("Enter Existing Order ID to Update: "); int oid = scan.nextInt(); scan.nextLine();
                                Order upOrder = orderDAO.getOrder(oid);
                                if (upOrder != null) {
                                    System.out.print("Enter New Status: "); upOrder.setStatus(scan.nextLine());
                                    orderDAO.updateOrder(upOrder);
                                } else System.out.println("Order Not Found");
                                break;
                            case 4:
                                System.out.print("Enter Order ID to Delete: "); orderDAO.deleteOrder(scan.nextInt());
                                break;
                            case 5:
                                for (Order ord : orderDAO.getAllOrders()) System.out.println(ord);
                                break;
                            case 0: orderLoop = false; break;
                        }
                    }
                    break;

                case 5:
                    boolean itemLoop = true;
                    while (itemLoop) {
                        System.out.println("\n------ ORDER ITEM MANAGEMENT ------");
                        System.out.println("1. Add Item to Order (ID Auto-Generates)");
                        System.out.println("2. View Order Item by ID");
                        System.out.println("3. Update Item Quantity");
                        System.out.println("4. Remove Item from Order");
                        System.out.println("5. List All Order Items");
                        System.out.println("0. Back");
                        System.out.print("Enter Choice: ");
                        int oiChoice = scan.nextInt();
                        scan.nextLine(); // Clear buffer
                        
                        switch (oiChoice) {
                            case 1:
                                System.out.print("Existing Order ID: "); int oid = scan.nextInt();
                                System.out.print("Existing Menu ID: "); int mid = scan.nextInt();
                                System.out.print("Enter Quantity: "); int qty = scan.nextInt();
                                System.out.print("Enter Item Total Price: "); double total = scan.nextDouble();
                                orderItemDAO.addOrderItem(new OrderItem(oid, mid, qty, total));
                                break;
                            case 2:
                                System.out.print("Enter Order Item ID to Search: ");
                                OrderItem oi = orderItemDAO.getOrderItem(scan.nextInt());
                                System.out.println(oi != null ? oi : "Item Not Found");
                                break;
                            case 3:
                                System.out.print("Enter Existing Order Item ID to Update: "); int oitId = scan.nextInt();
                                OrderItem upOi = orderItemDAO.getOrderItem(oitId);
                                if (upOi != null) {
                                    System.out.print("Enter New Quantity: "); int newQty = scan.nextInt();
                                    System.out.print("Enter New Total: "); double newTot = scan.nextDouble();
                                    upOi.setQuantity(newQty); upOi.setItemTotal(newTot);
                                    orderItemDAO.updateOrderItem(upOi);
                                } else System.out.println("Item Not Found");
                                break;
                            case 4:
                                System.out.print("Enter Order Item ID to Remove: "); orderItemDAO.deleteOrderItem(scan.nextInt());
                                break;
                            case 5:
                                for (OrderItem oit : orderItemDAO.getAllOrderItems()) System.out.println(oit);
                                break;
                            case 0: itemLoop = false; break;
                        }
                    }
                    break;

                case 0:
                    running = false;
                    System.out.println("Application Closed... Nandri!");
                    break;

                default:
                    System.out.println("Invalid Choice. Try Again!");
            }
        }
        scan.close();
    }
}