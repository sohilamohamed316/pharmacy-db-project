- =========================================
--   Create Database
-- =========================================
CREATE DATABASE Pharmacy;
USE Pharmacy;

-- =========================================
--   Tables
-- =========================================

-- Categories
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL UNIQUE,
    Description TEXT,
    CategoryCode VARCHAR(10) NOT NULL UNIQUE,
    Status VARCHAR(10) DEFAULT 'ACTIVE'
);

-- Medicines
CREATE TABLE Medicines(
    MedicineID INT PRIMARY KEY,
    MedicineName VARCHAR(100) NOT NULL,
    ScientificName VARCHAR(100),
    SellingPrice FLOAT NOT NULL,
    CostPrice FLOAT NOT NULL,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Inventory
CREATE TABLE Inventory(
    InventoryID INT PRIMARY KEY,
    BatchNumber INT NOT NULL,
    Quantity INT NOT NULL,
    Location VARCHAR(150),
    Status VARCHAR(100),
    MedicineID INT,
    FOREIGN KEY (MedicineID) REFERENCES Medicines(MedicineID)
);

-- Suppliers
CREATE TABLE Suppliers(
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(255),
    Phone VARCHAR(20) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Address VARCHAR(255)
);

-- Pharmacists
CREATE TABLE Pharmacists(
    PharmacistID INT PRIMARY KEY,
    Name VARCHAR(75) NOT NULL,
    Phone VARCHAR(15),
    Salary INT NOT NULL,
    Gender CHAR(1),
    BranchID int ,
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)

);

-- Branches
CREATE TABLE Branches (
    BranchID INT PRIMARY KEY AUTO_INCREMENT,
    BranchName VARCHAR(30),
    Location VARCHAR(100),
    Phone VARCHAR(15),
    ManagerName VARCHAR(50)
);

-- Purchase
CREATE TABLE Purchase (
    PurchaseID INT PRIMARY KEY AUTO_INCREMENT,
    PurchaseDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    InvoiceNo VARCHAR(50),
    Status VARCHAR(20),
    SupplierID INT,
    PharmacistID INT,
    BranchID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (PharmacistID) REFERENCES Pharmacists(PharmacistID),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);

-- Customers
CREATE TABLE Customers(
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(75) NOT NULL,
    Phone VARCHAR(15),
    Gender CHAR(1) NOT NULL,
    Address VARCHAR(75)
);

-- Sales
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    SaleDate DATE NOT NULL,
    TotalAmount INT NOT NULL,
    PaymentMode VARCHAR(20),
    Discount FLOAT,
    PharmacistID INT,
    CustomerID INT,
    BranchID INT,
    FOREIGN KEY (PharmacistID) REFERENCES Pharmacists(PharmacistID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);
-- =========================================
--   Insert Data
-- =========================================

-- Pharmacists
INSERT INTO Pharmacists (PharmacistID, Name, Phone, Salary, Gender, BranchID) VALUES
(1,'Mohamed Khalid','01111346769',17500,'M',1),
(2,'Ramy Yousef','01110003541',12000,'M',2),
(3,'Ziad Mostafa','01566733319',27500,'M',3),
(4,'Hana Khalid','035545454411',17500,'F',4),
(5,'Aya Mohamed','01111346229',10000,'F',5),
(6,'Majed Gamal','01111311169',17500,'M',6),
(7,'Mohamed Yousef','01111346769',1700,'M',7);



--   Insert Branches
INSERT INTO Branches (BranchName, Location, Phone, ManagerName) VALUES
('Branch Giza', 'Giza', '01000000001', 'Manager Giza'),
('Branch Tanta', 'Tanta', '01000000002', 'Manager Tanta'),
('Branch Alexandria', 'Alexandria', '01000000003', 'Manager Alexandria'),
('Branch Dumyat', 'Dumyat', '01000000004', 'Manager Dumyat'),
('Branch Tanta2', 'Tanta2', '01000000005', 'Manager Tanta2'),
('Branch Cairo', 'Cairo', '01000000006', 'Manager Cairo'),
('Branch Mansoura', 'Mansoura', '01000000007', 'Manager Mansoura');


