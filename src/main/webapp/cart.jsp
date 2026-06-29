<%-- cart.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, com.tap.Model.Cart, com.tap.Model.CartItem" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>FoodExpress - Your Cart</title>
  <link rel="stylesheet" href="menuStyles.css">
  <style>
    :root {
      --primary-color: #e07b5a;
      --primary-hover: #c9623e;
      --text-light: #f0f0f0;
      --text-muted: #a0a0b0;
      --bg-dark: #1a1a2e;
      --bg-card: #22223a;
      --bg-card2: #2a2a40;
      --border-color: #33334d;
    }

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      background-color: var(--bg-dark);
      color: var(--text-light);
      font-family: 'Segoe UI', sans-serif;
      min-height: 100vh;
    }

    /* Navbar */
    .navbar {
      background: var(--bg-card);
      padding: 16px 40px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      border-bottom: 1px solid var(--border-color);
    }

    .brand {
      font-size: 22px;
      font-weight: 700;
      color: var(--text-light);
      text-decoration: none;
      letter-spacing: 0.5px;
    }

    .brand span {
      color: var(--primary-color);
    }

    .nav-links {
      display: flex;
      gap: 28px;
    }

    .nav-links a {
      color: var(--text-muted);
      text-decoration: none;
      font-size: 15px;
      transition: color 0.2s;
    }

    .nav-links a:hover,
    .nav-links a.active {
      color: var(--text-light);
    }

    /* Main Container */
    .cart-container {
      max-width: 1100px;
      margin: 40px auto;
      padding: 0 24px;
    }

    .cart-title {
      font-size: 28px;
      font-weight: 700;
      color: var(--text-light);
      margin-bottom: 6px;
    }

    .cart-subtitle {
      color: var(--text-muted);
      font-size: 14px;
      margin-bottom: 28px;
    }

    /* Table Card */
    .cart-table-card {
      background: var(--bg-card);
      border-radius: 14px;
      overflow: hidden;
      border: 1px solid var(--border-color);
      margin-bottom: 24px;
    }

    .cart-table {
      width: 100%;
      border-collapse: collapse;
    }

    .cart-table thead tr {
      background: var(--bg-card2);
    }

    .cart-table thead th {
      padding: 14px 20px;
      text-align: left;
      font-size: 13px;
      font-weight: 600;
      color: var(--text-muted);
      text-transform: uppercase;
      letter-spacing: 0.8px;
    }

    .cart-table tbody tr {
      border-top: 1px solid var(--border-color);
      transition: background 0.15s;
    }

    .cart-table tbody tr:hover {
      background: var(--bg-card2);
    }

    .cart-table tbody td {
      padding: 18px 20px;
      vertical-align: middle;
    }

    .item-name {
      font-size: 16px;
      font-weight: 600;
      color: var(--text-light);
    }

    .item-price-td {
      font-size: 15px;
      color: var(--primary-color);
      font-weight: 600;
    }

    .item-total-td {
      font-size: 15px;
      font-weight: 700;
      color: var(--text-light);
    }

    /* Quantity Controller */
    .quantity-controller {
      display: inline-flex;
      align-items: center;
      background: var(--bg-dark);
      border-radius: 30px;
      overflow: hidden;
      border: 1px solid var(--border-color);
      gap: 0;
    }

    .qty-btn {
      background: none;
      border: none;
      color: var(--primary-color);
      font-size: 18px;
      font-weight: bold;
      width: 34px;
      height: 34px;
      cursor: pointer;
      transition: background 0.2s;
      display: flex;
      align-items: center;
      justify-content: center;
      border-radius: 50%;
    }

    .qty-btn:hover {
      background: rgba(224, 123, 90, 0.15);
    }

    .qty-display {
      width: 30px;
      text-align: center;
      background: none;
      border: none;
      font-size: 14px;
      font-weight: 700;
      color: var(--text-light);
      pointer-events: none;
    }

    /* Remove Button */
    .remove-btn {
      background: transparent;
      border: 1px solid var(--primary-color);
      color: var(--primary-color);
      padding: 6px 16px;
      border-radius: 20px;
      font-size: 13px;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.2s;
    }

    .remove-btn:hover {
      background: var(--primary-color);
      color: #fff;
    }

    /* Grand Total Row */
    .grand-total-row td {
      padding: 20px 20px;
      font-size: 17px;
      font-weight: 700;
      color: var(--text-light);
      border-top: 2px solid var(--border-color);
    }

    .grand-total-row .total-label {
      font-size: 17px;
    }

    .grand-total-row .total-amount {
      color: var(--primary-color);
      font-size: 20px;
    }

    /* Bottom Action Bar */
    .cart-actions {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-top: 8px;
    }

    .btn-add-more {
      display: inline-block;
      background: transparent;
      border: 1px solid var(--border-color);
      color: var(--text-light);
      text-decoration: none;
      padding: 12px 28px;
      border-radius: 8px;
      font-size: 14px;
      font-weight: 600;
      transition: all 0.2s;
    }

    .btn-add-more:hover {
      border-color: var(--primary-color);
      color: var(--primary-color);
    }

    .btn-checkout {
      background: var(--primary-color);
      border: none;
      color: #fff;
      padding: 14px 40px;
      border-radius: 8px;
      font-size: 15px;
      font-weight: 700;
      cursor: pointer;
      transition: background 0.2s;
      letter-spacing: 0.5px;
    }

    .btn-checkout:hover {
      background: var(--primary-hover);
    }

    /* Empty Cart */
    .empty-state-container {
      text-align: center;
      padding: 80px 20px;
      background: var(--bg-card);
      border-radius: 14px;
      border: 1px solid var(--border-color);
    }

    .empty-icon {
      font-size: 64px;
      margin-bottom: 20px;
    }

    .empty-title {
      font-size: 22px;
      font-weight: 700;
      color: var(--text-light);
      margin-bottom: 10px;
    }

    .empty-desc {
      color: var(--text-muted);
      margin-bottom: 28px;
      font-size: 15px;
    }

    .btn-browse {
      display: inline-block;
      background: var(--primary-color);
      color: #fff;
      text-decoration: none;
      padding: 12px 32px;
      border-radius: 8px;
      font-weight: 600;
      transition: background 0.2s;
    }

    .btn-browse:hover {
      background: var(--primary-hover);
    }

    @media (max-width: 700px) {
      .cart-table thead { display: none; }
      .cart-table tbody td { display: block; padding: 8px 16px; }
      .cart-actions { flex-direction: column; gap: 12px; }
    }
  </style>
