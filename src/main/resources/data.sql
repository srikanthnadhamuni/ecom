DROP TABLE IF EXISTS order_product CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS products CASCADE;


-- Create products table if it doesn't exist
CREATE TABLE IF NOT EXISTS products (
    id BIGSERIAL PRIMARY KEY,
    asin VARCHAR(16) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2),
    quantity INTEGER NOT NULL,
    image VARCHAR(255)
);

-- Insert sample data into products table
INSERT INTO products (asin, name, description, price, quantity, image)
VALUES
('B07FZ8S74R', 'Echo Dot (3rd Gen)', 'Smart speaker with Alexa', 39.99, 100, 'http://images.amazon.com/images/P/'),
('B00FLYWNYQ', 'Instant Pot Duo 7-in-1', 'Electric pressure cooker', 89.99, 50, 'http://images.amazon.com/images/P/'),
('B07CXG6C9W', 'Kindle Paperwhite', 'Waterproof e-reader', 129.99, 75, 'http://images.amazon.com/images/P/'),
('B078GVDB18', 'Philips Sonicare Toothbrush', 'Electric rechargeable toothbrush', 49.95, 150, 'http://images.amazon.com/images/P/'),
('B016VYAWA6', 'LED Desk Lamp', 'Adjustable brightness desk lamp with USB charging port', 29.99, 100, 'http://images.amazon.com/images/P/'),
('B07MCGZK3B', 'Wireless Bluetooth Earbuds', 'Noise-cancelling wireless earbuds with charging case', 59.99, 150, 'http://images.amazon.com/images/P/'),
('B0CP77ZXJ4', 'Stainless Steel Water Bottle', '24 oz double-wall vacuum insulated water bottle', 19.99, 200, 'http://images.amazon.com/images/P/'),
('B01LP0VI3G', 'Yoga Mat', 'Eco-friendly non-slip yoga mat', 25.99, 120, 'http://images.amazon.com/images/P/'),
('B092TQG5ZD', 'Backpack', 'Water-resistant travel backpack with laptop compartment', 49.99, 90, 'http://images.amazon.com/images/P/'),
('B0BJ85RD4V', 'Electric Kettle', '1.7L stainless steel electric kettle with auto shut-off', 29.95, 80, 'http://images.amazon.com/images/P/'),
('B0B75WWC8F', 'Smartwatch', 'Fitness tracker with heart rate monitor', 99.99, 110, 'http://images.amazon.com/images/P/'),
('B0CKXDSLZM', 'Gaming Mouse', 'RGB backlit gaming mouse with adjustable DPI', 35.99, 140, 'http://images.amazon.com/images/P/'),
('B07S829LBX', 'Portable Charger', '10000mAh power bank with dual USB ports', 21.99, 130, 'http://images.amazon.com/images/P/'),
('B078S4P3J9', 'Bluetooth Speaker', 'Waterproof portable Bluetooth speaker', 39.99, 85, 'http://images.amazon.com/images/P/'),
('B07D75MVX9', 'Robot Vacuum Cleaner', 'Automatic robot vacuum cleaner with smart navigation', 149.99, 70, 'http://images.amazon.com/images/P/'),
('B0CSKJTYZ5', 'Action Camera', '4K action camera with waterproof case', 79.99, 60, 'http://images.amazon.com/images/P/'),
('B0CCXTSSLJ', 'Bookshelf', '5-tier industrial style bookshelf', 89.99, 50, 'http://images.amazon.com/images/P/'),
('B0CT5NRN8F', 'Coffee Maker', 'Single serve coffee maker with reusable filter', 59.95, 100, 'http://images.amazon.com/images/P/'),
('B07SDFC9QT', 'Memory Foam Pillow', 'Orthopedic contour memory foam pillow', 29.99, 150, 'http://images.amazon.com/images/P/'),
('B0BZPJQ2X2', 'Office Chair', 'Ergonomic office chair with lumbar support', 109.99, 80, 'http://images.amazon.com/images/P/'),
('B0CJ2ZFW1P', 'Sneakers', 'Lightweight running sneakers for men and women', 49.99, 200, 'http://images.amazon.com/images/P/'),
('B0CKPR6634', 'Waffle Maker', 'Non-stick Belgian waffle maker with adjustable browning', 25.99, 90, 'http://images.amazon.com/images/P/'),
('B07VM28XTR', 'Air Fryer', '5.8QT large capacity air fryer with touchscreen', 99.99, 70, 'http://images.amazon.com/images/P/'),
('B0CP92T54K', 'Desk Organizer', 'Wooden desk organizer with drawers', 19.99, 160, 'http://images.amazon.com/images/P/');