-- Customers
INSERT INTO Customers VALUES
(1,'Ahmed Khalil','0900334242','M','12 Tahrir St, Dokki, Giza'),
(2,'Ahmed Mohamed','0900885242','M','27 El Mashaya St, Mansoura'),
(3,'Rana Walid','0900334242','F','78 El Haram St, Giza'),
(4,'Aml Khalil','0900334242','F','12 El Geish St, Tanta'),
(5,'Anwar Ahmed','0900311242','M','10 Palestine St, Maadi, Cairo'),
(6,'Ahmed Zayed','0910334242','M','35 Abd El Salam Aref St, Mansoura'),
(7,'Mohamed Khalil','0900331242','M','56 Khaled Ibn El Walid St, Alexandria');

-- Suppliers
INSERT INTO Suppliers VALUES
(1,'Nour Ali','01097345628','nour@gmail.com','Cairo'),
(2,'Mariam Hassan','01507765677','mariam.h@gmail.com','Mansoura'),
(3,'Ziad Mostafa','01012066273','z.iad@gmail.com','Aswan'),
(4,'Amr Mahmoud','011032456652','amr@gmail.com','Cairo'),
(5,'Youssef Adel','01212995611','usf@gmail.com','Tanta'),
(6,'Dina Omar','01010445088','dina.omar@gmail.com','Giza'),
(7,'Huda Samir','01550945603','huda@gmail.com','Mansoura'),
(8,'Hana Eyad','01233340778','hana.eyad@gmail.com','Cairo'),
(9,'Seif Ahmed','0106834564','seif@gmail.com','Alexandria');

-- Categories

INSERT INTO Categories (CategoryID, CategoryName, Description, CategoryCode, Status) VALUES
(1, 'ANTIBIOTICS', 'MEDICINES FOR BACTERIAL INFECTIONS', 'ANT-01', 'ACTIVE'),
(2, 'ANALGESICS', 'PAIN AND FEVER RELIEVERS', 'ANA-02', 'ACTIVE'),
(3, 'VITAMINS', 'NUTRITIONAL SUPPLEMENTS', 'VIT-03', 'ACTIVE'),
(4, 'DERMATOLOGY', 'SKIN CARE AND OINTMENTS', 'DER-04', 'INACTIVE'),
(5, 'CARDIOLOGY', 'HEART AND BLOOD PRESSURE', 'CAR-05', 'ACTIVE'),
(6, 'DIABETES', 'INSULIN AND SUGAR MEDS', 'DIA-06', 'ACTIVE'),
(7, 'FIRST AID', 'BANDAGES AND DISINFECTANTS', 'FST-07', 'ACTIVE');

-- Medicines
INSERT INTO Medicines VALUES
(1, 'Panadol', 'Paracetamol', 25.50, 18.00, 2),
(2, 'Brufen', 'Ibuprofen', 30.00, 22.00, 2),
(3, 'Augmentin', 'Amoxicillin', 75.00, 60.00, 1),
(4, 'Zithromax', 'Azithromycin', 65.00, 50.00, 1),
(5, 'Voltaren', 'Diclofenac Sodium', 40.00, 30.00, 2),
(6, 'Cataflam', 'Diclofenac Potassium', 35.00, 26.00, 2),
(7, 'Amaryl', 'Glimepiride', 55.00, 42.00, 6),
(8, 'Glucophage', 'Metformin', 28.00, 20.00, 6),
(9, 'Aspirin Protect', 'Acetylsalicylic Acid', 22.00, 15.00, 5),
(10, 'Clarinase', 'Loratadine + Pseudoephedrine', 45.00, 33.00, 4),
(11, 'Telfast', 'Fexofenadine', 50.00, 38.00, 4),
(12, 'Otrivin', 'Xylometazoline', 20.00, 14.00, 4),
(13, 'Flagyl', 'Metronidazole', 32.00, 24.00, 1),
(14, 'Spasmo Cibalgin', 'Hyoscine + Paracetamol', 27.00, 19.00, 2),
(15, 'Neurobion', 'Vitamin B Complex', 60.00, 48.00, 3);