</head>
<body>

  <header class="navbar">
    <a class="brand" href="callRestaurantServlet">Food<span>Hub</span></a>

    <nav class="nav-links">
      <a href="callRestaurantServlet">Home</a>

      <%
        String userEmail = (String) session.getAttribute("email");
        if (userEmail == null) {
          // User login pannala — Login & Sign Up kaattu
      %>
          <a href="login.html">Login</a>
          <a href="reg.html">Sign Up</a>
      <%
        } else {
          // User login pannaru — Logout மட்டும் kaattu
      %>
          <a href="logoutServlet">Logout</a>
      <%
        }
      %>

      <a href="cart.jsp" class="active">🛒 Cart</a>
      <a href="#">Profile</a>
    </nav>
  </header>

  <main class="cart-container">
    <%
      Cart cart = (Cart) session.getAttribute("cart");
      Map<Integer, CartItem> items = (cart != null) ? cart.getItems() : null;

      if (cart == null || items == null || items.isEmpty()) {
    %>
      <div class="empty-state-container">
        <div class="empty-icon">🛒</div>
        <div class="empty-title">Your cart is empty</div>
        <div class="empty-desc">Good food is always cooking! Go ahead, order some yummy items from the menu.</div>
        <a href="callRestaurantServlet" class="btn-browse">Browse Restaurants</a>
      </div>

    <%
      } else {
        double grandTotal = 0;
        for (Map.Entry<Integer, CartItem> entry : items.entrySet()) {
          grandTotal += entry.getValue().getPrice() * entry.getValue().getQuantity();
        }
    %>
      <h2 class="cart-title">Your Cart</h2>
      <p class="cart-subtitle">Review your selected food items</p>

      <div class="cart-table-card">
        <table class="cart-table">
          <thead>
            <tr>
              <th>Item</th>
              <th>Price</th>
              <th>Total</th>
              <th>Quantity</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <%
              for (Map.Entry<Integer, CartItem> entry : items.entrySet()) {
                CartItem ci = entry.getValue();
                double itemTotal = ci.getPrice() * ci.getQuantity();
            %>
            <tr>
              <!-- Item Name -->
              <td><span class="item-name"><%= ci.getName() %></span></td>

              <!-- Unit Price -->
              <td class="item-price-td">₹<%= ci.getPrice() %></td>

              <!-- Item Total -->
              <td class="item-total-td">₹<%= (int) itemTotal %></td>

              <!-- Quantity Controls -->
              <td>
                <div class="quantity-controller">
                  <!-- Minus -->
                  <form action="cartServlet" method="get" style="display:inline;">
                    <input type="hidden" name="menuId" value="<%= ci.getMenuId() %>">
                    <input type="hidden" name="restaurantId" value="<%= ci.getRestaurantId() %>">
                    <% if (ci.getQuantity() - 1 <= 0) { %>
                      <input type="hidden" name="action" value="remove">
                    <% } else { %>
                      <input type="hidden" name="action" value="update">
                      <input type="hidden" name="quantity" value="<%= ci.getQuantity() - 1 %>">
                    <% } %>
                    <button type="submit" class="qty-btn">−</button>
                  </form>

                  <input type="text" class="qty-display" value="<%= ci.getQuantity() %>" readonly>

                  <!-- Plus -->
                  <form action="cartServlet" method="get" style="display:inline;">
                    <input type="hidden" name="menuId" value="<%= ci.getMenuId() %>">
                    <input type="hidden" name="restaurantId" value="<%= ci.getRestaurantId() %>">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="quantity" value="<%= ci.getQuantity() + 1 %>">
                    <button type="submit" class="qty-btn">+</button>
                  </form>
                </div>
              </td>

              <!-- Remove -->
              <td>
                <form action="cartServlet" method="get" style="display:inline;">
                  <input type="hidden" name="menuId" value="<%= ci.getMenuId() %>">
                  <input type="hidden" name="restaurantId" value="<%= ci.getRestaurantId() %>">
                  <input type="hidden" name="action" value="remove">
                  <button type="submit" class="remove-btn">Remove</button>
                </form>
              </td>
            </tr>
            <% } %>
          </tbody>

          <!-- Grand Total Row -->
          <tfoot>
            <tr class="grand-total-row">
              <td class="total-label">Grand Total</td>
              <td></td>
              <td class="total-amount">₹<%= (int) grandTotal %></td>
              <td></td>
              <td></td>
            </tr>
          </tfoot>
        </table>
      </div>

      <!-- Bottom Actions -->
      <div class="cart-actions">
        <%
          Integer restaurantId = (Integer) session.getAttribute("restaurantId");
        %>
        <a href="menuServlet?restaurantID=<%= restaurantId %>" class="btn-add-more">
          Add More Items
        </a>
        
   <form action="checkout.jsp" method="post" style="display: inline;">
    <button type="submit" class="btn-checkout">Proceed to Checkout</button>
  </form>
  
      </div>

    <% } %>
  </main>

</body>
</html>
