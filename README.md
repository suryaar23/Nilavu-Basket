# Nilavu Basket 🛒

Nilavu Basket is a multi-role grocery delivery web application designed for rural and semi-urban areas where quick-commerce platforms have limited reach.

The platform enables local grocery shops to digitize inventory, users to order groceries online, and delivery agents to manage deliveries efficiently using a lightweight and scalable MVC-based architecture.

---

## 🌍 Problem Statement

Most quick-commerce platforms focus mainly on urban regions due to high logistics costs, infrastructure requirements, and low order density in rural areas.

Nilavu Basket aims to bridge this gap by providing a localized grocery delivery solution using:

- Local grocery shops
- Local delivery agents
- Multi-language support
- Lightweight web architecture

The goal is to connect local businesses with digital commerce and improve grocery accessibility in underserved communities.

---

## ✨ Features

### 👤 User
- User Registration & Login
- Secure Password Hashing using BCrypt
- Browse Products
- Product Search & Filtering
- Add to Cart
- Multiple Address Support
- Place Orders
- Dummy Payment System (Cash on Delivery)
- Order History & Order Details

---

### 🏪 Shop
- Manage Products
- Update Stock
- View Shop Orders
- Confirm Orders
- Maintain Inventory

---

### 🛵 Delivery Agent
- View Assigned Orders
- Start Delivery
- Update Delivery Status
- Mark Orders as Delivered
- View Delivery Address

---

### 🛠 Admin
- View Users
- View Products
- Manage Shops
- Manage Delivery Agents
- View Orders

---

## 🏗 System Architecture

The project follows the MVC (Model-View-Controller) architecture.

### MVC Structure

| Layer | Responsibility |
|------|----------------|
| Model | DAO classes + Database |
| View | JSP Pages |
| Controller | Java Servlets |

---

## 💻 Tech Stack

| Layer | Technology |
|------|------------|
| Frontend | JSP, HTML, CSS |
| Backend | Java Servlets |
| Database | MySQL |
| Architecture | MVC + DAO Pattern |
| Security | BCrypt Password Hashing |
| Internationalization | i18n |
| Server | Apache Tomcat |

---

## 🗄 Database Design

### Main Tables

- users
- products
- categories
- shops
- cart
- cart_items
- orders
- order_items
- address
- agents
- payments

---

## 🔗 Table Relationships

- One User → One Cart
- One Cart → Multiple Cart Items
- One User → Multiple Addresses
- One User → Multiple Orders
- One Order → Multiple Order Items
- One Shop → Multiple Products
- One Category → Multiple Products

---

## ⭐ Key Design Decisions

### ✅ Order + Order Items Separation
Orders and order_items are separated to support multiple products per order while maintaining database normalization.

---

### ✅ Cart + Cart Items Separation
The cart system is separated into cart and cart_items tables to support multiple products per cart and improve scalability and maintainability.

---

### ✅ Reusable User Cart System
Each user is assigned a dedicated cart that is reused across sessions.

The cart_items table stores temporary products added by the user. After successful order placement, cart items are cleared while the cart itself is retained and reused for future orders.

This design reduces unnecessary cart creation and simplifies cart management.

---

### ✅ Address Snapshot in Orders
Delivery address data is stored as a snapshot during checkout to preserve historical order information even if users later update their addresses.

---

### ✅ DAO Layer
The DAO layer separates database logic from business logic, improving maintainability, modularity, and code organization.

---

### ✅ Automated Delivery Assignment System
After a shop confirms an order, the system automatically checks for available delivery agents.

- If an agent is available:
  - The order is assigned automatically.
- If all agents are busy:
  - The order is marked as Pending Delivery.
- When an agent becomes available:
  - The oldest pending order is automatically assigned.

This improves workflow automation and ensures fair order handling using a FIFO-based assignment approach.

---

### ✅ Multi-Language Support (i18n)
The system supports:
- English
- Malayalam
- Tamil

This improves accessibility for users in rural and regional areas.

---

## 🔐 Security Features

- BCrypt password hashing
- PreparedStatement for SQL injection prevention
- Session-based authentication
- Role-based access control

---

## 🔄 Core System Flows

### 🛒 Add to Cart Flow
1. User selects a product
2. Request sent to Cart Servlet
3. Product stock is validated
4. Item added to cart_items table

---

### 📦 Order Flow
1. User places order from cart
2. Cart items are fetched
3. Product stock is validated again
4. Order record created
5. Order items inserted
6. Product stock updated
7. Cart items cleared after successful checkout
8. Shop reviews and confirms the order

---

### 🚚 Delivery Flow
1. Shop confirms order
2. System checks for available delivery agents
3. If an agent is available:
   - Order is assigned automatically
4. If all agents are busy:
   - Order marked as Pending 
5. When an agent becomes available:
   - Oldest pending order is assigned automatically
6. Agent updates delivery status
7. Order marked as delivered

---

## ⚡ Scalability & Future Improvements

Planned improvements include:

- Payment Gateway Integration
- REST API Migration
- React Frontend
- Mobile Application
- Real-Time Order Tracking
- Offline Support for Rural Areas
- Route Optimization for Delivery Agents
- Caching & Query Optimization
- Pagination for Large Product Lists
- Push Notifications

---

## ⚠ Current Limitations

- Dummy payment implementation
- Basic UI design
- No real-time GPS tracking
- Monolithic architecture
- Limited scalability optimizations
- No advanced recommendation system

---

## 📚 Learning Outcomes

Through this project, I gained experience in:

- MVC Architecture
- Servlet Lifecycle
- JDBC & DAO Pattern
- Database Normalization
- Session Management
- Authentication & Authorization
- Multi-Role System Design
- Order & Delivery Workflow Design
- Queue-Based Assignment Logic
- Internationalization (i18n)

---



## 📦 Setup Instructions

### Prerequisites

- Java JDK
- Apache Tomcat
- MySQL
- IDE (IntelliJ IDEA / Eclipse)

---

## 🚀 Installation Steps

### 1. Clone Repository

```bash
git clone https://github.com/suryaar23/Nilavu-Basket.git
```

---

### 2. Import Project into IDE

Import the project as a **Dynamic Web Project** in Eclipse or IntelliJ IDEA.

---

### 3. Configure MySQL Database

Create a MySQL database.

Example:

```sql
CREATE DATABASE nilavu_basket;
```

---

### 4. Import SQL Schema

Import the `schema.sql` file into the created MySQL database.
---

### 5. Update Database Credentials

Update the database username and password in your database configuration or DAO classes.

Example:

```java
String url = "jdbc:mysql://localhost:3306/nilavu_basket";
String username = "root";
String password = "your_password";
```

---

### 6. Configure Apache Tomcat

Add the Apache Tomcat server in your IDE and deploy the project.

---

### 7. Run the Application

Start the Tomcat server.

---

### 8. Open in Browser

```txt
http://localhost:8080/nilavu-basket
```
