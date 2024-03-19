I'm creating an eCommerce application where customers can browse products on a 
wesbite or mobile app and order products.

The eCommerce application will be implementd in Java and consists of the following key files:
Product.java - contains the Product class, that lists a bunch of products that can be viewed by the customers
Customer.java - contains the Customer class,a list of customers who can view and order products
Orders.java - contains the Orders class,which represents the orders placed by the customers for specific products
States.json - The master data associated with the list of all valid states and their codes are contained here.
ecommerce.sql - file will contain the sql script to create the database schema and populate it with some sample values, We will use a postgres database as the persistence store for the application 

The above application is being developed as a Spring boot application in the VSCode IDE on a Mac. 

ecommerce-app/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   ├── com/
│   │   │   │   └── yourcompany/
│   │   │   │       └── ecommerce/
│   │   │   │           ├── Customer.java
│   │   │   │           ├── Product.java
│   │   │   │           └── Orders.java
│   │   └── resources/
│   │       ├── States.json
│   │       └── ecommerce.sql
│   ├── test/
│   │   ├── java/
│   │   │   ├── com/
│   │   │   │   └── yourcompany/
│   │   │   │       └── ecommerce/
│   │   │   │           ├── CustomerTest.java
│   │   │   │           ├── ProductTest.java
│   │   │   │           └── OrdersTest.java
│   │   └── resources/
│   │       └── test-data.json   // Example test resource
├── build.gradle
└── README.md

