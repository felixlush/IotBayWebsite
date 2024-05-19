Project Title: IOT Bay E-commerce Platform
Description
IOT Bay is a web-based e-commerce platform designed to manage and sell IoT (Internet of Things) devices and smart home products. The platform enables users to register, login, browse products, and place orders. It provides administrative functions for managing products, orders, and users. The platform utilizes Java servlets for backend logic, JDBC for database interactions, and JSP for dynamic web content.

Features
User Registration and Login: Secure registration and login functionality for customers and staff.
Product Management: Ability for admins to add, update, and delete products.
Order Management: Users can browse products, add them to their cart, and place orders.
User Logs: Tracking user login sessions and activities.
Responsive Design: Web pages that are responsive and adaptable to different devices.
Prerequisites
Java JDK 8 or later
GlassFish Server 4.1
Apache Derby Database
Any IDE that supports Servlet and JSP (e.g., Eclipse, Apache NetBeans)
Installation
Clone the Repository:

bash
Copy code
git clone https://github.com/felixlush/IotBayWebsite
cd iot-bay
Setup Database:

Ensure Apache Derby is installed and running on your system.
Use the provided SQL script to create a dummy database in Source Packages/iot.isd.model.dao/createTables.sql

Configure GlassFish Server:

Download and install GlassFish Server 4.1.
Configure your project to run on GlassFish Server via your IDE.
Deploy the Application:

Build the project using your IDE.
Deploy the .war file to your GlassFish server using either the admin console or the asadmin command-line tool.
Usage
Start the GlassFish server.
Navigate to http://localhost:8080/IotBayWebsite to access the application.
Register as a new user or login using existing credentials.

Functionality:
Once you have executed the SQL command to full the databases you will be able to access the staff admin features on the sight by using the following details to login:

email: admin@gmail.com
password: password

This will allow you to edit, delete and add products on the product page. It will also allow you to access the staff list which is the list of all staff users. From here you can search, create, edit and delete staff users
