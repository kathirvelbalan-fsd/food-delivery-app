<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, com.tap.Model.Cart, com.tap.Model.CartItem" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>FoodHub - Checkout</title>
  <style>
    :root {
      --primary-color: #e07b5a;
      --primary-hover: #c9623e;
      --text-light: #f0f0f0;
      --text-muted: #a0a0b0;
      --bg-dark: #1a1a2e;
      --bg-card: #22223a;
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
    }

    /* Main Container layout */
    .checkout-container {
      max-width: 1200px;
      margin: 40px auto;
      padding: 0 24px;
    }

    .checkout-header h1 {
      font-size: 28px;
      margin-bottom: 6px;
    }

    .checkout-header p {
      color: var(--text-muted);
      font-size: 14px;
      margin-bottom: 30px;
    }

    .checkout-wrapper {
      display: grid;
      grid-template-columns: 1.2fr 1fr;
      gap: 30px;
      align-items: start;
    }

    .checkout-box, .summary-box {
      background: var(--bg-card);
      padding: 30px;
      border-radius: 14px;
      border: 1px solid var(--border-color);
    }

    .section-title {
      font-size: 20px;
      margin-bottom: 24px;
      font-weight: 600;
      border-bottom: 1px solid var(--border-color);
      padding-bottom: 10px;
    }

    /* Form Fields Styling (Left Side) */
    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      display: block;
      font-size: 14px;
      color: var(--text-muted);
      margin-bottom: 8px;
      font-weight: 500;
    }

    .form-group input, .form-group textarea, .form-group select {
      width: 100%;
      padding: 12px 16px;
      background: var(--bg-dark);
      border: 1px solid var(--border-color);
      border-radius: 8px;
      color: var(--text-light);
      font-size: 15px;
      outline: none;
      transition: border-color 0.2s;
    }

    .form-group input:focus, .form-group textarea:focus, .form-group select:focus {
      border-color: var(--primary-color);
    }

    /* Summary Styling (Right Side) */
    .summary-item {
      display: flex;
      justify-content: space-between;
      margin-bottom: 16px;
      font-size: 15px;
    }

    .item-name {
      color: var(--text-light);
      flex: 2;
    }

    .item-qty {
      color: var(--text-muted);
      flex: 1;
      text-align: center;
    }

    .item-total {
      color: var(--primary-color);
      font-weight: 600;
      flex: 1;
      text-align: right;
    }

    .bill-details {
      margin-top: 24px;
      padding-top: 20px;
      border-top: 1px solid var(--border-color);
    }

    .bill-row {
      display: flex;
      justify-content: space-between;
      margin-bottom: 12px;
      font-size: 14px;
      color: var(--text-muted);
    }

    .bill-row.total-row {
      font-size: 18px;
      font-weight: 700;
      color: var(--text-light);
      margin-top: 16px;
      padding-top: 12px;
      border-top: 1px dashed var(--border-color);
    }

    .bill-row.total-row .total-price {
      color: var(--primary-color);
      font-size: 22px;
    }

    /* Buttons */
    .btn-submit {
      width: 100%;
      background: var(--primary-color);
      color: #fff;
      border: none;
      padding: 14px;
      border-radius: 8px;
      font-size: 16px;
      font-weight: 700;
      cursor: pointer;
      transition: background 0.2s;
      margin-top: 20px;
    }

    .btn-submit:hover {
      background: var(--primary-hover);
    }

    .btn-back {
      display: block;
      text-align: center;
      text-decoration: none;
      color: var(--text-muted);
      font-size: 14px;
      margin-top: 15px;
      transition: color 0.2s;
    }

    .btn-back:hover {
      color: var(--text-light);
    }

    @media (max-width: 900px) {
      .checkout-wrapper {
        grid-template-columns: 1fr;
      }
    }
  </style>
</head>
<body>

  <header class="navbar">
    <a class="brand" href="callRestaurantServlet">Food<span>Hub</span></a>
    <nav class="nav-links">
      <a href="callRestaurantServlet">Home</a>
    </nav>
  </header>

  <main class="checkout-container">
    <div class="checkout-header">
      <h1>Checkout</h1>
      <p>Confirm your delivery details and place your order</p>
    </div>

    <%
      Cart cart = (Cart) session.getAttribute("cart");
      
      double grandTotal = 0;
      double deliveryFee = 40.0;
      double gstAmount = 0;
      double finalAmount = 0;

      if (cart != null && cart.getItems() != null && !cart.getItems().isEmpty()) {
          for (CartItem item : cart.getItems().values()) {
              grandTotal += item.getPrice() * item.getQuantity();
          }
          // Calculating 5% GST on food item total
          gstAmount = grandTotal * 0.05; 
          finalAmount = grandTotal + deliveryFee + gstAmount;
      }
    %>

    <form action="orderServlet" method="post" class="checkout-wrapper">
      
      <!-- LEFT SIDE: Delivery Details Form -->
      <div class="checkout-box">
        <h2 class="section-title">Delivery Details</h2>
        
        <div class="form-group">
          <label>Full Name</label>
          <input type="text" name="customerName" placeholder="Enter your full name" required>
        </div>

        <div class="form-group">
          <label>Mobile Number</label>
          <input type="tel" name="mobileNumber" placeholder="Enter your mobile number" required>
        </div>

        <div class="form-group">
          <label>Delivery Address</label>
          <textarea name="address" rows="3" placeholder="Enter your complete delivery address" required></textarea>
        </div>

        <div class="form-group">
          <label>Payment Method</label>
          <select name="paymentMode" required>
            <option value="" disabled selected>Select Payment Method</option>
            <option value="Cash On Delivery">Cash On Delivery</option>
            <option value="UPI">UPI / QR Code</option>
            <option value="Debit Card">Debit Card</option>
            <option value="Credit Card">Credit Card</option>
            <option value="Net Banking">Net Banking</option>
          </select>
        </div>
      </div>

      <!-- RIGHT SIDE: Order Summary & Bill Box -->
      <div class="summary-box">
        <h2 class="section-title">Order Summary</h2>
        
        <!-- Loop items inside cart -->
        <% 
          if (cart != null && cart.getItems() != null) {
              for (CartItem item : cart.getItems().values()) {
        %>
        <div class="summary-item">
          <div class="item-name"><%= item.getName() %></div>
          <div class="item-qty">x <%= item.getQuantity() %></div>
          <div class="item-total">₹<%= (int)(item.getPrice() * item.getQuantity()) %></div>
        </div>
        <% 
              }
          } 
        %>

        <!-- Calculation Matrix Rows -->
        <div class="bill-details">
          <div class="bill-row">
            <span>Item Total</span>
            <span>₹<%= (int) grandTotal %></span>
          </div>
          <div class="bill-row">
            <span>Delivery Fee</span>
            <span>₹<%= (int) deliveryFee %></span>
          </div>
          <div class="bill-row">
            <span>GST (5%)</span>
            <span>₹<%= (int) gstAmount %></span>
          </div>
          
          <div class="bill-row total-row">
            <span>Total Payable</span>
            <span class="total-price">₹<%= (int) finalAmount %></span>
          </div>
        </div>

        <!-- Submission Controls -->
        <button type="submit" class="btn-submit">Proceed to Pay</button>
        <a href="cart.jsp" class="btn-back">Back to Cart</a>
      </div>

    </form>
  </main>

</body>
</html>