-- ('Echo Dot (3rd Gen)', 'Smart speaker with Alexa', 39.99, 100, 'http://images.amazon.com/images/P/B07FZ8S74R.01._SCMZZZZZZZ_.jpg'),
-- ('Instant Pot Duo 7-in-1', 'Electric pressure cooker', 89.99, 50, 'http://images.amazon.com/images/P/B00FLYWNYQ.01._SCMZZZZZZZ_.jpg'),
-- ('Kindle Paperwhite', 'Waterproof e-reader', 129.99, 75, 'http://images.amazon.com/images/P/B07CXG6C9W.01._SCMZZZZZZZ_.jpg'),
-- ('Philips Sonicare Toothbrush', 'Electric rechargeable toothbrush', 49.95, 150, 'http://images.amazon.com/images/P/B09R1RRR35.01._SCMZZZZZZZ_.jpg'),
-- ('LED Desk Lamp', 'Adjustable brightness desk lamp with USB charging port', 29.99, 100, 'http://images.amazon.com/images/P/B079BNYJMT.01._SCMZZZZZZZ_.jpg'),
-- ('Wireless Bluetooth Earbuds', 'Noise-cancelling wireless earbuds with charging case', 59.99, 150, 'http://images.amazon.com/images/P/B07MCGZK3B.01._SCMZZZZZZZ_.jpg'),
-- ('Stainless Steel Water Bottle', '24 oz double-wall vacuum insulated water bottle', 19.99, 200, 'http://images.amazon.com/images/P/B07P6WRCJT.01._SCMZZZZZZZ_.jpg'),
-- ('Yoga Mat', 'Eco-friendly non-slip yoga mat', 25.99, 120, 'http://images.amazon.com/images/P/B086BZL6JT.01._SCMZZZZZZZ_.jpg'),
-- ('Backpack', 'Water-resistant travel backpack with laptop compartment', 49.99, 90, 'http://images.amazon.com/images/P/B076H2J5ZG.01._SCMZZZZZZZ_.jpg'),
-- ('Electric Kettle', '1.7L stainless steel electric kettle with auto shut-off', 29.95, 80, 'http://images.amazon.com/images/P/B07WDLGYB2.01._SCMZZZZZZZ_.jpg'),
-- ('Smartwatch', 'Fitness tracker with heart rate monitor', 99.99, 110, 'http://images.amazon.com/images/P/B07WSQLKHM.01._SCMZZZZZZZ_.jpg'),
-- ('Gaming Mouse', 'RGB backlit gaming mouse with adjustable DPI', 35.99, 140, 'http://images.amazon.com/images/P/B07W5PD6VS.01._SCMZZZZZZZ_.jpg'),
-- ('Portable Charger', '10000mAh power bank with dual USB ports', 21.99, 130, 'http://images.amazon.com/images/P/B07S829LBX.01._SCMZZZZZZZ_.jpg'),
-- ('Bluetooth Speaker', 'Waterproof portable Bluetooth speaker', 39.99, 85, 'http://images.amazon.com/images/P/B07FZ3C97K.01._SCMZZZZZZZ_.jpg'),
-- ('Robot Vacuum Cleaner', 'Automatic robot vacuum cleaner with smart navigation', 149.99, 70, 'http://images.amazon.com/images/P/B07D75MVX9.01._SCMZZZZZZZ_.jpg'),
-- ('Action Camera', '4K action camera with waterproof case', 79.99, 60, 'http://images.amazon.com/images/P/B07B2W96JH.01._SCMZZZZZZZ_.jpg'),
-- ('Bookshelf', '5-tier industrial style bookshelf', 89.99, 50, 'http://images.amazon.com/images/P/B07KTVTG8Z.01._SCMZZZZZZZ_.jpg'),
-- ('Coffee Maker', 'Single serve coffee maker with reusable filter', 59.95, 100, 'http://images.amazon.com/images/P/B07KMSBSZC.01._SCMZZZZZZZ_.jpg'),
-- ('Memory Foam Pillow', 'Orthopedic contour memory foam pillow', 29.99, 150, 'http://images.amazon.com/images/P/B07SDFC9QT.01._SCMZZZZZZZ_.jpg'),
-- ('Office Chair', 'Ergonomic office chair with lumbar support', 109.99, 80, 'http://images.amazon.com/images/P/B01HEJ5IXS.01._SCMZZZZZZZ_.jpg'),
-- ('Sneakers', 'Lightweight running sneakers for men and women', 49.99, 200, 'http://images.amazon.com/images/P/B07T4KPYN2.01._SCMZZZZZZZ_.jpg'),
-- ('Waffle Maker', 'Non-stick Belgian waffle maker with adjustable browning', 25.99, 90, 'http://images.amazon.com/images/P/B07C32SQCS.01._SCMZZZZZZZ_.jpg'),
-- ('Air Fryer', '5.8QT large capacity air fryer with touchscreen', 99.99, 70, 'http://images.amazon.com/images/P/B07VM28XTR.01._SCMZZZZZZZ_.jpg'),
-- ('Desk Organizer', 'Wooden desk organizer with drawers', 19.99, 160, 'http://images.amazon.com/images/P/B07L87MH64.01._SCMZZZZZZZ_.jpg');


