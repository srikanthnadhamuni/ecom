DROP TABLE IF EXISTS order_product CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS products CASCADE;


-- Create products table if it doesn't exist
CREATE TABLE IF NOT EXISTS products (
            id BIGINT PRIMARY KEY,
            name VARCHAR(255) NOT NULL,
            description TEXT,
            price DECIMAL(10, 2),
            quantity INTEGER NOT NULL,
            image VARCHAR(255)
        );

-- Insert sample data into products table
INSERT INTO products (id, name, description, price, quantity, image)
VALUES
(1, 'Product 1', 'Description of Product 1', 19.99, 100, 'https://example.com/product1.jpg'),
(2, 'Product 2', 'Description of Product 2', 29.99, 150, 'https://example.com/product2.jpg'),
(3, 'Product 3', 'Description of Product 3', 39.99, 200, 'https://example.com/product3.jpg');

-- Create customers table if it doesn't exist
CREATE TABLE IF NOT EXISTS customers (
    id BIGINT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
    address TEXT,
    city VARCHAR(255),
    state VARCHAR(255),
    pincode VARCHAR(20),
    country VARCHAR(255)
);

-- Insert sample data into customers table
INSERT INTO customers (id, name, email, phone, address, city, state, pincode, country) VALUES
(1, 'John Doe', 'john.doe@example.com', '+1234567890', '123 Main St', 'Anytown', 'State', '12345', 'Country'),
(2, 'Jane Smith', 'jane.smith@example.com', '+1987654321', '456 Elm St', 'Othertown', 'State', '67890', 'Country');

-- Create orders table if it doesn't exist
CREATE TABLE IF NOT EXISTS orders (
    id BIGINT PRIMARY KEY,
    status VARCHAR(255)
);

-- Insert sample data into orders table
INSERT INTO orders (id, status) VALUES
(1, 'pending'),
(2, 'shipped');

-- Create order_product mapping table if it doesn't exist
CREATE TABLE IF NOT EXISTS order_product (
    order_id BIGINT,
    product_id BIGINT,
    quantity INTEGER,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Insert sample data into order_product mapping table
INSERT INTO order_product (order_id, product_id, quantity) VALUES
(1, 1, 3),
(1, 2, 2),
(2, 2, 1),
(2, 3, 4);
