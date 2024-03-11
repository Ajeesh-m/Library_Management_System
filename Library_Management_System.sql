-- Create the database
CREATE DATABASE library;

-- Use the database
USE library;

-- Create the Branch table

CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) 
VALUES 
(1, 101, '123 Main Street', '123-456-7890'),
(2, 102, '456 Oak Avenue', '987-654-3210'),
(3, 103, '789 Elm Drive', '456-789-0123'),
(4, 104, '567 Pine Road', '321-987-6543'),
(5, 105, '890 Maple Lane', '789-012-3456');

SELECT * FROM Branch;


-- Create the Employee table

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) 
VALUES 
(201, 'John Doe', 'Librarian', 40000.00, 1),
(202, 'Jane Smith', 'Assistant Librarian', 30000.00, 2),
(203, 'David Lee', 'Clerk', 25000.00, 3),
(204, 'Mary Johnson', 'Assistant Librarian', 32000.00, 4),
(205, 'Sarah Brown', 'Clerk', 24000.00, 5),
(206,'Sam Brown','Assistant Librarian',25000.00,1);

SELECT * FROM Employee;


-- Create the Books table

CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) 
VALUES 
('978-0061120084', 'To Kill a Mockingbird', 'Fiction', 15.00, 'yes', 'Harper Lee', 'Harper Perennial Modern Classics'),
('978-0307277671', 'The Catcher in the Rye', 'Fiction', 12.00, 'yes', 'J.D. Salinger', 'Back Bay Books'),
('978-0451524935', '1984', 'Fiction', 14.00, 'yes', 'George Orwell', 'Signet Classic'),
('978-1451673319', 'The Great Gatsby', 'Fiction', 10.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-1400033423', 'The Adventures of Huckleberry Finn', 'Fiction', 13.00, 'yes', 'Mark Twain', 'Modern Library'),
('978-0062316094', 'Sapiens: A Brief History of Humankind', 'History', 20.00, 'yes', 'Yuval Noah Harari', 'Harper'),
('978-0140441000', 'The Republic', 'Philosophy', 18.00, 'yes', 'Plato', 'Penguin Classics'),
('978-0307477721', 'A Brief History of Time', 'Science', 25.00, 'yes', 'Stephen Hawking', 'Bantam'),
('978-0143127550', 'Thinking, Fast and Slow', 'Psychology', 22.00, 'yes', 'Daniel Kahneman', 'Farrar, Straus and Giroux'),
('978-0060850524', 'The Power of Habit: Why We Do What We Do in Life and Business', 'Self-Help', 16.00, 'yes', 'Charles Duhigg', 'Random House'),
('978-0385490818', 'The Seven Habits of Highly Effective People: Powerful Lessons in Personal Change', 'Self-Help', 17.00, 'yes', 'Stephen R. Covey', 'Simon & Schuster'),
('978-0679753351', 'The Art of Happiness', 'Self-Help', 19.00, 'yes', 'Dalai Lama', 'Riverhead Books'),
('978-1594484803', 'Quiet: The Power of Introverts in a World That Cannot Stop Talking', 'Psychology', 21.00, 'yes', 'Susan Cain', 'Crown Publishers'),
('978-0143128540', 'The Lean Startup: How Today’s Entrepreneurs Use Continuous Innovation to Create Radically Successful Businesses', 'Business', 23.00, 'yes', 'Eric Ries', 'Crown Business'),
('978-0804141329', 'The 4-Hour Workweek: Escape 9-5, Live Anywhere, and Join the New Rich', 'Business', 24.00, 'yes', 'Timothy Ferriss', 'Crown Publishing Group');

SELECT * FROM Books;


-- Create the Customer table

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) 
VALUES 
(300,'John Smith','123 Oak Avenue','2022-01-01'),
(301, 'Alice Johnson', '123 Elm Street', '2023-01-15'),
(302, 'Bob Smith', '456 Oak Avenue', '2023-02-20'),
(303, 'Charlie Brown', '789 Maple Drive', '2023-03-25'),
(304, 'Diana Lee', '567 Pine Road', '2023-04-30'),
(305, 'Eva Martinez', '890 Oak Lane', '2023-05-05');

SELECT * FROM Customer;


