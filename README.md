# GourmetSpices
# E-Commerce Website Project

This repository contains the code for a university project developed for the TSW course. The project is an e-commerce website that allows users to purchase products online. The project was developed following the specifications provided by the professor.

## Project Overview

The e-commerce website allows customers to:
- Browse products and add them to their cart.
- Modify the quantity of products in the cart.
- Remove products from the cart.
- Empty the cart.
- Confirm orders and view their order history.

The website also includes an administrative section where administrators can:
- Add, modify, view, and delete products in the catalog.
- View orders within a specified date range and by customer.

## Features

- **Responsive Design:** The website is dynamic and responsive, providing a seamless experience across different devices.
- **Form Validation:** Forms are validated using JavaScript and regular expressions to ensure correct data input.
- **AJAX:** Used for asynchronous communication with the server to enhance user experience.
- **Session Management:** Sessions are used to maintain the state of the cart.

## Technical Details

### Architecture
- **MVC Pattern:** The project follows the Model-View-Controller (MVC) architectural pattern.

### Technologies
- **Java:** Backend logic.
- **JSP:** For dynamic HTML generation.
- **Servlets:** For control logic.
- **JavaScript:** For client-side interactions and form validation.
- **CSS:** External stylesheets for styling.
- **AJAX:** For asynchronous server communication.
- **Git:** Version control.

### Directory Structure
- `src/control`: Contains the servlet classes.
- `src/model`: Contains the model classes.
- `WebContent/scripts`: Contains JavaScript files.
- `WebContent/images`: Contains static images.
- `WebContent/css`: Contains CSS stylesheets.
- `WebContent`: Contains JSP files.

## Setup and Deployment
1. **Clone the repository:**
   ```sh
   git clone https://github.com/BrunoNestico/GourmetSpices.git
   
2. **Configure the database:**

Set up your database with the necessary tables and relationships.
Update the database connection settings in the project.
Build and deploy:

Use your preferred IDE or build tools to compile and deploy the project.
