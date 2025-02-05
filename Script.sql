-- Create the 'Restaurant' table
CREATE TABLE Restaurant (
    Restaurant_ID VARCHAR(30) PRIMARY KEY,
    Name CHAR(70),
    Location VARCHAR(70),
    Email VARCHAR(50)
);

-- Create the 'Customer' table
CREATE TABLE Customer (
    Customer_ID VARCHAR(30) PRIMARY KEY,
    First_Name CHAR(70),
    Last_Name CHAR(70),
    Email VARCHAR(50),
    Phone_Number INT
);


ALTER TABLE Customer 
ADD CONSTRAINT unique_email UNIQUE (Email);

ALTER TABLE Customer
ADD CONSTRAINT check_phone_number
CHECK (Phone_Number >= 1000000000 AND Phone_Number <= 9999999999);


-- Create the 'Order' table
CREATE TABLE Orders (
    Order_ID VARCHAR(30) PRIMARY KEY,
    Order_Date DATE,
    Total_amount INT,
    Restaurant_ID VARCHAR(30),
    Customer_ID VARCHAR(30),
    FOREIGN KEY (Restaurant_ID) REFERENCES Restaurant(Restaurant_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

-- Create the 'Menu' table
CREATE TABLE Menu (
    Menu_ID VARCHAR(30) PRIMARY KEY,
    Item_Name CHAR(50),
    Price FLOAT,
    Menu_Category VARCHAR(80)
);

-- Create the 'OrderDetails' table
CREATE TABLE OrderDetails (
    Orderdetail_ID VARCHAR(30) PRIMARY KEY,
    First_Name CHAR(70),
    Last_Name CHAR(70),
    Email CHAR(50),
    Phone_Number INT,
    Order_ID VARCHAR(30),
    Menu_ID VARCHAR(30),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Menu_ID) REFERENCES Menu(Menu_ID)
);

-- Create the 'Inventory' table
CREATE TABLE Inventory (
    Inventory_ID VARCHAR(30) PRIMARY KEY,
    Item VARCHAR(50),
    Quantity INT,
    Price FLOAT,
    Restaurant_ID VARCHAR(30),
    FOREIGN KEY (Restaurant_ID) REFERENCES Restaurant(Restaurant_ID)
);

-- Create the 'Supplier' table
CREATE TABLE Supplier (
    Supplier_ID VARCHAR(30) PRIMARY KEY,
    Supplier_Name CHAR(70),
    Address CHAR(100),
    Phone_Number VARCHAR(10)
);

-- Create the 'RestaurantSupplier' table (Associative Entity)
CREATE TABLE RestaurantSupplier (
    Supply_Agreement_ID VARCHAR(30) PRIMARY KEY,
    Supplier_ID VARCHAR(30),
    Restaurant_ID VARCHAR(30),
    Delivery_Frequency VARCHAR(20),
    FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID),
    FOREIGN KEY (Restaurant_ID) REFERENCES Restaurant(Restaurant_ID)
);

-- Create the 'Employee' table
CREATE TABLE Employee (
    Employee_ID VARCHAR(30) PRIMARY KEY,
    First_Name CHAR(70),
    Last_Name CHAR(70),
    Job_Title CHAR(100),
    Restaurant_ID VARCHAR(30),
    Position_ID CHAR(70),
    Employee_Type VARCHAR(100),
    FOREIGN KEY (Restaurant_ID) REFERENCES Restaurant(Restaurant_ID)
);