-- Create the IssueStatus table

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) 
VALUES 
(701, 301, 'To Kill a Mockingbird', '2023-01-20', '978-0061120084'),
(702, 302, 'The Catcher in the Rye', '2023-02-25', '978-0307277671'),
(703, 303, '1984', '2023-03-30', '978-0451524935'),
(704, 304, 'The Great Gatsby', '2023-04-05', '978-1451673319'),
(705, 305, 'The Adventures of Huckleberry Finn', '2023-05-10', '978-1400033423'),
(706, 301, 'Sapiens: A Brief History of Humankind', '2023-06-15', '978-0062316094'),
(707, 302, 'The Republic', '2023-07-20', '978-0140441000'),
(708, 303, 'A Brief History of Time', '2023-08-25', '978-0307477721'),
(709, 304, 'Thinking, Fast and Slow', '2023-09-30', '978-0143127550'),
(710, 305, 'The Power of Habit: Why We Do What We Do in Life and Business', '2023-10-05', '978-0060850524'),
(711, 301, 'The Seven Habits of Highly Effective People: Powerful Lessons in Personal Change', '2023-11-10', '978-0385490818'),
(712, 302, 'The Art of Happiness', '2023-12-15', '978-0679753351'),
(713, 303, 'Quiet: The Power of Introverts in a World That Cannot Stop Talking', '2024-01-20', '978-1594484803'),
(714, 304, 'The Lean Startup: How Today’s Entrepreneurs Use Continuous Innovation to Create Radically Successful Businesses', '2024-02-25', '978-0143128540'),
(715, 305, 'The 4-Hour Workweek: Escape 9-5, Live Anywhere, and Join the New Rich', '2024-03-01', '978-0804141329');

SELECT * FROM IssueStatus;


-- Create the ReturnStatus table

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) 
VALUES 
(801, 301, 'To Kill a Mockingbird', '2023-02-05', '978-0061120084'),
(802, 302, 'The Catcher in the Rye', '2023-03-10', '978-0307277671'),
(803, 303, '1984', '2023-04-15', '978-0451524935'),
(804, 304, 'The Great Gatsby', '2023-05-20', '978-1451673319'),
(805, 305, 'The Adventures of Huckleberry Finn', '2023-06-25', '978-1400033423'),
(806, 301, 'Sapiens: A Brief History of Humankind', '2023-07-10', '978-0062316094'),
(807, 302, 'The Republic', '2023-08-15', '978-0140441000'),
(808, 303, 'A Brief History of Time', '2023-09-20', '978-0307477721'),
(809, 304, 'Thinking, Fast and Slow', '2023-10-25', '978-0143127550'),
(810, 305, 'The Power of Habit: Why We Do What We Do in Life and Business', '2023-11-30', '978-0060850524'),
(811, 301, 'The Seven Habits of Highly Effective People: Powerful Lessons in Personal Change', '2023-12-05', '978-0385490818'),
(812, 302, 'The Art of Happiness', '2024-01-10', '978-0679753351'),
(813, 303, 'Quiet: The Power of Introverts in a World That Cannot Stop Talking', '2024-02-15', '978-1594484803'),
(814, 304, 'The Lean Startup: How Today’s Entrepreneurs Use Continuous Innovation to Create Radically Successful Businesses', '2024-03-20', '978-0143128540'),
(815, 305, 'The 4-Hour Workweek: Escape 9-5, Live Anywhere, and Join the New Rich', '2024-04-25', '978-0804141329');

SELECT * FROM ReturnStatus;


-- Queries

-- 1. Retrieve the book title, category, and rental price of all available books.

SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'yes';

-- 2. List the employee names and their respective salaries in descending order of salary.

SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.

SELECT b.Book_title, c.Customer_name
FROM IssueStatus i
JOIN Books b ON i.Isbn_book = b.ISBN
JOIN Customer c ON i.Issued_cust = c.Customer_Id;

-- 4. Display the total count of books in each category.

SELECT Category, COUNT(*) AS Total_Count FROM Books GROUP BY Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.30,000.

SELECT Emp_name, Position FROM Employee WHERE Salary > 30000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.

SELECT Customer_name FROM Customer 
WHERE Reg_date < '2023-05-05'
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- 7. Display the branch numbers and the total count of employees in each branch.

SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee GROUP BY Branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023.

SELECT DISTINCT c.Customer_name
FROM IssueStatus i
JOIN Customer c ON i.Issued_cust = c.Customer_Id
WHERE YEAR(Issue_date) = 2023 AND MONTH(Issue_date) = 6;

-- 9. Retrieve book_title from book table containing history.

SELECT Book_title FROM Books WHERE Category = 'history';

-- 10. Retrieve the branch numbers along with the count of employees for branches having more than 1 employees.

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 1;