-- Create customers table if it doesn't exist
CREATE TABLE IF NOT EXISTS customers (
    id BIGSERIAL PRIMARY KEY,
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
INSERT INTO customers (name, email, phone, address, city, state, pincode, country) VALUES
('Rajesh Kumar', 'rajesh.kumar@example.com', '9820012345', '123 MG Road', 'Mumbai', 'Maharashtra', '400001', 'India'),
('Sunita Gupta', 'sunita.gupta@example.com', '9330012345', '45 Ballygunge Place', 'Kolkata', 'West Bengal', '700019', 'India'),
('Amit Singh', 'amit.singh@example.com', '9876512345', '678 Mall Road', 'Delhi', 'Delhi', '110006', 'India'),
('Priya Patel', 'priya.patel@example.com', '9555012345', '56 SG Highway', 'Ahmedabad', 'Gujarat', '380054', 'India'),
('Anil Sharma', 'anil.sharma@example.com', '9448012345', '202 Whitefield', 'Bangalore', 'Karnataka', '560066', 'India'),
('Lakshmi Reddy', 'lakshmi.reddy@example.com', '9618012345', '789 Banjara Hills', 'Hyderabad', 'Telangana', '500034', 'India'),
('Vijay Chauhan', 'vijay.chauhan@example.com', '9717012345', '34/1 Model Town', 'Chandigarh', 'Chandigarh', '160101', 'India'),
('Deepa Nair', 'deepa.nair@example.com', '9846012345', '90 MG Road', 'Kochi', 'Kerala', '682011', 'India'),
('Rohan Bhatia', 'rohan.bhatia@example.com', '9937012345', '56 Civil Lines', 'Jaipur', 'Rajasthan', '302006', 'India'),
('Pooja Mehra', 'pooja.mehra@example.com', '9988012345', '67 Sahakar Nagar', 'Pune', 'Maharashtra', '411009', 'India'),
('Nikhil Rao', 'nikhil.rao@example.com', '9246012345', '123 Kukatpally', 'Hyderabad', 'Telangana', '500072', 'India'),
('Simran Kaur', 'simran.kaur@example.com', '9786012345', '4568 Sector 37D', 'Chandigarh', 'Chandigarh', '160036', 'India'),
('Manish Agarwal', 'manish.agarwal@example.com', '9819012345', '12 Park Street', 'Kolkata', 'West Bengal', '700016', 'India'),
('Anjali Varma', 'anjali.varma@example.com', '9742012345', '234 Andheri West', 'Mumbai', 'Maharashtra', '400053', 'India'),
('Suresh Reddy', 'suresh.reddy@example.com', '9901012345', '789 Indiranagar', 'Bangalore', 'Karnataka', '560038', 'India'),
('Meera Chaudhary', 'meera.chaudhary@example.com', '9527012345', '1010 Malviya Nagar', 'Jaipur', 'Rajasthan', '302017', 'India'),
('Arjun Pandey', 'arjun.pandey@example.com', '9652012345', '402 Shivaji Nagar', 'Pune', 'Maharashtra', '411005', 'India'),
('Riya Malik', 'riya.malik@example.com', '9878012345', '68 MG Marg', 'Lucknow', 'Uttar Pradesh', '226001', 'India'),
('Kunal Shah', 'kunal.shah@example.com', '9225012345', '55 Satellite Area', 'Ahmedabad', 'Gujarat', '380015', 'India'),
('Sonam Jain', 'sonam.jain@example.com', '9403012345', '789 Gandhi Nagar', 'Delhi', 'Delhi', '110031', 'India');

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
