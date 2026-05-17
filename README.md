
project output :
1.register page:
<img width="1920" height="1020" alt="image" src="https://github.com/user-attachments/assets/ab7c446d-f0fb-4eaa-a36c-c882a352c1ec" />
-------------------------------------------
2.login page:
<img width="1920" height="1020" alt="image" src="https://github.com/user-attachments/assets/b3563880-63c0-4043-96af-d54a9fddef53" />
if login sucessful then go towards dashboard page 
if there is normal user login it can see only product do not edit or delete 
if login as admin have authority to view , edit , delete and do changes.
----------------------------------------------
3.1 if login as admin:
<img width="1920" height="1020" alt="image" src="https://github.com/user-attachments/assets/3bcaa6e5-ecf3-49fa-b2ec-fbf1be38bd64" />
3.1.1: as admin we can add product into my application
<img width="1920" height="1020" alt="image" src="https://github.com/user-attachments/assets/993a9bb4-b47f-41d9-bcda-91c1486de424" />
3.1.2: we can view all the products which added 
also as admin i have accessiblity to edit or delete product 
<img width="1920" height="1020" alt="image" src="https://github.com/user-attachments/assets/9fbdd927-e155-4dee-b44c-09240c899072" />
Edit product:
<img width="1920" height="1020" alt="image" src="https://github.com/user-attachments/assets/2a91c057-0f6d-4bdb-8e7a-fad4f4943f7c" />

edited page:
<img width="1920" height="1020" alt="image" src="https://github.com/user-attachments/assets/3c6b2e68-3735-48d2-aeb4-cfae3dff0da0" />





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

git clone https://github.com/Aaruu1709/nayka-ecommerce.git


```bash



----------------------------------------------------------------------------
demo representation of project:
Hello everyone,

Today I am going to explain my Java-based web application project which is inspired by the Nykaa e-commerce platform.

The main purpose of this project is to learn Java web development concepts such as JDBC, Servlets, JSP, MySQL database connectivity, CRUD operations, and authentication.

In this project, there are mainly two modules:

1. User Module
2. Admin Module

First, let me explain the User Module.

In the User Module, a user can register by entering details like name, email, password, gender, and city.
After registration, the data is stored in the MySQL database using JDBC.

Then the user can log in using email and password.
I implemented session-based authentication, so after successful login a session is created and the user can access the product page.

Users can:

* Register
* Login
* View products
* Logout

Now let me explain the Admin Module.

Admin can log in using admin credentials.
After login, the system checks the role field from the database.
If the role is admin, then the admin dashboard opens.

In the Admin Module, admin can perform CRUD operations on products:

* Add Product
* View Product
* Update Product
* Delete Product

Admin can also view all registered users.

For backend development, I used Java Servlets.
Servlets handle request and response processing.

For frontend pages, I used JSP along with HTML and CSS.

I used JDBC to connect the Java application with the MySQL database.

There are mainly two tables in the database:

1. naykausers
2. products

The naykausers table stores user information and role details.
The products table stores product details like name, price, and description.

One important concept implemented in this project is authentication and authorization.

Authentication means verifying login credentials.
Authorization means checking whether the logged-in user is admin or normal user.

I also used PreparedStatement in JDBC to execute SQL queries securely and avoid SQL Injection.

This project helped me understand:

* Java web application architecture
* Database connectivity
* Session management
* CRUD operations
* MVC flow using Servlet and JSP

Thank you.
