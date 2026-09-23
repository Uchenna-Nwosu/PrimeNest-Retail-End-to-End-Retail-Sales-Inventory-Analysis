-- Creating Tables

CREATE TABLE Categories (
	Category_id SERIAL PRIMARY KEY,
	Category_name VARCHAR(100) NOT NULL UNIQUE,
	Description Text
);

CREATE TABLE Customers(
	Customer_id SERIAL PRIMARY KEY,
	First_name VARCHAR (50) NOT NULL,
	Last_name VARCHAR (50) NOT NULL,
	Gender VARCHAR (10) CHECK (Gender IN ('Male', 'Female')),
	Email VARCHAR (100) UNIQUE NOT NULL,
	Phone Varchar (20),
	Address TEXT,
	City VARCHAR (50),
	Registration_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE Employees_ (
	Employee_id SERIAL PRIMARY KEY,
	First_name VARCHAR (50),
	Last_name VARCHAR (50),
	Job_title VARCHAR (50),
	Hire_date DATE,
	Salary NUMERic (10,2),
	Email VARCHAR (100) UNIQUE
);

CREATE TABLE Products(
	Product_id SERIAL PRIMARY KEY,
	Product_name VARCHAR (150) NOT NULL,
	Category_id INT NOT NULL,
	Supplier_id INT NOT NULL,
	Unit_price NUMERIC (10,2) NOT NULL CHECK (Unit_price > 0),
	Units_in_stock INT DEFAULT 0 CHECK (Units_in_stock >=0),
	Reorder_level INT DEFAULT 10,
	Discontinued BOOLEAN DEFAULT FALSE,

CONSTRAINT fk_Category
	FOREIGN KEY (Category_id)
	REFERENCES Categories (Category_id),

CONSTRAINT fk_Suppier
	FOREIGN KEY (Supplier_id)
	REFERENCES Suppliers (Supplier_id)
);

CREATE TABLE Inventory (
	Inventory_id SERIAL PRIMARY KEY,
	Product_id INT UNIQUE,
	Quantity_available INT NOT NULL,
	Warehouse_location VARCHAR (100),
	Last_updated DATE DEFAULT CURRENT_DATE,

CONSTRAINT fk_Innventory_product
	FOREIGN KEY (Product_id)
	REFERENCES Products (Product_id)
);

CREATE TABLE Orders(
	Order_id SERIAL PRIMARY KEY,
	Customer_id INT NOT NULL,
	Employee_id INT,
	Order_date DATE DEFAULT CURRENT_DATE,
	Order_status VARCHAR (20)
		CHECK (Order_status IN ('Pending', 'Processing', 'Shipped', 'Delivered', 
        'Cancelled')),

CONSTRAINT fk_Customer
	FOREIGN KEY (Customer_id)
	REFERENCES Customers (Customer_id),

CONSTRAINT fk_Employee
	FOREIGN KEY (Employee_id)
	REFERENCES Employees_ (Employee_id)
);

CREATE TABLE Order_details (
    Order_detail_id SERIAL PRIMARY KEY,
    Order_id INT NOT NULL,
    Product_id INT NOT NULL,
    Quantity INT NOT NULL CHECK(quantity > 0),
    Unit_price NUMERIC(10,2) NOT NULL,
    Discount NUMERIC(5,2) DEFAULT 0,

    CONSTRAINT fk_order
        FOREIGN KEY(order_id)
        REFERENCES Orders(order_id),

    CONSTRAINT fk_product
        FOREIGN KEY(product_id)
        REFERENCES Products(product_id)
);

CREATE TABLE Payments (
    Payment_id SERIAL PRIMARY KEY,
    Order_id INT UNIQUE,
    Payment_date DATE DEFAULT CURRENT_DATE,
    Payment_method VARCHAR(30),
    Amount NUMERIC(12,2),
    Payment_status VARCHAR(20)
        CHECK(payment_status IN ('Paid','Pending','Failed','Refunded')),

    CONSTRAINT fk_payment_order
        FOREIGN KEY(order_id)
        REFERENCES Orders(order_id)
);


-- Populating Tables

INSERT INTO Categories (Category_id, Category_name, Description)
VALUES
(0101,'Electronics', 'Electronic devices and Accessories'),
(0102,'Fashion and Clothing', 'Shoes and Accessores'),
(0103,'Home and Kitchen', 'Household Appliances and Kitchenware'),
(0104,'Beauty and Personal Care', 'Cosmetics and Skincare Products'),
(0105,'Sports and Outdoors', 'Sporting Goods and Fitness Equipment'),
(0106,'Books', 'Educcational and Leisure Books'),
(0107,'Toys and Games', 'Children Toys and Board Games'),
(0108,'Health', 'Health and Wellness Products'),
(0109,'Groceries', 'Food and Beverages'),
(0110,'Office Supplies', 'Office Stationary nd Equipment');


INSERT INTO Suppliers (supplier_id, company_name, contact_name, phone, email, address)
VALUES
(211,'TechWorld Ltd', 'John Smith', '08031234567', 'john@techworld.com', '12 Victoria Island, Lagos'),
(212,'Elite Fashion', 'Sarah Johnson', '08032345678', 'sarah@elitefashion.com', 'Lekki Phase 1, Lagos'),
(213,'Kitchen Hub', 'Michael Brown', '08033456789', 'michael@kitchenhub.com', 'Ikeja, Lagos'),
(214,'Glow Beauty', 'Linda White', '08034567890', 'linda@glowbeauty.com', 'Surulere, Lagos'),
(215,'Sport Arena', 'James Wilson', '08035678901', 'james@sportarena.com', 'Abuja'),
(216,'Book Planet', 'Grace Adams', '08036789012', 'grace@bookplanet.com', 'Port Harcourt'),
(217,'Toy Kingdom', 'Peter James', '08037890123', 'peter@toykingdom.com', 'Enugu'),
(218,'Healthy Living', 'Mary Green', '08038901234', 'mary@healthyliving.com', 'Ibadan'),
(219,'Fresh Mart', 'David Scott', '08039012345', 'david@freshmart.com', 'Benin City'),
(220,'Office Plus', 'Jennifer Lee', '08030123456', 'jennifer@officeplus.com', 'Kano');


INSERT INTO Customers
(customer_id, first_name, last_name, gender, email, phone, address, city)
VALUES
(1101,'Chinedu','Okafor','Male','chinedu.okafor@email.com','08030000001','15 Admiralty Way','Lagos'),
(1102,'Ada','Eze','Female','ada.eze@email.com','08030000002','12 GRA','Port Harcourt'),
(1103,'Emeka','Nwosu','Male','emeka.nwosu@email.com','08030000003','45 Independence Layout','Enugu'),
(1104,'Ngozi','Umeh','Female','ngozi.umeh@email.com','08030000004','23 Wuse Zone 4','Abuja'),
(1105,'Tunde','Adebayo','Male','tunde.adebayo@email.com','08030000005','8 Bodija','Ibadan'),
(1106,'Aisha','Bello','Female','aisha.bello@email.com','08030000006','16 Sabon Gari','Kano'),
(1107,'Ifeanyi','Obi','Male','ifeanyi.obi@email.com','08030000007','11 Trans Amadi','Port Harcourt'),
(1108,'Blessing','James','Female','blessing.james@email.com','08030000008','21 Lekki','Lagos'),
(1109,'Samuel','Ojo','Male','samuel.ojo@email.com','08030000009','9 Yaba','Lagos'),
(1110,'Esther','Daniels','Female','esther.daniels@email.com','08030000010','34 Garki','Abuja'),
(1111,'Daniel','Okeke','Male','daniel.okeke@email.com','08030000011','6 New Haven','Enugu'),
(1112,'Mercy','Ibrahim','Female','mercy.ibrahim@email.com','08030000012','14 Tudun Wada','Kaduna'),
(1113,'Paul','Ekanem','Male','paul.ekanem@email.com','08030000013','18 Marian Road','Calabar'),
(1114,'Ruth','Ogbonna','Female','ruth.ogbonna@email.com','08030000014','27 Douglas Road','Owerri'),
(1115,'Victor','Adewale','Male','victor.adewale@email.com','08030000015','31 Akobo','Ibadan'),
(1116,'Faith','Okon','Female','faith.okon@email.com','08030000016','22 Ewet Housing','Uyo'),
(1117,'Henry','Usman','Male','henry.usman@email.com','08030000017','17 Barnawa','Kaduna'),
(1118,'Joy','Nnamdi','Female','joy.nnamdi@email.com','08030000018','10 Rumuola','Port Harcourt'),
(1119,'Kelvin','George','Male','kelvin.george@email.com','08030000019','5 GRA','Benin City'),
(1120,'Chioma','Onyeka','Female','chioma.onyeka@email.com','08030000020','40 Lekki Phase 2','Lagos');


INSERT INTO Employees_ (Employee_id, First_name, Last_name, Job_title, Hire_date, Salary, Email)
VALUES
(101281,'Michael', 'Johnson', 'Sales Manager', '2022-01-15', 450000.00, 'michael.johnson@ecommerce.com'),
(101282,'Sophia', 'Williams', 'Sales Representative', '2022-03-10', 280000.00, 'sophia.williams@ecommerce.com'),
(101283,'Daniel', 'Brown', 'Inventory Officer', '2021-11-05', 320000.00, 'daniel.brown@ecommerce.com'),
(101284,'Olivia', 'Jones', 'Customer Support', '2023-02-20', 250000.00, 'olivia.jones@ecommerce.com'),
(101285,'James', 'Garcia', 'Warehouse Manager', '2020-08-18', 400000.00, 'james.garcia@ecommerce.com'),
(101286,'Emma', 'Martinez', 'Accountant', '2021-06-12', 380000.00, 'emma.martinez@ecommerce.com'),
(101287,'Benjamin', 'Taylor', 'IT Administrator', '2022-09-01', 500000.00, 'benjamin.taylor@ecommerce.com'),
(101288,'Charlotte', 'Anderson', 'HR Officer', '2023-01-09', 300000.00, 'charlotte.anderson@ecommerce.com'),
(101289,'Henry', 'Thomas', 'Sales Representative', '2023-04-17', 270000.00, 'henry.thomas@ecommerce.com'),
(101290,'Amelia', 'Jackson', 'Operations Manager', '2020-05-25', 550000.00, 'amelia.jackson@ecommerce.com');


INSERT INTO Products
(Product_id, Product_name, Category_id, Supplier_id, Unit_price, Units_in_stock, Reorder_level)
VALUES
(1001,'Samsung Galaxy A55',101,1,420000,50,10),
(1002,'HP Laptop 15',101,1,680000,30,5),
(1003,'Wireless Mouse',101,1,12000,120,20),
(1004,'Men''s Sneakers',102,2,35000,80,15),
(1005,'Women''s Handbag',102,2,45000,60,10),
(1006,'Blender',103,3,38000,40,8),
(1007,'Electric Kettle',103,3,22000,70,15),
(1008,'Vitamin C Serum',104,4,15000,100,20),
(1009,'Body Lotion',104,4,8500,90,20),
(1010,'Football',105,5,18000,50,10),
(1011,'Yoga Mat',105,5,12000,65,15),
(1012,'SQL Fundamentals',106,6,9500,40,10),
(1013,'Children Story Book',106,6,5000,80,15),
(1014,'Remote Control Car',107,7,25000,35,5),
(1015,'Building Blocks Set',107,7,17000,45,8),
(1016,'Digital Thermometer',108,8,7000,110,20),
(1017,'Protein Powder',108,8,32000,30,5),
(1018,'Rice 5kg',109,9,18500,60,10),
(1019,'Coffee 500g',109,9,7500,90,20),
(1020,'Office Chair',110,10,68000,25,5);


INSERT INTO Inventory
(inventory_id, product_id, quantity_available, warehouse_location)
VALUES
(33211,1001,50,'Warehouse A'),
(33212,1002,30,'Warehouse A'),
(33213,1003,120,'Warehouse B'),
(33214,1004,80,'Warehouse A'),
(33215,1005,60,'Warehouse B'),
(33216,1006,40,'Warehouse C'),
(33217,1007,70,'Warehouse C'),
(33218,1008,100,'Warehouse B'),
(33219,1009,90,'Warehouse B'),
(33220,1010,50,'Warehouse A'),
(33221,1011,65,'Warehouse A'),
(33222,1012,40,'Warehouse C'),
(33223,1013,80,'Warehouse C'),
(33224,1014,35,'Warehouse B'),
(33225,1015,45,'Warehouse B'),
(33226,1016,110,'Warehouse A'),
(33227,1017,30,'Warehouse C'),
(33228,1018,60,'Warehouse A'),
(33229,1019,90,'Warehouse B'),
(33230,1020,25,'Warehouse C');


INSERT INTO Orders
(order_id, customer_id, employee_id, order_date, order_status)
SELECT
    1340 + order_id,
    1100 + (RANDOM() * 19 + 1)::INT,
    101280 + (RANDOM() * 9 + 1)::INT,
    DATE '2025-01-01' + (RANDOM() * 364)::INT,
    (ARRAY['Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled'])
        [FLOOR(RANDOM() * 5 + 1)::INT]
FROM generate_series(1, 100) AS order_id;


INSERT INTO Order_Details
(order_detail_id, order_id, product_id, quantity, unit_price, discount)
SELECT
    13410 + detail_id,
    o.order_id,
    p.product_id,
    1 + FLOOR(RANDOM() * 5)::INT,
    p.unit_price,
    ROUND((RANDOM() * 15)::NUMERIC, 2)
FROM generate_series(1, 200) AS detail_id
CROSS JOIN LATERAL (
    SELECT order_id
    FROM Orders
    ORDER BY RANDOM()
    LIMIT 1
) o
CROSS JOIN LATERAL (
    SELECT product_id, unit_price
    FROM Products
    ORDER BY RANDOM()
    LIMIT 1
) p;


TRUNCATE TABLE Payments;

INSERT INTO Payments
(payment_id, order_id, payment_date, payment_method, amount, payment_status)
SELECT
    730050 + ROW_NUMBER() OVER (ORDER BY o.order_id),
    o.order_id,
    o.order_date,

    (ARRAY[
        'Card',
        'Bank Transfer',
        'PayPal',
        'Cash on Delivery'
    ])[FLOOR(RANDOM() * 4 + 1)::INT],

    ROUND(
        COALESCE(
            (
                SELECT SUM(
                    od.quantity
                    * od.unit_price
                    * (1 - od.discount / 100)
                )
                FROM Order_Details od
                WHERE od.order_id = o.order_id
            ),
            0
        )::NUMERIC,
        2
    ),

    CASE
        WHEN o.order_status = 'Cancelled' THEN 'Refunded'
        WHEN RANDOM() < 0.85 THEN 'Paid'
        WHEN RANDOM() < 0.95 THEN 'Pending'
        ELSE 'Failed'
    END

FROM Orders o
ORDER BY o.order_id;


SELECT
    MIN(payment_id) AS first_payment,
    MAX(payment_id) AS last_payment,
    COUNT(*) AS total_payments
FROM Payments;


SELECT
    p.payment_id,
    p.order_id,
    p.payment_method,
    p.amount,
    p.payment_status
FROM Payments p
ORDER BY p.payment_id
LIMIT 20;


SELECT
    o.order_id,
    COUNT(od.order_detail_id) AS number_of_items
FROM Orders o
LEFT JOIN Order_Details od
    ON o.order_id = od.order_id
GROUP BY o.order_id
ORDER BY o.order_id;


SELECT
    MIN(order_id) AS first_order,
    MAX(order_id) AS last_order,
    COUNT(*) AS total_details
FROM Order_Details;


UPDATE Payments p
SET amount = totals.total_amount
FROM (
    SELECT
        order_id,
        ROUND(
            SUM(
                quantity * unit_price * (1 - discount / 100)
            )::NUMERIC,
            2
        ) AS total_amount
    FROM Order_Details
    GROUP BY order_id
) totals
WHERE p.order_id = totals.order_id;


SELECT
    payment_id,
    order_id,
    amount,
    payment_status
FROM Payments
ORDER BY payment_id
LIMIT 20;


TRUNCATE TABLE Order_Details;


INSERT INTO Order_Details
(order_detail_id, order_id, product_id, quantity, unit_price, discount)
SELECT
    13410 + g.detail_id,
    1341 + FLOOR(RANDOM() * 100)::INT,
    p.product_id,
    1 + FLOOR(RANDOM() * 5)::INT,
    p.unit_price,
    ROUND((RANDOM() * 15)::NUMERIC, 2)
FROM generate_series(1, 200) AS g(detail_id)
JOIN Products p
    ON p.product_id = 1001 + FLOOR(RANDOM() * 20)::INT;


UPDATE Payments p
SET amount = totals.total_amount
FROM (
    SELECT
        order_id,
        ROUND(
            SUM(
                quantity * unit_price * (1 - discount / 100)
            )::NUMERIC,
            2
        ) AS total_amount
    FROM Order_Details
    GROUP BY order_id
) totals
WHERE p.order_id = totals.order_id;


SELECT
    payment_id,
    order_id,
    amount,
    payment_status
FROM Payments
ORDER BY payment_id
LIMIT 20;


SELECT
    o.order_id
FROM Orders o
LEFT JOIN Order_Details od
    ON o.order_id = od.order_id
WHERE od.order_detail_id IS NULL
ORDER BY o.order_id;


INSERT INTO Order_Details
(order_detail_id, order_id, product_id, quantity, unit_price, discount)
SELECT
    13610 + ROW_NUMBER() OVER (ORDER BY o.order_id),
    o.order_id,
    p.product_id,
    1 + FLOOR(RANDOM() * 5)::INT,
    p.unit_price,
    ROUND((RANDOM() * 15)::NUMERIC, 2)
FROM Orders o
CROSS JOIN LATERAL (
    SELECT product_id, unit_price
    FROM Products
    ORDER BY RANDOM()
    LIMIT 1
) p
WHERE o.order_id IN (1341, 1350);


UPDATE Payments p
SET amount = totals.total_amount
FROM (
    SELECT
        order_id,
        ROUND(
            SUM(
                quantity * unit_price * (1 - discount / 100)
            )::NUMERIC,
            2
        ) AS total_amount
    FROM Order_Details
    WHERE order_id IN (1341, 1350)
    GROUP BY order_id
) totals
WHERE p.order_id = totals.order_id;


SELECT
    payment_id,
    order_id,
    amount,
    payment_status
FROM Payments
WHERE order_id IN (1341, 1350)
ORDER BY order_id;


SELECT COUNT(*) AS zero_payment_count
FROM Payments
WHERE amount = 0;


SELECT
    order_id,
    product_id,
    quantity,
    unit_price,
    discount
FROM Order_Details
ORDER BY order_id
LIMIT 20;


UPDATE Payments p
SET amount = x.total_amount
FROM (
    SELECT
        order_id,
        ROUND(
            SUM(
                quantity * unit_price
                * (1 - discount / 100.0)
            ),
            2
        ) AS total_amount
    FROM Order_Details
    GROUP BY order_id
) x
WHERE p.order_id = x.order_id;


SELECT
    payment_id,
    order_id,
    amount,
    payment_status
FROM Payments
ORDER BY payment_id
LIMIT 20;


SELECT
    payment_id,
    order_id,
    amount
FROM Payments
WHERE amount = 0;


SELECT
    order_id,
    COUNT(*) AS items,
    SUM(quantity) AS total_quantity,
    SUM(unit_price) AS total_price,
    SUM(quantity * unit_price * (1 - discount / 100.0)) AS calculated_amount
FROM Order_Details
GROUP BY order_id
ORDER BY order_id
LIMIT 20;


TRUNCATE TABLE Order_Details;


INSERT INTO Order_Details
(order_detail_id, order_id, product_id, quantity, unit_price, discount)

SELECT
    13410 + gs,
    1340 + gs,
    p.product_id,
    1 + FLOOR(RANDOM() * 5)::INT,
    p.unit_price,
    ROUND((RANDOM() * 15)::NUMERIC, 2)

FROM generate_series(1, 100) AS gs

JOIN Products p
    ON p.product_id = 1001 + ((gs * 7) % 20);



INSERT INTO Order_Details
(order_detail_id, order_id, product_id, quantity, unit_price, discount)

SELECT
    13510 + gs,
    1341 + FLOOR(RANDOM() * 100)::INT,
    p.product_id,
    1 + FLOOR(RANDOM() * 5)::INT,
    p.unit_price,
    ROUND((RANDOM() * 15)::NUMERIC, 2)

FROM generate_series(1, 100) AS gs

JOIN Products p
    ON p.product_id = 1001 + ((gs * 11) % 20);



SELECT
    MIN(order_detail_id) AS first_detail,
    MAX(order_detail_id) AS last_detail,
    COUNT(*) AS total_details
FROM Order_Details;


SELECT
    MIN(product_id) AS first_product,
    MAX(product_id) AS last_product,
    COUNT(DISTINCT product_id) AS different_products
FROM Order_Details;


SELECT
    o.order_id,
    COUNT(od.order_detail_id) AS number_of_products
FROM Orders o
LEFT JOIN Order_Details od
    ON o.order_id = od.order_id
GROUP BY o.order_id
ORDER BY o.order_id;


UPDATE Payments p
SET amount = totals.total_amount
FROM (
    SELECT
        order_id,
        ROUND(
            SUM(
                quantity * unit_price * (1 - discount / 100.0)
            ),
            2
        ) AS total_amount
    FROM Order_Details
    GROUP BY order_id
) totals
WHERE p.order_id = totals.order_id;


SELECT
    payment_id,
    order_id,
    payment_date,
    payment_method,
    amount,
    payment_status
FROM Payments
ORDER BY payment_id
LIMIT 20;


SELECT
    payment_id,
    order_id,
    amount
FROM Payments
WHERE amount = 0;


SELECT
    MIN(amount) AS lowest_payment,
    MAX(amount) AS highest_payment,
    SUM(amount) AS total_payment_value,
    COUNT(*) AS total_payments
FROM Payments;



-- Viewing Tables

SELECT * FROM Categories
SELECT * FROM Customers
SELECT * FROM Employees_
SELECT * FROM Inventory
SELECT * FROM Orders
SELECT * FROM Order_details
SELECT * FROM Payments
SELECT * FROM Products
SELECT * FROM Suppliers


SELECT 'Categories' AS table_name, COUNT(*) AS records FROM Categories
UNION ALL
SELECT 'Suppliers', COUNT(*) FROM Suppliers
UNION ALL
SELECT 'Customers', COUNT(*) FROM Customers
UNION ALL
SELECT 'Employees_', COUNT(*) FROM Employees_
UNION ALL
SELECT 'Products', COUNT(*) FROM Products
UNION ALL
SELECT 'Inventory', COUNT(*) FROM Inventory
UNION ALL
SELECT 'Orders', COUNT(*) FROM Orders
UNION ALL
SELECT 'Order_Details', COUNT(*) FROM Order_Details
UNION ALL
SELECT 'Payments', COUNT(*) FROM Payments;




		-- PHASE 1: DATA EXPLORATION (BASIC DATA ENQUIRIES) --


-- Total Customers

SELECT COUNT(*) AS total_customers
FROM Customers;

-- Total Employees

SELECT COUNT(*) AS total_employees
FROM Employees_;

-- Total Products

SELECT COUNT(*) AS total_products
FROM Products;

-- Total Orders

SELECT COUNT(*) AS total_orders
FROM Orders;

-- Total Order_details

SELECT COUNT(*) AS total_order_details
FROM Order_Details;

-- Total Payments

SELECT COUNT(*) AS total_payments
FROM Payments;




		-- PHASE 2: OVERALL BUSINESS PERFORMANCE --


-- Total Sales/Revenue
-- (Total value of successfully paid orders)

SELECT
    ROUND(SUM(amount), 2) AS total_revenue
FROM Payments
WHERE payment_status = 'Paid';


-- Average Order Value
-- (Tells approximately how much the business earns per paid order)

SELECT
    ROUND(AVG(amount), 2) AS average_order_value
FROM Payments
WHERE payment_status = 'Paid';


-- Highest Payment

SELECT
    MAX(amount) AS highest_payment
FROM Payments
WHERE payment_status = 'Paid';


-- Lowest Payment

SELECT
    MIN(amount) AS lowest_payment
FROM Payments
WHERE payment_status = 'Paid';




		-- PHASE 3: ORDER STATUS ANALYSIS --


-- Number of Orders by Status

SELECT
    order_status,
    COUNT(*) AS number_of_orders
FROM Orders
GROUP BY order_status
ORDER BY number_of_orders DESC;




		-- PHASE 4: PAYMENT METHOD ANALYSIS --


-- Which Payment Method Is Most Popular?
-- (Tells which payment method customers use most frequently)

SELECT
    payment_method,
    COUNT(*) AS number_of_payments
FROM Payments
GROUP BY payment_method
ORDER BY number_of_payments DESC;


-- Revenue by Payment Method
-- (This is more valuable than simply counting payments because a method could have fewer transactions but generate more revenue)

SELECT
    payment_method,
    ROUND(SUM(amount), 2) AS total_revenue
FROM Payments
WHERE payment_status = 'Paid'
GROUP BY payment_method
ORDER BY total_revenue DESC;


-- Payment Status Analysis
-- (Shows how much revenue is: Paid, Pending, Failed, Refunded)

SELECT
    payment_status,
    COUNT(*) AS number_of_payments,
    ROUND(SUM(amount), 2) AS total_amount
FROM Payments
GROUP BY payment_status
ORDER BY number_of_payments DESC;




/* 
			PHASE 5: PRODUCT PERFORMANCE
		(ConnectING Products → Order_Details)
													*/


-- Best-Selling Products by Quantity
-- (Answers: Which products are selling the most units?)

SELECT
    p.product_id,
    p.product_name,
    SUM(od.quantity) AS total_quantity_sold
FROM Products p
JOIN Order_Details od
    ON p.product_id = od.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY total_quantity_sold DESC;


-- Product Revenue
--(Tells which products actually generate the most money after discounts)

SELECT
    p.product_id,
    p.product_name,
    ROUND(
        SUM(
            od.quantity * od.unit_price
            * (1 - od.discount / 100.0)
        ),
        2
    ) AS total_revenue
FROM Products p
JOIN Order_Details od
    ON p.product_id = od.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY total_revenue DESC;




/* 

						PHASE 6: CATEGORY ANALYSIS
		-- Connecting: Categories → Products → Order_Details --

																		*/


-- Revenue by Category
-- (Tells which product categories contribute the most revenue)

SELECT
    c.category_name,
    ROUND(
        SUM(
            od.quantity * od.unit_price
            * (1 - od.discount / 100.0)
        ),
        2
    ) AS category_revenue
FROM Categories c
JOIN Products p
    ON c.category_id = p.category_id
JOIN Order_Details od
    ON p.product_id = od.product_id
GROUP BY c.category_name
ORDER BY category_revenue DESC;


-- Quantity Sold by Category
-- (Compares sales volume with revenue)

SELECT
    c.category_name,
    SUM(od.quantity) AS units_sold
FROM Categories c
JOIN Products p
    ON c.category_id = p.category_id
JOIN Order_Details od
    ON p.product_id = od.product_id
GROUP BY c.category_name
ORDER BY units_sold DESC;




		-- PHASE 7: CUSTOMER ANALYSIS --



-- Top 10 Customers by Spending (Top 10 Customers)

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    ROUND(SUM(p.amount), 2) AS total_spent
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
JOIN Payments p
    ON o.order_id = p.order_id
WHERE p.payment_status = 'Paid'
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_spent DESC
LIMIT 10;


-- Number of Orders per Customer
-- (LEFT JOIN allows to see customers even if they have no orders)

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_orders DESC;




		-- PHASE 8: EMPLOYEE ANALYSIS --


-- Orders Handled by Each Employee
-- (Identifies employees handling the highest number of orders)

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    COUNT(o.order_id) AS orders_handled
FROM Employees_ e
LEFT JOIN Orders o
    ON e.employee_id = o.employee_id
GROUP BY
    e.employee_id,
    e.first_name,
    e.last_name
ORDER BY orders_handled DESC;




		-- PHASE 9: TIME BASED SALES ANALYSIS --


-- Monthly Revenue
-- (Shows revenue changes throughout 2025)
-- (Compares order activity with revenue)

SELECT
    DATE_TRUNC('month', o.order_date) AS month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(
        SUM(
            CASE
                WHEN p.payment_status = 'Paid'
                THEN p.amount
                ELSE 0
            END
        ), 2
    ) AS total_revenue
FROM Orders o
JOIN Payments p
    ON o.order_id = p.order_id
GROUP BY DATE_TRUNC('month', o.order_date)
ORDER BY month;




		-- PHASE 10: CUSTOMER BEHAVIOR ANALYSIS --
		

-- Customers with More Than 3 Orders
-- Identifies the more frequent customers

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(o.order_id) > 3
ORDER BY total_orders DESC;


-- Average Spending per Customer

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    ROUND(AVG(p.amount), 2) AS average_spending
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
JOIN Payments p
    ON o.order_id = p.order_id
WHERE p.payment_status = 'Paid'
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY average_spending DESC;




		-- PHASE 11: INVENTORY ANALYSIS --


-- Products with the Lowest Stock Buffer
-- (Identifies the 5 products with the smallest stock buffer)

SELECT
    p.product_id,
    p.product_name,
    i.quantity_available,
    p.reorder_level,
    (i.quantity_available - p.reorder_level) AS stock_buffer
FROM Products p
JOIN Inventory i
    ON p.product_id = i.product_id
ORDER BY stock_buffer ASC
LIMIT 5;




		-- PHASE 12: INVENTORY ANALYSIS --


-- CASE: Classify Products by Sales Performance (Based on the total quantity sold)
-- By using CASE, a new category based on sales performance is created.
/*
	The logic is:

		- 20+ units → High Performer
		- 10–19 units → Medium Performer
		- Below 10 → Low Performer
											*/

-- So, instead of - "Product 1005 sold 24 units",
-- It shows/- "Product 1005 is a High Performer". 
-- (Whch is much easierto interprete).

SELECT
    p.product_id,
    p.product_name,
    SUM(od.quantity) AS total_quantity_sold,
    CASE
        WHEN SUM(od.quantity) > 30 THEN 'High Performer'
        WHEN SUM(od.quantity) > 20 THEN 'Medium Performer'
        ELSE 'Low Performer'
    END AS sales_performance
FROM Products p
JOIN Order_Details od
    ON p.product_id = od.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY total_quantity_sold DESC;


-- 1st Subquery: Products Selling Above Average
-- (Using a subquery to compare individual performance against the overall average product sales)
/*
	The question is:

		Which products have sold more units than the average quantity sold across all product?
																								*/

/*	The inner query calculates the total quantity sold for each individual product
	
	The next level calculates the average of those product
    totals using:

        AVG(total_quantity)

    This gives us the average quantity sold per product.
															
	The main query compares each product's total quantity sold against the calculated average quantity.

	Only products whose total sales are greater than the
    overall average are returned.

	The query also displays the average quantity sold alongside
    each qualifying product, making it easier to compare
    individual product performance against the benchmark.
																										*/
SELECT
    p.product_id,
    p.product_name,
    SUM(od.quantity) AS total_quantity_sold,
    ROUND(avg_sales.average_quantity, 2) AS average_quantity_sold
FROM Products p
JOIN Order_Details od
    ON p.product_id = od.product_id
CROSS JOIN (
    SELECT
        AVG(total_quantity) AS average_quantity
    FROM (
        SELECT
            product_id,
            SUM(quantity) AS total_quantity
        FROM Order_Details
        GROUP BY product_id
    ) AS product_totals
) AS avg_sales
GROUP BY
    p.product_id,
    p.product_name,
    avg_sales.average_quantity
HAVING SUM(od.quantity) > avg_sales.average_quantity
ORDER BY total_quantity_sold DESC;


-- Window Function 1: Rank Products by Revenue
/*
	Ranking products without collapsing the rows.
	(That's one of the key differences between a normal GROUP BY and a window function)
																							*/

SELECT
    product_id,
    product_name,
    total_revenue,
    RANK() OVER (
        ORDER BY total_revenue DESC
    ) AS revenue_rank
FROM (
    SELECT
        p.product_id,
        p.product_name,
        ROUND(
            SUM(
                od.quantity * od.unit_price
                * (1 - od.discount / 100.0)
            ),
            2
        ) AS total_revenue
    FROM Products p
    JOIN Order_Details od
        ON p.product_id = od.product_id
    GROUP BY
        p.product_id,
        p.product_name
) AS product_revenue
ORDER BY revenue_rank;


-- Window Function 2: Rank Employees by Orders
/*
	This identifies:

		Which employees handle the highest number of orders?

	Using the RANK(), places employees with the same number of orders receive, within the same rank.
																										*/

SELECT
    employee_id,
    first_name,
    last_name,
    orders_handled,
    RANK() OVER (
        ORDER BY orders_handled DESC
    ) AS employee_rank
FROM (
    SELECT
        e.employee_id,
        e.first_name,
        e.last_name,
        COUNT(o.order_id) AS orders_handled
    FROM Employees_ e
    LEFT JOIN Orders o
        ON e.employee_id = o.employee_id
    GROUP BY
        e.employee_id,
        e.first_name,
        e.last_name
) AS employee_orders
ORDER BY employee_rank;


-- Creating a Sales Performance View (Something reusable)
-- This view gives a reusable representation of the data.
-- It comes in handy, instead of repeatedly writing the three-table JOIN.

CREATE OR REPLACE VIEW sales_performance AS
SELECT
    o.order_id,
    o.order_date,
    o.order_status,
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    p.payment_method,
    p.payment_status,
    ROUND(p.amount, 2) AS order_value
FROM Orders o
JOIN Customers c
    ON o.customer_id = c.customer_id
JOIN Payments p
    ON o.order_id = p.order_id;


-- To review

SELECT *
FROM sales_performance;


-- Final Business Performance Query
-- (Combining several tables and metrics into one final business-level analysis which gives a high-level snapshot of the business)

SELECT
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT o.customer_id) AS active_customers,
    COUNT(DISTINCT od.product_id) AS products_sold,
    ROUND(SUM(od.quantity * od.unit_price), 2) AS gross_sales,
    ROUND(
        SUM(
            od.quantity * od.unit_price
            * (1 - od.discount / 100.0)
        ),
        2
    ) AS net_sales,
    ROUND(AVG(p.amount), 2) AS average_order_value
FROM Orders o
JOIN Order_Details od
    ON o.order_id = od.order_id
JOIN Payments p
    ON o.order_id = p.order_id
WHERE p.payment_status = 'Paid';