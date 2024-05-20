CREATE DATABASE LIBRARY;
USE LIBRARY;

CREATE TABLE Branch(
Branch_No INT PRIMARY KEY,
Manager_Id VARCHAR(10),
Branch_Address VARCHAR(25),
Contact_No int
);
DESC Branch;

INSERT INTO Branch(Branch_No,Manager_Id,Branch_Address,Contact_No)values
(6711,111,'Melbourne',12345678),
(6712,112,'Vienna',23456789),
(6713,113,'Vancouver',34567891),
(6714,114,'Toronto',45678910),
(6715,115,'Calgary',56789102),
(6716,116,'Adelaide',67891023),
(6717,117,'Sydney',78910234),
(6718,118,'Helsinki',89102345),
(6719,119,'Perth',90123456),
(6710,110,'Auckland',90234567);

SELECT * FROM Branch;

CREATE TABLE Employee(
Emp_Id INT PRIMARY KEY NOT NULL,
Emp_Name VARCHAR(20),
Position VARCHAR(20),
Salary INT,
Branch_No INT,
FOREIGN KEY (Branch_No) REFERENCES Branch(Branch_No)
);
DESC Employee;

INSERT INTO Employee(Emp_Id,Emp_Name,Position,Salary,Branch_No)VALUES
(560,'Berin Thomas','Cashier',45000,6718),
(561,'Sonny Jacob','Customer Service',35000,6713),
(562,'Linda Baby','Clerk',40000,6715),
(564,'Anney Varghees','Manager',60000,6718),
(565,'John Ebraham','Librarian',65000,6719),
(566,'John Mathew','Senior Librarian',80000,6710),
(567,'Norah William','Assistant',47000,6712),
(568,'Mary Joseph','PRO',60000,6714),
(569,'Dean Willow','Librarian',65000,6712),
(570,'Carlo Thomas','Cashier',45000,6718),
(571,'Jennie Mary','Clerk',40000,6716),
(572,'Federik David','Manager',60000,6718),
(573,'Davidson','PRO',60000,6716),
(574,'William Smith','Senior Librarian',80000,6718),
(575,'James Bonds','Clerk',40000,6718),
(576,'Ishan Kok','Technician',40000,6710),
(577,'Pied Piper','PRO',60000,6715),
(578,'Luca Alberto','Librarian',65000,6713),
(579,'Martin Luther','Assistant',47000,6718),
(580,'Naira Noory','Administrator',50000,6719);

SELECT * FROM Employee;

CREATE TABLE Customer(
Customer_ID INT PRIMARY KEY,
Customer_name VARCHAR(30),
Customer_Address VARCHAR(30),
Reg_date DATE);

DESC Customer;

INSERT INTO Customer VALUES
(1901,'Merin','Jamestown','2024-01-17'),
(1902,'Benyamin','Albany Ny','2022-05-19'),
(1903,'Thomas','Milford','2022-09-28'),
(1904,'Eydin','Danville','2023-03-02'),
(1905,'Edwerd','Canton city','2023-04-29'),
(1906,'Davidson','Warren','2022-06-30'),
(1907,'Emmy','Lincoln','2021-04-26'),
(1908,'Fedrik','Hampton','2023-12-12'),
(1909,'Emma','Trenton','2024-10-29'),
(1910,'Zain','Lafayette','2024-12-02'),
(1911,'Jackson','Scotland','2023-04-14'),
(1912,'Elsa','Glassgow','2020-02-22'),
(1913,'Harry','Ely','2022-03-27'),
(1914,'George','Bloomington','2020-03-28'),
(1915,'Williams','Plymouth','2022-03-22'),
(1916,'Peter','Newport','2024-07-27');

SELECT * FROM Customer;

CREATE TABLE Issue_status(
Issue_ID INT,
Issued_customer INT,
Issued_book_name VARCHAR(30),
Issue_date DATE,
ISBN_book VARCHAR(30),
FOREIGN KEY(Issued_customer) REFERENCES Customer(Customer_ID) ON DELETE CASCADE,
FOREIGN KEY(ISBN_book) REFERENCES Books(ISBN) ON DELETE CASCADE 
);

DESC Issue_status;

INSERT INTO Issue_status VALUES
(101,1915,'The Kite Runner','2023-03-13','ISBN10'),
(102,1901,'Pride and Prejudice','2024-04-24','ISBN11'),
(103,1902,'Great Expectations','2023-10-15','ISBN20'),
(104,1904,'The Great Gatsby','2023-06-22','ISBN16'),
(105,1911,'To Kill a Mockinbird','2021-08-26','ISBN19'),
(106,1912,'Wuthering Heights','2023-12-15','ISBN18'),
(107,1916,'Jane Eyre','2024-01-09','ISBN17'),
(108,1907,'The Lord of the Rings','2024-03-24','ISBN14'),
(109,1903,'Beloved','2024-05-01','ISBN1'),
(110,1906,'Don Quixote','2024-02-12','ISBN13'),
(111,1905,'The Catcher in the Rye','2023-04-17','ISBN12');

SELECT * FROM Issue_status;

CREATE TABLE Return_status(
Return_ID INT PRIMARY KEY,
Return_cust INT ,
Return_book_name VARCHAR(100),
Return_date DATE,
ISBN_Book2 VARCHAR(30),
FOREIGN KEY(Return_cust) REFERENCES Customer(Customer_ID),
FOREIGN KEY(ISBN_Book2) REFERENCES Books(ISBN) ON DELETE CASCADE
);

