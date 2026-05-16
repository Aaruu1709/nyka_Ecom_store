# 💄 Nayka E-Commerce Mini Project

A simple Java-based web application that simulates an e-commerce platform like Nykaa.  
This project demonstrates **JDBC, Servlets, JSP, and MySQL** with full CRUD operations and authentication.

---

## 🚀 Features

### 👤 User Module
- User Registration
- User Login
- View Products
- Logout

### 🛠️ Admin Module
- Admin Login
- Add Product
- View Products
- Update Product
- Delete Product
- View Users

---

## 🔐 Authentication & Authorization
- Session-based login system
- Role-based access:
  - **Admin** → Access admin dashboard
  - **User** → Access product page
- Secure page access (restricted admin pages)

---

## 🧰 Technologies Used

- Java (JDK 8+)
- JDBC
- Servlets (Jakarta EE)
- JSP
- MySQL
- Apache Tomcat Server
- HTML/CSS

---

## 🗄️ Database Structure

### 📌 Table: `naykausers`

| Column | Type |
|--------|-----|
| id | int (PK, auto increment) |
| name | varchar |
| email | varchar |
| password | varchar |
| gender | varchar |
| city | varchar |
| role | varchar (admin/user) |

---

### 📌 Table: `products`

| Column | Type |
|--------|-----|
| id | int (PK, auto increment) |
| name | varchar |
| price | double |
| description | varchar |

---



```bash
git clone https://github.com/Aaruu1709/nayka-ecommerce.git
