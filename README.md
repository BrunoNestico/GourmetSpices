# GourmetSpices
E-Commerce Website Project
This repository contains the code for a university project developed for the TSW course. The project is an e-commerce website that allows users to purchase products online.

Project Overview
The e-commerce website allows customers to:

Browse products and add them to their cart.
Modify the quantity of products in the cart.
Remove products from the cart.
Empty the cart.
Confirm orders and view their order history.
The website also includes an administrative section where administrators can:

Add, modify, view, and delete products in the catalog.
View orders within a specified date range and by customer.

Features
Customer Functionality
Product Management: Customers can add products to their cart, update quantities, remove products, and empty their cart.
Order Management: After confirming an order, the cart is emptied and the order is saved in the order history.
Responsive Design: The website is dynamic and responsive, providing a seamless experience across different devices.
Form Validation: Forms are validated using JavaScript and regular expressions to ensure correct data input.
AJAX: Used for asynchronous communication with the server to enhance user experience.
Session Management: Sessions are used to maintain the state of the cart.
Administrator Functionality
Catalog Management: Administrators can add, edit, view, and delete products.
Order Viewing: Administrators can view all orders, filterable by date range and customer.
Authentication: Access to the administrator pages is restricted and requires authentication.

Technical Details
Architecture
MVC Pattern: The project follows the Model-View-Controller (MVC) architectural pattern.
Data Persistence: The DataSource or DriveManager is used to connect to the database, and the DAO pattern is used to encapsulate the persistence logic.
Session Management: Tokens are used in the session for access control in servlets and JSP pages.
Technologies
Java: Backend logic.
JSP: For dynamic HTML generation.
Servlets: For control logic.
JavaScript: For client-side interactions and form validation.
CSS: External stylesheets for styling.
AJAX: For asynchronous server communication.
Git: Version control.
Directory Structure
src/control: Contains the servlet classes.
src/model: Contains the model classes.
webapp/scripts: Contains JavaScript files.
webapp/images: Contains static images.
webapp/styles: Contains CSS stylesheets.
webapp/WEB-INF/jsp: Contains JSP files.

Database Schema
Orders Table: Maintains order history, ensuring the price at the time of purchase is preserved.
Products Table: Allows modification of product details without affecting past orders.
Customers Table: Stores customer information.

Setup and Deployment
Clone the repository:

git clone https://github.com/yourusername/ecommerce-website.git

Configure the database:
Set up your database with the necessary tables and relationships.
Update the database connection settings in the project.
Build and deploy:

Use your preferred IDE or build tools to compile and deploy the project.

Conclusion
This project demonstrates the development of a dynamic and responsive e-commerce website with a clear separation of concerns following the MVC pattern. The website provides robust functionality for both customers and administrators, ensuring a seamless shopping experience and efficient management of the product catalog and orders.

For more details on the implementation and to view the code, please refer to the repository.
