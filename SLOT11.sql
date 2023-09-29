-- TAO TABLE
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY NOT NULL,
    CustomerName NVARCHAR(255),
    Address NVARCHAR(255),
    PhoneNumber VARCHAR(15)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY NOT NULL,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY NOT NULL,
    OrderID INT NOT NULL,
    STT INT,
    ItemName NVARCHAR(255),
    ItemDescription NVARCHAR(255),
    Unit NVARCHAR(50),
    Price DECIMAL(10, 2),
    Quantity INT,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY NOT NULL,
    CategoryName NVARCHAR(255)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY NOT NULL,
    ProductName NVARCHAR(255),
    Description NVARCHAR(255), -- Ðã thay d?i d? dài
    CategoryID INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

DROP TABLE Customers;
DROP TABLE Orders;
DROP TABLE OrderDetails;
DROP TABLE Categories
DROP TABLE Products;

-- NHAP DATA

INSERT INTO Customers (CustomerID, CustomerName, Address, PhoneNumber)
VALUES (1, N'Nguyễn Văn An', N'111 Nguyễn Trãi, Thanh Xuân, Hà Nội', '987654321');

INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES (123, 1, '2023-09-18');

INSERT INTO OrderDetails (OrderDetailID, OrderID, STT, ItemName, ItemDescription, Unit, Price, Quantity, Amount)
VALUES
		(1, 123, 1, N'Máy Tính', N'Máy nhập mới', N'Chiếc', 1000.00, 1, 1000.00),
		(2, 123, 2, N'Điện Thoại', N'Điện thoại đang hot', N'Chiếc', 200.00, 2, 400.00),
		(3, 123, 3, N'Máy In', N'Máy in đang ế', N'Chiếc', 100.00, 1, 100.00);

INSERT INTO Categories (CategoryID, CategoryName)
VALUES (1, N'Electronics');

INSERT INTO Products (ProductID, ProductName, Description, CategoryID, Price)
VALUES
		(1, N'Máy Tính T450', N'Máy nhập mới', 1, 1000.00),
		(2, N'Điện Thoại Nokia5670', N'Điện thoại đang hot', 1, 200.00),
		(3, N'Máy In Samsung 450', N'Máy in đang ế', 1, 100.00);

-- HIEN THI DATA

SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Categories;
SELECT * FROM Products;

SELECT * FROM Customers ORDER BY CustomerName ASC;
SELECT * FROM Products ORDER BY Price DESC;

SELECT C.CustomerName, OD.ItemName
FROM Customers AS C
INNER JOIN Orders AS O ON C.CustomerID = O.CustomerID
INNER JOIN OrderDetails AS OD ON O.OrderID = OD.OrderID
WHERE C.CustomerName = N'Nguyễn Văn An';