-- Create the 'FullTime' table
CREATE TABLE FullTime (
    FullTime_ID VARCHAR(30) PRIMARY KEY,
    Employee_ID VARCHAR(30),
    Benefits VARCHAR(30),
    SalaryAmount INT,
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

-- Create the 'PartTime' table
CREATE TABLE PartTime (
    PartTime_ID VARCHAR(30) PRIMARY KEY,
    HourlyWage VARCHAR(30),
    ScheduledHours INT,
    Employee_ID VARCHAR(30),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

-- Create the 'Reservation' table
CREATE TABLE Reservation (
    Reservation_ID VARCHAR(30) PRIMARY KEY,
    Status CHAR(50),
    Occupancy INT,
    Customer_ID VARCHAR(30),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

-- Create the 'Payment' table
CREATE TABLE Payment (
    Payment_ID VARCHAR(30) PRIMARY KEY,
    Payment_Method CHAR(70),
    Payment_Date DATE,
    Amount FLOAT,
    Status CHAR(70),
    Customer_ID VARCHAR(30),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

-- Create the 'Positions' table
CREATE TABLE Positions (
    Position_ID CHAR(70) PRIMARY KEY,
    Head_Chef VARCHAR(30),
    Kitchen_Assistant VARCHAR(30),
    Waiter VARCHAR(30)
);

-- Populate the data into the tables
INSERT INTO Restaurant (Restaurant_ID, Name, Location, Email)
VALUES 
('R001','Spice Venue', 'Main St', 'info@spicevenue.com'),
('R002','Dhabawala', 'Main St', 'info@dhabawala.com'),
('R003','Feng', 'Main St', 'info@feng.com'),
('R004','Sunberry', 'Pratt St', 'info@sunberry.com'),
('R005','Sorella', 'Pratt St', 'info@sorella.com'),
('R006','The Lady', 'Ucello St', 'info@thelady.com'),
('R007','Godavari', 'Asylum St', 'info@godavari.com'),
('R008','Bastian', 'Morris St', 'info@bastian.com'),
('R009','Razzberry', 'Highway St', 'info@razzberry.com'),
('R010','Playa Bowl', 'University St', 'info@playabowl.com'),
('R011','Ocho', 'Buckland St', 'info@ocho.com'),
('R012','Sea View', 'Ocean St', 'info@seaview.com'),
('R013','Asilo', 'Market St', 'info@asilo.com'),
('R014','Sage', 'Ucello St', 'info@sage.com'),
('R015','Cranberry', 'Valentine St', 'info@cranberry.com'),
('R016','Pearl', 'Pearl St', 'info@pearl.com'),
('R017','Issy', 'Good St', 'info@issy.com'),
('R018', 'Central Diner', 'Center Blvd', 'info@centraldiner.com'),
('R019', 'Mountain Grill', 'Hill Rd', 'contact@mountaingrill.com'),
('R020', 'City Lights', 'Downtown Square', 'info@citylights.com'),
('R021', 'Green Pastures', 'Park Lane', 'contact@greenpastures.com'),
('R022', 'Urban Eatery', 'City Center', 'contact@urbaneatery.com'),
('R023', 'Rustic Table', 'Country Rd', 'info@rustictable.com'),
('R024', 'The Garden Plate', 'Greenway Ave', 'contact@gardenplate.com'),
('R025', 'Lakeside Lounge', 'Lakeside Dr', 'info@lakesidelounge.com'),
('R026', 'Vista Point', 'Highview', 'contact@vistapoint.com'),
('R027', 'Vista Dome Point', 'Vista St', 'contact@vistadome.com'),
('R028', 'Flamboynte', 'Marine St', 'contact@flambounte.com'),
('R029', 'Bayview', 'Marine St', 'contact@bayview.com'),
('R030', 'The Dome', 'Marine Drive', 'contact@thedome.com');

INSERT INTO Menu (Menu_ID, Item_Name, Price, Menu_Category)
VALUES
('M001', 'Burger', 12.99, 'Main Course'),
('M002', 'Pasta', 15.49, 'Main Course'),
('M003', 'Salad', 8.99, 'Appetizer'),
('M004', 'Pizza', 14.99, 'Main Course'),
('M005', 'Steak', 20.99, 'Main Course'),
('M006', 'Tacos', 10.99, 'Main Course'),
('M007', 'Soup', 6.99, 'Appetizer'),
('M008', 'Sandwich', 9.99, 'Main Course'),
('M009', 'Sushi', 18.99, 'Appetizer'),
('M010', 'Curry', 13.49, 'Main Course'),
('M011', 'Fries', 4.99, 'Side'),
('M012', 'Nachos', 7.49, 'Appetizer'),
('M013', 'Wrap', 8.49, 'Main Course'),
('M014', 'Grilled Cheese', 5.99, 'Appetizer'),
('M015', 'Ramen', 11.99, 'Main Course'),
('M016', 'Chicken Wings', 9.49, 'Appetizer'),
('M017', 'BBQ Ribs', 17.99, 'Main Course'),
('M018', 'Veggie Bowl', 10.49, 'Main Course'),
('M019', 'Quesadilla', 8.99, 'Appetizer'),
('M020', 'Falafel', 9.99, 'Appetizer'),
('M021', 'Hot Dog', 6.49, 'Appetizer'),
('M022', 'Fish and Chips', 12.49, 'Main Course'),
('M023', 'Burrito', 11.99, 'Main Course'),
('M024', 'Pad Thai', 14.49, 'Main Course'),
('M025', 'Pho', 13.99, 'Main Course'),
('M026', 'Cobb Salad', 10.49, 'Salad'),
('M027', 'Omelette', 7.99, 'Breakfast'),
('M028', 'Pancakes', 6.99, 'Breakfast'),
('M029', 'French Toast', 7.49, 'Breakfast'),
('M030', 'Ice Cream', 5.99, 'Dessert');

INSERT INTO Customer (Customer_ID, First_Name, Last_Name, Email, Phone_Number)
VALUES 
('C001', 'John', 'Doe', 'john.doe@example.com', 1234567890),
('C002', 'Jane', 'Smith', 'jane.smith@example.com', 2345678901),
('C003', 'Alice', 'Johnson', 'alice.johnson@example.com', 3456789012),
('C004', 'Bob', 'Brown', 'bob.brown@example.com', 4567890123),
('C005', 'Charlie', 'Davis', 'charlie.davis@example.com', 5678901234),
('C006', 'Diana', 'Miller', 'diana.miller@example.com', 6789012345),
('C007', 'Evan', 'Wilson', 'evan.wilson@example.com', 7890123456),
('C008', 'Fiona', 'Moore', 'fiona.moore@example.com', 8901234567),
('C009', 'George', 'Taylor', 'george.taylor@example.com', 9012345678),
('C010', 'Hannah', 'Anderson', 'hannah.anderson@example.com', 1230987654),
('C011', 'Ian', 'Thomas', 'ian.thomas@example.com', 2345678091),
('C012', 'Jenny', 'Jackson', 'jenny.jackson@example.com', 3456780192),
('C013', 'Kyle', 'White', 'kyle.white@example.com', 4567891230),
('C014', 'Laura', 'Harris', 'laura.harris@example.com', 5678902341),
('C015', 'Mark', 'Martin', 'mark.martin@example.com', 6789013452),
('C016', 'Nina', 'Garcia', 'nina.garcia@example.com', 7890124563),
('C017', 'Oscar', 'Martinez', 'oscar.martinez@example.com', 8901235674),
('C018', 'Paula', 'Robinson', 'paula.robinson@example.com', 9012346785),
('C019', 'Quinn', 'Lewis', 'quinn.lewis@example.com', 1234567891),
('C020', 'Rachel', 'Clark', 'rachel.clark@example.com', 2345678902),
('C021', 'Sam', 'Walker', 'sam.walker@example.com', 3456789013),
('C022', 'Tina', 'Hall', 'tina.hall@example.com', 4567890124),
('C023', 'Uma', 'Young', 'uma.young@example.com', 5678901235),
('C024', 'Vince', 'Allen', 'vince.allen@example.com', 6789012346),
('C025', 'Wendy', 'King', 'wendy.king@example.com', 7890123457),
('C026', 'Xander', 'Scott', 'xander.scott@example.com', 8901234568),
('C027', 'Yara', 'Green', 'yara.green@example.com', 9012345679),
('C028', 'Zane', 'Adams', 'zane.adams@example.com', 1234567089),
('C029', 'Olivia', 'Parker', 'olivia.parker@example.com', 2345678190),
('C030', 'Lucas', 'Reed', 'lucas.reed@example.com', 3456789201);

INSERT INTO Supplier (Supplier_ID, Supplier_Name, Address, Phone_Number)
VALUES 
('S001', 'Fresh Farms', '789 Rural Rd', 9130547001),
('S002', 'City Produce', '321 City St', 9130547002),
('S003', 'Green Grocers', '123 Greenway', 9130547003),
('S004', 'Farm Direct', '654 Farm Rd', 9130547004),
('S005', 'Organic Roots', '98 Market St', 9130547005),
('S006', 'Harbor Seafood', '22 Harbor Lane', 9130547006),
('S007', 'Baker Supplies', '321 Baker St', 9130547007),
('S008', 'Dairy Fresh', '777 Dairy Rd', 9130547008),
('S009', 'Sunrise Orchards', '456 Orchard Ln', 9130547009),
('S010', 'Crisp Veg', '111 Fresh Ave', 9130547010),
('S011', 'Gourmet Butchers', '88 Meat St', 9130547011),
('S012', 'Healthy Grains', '76 Granary Rd', 9130547012),
('S013', 'Spice Traders', '90 Spice Blvd', 9130547013),
('S014', 'Sweet Treats', '32 Dessert Ln', 9130547014),
('S015', 'Nuts & More', '45 Nut Grove', 9130547015),
('S016', 'Wild Catch', '12 Dockside', 9130547016),
('S017', 'Fine Teas', '77 Leaf Way', 9130547170),
('S018', 'Beverage House', '111 Drink St', 9130547018),
('S019', 'Pure Produce', '500 Pure Dr', 91305470120),
('S020', 'Exotic Fruits', '66 Tropical Rd', 9130547021),
('S021', 'Cheese Makers', '74 Cheese St', 9130547022),
('S022', 'Fresh Fish Co.', '17 Fishmarket Ln', 9130547023),
('S023', 'Chocolatier', '89 Cocoa Ave', 9130547024),
('S024', 'Herb Haven', '35 Herb Blvd', 9130547025),
('S025', 'Nutri Greens', '200 Healthy St', 9130547026),
('S026', 'Harvest Supplies', '15 Farmview', 9130547027),
('S027', 'Gourmet Delights', '400 Luxury Ln', 9130547028),
('S028', 'The Spice Jar', '88 Spice Alley', 9130547029),
('S029', 'Baker’s Best', '94 Pastry Way', 9130547030),
('S030', 'Juice Junction', '110 Fruit Rd', 9130547033);

INSERT INTO Positions (Position_ID, Head_Chef, Kitchen_Assistant, Waiter)
VALUES 
('P001', 'Yes', 'No', 'Yes'),
('P002', 'No', 'Yes', 'Yes'),
('P003', 'Yes', 'No', 'No'),
('P004', 'No', 'Yes', 'No'),
('P005', 'Yes', 'Yes', 'Yes'),
('P006', 'No', 'No', 'Yes'),
('P007', 'Yes', 'Yes', 'No'),
('P008', 'No', 'Yes', 'Yes'),
('P009', 'Yes', 'No', 'Yes'),
('P010', 'No', 'Yes', 'No'),
('P011', 'Yes', 'Yes', 'Yes'),
('P012', 'No', 'No', 'Yes'),
('P013', 'Yes', 'Yes', 'No'),
('P014', 'Yes', 'No', 'No'),
('P015', 'No', 'Yes', 'Yes'),
('P016', 'Yes', 'No', 'Yes'),
('P017', 'No', 'Yes', 'No'),
('P018', 'Yes', 'Yes', 'Yes'),
('P019', 'No', 'No', 'Yes'),
('P020', 'Yes', 'No', 'No'),
('P021', 'No', 'Yes', 'Yes'),
('P022', 'Yes', 'Yes', 'Yes'),
('P023', 'No', 'No', 'Yes'),
('P024', 'Yes', 'Yes', 'No'),
('P025', 'No', 'Yes', 'No'),
('P026', 'Yes', 'No', 'Yes'),
('P027', 'No', 'Yes', 'Yes'),
('P028', 'Yes', 'No', 'No'),
('P029', 'Yes', 'Yes', 'Yes'),
('P030', 'No', 'No', 'Yes');

INSERT INTO Payment (Payment_ID, Payment_method, Payment_date, Amount, Status, Customer_ID)
VALUES 
('P001', 'Credit Card', '2024-10-01', 30.50, 'Completed', 'C001'),
('P002', 'Cash', '2024-10-02', 45.00, 'Pending', 'C002'),
('P003', 'Debit Card', '2024-10-03', 22.75, 'Completed', 'C003'),
('P004', 'Credit Card', '2024-10-04', 58.40, 'Completed', 'C004'),
('P005', 'Cash', '2024-10-05', 19.99, 'Pending', 'C005'),
('P006', 'Credit Card', '2024-10-06', 65.00, 'Completed', 'C006'),
('P007', 'Debit Card', '2024-10-07', 42.10, 'Completed', 'C007'),
('P008', 'Credit Card', '2024-10-08', 37.80, 'Pending', 'C008'),
('P009', 'Cash', '2024-10-09', 15.00, 'Completed', 'C009'),
('P010', 'Debit Card', '2024-10-10', 50.60, 'Completed', 'C010'),
('P011', 'Credit Card', '2024-10-11', 27.40, 'Pending', 'C011'),
('P012', 'Cash', '2024-10-12', 100.00, 'Completed', 'C012'),
('P013', 'Debit Card', '2024-10-13', 90.30, 'Completed', 'C013'),
('P014', 'Credit Card', '2024-10-14', 120.25, 'Pending', 'C014'),
('P015', 'Cash', '2024-10-15', 35.70, 'Completed', 'C015'),
('P016', 'Credit Card', '2024-10-16', 47.20, 'Completed', 'C016'),
('P017', 'Debit Card', '2024-10-17', 55.80, 'Pending', 'C017'),
('P018', 'Credit Card', '2024-10-18', 29.50, 'Completed', 'C018'),
('P019', 'Cash', '2024-10-19', 40.99, 'Completed', 'C019'),
('P020', 'Debit Card', '2024-10-20', 70.75, 'Pending', 'C020'),
('P021', 'Credit Card', '2024-10-21', 33.30, 'Completed', 'C021'),
('P022', 'Cash', '2024-10-22', 80.20, 'Pending', 'C022'),
('P023', 'Debit Card', '2024-10-23', 25.45, 'Completed', 'C023'),
('P024', 'Credit Card', '2024-10-24', 95.00, 'Completed', 'C024'),
('P025', 'Cash', '2024-10-25', 60.10, 'Pending', 'C025'),
('P026', 'Debit Card', '2024-10-26', 45.30, 'Completed', 'C026'),
('P027', 'Credit Card', '2024-10-27', 39.90, 'Completed', 'C027'),
('P028', 'Cash', '2024-10-28', 110.50, 'Pending', 'C028'),
('P029', 'Debit Card', '2024-10-29', 25.60, 'Completed', 'C029'),
('P030', 'Credit Card', '2024-10-30', 75.25, 'Pending', 'C030');

INSERT INTO Reservation (Reservation_ID, Status, Occupancy, Customer_ID)
VALUES
('Res001', 'Confirmed', 4, 'C001'),
('Res002', 'Pending', 2, 'C002'),
('Res003', 'Cancelled', 6, 'C003'),
('Res004', 'Confirmed', 3, 'C004'),
('Res005', 'Pending', 5, 'C005'),
('Res006', 'Confirmed', 2, 'C006'),
('Res007', 'Cancelled', 4, 'C007'),
('Res008', 'Confirmed', 8, 'C008'),
('Res009', 'Pending', 1, 'C009'),
('Res010', 'Confirmed', 7, 'C010'),
('Res011', 'Cancelled', 3, 'C011'),
('Res012', 'Confirmed', 5, 'C012'),
('Res013', 'Pending', 6, 'C013'),
('Res014', 'Confirmed', 2, 'C014'),
('Res015', 'Cancelled', 4, 'C015'),
('Res016', 'Pending', 3, 'C016'),
('Res017', 'Confirmed', 6, 'C017'),
('Res018', 'Cancelled', 2, 'C018'),
('Res019', 'Confirmed', 4, 'C019'),
('Res020', 'Pending', 7, 'C020'),
('Res021', 'Confirmed', 5, 'C021'),
('Res022', 'Cancelled', 1, 'C022'),
('Res023', 'Pending', 8, 'C023'),
('Res024', 'Confirmed', 6, 'C024'),
('Res025', 'Cancelled', 3, 'C025'),
('Res026', 'Pending', 2, 'C026'),
('Res027', 'Confirmed', 5, 'C027'),
('Res028', 'Cancelled', 4, 'C028'),
('Res029', 'Pending', 7, 'C029'),
('Res030', 'Confirmed', 3, 'C030');

INSERT INTO Orders (Order_ID, Order_Date, Total_amount, Restaurant_ID, Customer_ID)
VALUES
('O001', '2024-10-01', 30.50, 'R001', 'C001'),
('O002', '2024-10-03', 45.00, 'R002', 'C002'),
('O003', '2024-10-03', 22.75, 'R003', 'C003'),
('O004', '2024-10-03', 58.40, 'R004', 'C004'),
('O005', '2024-10-01', 19.99, 'R005', 'C005'),
('O006', '2024-10-01', 65.00, 'R006', 'C006'),
('O007', '2024-10-01', 42.10, 'R007', 'C007'),
('O008', '2024-10-01', 37.80, 'R008', 'C008'),
('O009', '2024-10-01', 15.00, 'R009', 'C009'),
('O010', '2024-10-04', 50.60, 'R010', 'C010'),
('O011', '2024-10-04', 27.40, 'R011', 'C011'),
('O012', '2024-10-04', 100.00, 'R012', 'C012'),
('O013', '2024-10-04', 90.30, 'R013', 'C013'),
('O014', '2024-10-02', 120.25, 'R014', 'C014'),
('O015', '2024-10-02', 35.70, 'R015', 'C015'),
('O016', '2024-10-02', 47.20, 'R016', 'C016'),
('O017', '2024-10-02', 55.80, 'R017', 'C017'),
('O018', '2024-10-05', 29.50, 'R018', 'C018'),
('O019', '2024-10-05', 40.99, 'R019', 'C019'),
('O020', '2024-10-05', 70.75, 'R020', 'C020'),
('O021', '2024-10-05', 33.30, 'R021', 'C021'),
('O022', '2024-10-05', 80.20, 'R022', 'C022'),
('O023', '2024-10-06', 25.45, 'R023', 'C023'),
('O024', '2024-10-06', 95.00, 'R024', 'C024'),
('O025', '2024-10-06', 60.10, 'R025', 'C025'),
('O026', '2024-10-07', 45.30, 'R026', 'C026'),
('O027', '2024-10-07', 39.90, 'R027', 'C027'),
('O028', '2024-10-07', 110.50, 'R028', 'C028'),
('O029', '2024-10-07', 25.60, 'R029', 'C029'),
('O030', '2024-10-07', 75.25, 'R030', 'C030');

INSERT INTO OrderDetails (Orderdetail_ID, First_Name, Last_Name, Email, Phone_Number, Order_ID, Menu_ID)
VALUES
('OD001', 'John', 'Doe', 'john.doe@example.com', 1234567890, 'O001', 'M001'),
('OD002', 'Jane', 'Smith', 'jane.smith@example.com', 2345678901, 'O002', 'M002'),
('OD003', 'Alice', 'Johnson', 'alice.johnson@example.com', 3456789012, 'O003', 'M003'),
('OD004', 'Bob', 'Brown', 'bob.brown@example.com', 4567890123, 'O004', 'M004'),
('OD005', 'Charlie', 'Davis', 'charlie.davis@example.com', 5678901234, 'O005', 'M005'),
('OD006', 'Diana', 'Miller', 'diana.miller@example.com', 6789012345, 'O006', 'M006'),
('OD007', 'Evan', 'Wilson', 'evan.wilson@example.com', 7890123456, 'O007', 'M007'),
('OD008', 'Fiona', 'Moore', 'fiona.moore@example.com', 8901234567, 'O008', 'M008'),
('OD009', 'George', 'Taylor', 'george.taylor@example.com', 9012345678, 'O009', 'M009'),
('OD010', 'Hannah', 'Anderson', 'hannah.anderson@example.com', 1230987654, 'O010', 'M010'),
('OD011', 'Ian', 'Thomas', 'ian.thomas@example.com', 2345678091, 'O011', 'M011'),
('OD012', 'Jenny', 'Jackson', 'jenny.jackson@example.com', 3456780192, 'O012', 'M012'),
('OD013', 'Kyle', 'White', 'kyle.white@example.com', 4567891230, 'O013', 'M013'),
('OD014', 'Laura', 'Harris', 'laura.harris@example.com', 5678902341, 'O014', 'M014'),
('OD015', 'Mark', 'Martin', 'mark.martin@example.com', 6789013452, 'O015', 'M015'),
('OD016', 'Nina', 'Garcia', 'nina.garcia@example.com', 7890124563, 'O016', 'M016'),
('OD017', 'Oscar', 'Martinez', 'oscar.martinez@example.com', 8901235674, 'O017', 'M017'),
('OD018', 'Paula', 'Robinson', 'paula.robinson@example.com', 9012346785, 'O018', 'M018'),
('OD019', 'Quinn', 'Lewis', 'quinn.lewis@example.com', 1234567891, 'O019', 'M019'),
('OD020', 'Rachel', 'Clark', 'rachel.clark@example.com', 2345678902, 'O020', 'M020'),
('OD021', 'Sam', 'Walker', 'sam.walker@example.com', 3456789013, 'O021', 'M021'),
('OD022', 'Tina', 'Hall', 'tina.hall@example.com', 4567890124, 'O022', 'M022'),
('OD023', 'Uma', 'Young', 'uma.young@example.com', 5678901235, 'O023', 'M023'),
('OD024', 'Vince', 'Allen', 'vince.allen@example.com', 6789012346, 'O024', 'M024'),
('OD025', 'Wendy', 'King', 'wendy.king@example.com', 7890123457, 'O025', 'M025'),
('OD026', 'Xander', 'Scott', 'xander.scott@example.com', 8901234568, 'O026', 'M026'),
('OD027', 'Yara', 'Green', 'yara.green@example.com', 9012345679, 'O027', 'M027'),
('OD028', 'Zane', 'Adams', 'zane.adams@example.com', 1234567089, 'O028', 'M028'),
('OD029', 'Olivia', 'Parker', 'olivia.parker@example.com', 2345678190, 'O029', 'M029'),
('OD030', 'Lucas', 'Reed', 'lucas.reed@example.com', 3456789201, 'O030', 'M030');

INSERT INTO Inventory (Inventory_ID, Item, Quantity, Price, Restaurant_ID)
VALUES
('I001', 'Tomato', 50, 0.5, 'R001'),
('I002', 'Cheese', 30, 1.2, 'R002'),
('I003', 'Lettuce', 40, 0.8, 'R003'),
('I004', 'Chicken', 25, 3.5, 'R004'),
('I005', 'Beef', 20, 5.0, 'R005'),
('I006', 'Fish', 15, 4.2, 'R006'),
('I007', 'Rice', 100, 0.3, 'R007'),
('I008', 'Pasta', 75, 1.1, 'R008'),
('I009', 'Bread', 50, 1.5, 'R009'),
('I010', 'Eggs', 60, 0.2, 'R010'),
('I011', 'Butter', 20, 1.8, 'R011'),
('I012', 'Milk', 40, 1.0, 'R012'),
('I013', 'Onion', 70, 0.4, 'R013'),
('I014', 'Garlic', 30, 0.6, 'R014'),
('I015', 'Salt', 100, 0.1, 'R015'),
('I016', 'Pepper', 40, 0.7, 'R016'),
('I017', 'Potato', 80, 0.3, 'R017'),
('I018', 'Carrot', 60, 0.4, 'R018'),
('I019', 'Broccoli', 25, 1.2, 'R019'),
('I020', 'Mushroom', 35, 1.5, 'R020'),
('I021', 'Spinach', 45, 0.9, 'R021'),
('I022', 'Cucumber', 50, 0.5, 'R022'),
('I023', 'Zucchini', 30, 0.6, 'R023'),
('I024', 'Bell Pepper', 25, 0.8, 'R024'),
('I025', 'Chili', 20, 1.0, 'R025'),
('I026', 'Olive Oil', 15, 3.0, 'R026'),
('I027', 'Vinegar', 10, 2.5, 'R027'),
('I028', 'Sugar', 40, 0.7, 'R028'),
('I029', 'Flour', 60, 0.4, 'R029'),
('I030', 'Baking Soda', 25, 0.9, 'R030');

INSERT INTO Employee (Employee_ID, First_Name, Last_Name, Job_Title, Restaurant_ID, Position_ID, Employee_Type)
VALUES
('E001', 'Emily', 'Brown', 'Waiter', 'R001', 'P001', 'FullTime'),
('E002', 'Jack', 'Davis', 'Head Chef', 'R002', 'P002', 'FullTime'),
('E003', 'Sophia', 'Wilson', 'Kitchen Assistant', 'R003', 'P003', 'PartTime'),
('E004', 'Liam', 'Smith', 'Waiter', 'R004', 'P004', 'FullTime'),
('E005', 'Olivia', 'Johnson', 'Waiter', 'R005', 'P005', 'PartTime'),
('E006', 'Noah', 'Miller', 'Kitchen Assistant', 'R006', 'P006', 'FullTime'),
('E007', 'Ava', 'Jones', 'Head Chef', 'R007', 'P007', 'FullTime'),
('E008', 'William', 'Davis', 'Waiter', 'R008', 'P008', 'PartTime'),
('E009', 'Mia', 'Garcia', 'Kitchen Assistant', 'R009', 'P009', 'FullTime'),
('E010', 'James', 'Martinez', 'Waiter', 'R010', 'P010', 'FullTime'),
('E011', 'Isabella', 'Rodriguez', 'Kitchen Assistant', 'R011', 'P011', 'PartTime'),
('E012', 'Lucas', 'Lee', 'Head Chef', 'R012', 'P012', 'FullTime'),
('E013', 'Amelia', 'Walker', 'Waiter', 'R013', 'P013', 'FullTime'),
('E014', 'Mason', 'Hall', 'Kitchen Assistant', 'R014', 'P014', 'PartTime'),
('E015', 'Harper', 'Young', 'Waiter', 'R015', 'P015', 'FullTime'),
('E016', 'Ethan', 'Allen', 'Head Chef', 'R016', 'P016', 'FullTime'),
('E017', 'Abigail', 'Hernandez', 'Waiter', 'R017', 'P017', 'PartTime'),
('E018', 'Logan', 'King', 'Kitchen Assistant', 'R018', 'P018', 'FullTime'),
('E019', 'Ella', 'Wright', 'Waiter', 'R019', 'P019', 'FullTime'),
('E020', 'Benjamin', 'Lopez', 'Kitchen Assistant', 'R020', 'P020', 'PartTime'),
('E021', 'Lily', 'Hill', 'Head Chef', 'R021', 'P021', 'FullTime'),
('E022', 'Henry', 'Scott', 'Waiter', 'R022', 'P022', 'FullTime'),
('E023', 'Victoria', 'Green', 'Kitchen Assistant', 'R023', 'P023', 'PartTime'),
('E024', 'Sebastian', 'Adams', 'Waiter', 'R024', 'P024', 'FullTime'),
('E025', 'Zoe', 'Baker', 'Kitchen Assistant', 'R025', 'P025', 'FullTime'),
('E026', 'Aiden', 'Gonzalez', 'Head Chef', 'R026', 'P026', 'FullTime'),
('E027', 'Layla', 'Nelson', 'Waiter', 'R027', 'P027', 'PartTime'),
('E028', 'Gabriel', 'Carter', 'Kitchen Assistant', 'R028', 'P028', 'FullTime'),
('E029', 'Aria', 'Mitchell', 'Waiter', 'R029', 'P029', 'FullTime'),
('E030', 'Elijah', 'Perez', 'Kitchen Assistant', 'R030', 'P030', 'PartTime');

INSERT INTO RestaurantSupplier (Supply_Agreement_ID, Supplier_ID, Restaurant_ID, Delivery_Frequency)
VALUES 
('RS001', 'S001', 'R001', 'Weekly'),
('RS002', 'S002', 'R002', 'Monthly'),
('RS003', 'S003', 'R003', 'Biweekly'),
('RS004', 'S004', 'R004', 'Weekly'),
('RS005', 'S005', 'R005', 'Monthly'),
('RS006', 'S006', 'R006', 'Biweekly'),
('RS007', 'S007', 'R007', 'Weekly'),
('RS008', 'S008', 'R008', 'Monthly'),
('RS009', 'S009', 'R009', 'Biweekly'),
('RS010', 'S010', 'R010', 'Weekly'),
('RS011', 'S011', 'R011', 'Monthly'),
('RS012', 'S012', 'R012', 'Biweekly'),
('RS013', 'S013', 'R013', 'Weekly'),
('RS014', 'S014', 'R014', 'Monthly'),
('RS015', 'S015', 'R015', 'Biweekly'),
('RS016', 'S016', 'R016', 'Weekly'),
('RS017', 'S017', 'R017', 'Monthly'),
('RS018', 'S018', 'R018', 'Biweekly'),
('RS019', 'S019', 'R019', 'Weekly'),
('RS020', 'S020', 'R020', 'Monthly'),
('RS021', 'S021', 'R021', 'Biweekly'),
('RS022', 'S022', 'R022', 'Weekly'),
('RS023', 'S023', 'R023', 'Monthly'),
('RS024', 'S024', 'R024', 'Biweekly'),
('RS025', 'S025', 'R025', 'Weekly'),
('RS026', 'S026', 'R026', 'Monthly'),
('RS027', 'S027', 'R027', 'Biweekly'),
('RS028', 'S028', 'R028', 'Weekly'),
('RS029', 'S029', 'R029', 'Monthly'),
('RS030', 'S030', 'R030', 'Biweekly');

INSERT INTO FullTime (FullTime_ID, Employee_ID, Benefits, SalaryAmount)
VALUES 
('FT001', 'E001', 'Health Insurance', 50000),
('FT002', 'E002', 'Retirement Plan', 55000),
('FT003', 'E003', 'Health Insurance', 48000),
('FT004', 'E004', 'Retirement Plan', 52000),
('FT005', 'E005', 'Health Insurance', 46000),
('FT006', 'E006', 'Health Insurance', 53000),
('FT007', 'E007', 'Retirement Plan', 57000),
('FT008', 'E008', 'Health Insurance', 51000),
('FT009', 'E009', 'Retirement Plan', 49000),
('FT010', 'E010', 'Health Insurance', 55000),
('FT011', 'E011', 'Retirement Plan', 60000),
('FT012', 'E012', 'Health Insurance', 62000),
('FT013', 'E013', 'Retirement Plan', 48000),
('FT014', 'E014', 'Health Insurance', 57000),
('FT015', 'E015', 'Retirement Plan', 53000),
('FT016', 'E016', 'Health Insurance', 61000),
('FT017', 'E017', 'Retirement Plan', 58000),
('FT018', 'E018', 'Health Insurance', 49000),
('FT019', 'E019', 'Retirement Plan', 60000),
('FT020', 'E020', 'Health Insurance', 54000),
('FT021', 'E021', 'Retirement Plan', 56000),
('FT022', 'E022', 'Health Insurance', 65000),
('FT023', 'E023', 'Retirement Plan', 47000),
('FT024', 'E024', 'Health Insurance', 58000),
('FT025', 'E025', 'Retirement Plan', 61000),
('FT026', 'E026', 'Health Insurance', 53000),
('FT027', 'E027', 'Retirement Plan', 55000),
('FT028', 'E028', 'Health Insurance', 52000),
('FT029', 'E029', 'Retirement Plan', 60000),
('FT030', 'E030', 'Health Insurance', 63000);

INSERT INTO PartTime (PartTime_ID, Employee_ID, HourlyWage, ScheduledHours)
VALUES
('PT001', 'E001', 15.00, 20),
('PT002', 'E002', 12.50, 25),
('PT003', 'E003', 14.00, 30),
('PT004', 'E004', 13.50, 18),
('PT005', 'E005', 16.00, 22),
('PT006', 'E006', 11.00, 24),
('PT007', 'E007', 15.50, 20),
('PT008', 'E008', 14.50, 25),
('PT009', 'E009', 12.00, 28),
('PT010', 'E010', 13.00, 30),
('PT011', 'E011', 17.00, 18),
('PT012', 'E012', 15.00, 22),
('PT013', 'E013', 16.50, 20),
('PT014', 'E014', 14.00, 25),
('PT015', 'E015', 13.50, 30),
('PT016', 'E016', 12.00, 24),
('PT017', 'E017', 15.50, 18),
('PT018', 'E018', 11.50, 22),
('PT019', 'E019', 14.50, 20),
('PT020', 'E020', 12.50, 25),
('PT021', 'E021', 16.00, 28),
('PT022', 'E022', 13.50, 30),
('PT023', 'E023', 15.00, 18),
('PT024', 'E024', 17.50, 22),
('PT025', 'E025', 11.00, 20),
('PT026', 'E026', 14.00, 25),
('PT027', 'E027', 12.50, 30),
('PT028', 'E028', 16.00, 24),
('PT029', 'E029', 13.50, 18),
('PT030', 'E030', 15.50, 22);

-- To get the number of records in each table
select 'Restaurant',count(*)
from Restaurant r 
union
select 'Orders', count(*)
from Orders o 
union
select 'Customer', count(*)
from Customer c 
union
select 'Payment', count(*)
from Payment p 
union
select 'Reservation', count(*)
from Reservation r2 
union
select 'Menu', count(*)
from Menu m 
union
select 'Order Details', count(*)
from OrderDetails od 
union
select 'Inventory', count(*)
from Inventory i 
union
select 'Employee', count(*)
from Employee e 
union
select 'Positions', count(*)
from Positions p2 
union
select 'Restaurant_Supplier', count(*)
from RestaurantSupplier rs 
union
select 'Supplier', count(*)
from Supplier s
union
select 'FullTime', count(*)
from FullTime ft 
union
select 'PartTime', count(*)
from PartTime pt 
;


-- Report 1 using Subquery
SELECT 
    UPPER(Customer_First_Name) AS Customer_First_Name,
    UPPER(Customer_Last_Name) AS Customer_Last_Name,
    Restaurant_Name,
    Total_Sales
FROM (
    SELECT 
        c.First_Name AS Customer_First_Name,
        c.Last_Name AS Customer_Last_Name,
        r.Name AS Restaurant_Name,
        ROUND(SUM(o.Total_amount), 2) AS Total_Sales
    FROM Orders o
    JOIN Customer c ON o.Customer_ID = c.Customer_ID
    JOIN Restaurant r ON o.Restaurant_ID = r.Restaurant_ID
    GROUP BY c.First_Name, c.Last_Name, r.Name
) AS Subquery
ORDER BY Total_Sales DESC;


-- 3rd Report
SELECT 
    C.First_Name AS CustomerFirstName,
    C.Last_Name AS CustomerLastName,
    COUNT(O.Order_ID) AS TotalOrders,
    ROUND(SUM(O.Total_amount), 2) AS TotalSpent,
    CASE 
        WHEN SUM(O.Total_amount) > 100 THEN 'High Spender'
        ELSE 'Regular Spender'
    END AS SpendingCategory
FROM 
    Customer C
JOIN 
    Orders O ON C.Customer_ID = O.Customer_ID
GROUP BY 
    C.First_Name, C.Last_Name
ORDER BY 
    TotalSpent DESC;
   

   
 
-- 4th Report (Average Order Amount & No. of Orders by Customer Name)
SELECT 
    C.First_Name AS CustomerFirstName,
    C.Last_Name AS CustomerLastName,
    COUNT(O.Order_ID) AS TotalOrders,
    ROUND(AVG(O.Total_amount), 2) AS AverageOrderAmount
FROM 
    Customer C
JOIN 
    Orders O ON C.Customer_ID = O.Customer_ID
GROUP BY 
    C.First_Name, C.Last_Name
ORDER BY 
    AverageOrderAmount DESC;
   
   


-- Report 3
-- To find frequent visitors in the restaurant
WITH Ranked_Customers AS (
    SELECT 
        r.Name AS Restaurant_Name,
        CONCAT(UPPER(c.First_Name), ' ', UPPER(c.Last_Name)) AS Customer_Name,
        COUNT(o.Order_ID) AS Order_Count,
        RANK() OVER (PARTITION BY r.Restaurant_ID ORDER BY COUNT(o.Order_ID) DESC) AS Customer_Rank
    FROM 
        Orders o
    JOIN 
        Customer c ON o.Customer_ID = c.Customer_ID
    JOIN 
        Restaurant r ON o.Restaurant_ID = r.Restaurant_ID
    GROUP BY 
        r.Name, c.First_Name, c.Last_Name, r.Restaurant_ID
)

SELECT 
    Restaurant_Name,
    Customer_Name,
    Order_Count,
    Customer_Rank
FROM 
    Ranked_Customers
WHERE 
    Customer_Rank <= 5
ORDER BY 
    Restaurant_Name;
   
   
-- PPT REPORT SCRIPTS

   
-- Report 1 PPT
-- Report to find total sales amount by restaurant and customer
select 
	UPPER(c.First_Name) as Customer_First_Name,
	UPPER(c.Last_Name) as Customer_Last_Name,
	r.Name as Restaurant_Name,
	ROUND(SUM(o.Total_amount), 2) AS Total_Sales
from Orders o
JOIN Customer c on o.Customer_ID = c.Customer_ID 
JOIN Restaurant r on o.Restaurant_ID = r.Restaurant_ID 
GROUP BY c.First_Name , c.Last_Name , r.Name 
ORDER BY Total_amount DESC; 


-- Report 3 PPT
-- Report to find the stock   
-- View for average quantity and price in inventory
CREATE VIEW Inventory_Averages AS
SELECT 
    AVG(Quantity) AS Avg_Quantity,
    AVG(Price) AS Avg_Price
FROM Inventory;


-- Query to identify low-stock items (below average quantity)
SELECT 
    Item,
    Quantity
FROM Inventory
WHERE Quantity < (SELECT Avg_Quantity FROM Inventory_Averages);


-- Query to identify high-cost items (above average price)
SELECT 
    Item,
    Quantity,
    Price
FROM Inventory
WHERE Price > (SELECT Avg_Price FROM Inventory_Averages);


-- Combined query to find items that are either low stock or high cost using UNION
SELECT 
    Item,
    Quantity,
    Price
FROM Inventory
WHERE Quantity < (SELECT Avg_Quantity FROM Inventory_Averages)
UNION
SELECT 
    Item,
    Quantity,
    Price
FROM Inventory
WHERE Price > (SELECT Avg_Price FROM Inventory_Averages);

-- Combined query to find items that are both low stock and high cost using INTERSECT
SELECT 
    Item,
    Quantity,
    Price
FROM Inventory
WHERE Quantity < (SELECT Avg_Quantity FROM Inventory_Averages)
INTERSECT
SELECT 
    Item,
    Quantity,
    Price
FROM Inventory
WHERE Price > (SELECT Avg_Price FROM Inventory_Averages);




-- Report 3 PPT
-- To find average order amount and categorize customers as high spender or regular spender

SELECT 
    R.Name AS RestaurantName,
    C.First_Name AS CustomerFirstName, 
    C.Last_Name AS CustomerFullName,
    ROUND(AVG(O.Total_amount), 2) AS AverageOrderAmount,
    CASE 
        WHEN AVG(O.Total_amount) > 50 THEN 'High Average Spender'
        ELSE 'Regular Average Spender'
    END AS SpendingCategory
FROM 
    Restaurant R
JOIN 
    Orders O ON R.Restaurant_ID = O.Restaurant_ID
JOIN 
    Customer C ON O.Customer_ID = C.Customer_ID
GROUP BY 
    R.Name, C.First_Name, C.Last_Name
ORDER BY 
    AverageOrderAmount DESC;
   
   
   
-- 4th in PPT
-- Report to get Payment Summary Analysis
-- View Creation 
CREATE VIEW customer_payment_details AS
SELECT Customer_ID, Payment_method, Status, SUM(Amount) AS Total_Spent
FROM Payment
GROUP BY Customer_ID, Payment_method, Status;

-- payment summary query
SELECT c.Customer_ID, c.First_Name, c.Last_Name, p.Payment_Method, p.Status AS Payment_Status, p.Total_Spent, 
       (SELECT COUNT(DISTINCT Payment_method) 
        FROM Payment 
        WHERE Customer_ID = c.Customer_ID) AS Distinct_Payment_Methods
FROM Customer c
LEFT JOIN customer_payment_details p ON c.Customer_ID = p.Customer_ID
WHERE p.Status = 'Completed'

UNION

SELECT c.Customer_ID, c.First_Name, c.Last_Name, p.Payment_method, p.Status AS Payment_Status, 
       p.Total_Spent,
       NULL AS Distinct_Payment_Methods
FROM Customer c
LEFT JOIN customer_payment_details p ON c.Customer_ID = p.Customer_ID
WHERE p.Status = 'Pending';





SELECT 
    UPPER(c.First_Name) AS Customer_First_Name, 
    UPPER(c.Last_Name) AS Customer_Last_Name, 
    r.Name AS Restaurant_Name, 
    ROUND(SUM(o.Total_amount) OVER (PARTITION BY c.First_Name, c.Last_Name, r.Name), 2) AS Total_Sales
FROM Orders o 
JOIN Customer c ON o.Customer_ID = c.Customer_ID  
JOIN Restaurant r ON o.Restaurant_ID = r.Restaurant_ID 
ORDER BY Total_Sales DESC;


SELECT 
    r.Name AS RestaurantName, 
    c.First_Name AS CustomerFirstName, 
    c.Last_Name AS CustomerFullName, 
    COUNT(o.Order_ID) OVER (PARTITION BY r.Name, c.First_Name, c.Last_Name) AS TotalOrders,
    ROUND(AVG(o.Total_amount) OVER (PARTITION BY r.Name, c.First_Name, c.Last_Name), 2) AS AverageOrderAmount,
    CASE  
        WHEN AVG(o.Total_amount) OVER (PARTITION BY r.Name, c.First_Name, c.Last_Name) > 50 THEN 'High Average Spender' 
        ELSE 'Regular Average Spender' 
    END AS SpendingCategory
FROM Orders o 
JOIN Restaurant r ON o.Restaurant_ID = r.Restaurant_ID 
JOIN Customer c ON o.Customer_ID = c.Customer_ID 
ORDER BY AverageOrderAmount DESC;





