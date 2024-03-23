DROP TABLE IF EXISTS order_product CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS products CASCADE;


-- Create products table if it doesn't exist
CREATE TABLE IF NOT EXISTS products (
            id BIGSERIAL PRIMARY KEY,
            name VARCHAR(255) NOT NULL,
            description TEXT,
            price DECIMAL(10, 2),
            quantity INTEGER NOT NULL,
            image VARCHAR(255)
        );

-- Insert sample data into products table
INSERT INTO products (name, description, price, quantity, image)
VALUES
('Echo Dot (3rd Gen)', 'Smart speaker with Alexa', 39.99, 100, 'https://example.com/echodot.jpg'),
('Instant Pot Duo 7-in-1', 'Electric pressure cooker', 89.99, 50, 'https://example.com/instantpot.jpg'),
('Kindle Paperwhite', 'Waterproof e-reader', 129.99, 75, 'https://example.com/kindle.jpg'),
('Philips Sonicare Toothbrush', 'Electric rechargeable toothbrush', 49.95, 150, 'https://example.com/sonicare.jpg'),
('LED Desk Lamp', 'Adjustable brightness desk lamp with USB charging port', 29.99, 100, 'https://example.com/leddesklamp.jpg'),
('Wireless Bluetooth Earbuds', 'Noise-cancelling wireless earbuds with charging case', 59.99, 150, 'https://example.com/bluetoothearbuds.jpg'),
('Stainless Steel Water Bottle', '24 oz double-wall vacuum insulated water bottle', 19.99, 200, 'https://example.com/waterbottle.jpg'),
('Yoga Mat', 'Eco-friendly non-slip yoga mat', 25.99, 120, 'https://example.com/yogamat.jpg'),
('Backpack', 'Water-resistant travel backpack with laptop compartment', 49.99, 90, 'https://example.com/backpack.jpg'),
('Electric Kettle', '1.7L stainless steel electric kettle with auto shut-off', 29.95, 80, 'https://example.com/electrickettle.jpg'),
('Smartwatch', 'Fitness tracker with heart rate monitor', 99.99, 110, 'https://example.com/smartwatch.jpg'),
('Gaming Mouse', 'RGB backlit gaming mouse with adjustable DPI', 35.99, 140, 'https://example.com/gamingmouse.jpg'),
('Portable Charger', '10000mAh power bank with dual USB ports', 21.99, 130, 'https://example.com/portablecharger.jpg'),
('Bluetooth Speaker', 'Waterproof portable Bluetooth speaker', 39.99, 85, 'https://example.com/bluetoothspeaker.jpg'),
('Robot Vacuum Cleaner', 'Automatic robot vacuum cleaner with smart navigation', 149.99, 70, 'https://example.com/robotvacuum.jpg'),
('Action Camera', '4K action camera with waterproof case', 79.99, 60, 'https://example.com/actioncamera.jpg'),
('Bookshelf', '5-tier industrial style bookshelf', 89.99, 50, 'https://example.com/bookshelf.jpg'),
('Coffee Maker', 'Single serve coffee maker with reusable filter', 59.95, 100, 'https://example.com/coffeemaker.jpg'),
('Memory Foam Pillow', 'Orthopedic contour memory foam pillow', 29.99, 150, 'https://example.com/memoryfoampillow.jpg'),
('Office Chair', 'Ergonomic office chair with lumbar support', 109.99, 80, 'https://example.com/officechair.jpg'),
('Sneakers', 'Lightweight running sneakers for men and women', 49.99, 200, 'https://example.com/sneakers.jpg'),
('Waffle Maker', 'Non-stick Belgian waffle maker with adjustable browning', 25.99, 90, 'https://example.com/wafflemaker.jpg'),
('Air Fryer', '5.8QT large capacity air fryer with touchscreen', 99.99, 70, 'https://example.com/airfryer.jpg'),
('Desk Organizer', 'Wooden desk organizer with drawers', 19.99, 160, 'https://example.com/deskorganizer.jpg');

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
