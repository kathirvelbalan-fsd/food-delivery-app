<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@
	page import="java.util.List,com.tap.Model.Restaurant"
 %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>FoodExpress - Restaurant Page</title>
  <link rel="stylesheet" href="restaurantStyles.css">
</head>
<body>
  <header class="navbar">
    <a class="brand" href="callRestaurantServlet">FoodExpress</a>
    <nav class="nav-links" aria-label="Main navigation">
      <a href="callRestaurantServlet">Home</a>
      
      <%
        String userEmail = (String) session.getAttribute("email");
        
        if (userEmail == null) { 
      %>
          <a href="login.html">Login</a>
          <a href="reg.html">Sign Up</a>
      <% 
        } else { 
      %>
          <a href="logoutServlet">Logout</a>
      <% 
        } 
      %>
      
      <a href="cart.jsp">🛒 Cart</a>
      <a href="#">Profile</a>
    </nav>
  </header>

  <main>
    <section class="hero">
      <div class="hero-content">
        <p class="eyebrow">Restaurant discovery</p>
        <h1>Find tasty food near you</h1>
        <p>Browse popular restaurants with ratings, location, delivery time, cuisine, and offers.</p>
        <form class="search-box">
          <input type="search" placeholder="Search for biryani, pizza, dosa..." aria-label="Search restaurants">
          <button type="submit">Search</button>
        </form>
      </div>
    </section>

    <section class="toolbar" aria-label="Restaurant filters">
      <button>Fast Delivery</button>
      <button>Top Rated</button>
      <button>Pure Veg</button>
      <button>Offers</button>
      <button>Near Me</button>
    </section>

    <section class="restaurant-section">
      <div class="section-heading">
        <h2>Popular Restaurants</h2>
        <p>Restaurants available in your city</p>
      </div>
      
      <div class="restaurant-grid">
      <%
        List<Restaurant> allRestaurants = (List<Restaurant>) request.getAttribute("restaurants");
        if (allRestaurants != null && !allRestaurants.isEmpty()) {
            for (Restaurant restaurant : allRestaurants) {
      %>
    	  	<a href="menuServlet?restaurantID=<%=restaurant.getRestaurantId()%>&restaurantName=<%=restaurant.getName()%>" style="text-decoration: none; color: inherit;">
    	  		 <article class="restaurant-card">
		          <img src="<%= restaurant.getImagePath() %>" alt="<%= restaurant.getName() %>">
		          <div class="card-body">
		            <div class="card-title-row">
		              <h3><%= restaurant.getName() %></h3>
		              <span class="rating"><%= restaurant.getRating() %></span>
		            </div>
		            <p class="cuisine"><%= restaurant.getCuisineType() %></p>
		            <p class="meta"><%= restaurant.getAddress()%></p>
		            <div class="card-footer">
		              <span><%= restaurant.getDeliveryTime() %> min</span>
		              <strong>OPEN</strong>
		            </div>
		          </div>
		        </article>
    	  	</a>
	  <%	      
		    }
        } else {
      %>
            <p>No restaurants found!</p>
      <%
        }
      %>
      </div>
    </section>
  </main>
</body>
</html>