DESC Return_status;

INSERT INTO Return_status VALUES
(201,1908,'Pride and Prejudice','2024-01-02','ISBN11'),
(202,1901,'The Kite Runner','2023-06-01','ISBN10'),
(203,1909,'The Catcher in the Rye','2024-05-01','ISBN12'),
(204,1916,'Don Quixote','2024-01-12','ISBN13'),
(205,1902,'Great Expectations','2023-06-12','ISBN20'),
(206,1914,'The Great Gatsby','2024-05-16','ISBN16'),
(207,1912,'Beloved','2024-03-15','ISBN1'),
(208,1915,'Jane Eyre','2024-01-15','ISBN17'),
(209,1904,'Twilight Saga 1','2024-03-24','ISBN2'),
(210,1911,'Twilight Saga 3','2024-05-14','ISBN4');

SELECT * FROM Return_status;

CREATE TABLE Books(
ISBN VARCHAR(30) PRIMARY KEY,
Book_Title VARCHAR(100),
Category VARCHAR(100),
Rental_price INT,
STATUS ENUM('YES','NO'),
Author VARCHAR(100),
Publisher VARCHAR(100)
);

DESC Books;

INSERT INTO Books(ISBN,Book_Title,Category,Rental_price,STATUS,Author,Publisher) VALUES
('ISBN1','Beloved','Novel',20,'NO','Toni Morrison','Macmillons'),
('ISBN2','Twilight Saga 1','Fiction',25,'YES','Stephenie Meyer','HarperCollins'),
('ISBN3','Twilight Saga 2','Fiction',25,'YES','Stephenie Meyer','Emerald Group'),
('ISBN4','Twilight Saga 3','Fiction',25,'YES','Stephenie Meyer','Macmillons'),
('ISBN5','Twilight Saga4','Fiction',25,'YES','Stephenie Meyer','Pearson'),
('ISBN6','Twilight Saga5','Fiction',25,'NO','Stephenie Meyer','Macmillons'),
('ISBN8','Twilight Saga7','Fiction',25,'YES','Stephenie Meyer','Macmillons'),
('ISBN9','Twilight Saga8','Fiction',25,'YES','Stephenie Meyer','Pearson'),
('ISBN10','Tha Kite Runner','Novel',20,'YES','Khalid Hussaini','Salmon and Schuster'),
('ISBN11','Pride and Prejudice','Novel',30,'YES','Jane Austen','Little Brown and Company'),  
('ISBN12','The Catcher in the Rye','Novel',25,'NO','Stephenie Meyer','Salmon and Schuster'),
('ISBN13','Don Quixote','Novel',25,'NO','Miguel de Cevantes','Little Brown and Company'),
('ISBN14','The Lord of the Rings','Novel',25,'NO','JRR Tolken','Salmon and Schuster'),
('ISBN15','Gullivers travel','Fantasy',20,'NO','Jonathan Swift','Salmon and Schuster'),
('ISBN16','The great Gatsby','History',20,'YES','F ScottFitzgerald','Unknown'),
('ISBN17','Jane Eyre','Poetry',12,'Yes','Charlotte Bronte','Pearson'),
('ISBN18','Wuthering Heights','Drama',12,'YES','Emily Brinte','Pearson'),
('ISBN19','To Kill a Mockinbird','Novel','20','YES','Harper Lee','Westlandbooks'),
('ISBN20','Great Expectations','History',12,'NO','Charls Dickens','Unknown');

SELECT * FROM Books;

# Questions
#1) Retrieve the book title, category, and rental price of all available books.

SELECT Book_Title,Category,Rental_price FROM Books WHERE STATUS = 'YES';

# 2. List the employee names and their respective salaries in descending order of salary.

SELECT Emp_Name, Salary FROM Employee ORDER BY  Salary DESC;

# 3. Retrieve the book titles and the corresponding customers who have issued those books.

SELECT Books.Book_Title,Customer.Customer_name FROM Issue_status JOIN Books ON Issue_status.ISBN_book = Books.ISBN
JOIN Customer ON Issue_status.Issued_customer = Customer.Customer_Id;


# 4. Display the total count of books in each category.

SELECT Category,COUNT(*) FROM Books GROUP BY Category;


# 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.

SELECT Emp_name,Position,Salary FROM Employee WHERE Salary > 50000;

# 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.

SELECT Customer_name,Reg_Date FROM Customer LEFT JOIN  issue_status  ON Customer.customer_id = Issue_status.Issued_customer
WHERE Customer.Reg_date < 2022-01-01 and Issue_status.ISBN_Book IS NULL;

# 7. Display the branch numbers and the total count of employees in each branch.
SELECT Branch_No,COUNT(*) FROM Employee GROUP BY Branch_No;

# 8. Display the names of customers who have issued books in the month of June 2023.

SELECT Customer_name From Customer 
JOIN Issue_status ON Customer.Customer_ID = Issue_status.Issued_customer 
WHERE Issue_status.Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

# 9. Retrieve book_title from book table containing history. 
SELECT Book_Title FROM Books WHERE CATEGORY = 'History';

# 10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
SELECT Branch_No,COUNT(*) FROM Employee GROUP BY Branch_No Having Branch_No > 5;