-- Inventory
INSERT INTO Inventory VALUES
(1, 1001, 50, 'Main Warehouse', 'Available', 1),
(2, 1002, 30, 'Main Warehouse', 'Available', 2),
(3, 1003, 0, 'Main Warehouse', 'Out of Stock', 3),
(4, 1004, 75, 'Branch 1', 'Available', 4),
(5, 1005, 20, 'Branch 1', 'Low Stock', 5),
(6, 1006, 10, 'Branch 2', 'Low Stock', 6),
(7, 1007, 0, 'Branch 2', 'Out of Stock', 7),
(8, 1008, 60, 'Main Warehouse', 'Available', 8),
(9, 1009, 15, 'Branch 3', 'Low Stock', 9),
(10, 1010, 90, 'Main Warehouse', 'Available', 10),
(11, 1011, 5, 'Branch 1', 'Low Stock', 4);


-- =================================
--   Retrieve Data (SELECT) 
-- =================================

-- 1.Retrieve all Data
SELECT * FROM Pharmacists;
SELECT * FROM Customers;
SELECT * FROM Sales;
SELECT * FROM Inventory;

-- 2.Retrieve specific columns
SELECT Salary FROM Pharmacists;
SELECT Name FROM Pharmacists;


-- ================================================
-- Filter Data (WHERE / LIKE / BETWEEN / IN / NOT)
-- ================================================

-- 1. WHERE condition
SELECT * FROM Pharmacists
WHERE (Gender='M');
SELECT * FROM Customers
WHERE Gender='M';
SELECT * FROM CATEGORIES 
WHERE STATUS = 'ACTIVE';
SELECT * FROM Inventory
WHERE BatchNumber=1010;

-- 2.LIKE
SELECT * FROM CATEGORIES
WHERE CATEGORYNAME LIKE 'A%';

-- 3.BETWEEN
SELECT * FROM CATEGORIES
WHERE CATEGORYID BETWEEN 1 AND 3;

-- 4.IN
SELECT * FROM Inventory
WHERE Quantity IN(50,60,75)
ORDER BY Quantity;

-- 5.NOT
SELECT * FROM Inventory
WHERE Not (Status  ='Low Stock' OR Status='Out of Stock');


-- ===========================
--       Update Data
-- ===========================
UPDATE Pharmacists
SET Phone='01025234412'
WHERE PharmacistID=4;

UPDATE Medicines
SET SellingPrice =15
WHERE MedicineID=8;

UPDATE Medicines
SET CostPrice=12
WHERE MedicineID=8;

-- ==========================
--      Delete Data
-- ==========================
DELETE FROM Pharmacists
WHERE PharmacistID =1;

DELETE FROM Sales
WHERE SaleID=3;

-- ============================
--    Sort Data(ORDER BY)
-- ============================
SELECT * FROM Pharmacists
ORDER BY Salary;

SELECT * FROM Medicines
ORDER BY CostPrice;

-- ============================
--    Aggregate Functions
-- ============================
-- 1.SUM
SELECT SUM(Salary) FROM Pharmacists;

-- 2.COUNT
SELECT COUNT(*) AS TotalBranches 
FROM Branches;

-- 3.MAX

-- 4.MIN

-- 5.AVG

-- ============================
--         GROUP BY
-- ============================
SELECT 
SaleDate,
SUM(TotalAmount) AS TotalAmount
FROM Sales
GROUP BY SaleDate;


SELECT PaymentMode,
SUM(TotalAmount) AS TotalAmount,
COUNT(PaymentMode) AS NumberOfUse
FROM Sales
GROUP BY PaymentMode;

-- ===========================================
--  Compare a value with an aggregate result
-- ===========================================
SELECT * FROM Inventory
WHERE Quantity > (SELECT AVG(Quantity)
FROM Inventory
);
-- ===========================================
--                  JOINS 
-- ===========================================

SELECT Medicines.MedicineName, Categories.CategoryName
FROM Medicines
INNER JOIN Categories
ON Medicines.CategoryID = Categories.CategoryID;

SELECT Customers.Name, Sales.SaleID, Sales.TotalAmount
FROM Customers
LEFT JOIN Sales
ON Customers.CustomerID = Sales.CustomerID;

