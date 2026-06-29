<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@
	page import="java.util.List,com.tap.Model.Menu"
 %>
 
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>FoodExpress - Menu</title>
  <link rel="stylesheet" href="menuStyles.css">
</head>
<body>

  <header class="navbar">
    <a class="brand" href="#">FoodExpress</a>

    <nav class="nav-links">
      <a href="restaurant.html">Home</a>
      <a href="cart.jsp">Cart</a>
      <a href="cart.jsp">Cart</a>
      <a href="#">Profile</a>
    </nav>
  </header>

  <main>

    <section class="hero">
      <div class="hero-content">
        <p class="eyebrow">Restaurant Menu</p>
        <h1>Pizza Palace</h1>
        <p>
          Italian • Pizza • Fast Food • 30 mins Delivery
        </p>
      </div>
    </section>

    <section class="toolbar">
      <button>Popular</button>
      <button>Veg</button>
      <button>Non Veg</button>
      <button>Bestseller</button>
      <button>Fast Delivery</button>
    </section>

    <section class="menu-section">

      <div class="section-heading">
        <h2>Menu Items</h2>
        <p>20 items available</p>
      </div>

      <div class="menu-grid">
      
      <%
       List<Menu> allMenu=(List<Menu>)request.getAttribute("allMenu");
		for (Menu menu : allMenu) 
		{
	  %>
		<article class="menu-card">
          <img src="<%= (menu.getImagePath() != null && !menu.getImagePath().trim().isEmpty()) ? menu.getImagePath() : "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&w=500&q=80" %>" 
     alt="<%= menu.getItemName() %>" 
     onerror="this.onerror=null; this.src='https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&w=500&q=80';">

          <div class="card-body">
            <div class="card-title-row">
              <h3><%= menu.getItemName() %></h3>
              <span class="rating">4.5</span>
            </div>
            <p class="description">
                  <%= menu.getDescription() %>
            </p>
            <div class="card-footer">
              <span class="price">₹<%= menu.getPrice() %></span>
              
              <form action="cartServlet">
              	<input type = "hidden" name = "menuId" value ="<%= menu.getMenuId() %>">
              	<input type = "hidden" name = "restaurantId" value ="<%= menu.getRestaurantId() %>">
              	<input type = "hidden" name = "quantity" value ="1">
              	<input type = "hidden" name = "action" value ="add">
              	<button class="cart-btn">Add To Cart</button>
              </form>

            </div>
          </div>
        </article>
	  <%	
		}
      %>
      </div>

    </section>

  </main>

</body>
</html>