
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



```bash
git clone https://github.com/Aaruu1709/nayka-ecommerce.git
